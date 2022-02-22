
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/assets/statistique/amcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/serial.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/pie.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>


<style>
    #chartdiv ,  #chartpiediv {
        width: 100%;
        height: 500px;
    }
    .statistique-flip-card{
        height: 115px;
    }
    .hide {
        display: none;
    }

    .show {
        display: block;
    }
</style>
<div class="row" style="margin-top: 6%">
    <div class="col-xl-2 col-lg-3 col-md-3 col-sm-12">
        <div class="nav flex-column nav-pills bg-white" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link" id="v-pills-region-tab" href="/api/statistique/typeDechetDangereux/new" type="button" role="tab" aria-controls="v-pills-home">Importation de la zone franche </a>
            <a class="nav-link" href="/api/statistique/typeDechetDangereux/nombre" type="button" id="v-pills-comite-tab" role="tab" aria-controls="v-pills-profile">Nombre des autorisations des zones franches</a>
            <a class="nav-link" href="/api/statistique/typeDechetDangereux/societe" type="button" id="v-pills-code-tab" role="tab" aria-controls="v-pills-messages" aria-selected="false">Nombre des sociétés importatrices des déchets </a>
            <a class="nav-link" id="v-pills-secteur-tab" data-toggle="pill" role="tab" aria-controls="v-pills-settings" aria-selected="false">Traitement des Déchets </a>
            </div>
    </div>
    <c:if test="${type.equals('new')}">
    <div class="col-xl-10 col-lg-9 col-md-9 col-sm-12">
            <div class="row justify-content-center">
                <div class="col-lg-6 grid-margin stretch-card mt-2">
                    <div class="card">
                        <div class="card-body">
                            <div id="w">
                                <div id="content">
                                </div>
                            </div>
                            <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                            <hr>
                            <form>
                                <div class="form-group">
                                    <div class="col-auto">
                                        <label><spring:message code="label.typededechet"/> </label>
                                        <select id="typeDechet" class="form-control" style="width: 100%" onchange="selectstatut(this)">
                                            <option value="0" selected="selected">Choisir</option>
                                            <option value="1">Dangereux</option>
                                            <option value="2">Non dangereux</option>
                                        </select>
                                    </div>
                                    <div id="toutes">

                                    </div>

                                </div>

                                    <div class="form-group">
                                        <button onclick="getStatZF()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                                    </div>

                                <c:if test="${type.equals('nombre')}">
                                    <div class="form-group">
                                        <button onclick="getNombreStatZF()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                                    </div>
                                </c:if>
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
                                <div class="col-md-4 tab1">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart3.png"  class="w-100 img_chart" width="70%"></label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="1" id="affiche_shart">
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
    </c:if>
    <c:if test="${type.equals('nombre')}">
        <div class="col-xl-10 col-lg-9 col-md-9 col-sm-12">
            <div class="row justify-content-center">
                <div class="col-lg-6 grid-margin stretch-card mt-2">
                    <div class="card">
                        <div class="card-body">
                            <div id="w">
                                <div id="content">
                                </div>
                            </div>
                            <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                            <hr>
                            <form>
                                <div class="form-group">
                                    <div class="col-auto">
                                        <label><spring:message code="label.typededechet"/> </label>
                                        <select id="typeDechet" class="form-control" style="width: 100%" onchange="selectstatut(this)">
                                            <option value="0" selected="selected">Choisir</option>
                                            <option value="1">Dangereux</option>
                                            <option value="2">Non dangereux</option>
                                        </select>
                                    </div>
                                    <div id="toutes">

                                    </div>
                                </div>


                                    <div class="form-group">
                                        <button onclick="getNombreStatZF()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changes1(1,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 chart1">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes1(2,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 tab1">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes1(3,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="1" id="affiche_shart">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div id="resultat" style="height: auto!important; min-height:50vh">
                        <div id="resultats" style="height: 400px;">
                    </div>
                </div>
            </div>
        </div>
        </div>
    </c:if>
    <c:if test="${type.equals('societe')}">
        <div class="col-xl-10 col-lg-9 col-md-9 col-sm-12">
            <div class="row justify-content-center">
                <div class="col-lg-6 grid-margin stretch-card mt-2">
                    <div class="card">
                        <div class="card-body">
                            <div id="w">
                                <div id="content">
                                </div>
                            </div>
                            <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                            <hr>
                            <form>
                                <div class="form-group">
                                    <div class="col-auto">
                                        <label><spring:message code="label.typededechet"/> </label>
                                        <select id="typeDechet" class="form-control" style="width: 100%" onchange="selectstatut(this)">
                                            <option value="0" selected="selected">Choisir</option>
                                            <option value="1">Dangereux</option>
                                            <option value="2">Non dangereux</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <button onclick="getNombreSocieteZF()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changes2(1,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes2(2,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes2(3,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="1" id="affiche_shart">
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
    </c:if>
</div>

<script src="${pageContext.request.contextPath}/assets/statistique/Chart.min.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/css/chart.js/dist/Chart.js"></script>
<!-- amchart js -->
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/amcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/serial.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/light.js"></script>

<script src="${pageContext.request.contextPath}/assets/statistique/chart/statisticfr.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".select2").select2();
    });

    /* function tous() {
        var region = document.getElementById("region");
        region.classList.remove('show');
        region.classList.add('hide');
    } */

    /* function choisir() {
        var region = document.getElementById("region");
        region.classList.remove('hide');
        region.classList.add('show');
    } */

    function tousAut() {
        var autorisation = document.getElementById("autorisation");
        autorisation.classList.remove('show');
        autorisation.classList.add('hide');

    }

    function choisirAut() {
        var autorisation = document.getElementById("autorisation");
        autorisation.classList.remove('hide');
        autorisation.classList.add('show');
    }

    function fun_change(){
        $(".img_chart").each(function(ind,el){
            var src = "";
            //$("#affiche_shart").val(id);
            $(el).attr("src",src);
        });
        getStatZF();

    }

    function selectstatut(val){
        event.preventDefault();
        var type = $(val).val();
        if(type==="" || type==null){
            return false;
        }

        $.ajax({
            url: '/api/getTransporteurByClassification/'+type,
            type: 'post',
            dataType: "html",
            data: {
            },
        })
            .done(function(data) {

                $("#toutes").html(data);

                /*$("#transporteur option").remove();
                $("#transporteur").append(data);
                $("#transporteur").trigger("change");

                $("#zonneFranche option").remove();
                $("#zonneFranche").append(data);
                $("#zonneFranche").trigger("change");*/

            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
            });


    }

    function getStatZF() {

        var typeDechet =$("#typeDechet").val();
        var transporteur=$("#transporteur").val();
        var zonneFranche=$("#zonneFranche").val();

        $(".chart1").hide();
        $(".pie1").hide();

        if(typeDechet==0 || typeDechet==null){
            swal("<spring:message code="label.Avertissement" />","S'il vous plaît Choisir un type de déchet", "error");
            return false;
        }

        $.ajax({
            url:"/api/statistique/getCodeTypeDangereux",
            type:"GET",

            data:{
                "typeDechet":typeDechet,
                "transporteur":transporteur,
                "zonneFranche":zonneFranche
            }
        }).done(function(data){
            if(data.length==0){
                swal("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }

            var dataProvider = [];

            $(data).each(function(idx,el){

                dataProvider.push({
                    "code"   : el[0],
                    "type"   : el[1]
                });
            });
            $("#affiche_shart").val();

                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.code+"</td><td>"+el.type+"</td></tr>";
                })

                var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead class="bg-vert text-white"> <tr> <th>Code</th> <th>Type de déchet</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat").html(tab1);



        }).fail(function(){
            alert("error");
        })
    }
    function getNombreStatZF() {

        var typeDechet =$("#typeDechet").val();
        var transporteur=$("#transporteur").val();
        var zonneFranche=$("#zonneFranche").val();

        if((transporteur==0 && zonneFranche==0) || (transporteur!=0 && zonneFranche!=0)){
            $(".chart1").hide();
            $(".tab1").hide();
        }
        else{
            $(".chart1").show();
            $(".tab1").show();
        }

        if(typeDechet==0 || typeDechet==null){
            swal("<spring:message code="label.Avertissement" />","S'il vous plaît Choisir un type de déchet", "error");
            return false;
        }

        $.ajax({
            url:"/api/statistique/getNombreTypeDangereux",
            type:"GET",

            data:{
                "typeDechet":typeDechet,
                "transporteur":transporteur,
                "zonneFranche":zonneFranche
            }
        }).done(function(data){

            if(data.length==0){
                swal("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }

            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }


            if((transporteur==0 && zonneFranche==0) || (transporteur!=0 && zonneFranche!=0)){
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "code"   : el[0],
                        "total"  : el[1]
                    });
                });
                var chart = $("#affiche_shart").val();
                var t="";

                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "code",
                        "valueField": "total",
                        "legend": {
                            "useGraphSettings": true,
                            "position":"right",
                            "color":"#003399",
                            "fontSize":14,
                            "markerDisabledColor":"#AAB3B3"
                        },
                        "balloon": {
                            "fixedPosition": true
                        },
                        "export": {
                            "enabled": true
                        },
                        "titles": [
                            {
                                "text": "Nombre des autorisations délivrées pour importation des déchets "+t+" des zones franches",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
            }
            else{
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "code"   : el[0],
                        "type"   : el[1],
                        "total"  : el[2]
                    });
                });
                var chart = $("#affiche_shart").val();

                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "code",
                        "valueField": "total",
                        "legend": {
                            "useGraphSettings": true,
                            "position":"right",
                            "color":"#003399",
                            "fontSize":14,
                            "markerDisabledColor":"#AAB3B3"
                        },
                        "balloon": {
                            "fixedPosition": true
                        },
                        "export": {
                            "enabled": true
                        },
                        "titles": [
                            {
                                "text": "Nombre des autorisations délivrées pour importation des déchets "+t+" des zones franches",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }else if(chart=="2"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "marginRight": 70,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left",
                            "title": "Nombre des autorisations délivrées",

                        }],
                        "startDuration": 1,
                        "graphs": [  {
                            "balloonText": "[[title]]:[[value]]",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "title": "Total",
                            "type": "column",
                            "valueField": "total"
                        }],
                        "legend": {
                            "useGraphSettings": true,
                        },
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": "code",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "export": {
                            "enabled": true
                        }

                    });
                }else if (chart=="3"){
                    if(transporteur!=0){
                        var tr = "";
                        $(dataProvider).each(function(ind,el){
                            tr+="<tr><td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.total+"</td></tr>";
                        })

                        var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                            '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                            '<thead class="bg-vert text-white"> <tr> <th>Zonne franche</th> <th>Société</th> <th>Total</th> </tr>' +
                            ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                        $("#resultat").html(tab1);
                    }
                    else if(zonneFranche!=0){
                        var tr = "";
                        $(dataProvider).each(function(ind,el){
                            tr+="<tr><td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.total+"</td></tr>";
                        })

                        var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                            '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                            '<thead class="bg-vert text-white"> <tr> <th>Société</th> <th>Zonne franche</th> <th>Total</th> </tr>' +
                            ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                        $("#resultat").html(tab1);
                    }
                }
            }

        }).fail(function(){
            alert("error");
        })
    }
    function getNombreSocieteZF() {

        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            swal("<spring:message code="label.Avertissement" />","S'il vous plaît Choisir un type de déchet", "error");
            return false;
        }
        $.ajax({
            url:"/api/statistique/getNombreSociete",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){
            if(data.length==0){
                swal("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }

                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "code"   : el[0],
                        "total"  : el[1],
                    });
                });
                var chart = $("#affiche_shart").val();
                var t ="";
                if(typeDechet==1){
                    t="dangereux";
                }else{
                    t="non dangereux";
                }

                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        "labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "code",
                        "valueField": "total",
                        "legend": {
                            "useGraphSettings": true,
                            "position":"right",
                            "color":"#003399",
                            "fontSize":14,
                            "markerDisabledColor":"#AAB3B3"
                        },
                        "balloon": {
                            "fixedPosition": true
                        },
                        "export": {
                            "enabled": true
                        },
                        "titles": [
                            {
                                "text": "Nombre des sociétés importatrices des déchets "+t+" des Zones Franches ",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }else if(chart=="2"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "marginRight": 70,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left",
                            "title": "Nombre des sociétés importatrices",

                        }],
                        "startDuration": 1,
                        "graphs": [  {
                            "balloonText": "[[title]]:[[value]]",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "title": "Total",
                            "type": "column",
                            "valueField": "total"
                        }],

                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": "code",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "export": {
                            "enabled": true
                        },
                        "legend": {
                            "useGraphSettings": false,
                        },
                        "titles": [
                            {
                                "text": "Nombre des sociétés importatrices des déchets "+t+" des Zones Franches ",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }else if (chart=="3"){
                        var tr = "";
                        $(dataProvider).each(function(ind,el){
                            tr+="<tr><td>"+el.code+"</td><td>"+el.total+"</td></tr>";
                        })

                        var tab1 = '<p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des sociétés importatrices des déchets "+t+" des Zones Franches</p><div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                            '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                            '<thead class="bg-vert text-white"> <tr> <th>Zonne franche</th><th>Total</th> </tr>' +
                            ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';


                        $("#resultat").html(tab1);
                }

        }).fail(function(){
            alert("error");
        })
    }

    function fun_changes1(id,val){

        $(".img_chart").each(function(ind,el){
            var src = "";
            if((id-1)==ind){
                src="/assets/images/chart"+(ind+1)+".png";
            }else {
                src="/assets/images/chart"+(ind+1)+"_gris.png";
            }
            $("#affiche_shart").val(id);
            $(el).attr("src",src);

        });
        getNombreStatZF();

    }


</script>
<script src="/assets/js/Loginstatistique.js"></script>
<jsp:include page="../../includes/footer.jsp" />
