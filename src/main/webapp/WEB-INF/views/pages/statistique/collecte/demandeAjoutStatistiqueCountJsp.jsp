<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<div class="col-12">
    <div class="row justify-content-center">
        <div class="col-lg-12 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                    <hr>
                    <div class="row " style="width: 40%;float: right;">
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changes2CT(1,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">

                                    <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes2CT(2,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changes2CT(3,this)"></label>
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

<script>
    $(document).ready(function () {

        $.ajax({
            url:"/api/statistique/getCountDemandeAjout",
            type:"GET",

            data:{
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun r??sultat","Aucun r??sultat ne corr??spond ?? vos crit??res de recherche","warning");
                return false;
            }
            var dataProvider = [];
            $(data).each(function(idx,el){
                dataProvider.push({
                    "email"    : el[0],
                    "nom"     : el[1],
                    "total"      : el[2]
                });
            });
            var chart = $("#affiche_shart").val();
            if(chart=="1"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "pie",
                    "theme": "none",
                    "hideCredits":true,
                    "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                    "labelRadius": -35,
                    //"labelText": "[[percents]]%",
                    "dataProvider": dataProvider,
                    "valueField": "total",
                    "titleField": "nom",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": false
                    }
                });
            }
            else if(chart=="2"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "serial",
                    "theme": "none",
                    "hideCredits":true,
                    "marginRight": 70,
                    "colors": ["#80cbc4","#00897b","#004d40"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre des autorisations d??livr??es",

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
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "nom",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": false
                    },
                    "legend": {
                        "useGraphSettings": false,
                    },
                    "titles": [
                        {
                            "text": "Nombre des demandes d???ajout des v??hicules et d??chets par les soci??t??s autoris??s",
                            "color":"#003399",
                            "size": 20
                        }
                    ]
                });
            }
            else if (chart=="3"){
                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.nom+"</td><td>"+el.total+"</td></tr>";
                })
                var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des demandes d???ajout des v??hicules et d??chets par les soci??t??s autoris??s</p>' +
                    '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead><tr class="bg-vert text-white"><th style="width: 20%">Nom de soci??t??</th><th>Total</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat").html(tab1);
            }

        }).fail(function(){
            alert("error");
        })
    });



    function fun_changes2CT(id,val){

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
        $(document).ready(function () {

            $.ajax({
                url:"/api/statistique/getCountDemandeAjout",
                type:"GET",

                data:{
                }
            }).done(function(data){
                if(data.length===0){
                    Swal.fire("Aucun r??sultat","Aucun r??sultat ne corr??spond ?? vos crit??res de recherche","warning");
                    return false;
                }
                var dataProvider = [];
                $(data).each(function(idx,el){
                    dataProvider.push({
                        "email"    : el[0],
                        "nom"     : el[1],
                        "total"      : el[2]
                    });
                });
                var chart = $("#affiche_shart").val();
                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "hideCredits":true,
                        "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "valueField": "total",
                        "titleField": "nom",
                        "balloon": {
                            "fixedPosition": true
                        },
                        "export": {
                            "enabled": false
                        }
                    });
                }
                else if(chart=="2"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "hideCredits":true,
                        "marginRight": 70,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left",
                            "title": "Nombre des autorisations d??livr??es",

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
                        "maxSelectedSeries": 10,
                        "mouseWheelScrollEnabled": false,
                        "chartScrollbar": {
                            "graphType": "column",
                            "resizeEnabled": false,
                            "scrollbarHeight": 21,
                            "scrollDuration": 0,
                            "updateOnReleaseOnly": true
                        },
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": "nom",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "export": {
                            "enabled": false
                        },
                        "legend": {
                            "useGraphSettings": false,
                        },
                        "titles": [
                            {
                                "text": "Nombre des demandes d???ajout des v??hicules et d??chets par les soci??t??s autoris??s",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
                else if (chart=="3"){
                    var tr = "";
                    $(dataProvider).each(function(ind,el){
                        tr+="<tr><td>"+el.nom+"</td><td>"+el.total+"</td></tr>";
                    })
                    var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                        '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des demandes d???ajout des v??hicules et d??chets par les soci??t??s autoris??s</p>' +
                        '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                        '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                        '<thead><tr class="bg-vert text-white"><th style="width: 20%">Nom de soci??t??</th><th>Total</th> </tr>' +
                        ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                    $("#resultat").html(tab1);
                }

            }).fail(function(){
                alert("error");
            })
        });

    }
</script>