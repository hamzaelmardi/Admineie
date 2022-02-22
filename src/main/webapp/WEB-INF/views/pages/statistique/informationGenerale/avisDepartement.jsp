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
                                    <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changesAvisD(1,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">

                                    <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesAvisD(2,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesAvisD(3,this)"></label>
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
            <div id="resultat" style="min-height:400px">
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {

        $.ajax({
            url:"/api/statistique/getAvisdepartementsconcernesJsp",
            type:"GET",
            data:{
            }
        }).done(function(data){
            if(data[0]==null || data.length===0){
                Swal.fire(
                    '<spring:message code="label.AucunResultat"/>','<spring:message code="label.Aucunresultatnecorrespondavoscriterederecherche"/>', 'error');
                return false;
            }

            var dataProvider = [];

            $(data).each(function(idx,el){

                dataProvider.push({
                    "nbr"   : el[0],
                    "etat"  : el[1],
                    "type"  : el[2]
                });
            });
            var chart = $("#affiche_shart").val();

            if(chart=="1"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "pie",
                    "theme": "none",
                    "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                    "labelRadius": -35,
                    "labelText": "[[percents]]%",
                    "dataProvider": dataProvider,
                    "valueField": "nbr",
                    "titleField": "type",
                    "balloon": {
                        "fixedPosition": true
                    },
                    "export": {
                        "enabled": false
                    },
                    "hideCredits":true,
                });
            }else if(chart=="2"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "serial",
                    "theme": "none",
                    "hideCredits":true,
                    "marginRight": 70,
                    "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre d'autorisation",

                    }],
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "<b>[[etat]]: [[nbr]]</b>",
                        "fillAlphas": 0.9,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": "nbr"
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "type",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
                    "export": {
                        "enabled": false
                    }

                });
            }else if (chart=="3"){
                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.type+"</td><td>"+el.etat+"</td><td>"+el.nbr+"</td></tr>";
                })

                var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead class="bg-vert"> <tr><th>Autotrisation</th> <th>Etat</th> <th>Nombre d\'autorisations</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat").html(tab1);
            }


        }).fail(function(){
            alert("error");
        })
    })


    function fun_changesAvisD(id,val){

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
                url:"/api/statistique/getAvisdepartementsconcernesJsp",
                type:"GET",
                data:{
                }
            }).done(function(data){
                if(data[0]==null || data.length===0){
                    Swal.fire(
                        '<spring:message code="label.AucunResultat"/>','<spring:message code="label.Aucunresultatnecorrespondavoscriterederecherche"/>', 'error');
                    return false;
                }

                var dataProvider = [];

                $(data).each(function(idx,el){

                    dataProvider.push({
                        "nbr"   : el[0],
                        "etat"  : el[1],
                        "type"  : el[2]
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
                        "labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "valueField": "nbr",
                        "titleField": "type",
                        "balloon": {
                            "fixedPosition": true
                        },
                        "export": {
                            "enabled": false
                        }
                    });
                }else if(chart=="2"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "marginRight": 70,
                        "hideCredits":true,
                        "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left",
                            "title": "Nombre d'autorisation",

                        }],
                        "startDuration": 1,
                        "maxSelectedSeries": 10,
                        "mouseWheelScrollEnabled": false,
                        "chartScrollbar": {
                            "graphType": "column",
                            "resizeEnabled": false,
                            "scrollbarHeight": 21,
                            "scrollDuration": 0,
                            "updateOnReleaseOnly": true
                        },
                        "graphs": [{
                            "balloonText": "<b>[[etat]]: [[nbr]]</b>",
                            "fillAlphas": 0.9,
                            "lineAlpha": 0.2,
                            "type": "column",
                            "valueField": "nbr"
                        }],
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": "type",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "export": {
                            "enabled": false
                        }

                    });
                }else if (chart=="3"){
                    var tr = "";
                    $(dataProvider).each(function(ind,el){
                        tr+="<tr><td>"+el.type+"</td><td>"+el.etat+"</td><td>"+el.nbr+"</td></tr>";
                    })

                    var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                        '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                        '<thead class="bg-vert text-white"> <tr><th>Autotrisation</th> <th>Etat</th> <th>Nombre d\'autorisations</th> </tr>' +
                        ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                    $("#resultat").html(tab1);
                }


            }).fail(function(){
                alert("error");
            })
        })

    }
</script>
