<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="col-12">
    <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
        <div class="col-lg-6 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                <h5 style="text-align:center">
                    <c:if test="${etat.equals('EE')}">
                        Montant d’investissement (par régions et par secteurs d’activités)
                    </c:if>
                    <c:if test="${!etat.equals('EE')}">
                        Montant d’investissement (par secteurs d’activités)
                    </c:if>
                </h5>
                <hr>
                <form>
                    <c:if test="${etat.equals('EE')}">
                        <div class="form-group">
                            <label><spring:message code='label.Region'/></label>
                            <select class="form-control" name="region" id="region">
                                <option value="0" selected="selected">Tous</option>
                                <c:forEach items="${region}" var="r">
                                    <option value="${r.regionId}">${r.nom_fr}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label>Secteur d'activité</label>
                        <select class="form-control" name="categorie" id="categorie">
                            <option value="0" selected="selected">Tous</option>
                            <c:forEach items="${categorie}" var="c">
                                <option value="${c.id_categorie}">${c.nom_fr}</option>
                            </c:forEach>
                        </select>
                    </div>

                        <div class="form-group text-left">
                            <label>Année </label>
                            <div class="input-group">
                                <select class="form-control" id="annee">
                                    <option value="0" selected="selected">Tous</option>
                                    <c:forEach begin="0" end="50" var="val">
                                        <jsp:useBean id="now" class="java.util.Date" />
                                        <fmt:formatDate var="annee" value="${now}" pattern="yyyy" />
                                        <c:set var="year" value="${annee - val}"/>
                                        <option value="${year}">${year}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    <div class="form-group">
                        <button  onclick="getStatMontantInvestissement()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
        <div class="col-lg-6 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                <hr>
                <div class="row " style="margin-top: 10%">
                    <div class="col-md-4 pie1">
                        <div class="form-group">
                            <div class="custom-control">
                                <!-- <input type="radio" onchange="choosegraf('1')" name="gender" CHECKED> -->
                                <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_change3(1,this)"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 bar1">
                        <div class="form-group">
                            <div class="custom-control">
                                <!--  <input type="radio" onchange="choosegraf('2')" name="gender"> -->
                                <label><img src="/assets/images/chart2.png" class="w-100 img_chart" width="70%" onclick="fun_change3(2,this)"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 tab1">
                        <div class="form-group">
                            <div class="custom-control">
                                <!--  <input type="radio" onchange="choosegraf('3')" name="gender"> -->
                                <label><img src="/assets/images/chart3_gris.png" class="w-100 img_chart" width="70%" onclick="fun_change3(3,this)"></label>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="2" id="affiche_shart">
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="card">
        <div class="card-body">
            <div id="resultat" style="height: auto!important; min-height:50vh">
            </div>
        </div>
    </div>
</div>

    <script type="text/javascript">

        $(document).ready(function() {
            $(".select2").select2();
        });
        function fun_change3(id,val){
            $(".img_chart").each(function(ind,el){
                var src = "";
                if((id-1)===ind){
                    src="/assets/images/chart"+(ind+1)+".png";
                }else {
                    src="/assets/images/chart"+(ind+1)+"_gris.png";
                }
                $("#affiche_shart").val(id);
                $(el).attr("src",src);

            });
            getStatMontantInvestissement();

        }
        function getStatMontantInvestissement() {
            var annee = $("#annee").val();
            var region =$("#region").val();
            var categorie = $("#categorie").val();

            $.ajax({
                url:"/api/statistique/getMontantInvestissement/${etat}",
                type:"GET",

                data:{
                    "region":region,
                    "categorie":categorie,
                    "annee":annee
                }
            }).done(function(data){
                if(data[0]==null){
                    Swal.fire(
                        'Aucun résultat !',
                        'Aucun résultat ne corréspond à vos critères de recherche!',
                        'warning'
                    )
                    return false;
                }

                var dataProvider = [];
                var chart = $("#affiche_shart").val();
                if(${etat.equals('EE')}){
                    if(region==0 && categorie==0){

                        if(annee==0){
                            var a = data[0].slice(1);
                            var aa = "de tous les années";
                        }else{
                            var a = data[0].slice(1);
                            var aa = "de l'année "+a;
                        }

                        $(".bar1").hide();
                        $(".tab1").hide();
                        $(".pie1").show();

                        $(data).each(function(idx,el){
                            dataProvider.push({
                                "total": el[0],
                                "year": el[1]
                            });
                        });
                        var chart = AmCharts.makeChart("resultat", {
                            "type": "pie",
                            "theme": "none",
                            "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                            "labelRadius": -35,
                            //"labelText": "[[percents]]%",
                            "dataProvider": dataProvider,
                            "valueField": "total",
                            "titleField": "year",
                            "hideCredits":true,
                            "depth3D": 15,
                            "angle": 25,
                            "legend": {
                                "useGraphSettings": false,
                                "position":"right",
                            },
                            "balloon": {
                                "fixedPosition": true
                            },
                            "export": {
                                "enabled": false
                            },
                            "titles": [
                                {
                                    "text": "Montant d\'investissement "+aa,
                                    "color":"#003399",
                                    "size": 20
                                }
                            ]
                        });
                    }
                    else if(region!=0 && categorie==0){

                        if(annee==0){
                            var r = data[0].slice(0,-2);
                            var a = data[0].slice(2,-1);
                            var aa = "de tous les années";
                        }else{
                            var r = data[0].slice(0,-3);
                            var a = data[0].slice(2,-1);
                            var aa = "de l'année "+a;
                        }

                        $(".pie1").hide();
                        $(".bar1").show();
                        $(".tab1").show();
                        if(annee==0){
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "region"    : el[0],
                                    "categorie" : el[1],
                                    "nbr"       : el[2],
                                    "etat"      : "Montant d’investissement "
                                });
                            });
                        }else{
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "region"    : el[0],
                                    "categorie" : el[1],
                                    "year"      : el[2],
                                    "nbr"       : el[3],
                                    "etat"      : "Montant d’investissement "
                                });
                            });
                        }

                        if(chart=="2"){
                            var chart = AmCharts.makeChart("resultat", {
                                "type": "serial",
                                "theme": "none",
                                "marginRight": 70,
                                "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                                "dataProvider": dataProvider,
                                "valueAxes": [{
                                    "axisAlpha": 0,
                                    "position": "left",
                                    "title": "Montant d’investissement",
                                }],
                                "startDuration": 1,
                                "graphs": [ {
                                    "balloonText": "[[title]]:[[value]]",
                                    "fillAlphas": 0.8,
                                    "lineAlpha": 0.2,
                                    "title": "Montant d’investissement",
                                    "type": "column",
                                    "valueField": "nbr"
                                }],
                                "chartCursor": {
                                    "categoryBalloonEnabled": false,
                                    "cursorAlpha": 0,
                                    "zoomable": false
                                },
                                "categoryField": "categorie",
                                "categoryAxis": {
                                    "gridPosition": "start",
                                    "labelRotation": 45
                                },
                                "hideCredits":true,
                                "legend": {
                                    "useGraphSettings": true
                                },
                                "export": {
                                    "enabled": false
                                },
                                "titles": [
                                    {
                                        "text": "Montant d’investissement par région "+r+" "+aa,
                                        "color":"#003399",
                                        "size": 20
                                    }
                                ],
                            });
                        }
                        else if (chart=="3"){
                            var tr = "";
                            $(dataProvider).each(function(ind,el){
                                tr+="<tr><td>"+el.categorie+"</td><td>"+el.nbr+"</td></tr>";
                            })
                            var tt= "";
                            if(annee!=0){
                                tt=' <tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Année : ' + annee + '</th></tr>';
                            }
                            var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Montant d’investissement par région '+r+' '+aa+'</p> ' +
                                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                                '<table class="table table-bordered table-striped table-hover"> ' +
                                '<thead class="text-white">' +
                                ' <tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Région : ' + r + '</th></tr>'+
                                tt+
                                ' <tr style="background-color: #1b5e20; color: white"> <th>Secteurs d’activités</th> <th>Montant d’investissement</th> </tr>' +
                                '</thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
                            $("#resultat").html(tab1);
                        }
                    }
                    else if(region==0 && categorie!=0){

                        $(".pie1").hide();
                        $(".bar1").show();
                        $(".tab1").show();
                        if(annee==0){
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "region"    : el[0],
                                    "categorie" : el[1],
                                    "nbr"       : el[2],
                                    "etat"      : "Montant d’investissement "
                                });
                            });
                        }else{
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "region"    : el[0],
                                    "categorie" : el[1],
                                    "year"      : el[2],
                                    "nbr"       : el[3],
                                    "etat"      : "Montant d’investissement "
                                });
                            });
                        }

                        if(annee==0){
                            var r = data[0].slice(1,-1);
                            var a = data[0].slice(2,-1);
                            var aa = "de tous les années";
                        }else{
                            var r = data[0].slice(1,-2);
                            var a = data[0].slice(2,-1);
                            var aa = "de l'année "+a;
                        }

                        if(chart=="2"){
                            var chart = AmCharts.makeChart("resultat", {
                                "type": "serial",
                                "theme": "none",
                                "marginRight": 70,
                                "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                                "dataProvider": dataProvider,
                                "valueAxes": [{
                                    "axisAlpha": 0,
                                    "position": "left",
                                    "title": "Montant d’investissement",
                                }],
                                "startDuration": 1,
                                "graphs": [ {
                                    "balloonText": "[[title]]:[[value]]",
                                    "fillAlphas": 0.8,
                                    "lineAlpha": 0.2,
                                    "title": "Montant d’investissement",
                                    "type": "column",
                                    "valueField": "nbr"
                                }],
                                "chartCursor": {
                                    "categoryBalloonEnabled": false,
                                    "cursorAlpha": 0,
                                    "zoomable": false
                                },
                                "categoryField": "region",
                                "categoryAxis": {
                                    "gridPosition": "start",
                                    "labelRotation": 45
                                },
                                "hideCredits":true,
                                "legend": {
                                    "useGraphSettings": false
                                },
                                "export": {
                                    "enabled": false
                                },
                                "titles": [
                                    {
                                        "text": "Montant d’investissement par secteur d\'activité "+r+" "+aa,
                                        "color":"#003399",
                                        "size": 20
                                    }
                                ],
                            });
                        }
                        else if (chart=="3"){
                            var tr = "";
                            $(dataProvider).each(function(ind,el){
                                tr+="<tr><td>"+el.region+"</td><td>"+el.nbr+"</td></tr>";
                            })
                            var tt= "";
                            if(annee!=0){
                                tt=' <tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Année : ' + annee + '</th></tr>';
                            }
                            var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Montant d’investissement par secteur d\'activité '+r+' '+aa+'</p> ' +
                                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                                '<table class="table table-bordered table-striped table-hover"> ' +
                                '<thead class="text-white">' +
                                ' <tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Région : ' + r + '</th></tr>'+
                                tt+
                                ' <tr style="background-color: #1b5e20; color: white"> <th>Région</th> <th>Montant d’investissement</th> </tr>' +
                                '</thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
                            $("#resultat").html(tab1);
                        }
                    }
                    else{

                        $(".bar1").hide();
                        $(".tab1").hide();
                        $(".pie1").show();

                        var r = data[0].slice(0,-3);
                        var c = data[0].slice(1,-2);

                        if(annee==0){
                            var a = data[0].slice(2,-1);
                            var aa = "de tous les années";
                        }else{
                            var a = data[0].slice(2,-1);
                            var aa = "de l'année "+a;
                        }

                        $(data).each(function(idx,el){
                            dataProvider.push({
                                "region"    : el[0],
                                "categorie" : el[1],
                                "year"      : el[2],
                                "total"     : el[3]
                            });
                        });
                        var chart = AmCharts.makeChart("resultat", {
                            "type": "pie",
                            "theme": "none",
                            "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                            "labelRadius": -35,
                            //"labelText": "[[percents]]%",
                            "dataProvider": dataProvider,
                            "valueField": "total",
                            "titleField": "year",
                            "hideCredits":true,
                            "depth3D": 15,
                            "angle": 25,
                            "legend": {
                                "useGraphSettings": false,
                                "position":"right",
                            },
                            "balloon": {
                                "fixedPosition": true
                            },
                            "export": {
                                "enabled": false
                            },
                            "titles": [
                                {
                                    "text": "Montant d\'investissement par région "+r+" et secteur d\'activité "+c+" "+aa,
                                    "color":"#003399",
                                    "size": 20
                                }
                            ]
                        });
                    }
                }
                else if (${etat.equals('NT')}){
                    if(categorie==0){
                        if(annee==0){
                            var aa = "de tous les années";
                        }else{
                            var a = data[0].slice(0,-1);
                            var aa = "de l'année "+a;
                        }

                        $(".bar1").hide();
                        $(".tab1").hide();
                        $(".pie1").show();

                        $(data).each(function(idx,el){
                            dataProvider.push({
                                "year"       : el[0],
                                "total"      : el[1]
                            });
                        });

                        var chart = AmCharts.makeChart("resultat", {
                            "type": "pie",
                            "theme": "none",
                            "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                            "labelRadius": -35,
                            //"labelText": "[[percents]]%",
                            "dataProvider": dataProvider,
                            "valueField": "total",
                            "titleField": "year",
                            "hideCredits":true,
                            "depth3D": 15,
                            "angle": 25,
                            "legend": {
                                "useGraphSettings": false,
                                "position":"right",
                            },
                            "balloon": {
                                "fixedPosition": true
                            },
                            "export": {
                                "enabled": false
                            },
                            "titles": [
                                {
                                    "text": "Montant d’investissement "+aa,
                                    "color":"#003399",
                                    "size": 20
                                }
                            ]
                        });
                    }
                    else{
                        $(".pie1").hide();
                        $(".bar1").show();
                        $(".tab1").show();
                        if(annee==0){
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "categorie" : el[0],
                                    "nbr"       : el[1],
                                    "etat"      : "Montant d’investissement"
                                });
                            });
                        }else{
                            $(data).each(function(idx,el){
                                dataProvider.push({
                                    "categorie" : el[0],
                                    "year"      : el[1],
                                    "nbr"       : el[2],
                                    "etat"      : "Montant d’investissement"
                                });
                            });
                        }

                        if(annee==0){
                            var r = data[0].slice(0,-1);
                            var aa = "de tous les années";
                        }else{
                            var r = data[0].slice(0,-2);
                            var a = data[0].slice(1,-1);
                            var aa = "de l'année "+a;
                        }

                        if(chart=="2"){
                            var chart = AmCharts.makeChart("resultat", {
                                "type": "serial",
                                "theme": "none",
                                "marginRight": 70,
                                "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                                "dataProvider": dataProvider,
                                "valueAxes": [{
                                    "axisAlpha": 0,
                                    "position": "left",
                                    "title": "Montant d’investissement",
                                }],
                                "startDuration": 1,
                                "graphs": [ {
                                    "balloonText": "[[title]]:[[value]]",
                                    "fillAlphas": 0.8,
                                    "lineAlpha": 0.2,
                                    "title": "Montant d’investissement",
                                    "type": "column",
                                    "valueField": "nbr"
                                }],
                                "chartCursor": {
                                    "categoryBalloonEnabled": false,
                                    "cursorAlpha": 0,
                                    "zoomable": false
                                },
                                "categoryField": "categorie",
                                "categoryAxis": {
                                    "gridPosition": "start",
                                    "labelRotation": 45
                                },
                                "hideCredits":true,
                                "legend": {
                                    "useGraphSettings": false
                                },
                                "export": {
                                    "enabled": false
                                },
                                "titles": [
                                    {
                                        "text": "Montant d’investissement par secteur d\'activité "+r+" "+aa,
                                        "color":"#003399",
                                        "size": 20
                                    }
                                ],
                            });
                        }
                        else if (chart=="3"){
                            var tr = "";
                            $(dataProvider).each(function(ind,el){
                                tr+="<tr><td>"+el.categorie+"</td><td>"+el.nbr+"</td></tr>";
                            })
                            var tt= "";
                            if(annee!=0){
                                tt=' <tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Année : ' + annee + '</th></tr>';
                            }
                            var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Montant d’investissement par secteur d\'activité '+r+' '+aa+'</p> ' +
                                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                                '<table class="table table-bordered table-striped table-hover"> ' +
                                '<thead class="text-white">' +
                                ' <tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Secteurs d\'activités : ' + r + '</th></tr>'+
                                tt+
                                ' <tr style="background-color: #1b5e20; color: white"> <th>Secteurs d\'activités</th> <th>Montant d’investissement</th> </tr>' +
                                '</thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
                            $("#resultat").html(tab1);
                        }
                    }
                }

            }).fail(function(){
                alert("error");
            })
        }
        var tableToExcel = (function() {
            var uri = 'data:application/vnd.ms-excel;base64,'
                , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
                , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
                , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
            return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>

