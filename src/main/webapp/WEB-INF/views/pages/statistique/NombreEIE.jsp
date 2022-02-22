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
                    <c:if test="${!etat.equals('AE')}">
                        Nombre de DAE délivrées
                    </c:if>
                    <c:if test="${etat.equals('AE')}">
                        Nombre de CCE délivrées
                    </c:if>
                </h5>
                <hr>
                <form>
                    <div class="form-group text-left">
                        <label>Année </label>
                        <div class="input-group">
                            <select multiple class="form-control select2" id="annee">
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
                        <button  onclick="getStat11()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
                                <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_change(1,this)"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="custom-control">
                                <label><img src="/assets/images/chart2_gris.png" class="w-100 img_chart" width="70%" onclick="fun_change(2,this)"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <div class="custom-control">
                                <label><img src="/assets/images/chart3_gris.png" class="w-100 img_chart" width="70%" onclick="fun_change(3,this)"></label>
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
    $(document).ready(function() {
        $(".select2").select2();
    });

    function getStat11() {

        var annee = new Array();
        var annee = $("#annee").val();

        if(annee == 0){
            Swal.fire("Attention!","Merci de choisir une année valide","error");
            return false;
        }

        $.ajax({
            url:"/api/statistique/getEIEparcategorie/${etat}",
            type:"GET",

            data:{
                "annee":annee
            }
        }).done(function(data){
            if(data.length==0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond aux critère de recherche","warning");
                return false;
            }

            var dataProvider = [];

            $(data).each(function(idx,el){

                dataProvider.push({
                    "total"   : el[0],
                    "year"  : el[1]
                });
            });
            var chart = $("#affiche_shart").val();

            if(chart=="1"){
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
                    "titles": [
                        {
                            "text": "Nombre de DAE délivrées",
                            "color":"#003399",
                            "size": 20
                        }
                    ],
                    "legend": {
                        "useGraphSettings": false,
                        "position":"right",
                        "fontSize":14,
                    },
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
                    "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre de DAE délivrées",

                    }],
                    "titles": [
                        {
                            "text": "Nombre de DAE délivrées",
                            "color":"#003399",
                            "size": 20
                        }
                    ],
                    "legend": {
                        "useGraphSettings": true,
                        "position":"right",
                        "color":"#003399",
                        "fontSize":14,
                        "markerDisabledColor":"#AAB3B3"
                    },
                    "hideCredits":true,
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "[[title]]:[[value]]",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "title": "Nombre de DAE",
                        "type": "column",
                        "valueField": "total",
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "year",
                    "categoryAxis": {
                        "gridPosition": "start",
                    },
                    "export": {
                        "enabled": false
                    }

                });
            }else if (chart=="3"){
                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.year+"</td><td>"+el.total+"</td></tr>";
                })

                var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                    '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre de DAE délivrées</p> ' +
                    '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover"> ' +
                    '<thead class="text-white"> <tr style="background-color: #1b5e20; color: white"> <th>Année</th> <th>Nombre de DAE délivrées</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div></div>';

                $("#resultat").html(tab1);
            }


        }).fail(function(){
            alert("error");
        })
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/sweet.js"></script>
<script src="/assets/js/nombreEIE.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>
