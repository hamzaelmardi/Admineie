<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:if test="${type=='nombre'}">
    <div class="col-12">
        <div class="row justify-content-center">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select id="region" class="form-control" style="width: 100%" onchange="selectRegion(this)">
                                        <option value="0" selected="selected">Choisir</option>
                                        <option value="1" style="background-color: bisque">Niveau nationnal</option>
                                        <c:forEach items="${region}" var="r">
                                            <option value="${r.regionId}">${r.nom_fr}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <br/>
                                <div id="prefectures">

                                </div>
                            </div>


                            <div class="form-group">
                                <button onclick="afficheZon()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
                                        <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changesCT(3,this)"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 chart1">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesCT(1,this)"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 tab1">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesCT(2,this)"></label>
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

<c:if test="${type=='societe'}">
    <div class="col-12">
        <div class="row justify-content-center">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select id="region" class="form-control" style="width: 100%" onchange="selectRegion(this)">
                                        <option value="0" selected="selected">Choisir</option>
                                        <option value="1" style="background-color: bisque">Niveau nationnal</option>
                                        <c:forEach items="${region}" var="r">
                                            <option value="${r.regionId}">${r.nom_fr}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <br/>
                                <div id="prefectures">

                                </div>
                            </div>


                            <div class="form-group">
                                <button onclick="afficheRegion()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
<script>

    function selectRegion(val){
        event.preventDefault();
        var type = $(val).val();
        if(type==="" || type==null){
            return false;
        }
        $.ajax({
            url: '/api/getVillesByRegion/'+type,
            type: 'post',
            dataType: "html",
            data: {
            },
        })
            .done(function(data) {
                $("#prefectures").html(data);
            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
            });
    }

    function afficheZon(){
        var prefecture =$("#prefecture").val();
        $.ajax({
            url:"/api/region",
            type:"GET",
            data:{
                "id_pref":prefecture
            },
            success:function(data) {
                getNombreRegionCT(data);
            },
            error:function() {
                alert("error");
            }
        });
    }

    function afficheRegion(){
        var prefecture =$("#prefecture").val();
        $.ajax({
            url:"/api/region",
            type:"GET",
            data:{
                "id_pref":prefecture
            },
            success:function(data) {
                getSocieteRegionCT(data);
            },
            error:function() {
                alert("error");
            }
        });
    }

    function getNombreRegionCT(reg){
        var region =$("#region").val();
        var prefecture =$("#prefecture").val();

        if(region==0){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir une région',
                'error');
            return false;
        }
        $(".chart1").hide();
        $(".tab1").hide();
        $.ajax({
            url:"/api/statistique/getCountInstallationByRegion",
            type:"GET",

            data:{
                "id_reg":region,
                "prefecture":prefecture
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            if(prefecture==0){
                var dataProvider = [];
                $(data).each(function(idx,el){
                    dataProvider.push({
                        "societe"    : el[0],
                        "region"     : el[1],
                        "total"      : el[2]
                    });
                });
                var chart = $("#affiche_shart").val();
                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "hideCredits":true,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "societe",
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
                            "enabled": false
                        },
                        "titles": [
                            {
                                "text": "Nombre des sociétés autorisées à traiter les Déchets Dangereux ",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }

            }
            else if (prefecture!==0){
                var dataProvider = [];
                $(data).each(function(idx,el){
                    dataProvider.push({
                        "societe"    : el[0],
                        "region"     : el[1],
                        "prefecture" : el[2],
                        "total"      : el[3]
                    });
                });
                var chart = $("#affiche_shart").val();
                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "hideCredits":true,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "societe",
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
                            "enabled": false
                        },
                        "titles": [
                            {
                                "text": "Nombre des sociétés autorisées à traiter les Déchets Dangereux ",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
            }


        }).fail(function(){
            alert("error");
        })
    }

    function getSocieteRegionCT(reg){
        var region =$("#region").val();
        var prefecture =$("#prefecture").val();

        if(region==0){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir une région',
                'error');
            return false;
        }
        $(".pie1").hide();
        $.ajax({
            url:"/api/statistique/getInstallationByRegion",
            type:"GET",

            data:{
                "id_reg":region,
                "prefecture":prefecture
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            if(prefecture==0){
                var dataProvider = [];
                $(data).each(function(idx,el){
                    dataProvider.push({
                        "societe"    : el[0],
                        "region"     : el[1]
                    });
                });

                var tr = "";
                var tr2 = "";
                var tab1 = "";
                $(reg).each(function (ind, ell) {
                    var nom = ell;
                    $(dataProvider).each(function (ind, el) {
                        if (nom === el.region)
                            tr += "<td>" + el.societe + "</td></tr>";
                    })
                    if (tr != '') {
                        tr2 += '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> <table class="table table-bordered"> ' +
                            '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="1" class="text-center">Région : ' + nom + '</th></tr><tr class="bg-vert text-white"><th>Nom de société</th></tr>' +
                            ' </thead> <tbody>' + tr + ' </tbody> </table> </div> </div>';
                        tr = '';
                    }
                })
                tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Les sociétés autorisées à traiter et transporter les Déchets Dangereux </p> ' + tr2 + '</div>';
                $("#resultat").html(tab1);

            }else if (prefecture!==0){
                var dataProvider = [];
                $(data).each(function(idx,el){
                    dataProvider.push({
                        "societe"    : el[0],
                        "region"     : el[1],
                        "prefecture" : el[2],
                        "total"      : el[3]
                    });
                });
                var tr = "";
                var tr2 = "";
                var tab1 = "";
                var r = data[0].slice(1,-1);
                $(reg).each(function (ind, ell) {
                    var nom = ell;
                    $(dataProvider).each(function (ind, el) {
                        if (nom === el.prefecture)
                            tr += "<td>" + el.societe + "</td></tr>";
                    })
                    if (tr != '') {
                        tr2 += '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> <table class="table table-bordered"> ' +
                            '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Région : ' + r + '</th></tr><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Ville : ' + nom + '</th></tr><tr class="bg-vert text-white"><th>Nom de société</th></tr>' +
                            ' </thead> <tbody>' + tr + ' </tbody> </table> </div> </div>';
                        tr = '';
                    }
                })
                tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des sociétés autorisées à collecter et transporter les Déchets Dangereux</p> ' + tr2 + '</div>';
                $("#resultat").html(tab1);

            }


        }).fail(function(){
            alert("error");
        })
    }

    function fun_changesCT(id,val){

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
        afficheZon();

    }
</script>

