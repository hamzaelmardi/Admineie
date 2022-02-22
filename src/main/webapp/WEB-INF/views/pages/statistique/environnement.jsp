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

<div class="row" style="margin:180px 10px 0px 10px;">
    <div class="col-lg-12 grid-margin grid-margin-md-0">
        <div class="card ">
            <div class="card-body p-4">

                <div class="row portfolio-grid justify-content-center">

                    <div class="col-lg-4 col-md-5 col-sm-12 mt-2">
                        <div class="statistique-flip-card">
                            <div class="statistique-flip-card-inner">
                                <div class="statistique-flip-card-front">
                                    <div class="mt-3">
                                        <i class="mdi mdi-file-check btn-icon-prepend mdi-36px" style="text-align:center"></i>
                                        <h6 class="card-title2 mb-1"><spring:message code='label.Nombretotaledesautorisationsdesdechetspartype'/></h6>
                                    </div>
                                </div>
                                <div class="statistique-flip-card-back">
                                    <a href="/api/statistique/autorisation_octroyees/autorisation" type="button" class="btn btn-info"><spring:message code='label.Afficher'/> </a>
                                    <h6 class="card-title2 mb-1" style="color:white; margin-top: 15px"><spring:message code='label.Nombretotaledesautorisationsdesdechetspartype'/></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-12 mt-2">
                        <div class="statistique-flip-card">
                            <div class="statistique-flip-card-inner">
                                <div class="statistique-flip-card-front" style="background-color:  #d59d32">
                                    <div class="mt-3">
                                        <i class="mdi mdi-vector-rectangle btn-icon-prepend mdi-36px" style="text-align:center;color:white"></i>
                                        <h6 class="card-title2 mb-1 " style="color:white"><spring:message code='label.Nombretotaledesautorisationsdesdechetsparstatut'/></h6>
                                    </div>
                                </div>
                                <div class="statistique-flip-card-back" style="background-color:  #d59d32">
                                    <a href="/api/statistique/environnement/autorisation" type="button" class="btn btn-info"> <spring:message code='label.Afficher'/></a>
                                    <h6 class="card-title2 mb-1" style="color:white; margin-top: 15px"><spring:message code='label.Nombretotaledesautorisationsdesdechetsparstatut'/></h6>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="col-lg-6 grid-margin stretch-card mt-3">
                                                                <div class="card">
                                                                    <div class="card-body">


                                                                        <div id="w">
                                                                            <div id="content">
                                                                            </div>
                                                                        </div>
                                                                         <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechetsparstatut'/></h5>
                                                                      <hr>

                                                                        <form>


                                                                            <div class="form-group">

                                                                          <div class="col-auto">

                                                                                  <div class="form-check form-check-inline">
                                                                                   <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="date_depot" checked="checked">
                                                                                    <label class="form-check-label m_4p" for="inlineRadio1" id="dateD" onclick="date_depot()"><spring:message code='label.Datedepots'/></label>
                                                                                 </div>
                                                                                 <div class="form-check form-check-inline">
                                                                                   <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="date_validation">
                                                                                    <label class="form-check-label m_4p" for="inlineRadio1" id="dateV" onclick="date_vaalidation()"><spring:message code='label.DateValidation'/></label>
                                                                                 </div>





                                                                                    <select  id="type"  class="form-control select2" style="width: 100%" onchange="selectstatut(this)">
                                                                                        <option value="0" selected="selected"><spring:message code='label.Choisir'/> </option>
                                                                                        <option value="ZF"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/> </option>
                                                                                        <option value="ET"><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></option>
                                                                                        <option value="IT"><spring:message code='label.Installationdetraitementdesdechets'/></option>
                                                                                        <option value="CT"><spring:message code='label.CollecteTransport'/></option>
                                                                                        <option value="XD"><spring:message code='label.ExportationDesDechetsDangereux'/></option>
                                                                                        <option value="TR"><spring:message code='label.TransitDesDechets'/></option>

                                                                                    </select>

                                                                                 <div class="mt-3"id="autorisationparstatut" >

                                                                                    <select id="statut_select" class="form-control select2"  style="width: 100%" multiple>
                                                                                     <!-- load dynamique -->
                                                                                    </select>

                                                                                </div>
                                                                            </div>


                               </div>
                                                                            <div class="form-group">
                                                                                <label><spring:message code='label.DateDebut'/></label>
                                                                                <div class="input-group">
                                                                                    <input type="date" value="" placeholder="Date Début" class="form-control mydatepicker dateDebut" id="date1">
                                                                                </div>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label><spring:message code='label.DateFin'/></label>
                                                                                <div class="input-group">
                                                                                    <input type="date" value="" placeholder="Date Fin" class="form-control mydatepicker" id="date2">
                                                                                </div>
                                                                            </div>

                                                                                <div class="form-group">
                                                                                    <button  onclick="getStat10()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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

                                                                                        <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changes(1,this)"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <div class="custom-control">

                                                                                        <label><img src="/assets/images/chart2_gris.png" class="w-100 img_chart" width="70%" onclick="fun_changes(2,this)"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group">
                                                                                    <div class="custom-control">

                                                                                        <label><img src="/assets/images/chart3_gris.png" class="w-100 img_chart" width="70%" onclick="fun_changes(3,this)"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <input type="hidden" value="1" id="affiche_shart">
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>

    <div class="col-12">
                                                             <div class="card">
                                                                    <div class="card-body">
                                                                 <div id="resultat" style="height: auto!important; min-height:50vh">

</div>
</div>


                                                            </div>



                                                        </div>



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
    function selectstatut(val){

	    event.preventDefault();
	    var type = $(val).val();
	    if(type==="" || type==null){
	        return false;
	    }

	    $.ajax({
	        url: '/api/getStatutBytype/'+type,
	        type: 'post',
	        dataType: "html",
	        data: {},
	    })
	        .done(function(data) {

	            $("#statut_select option").remove();
	            $("#statut_select").append(data);
	            $("#statut_select").trigger("change");
	        })
	        .fail(function() {
	            alert("error");
	        })
	        .always(function() {
	            console.log("complete");
	        });


}
    //
  function fun_changes(id,val){

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
    getStat10();

}
    function getStat10() {
	var date1 =$("#date1").val();
	var date2 = $("#date2").val();

	var type= $("#type").val();


	var type_date = $("input[name=inlineRadioOptions]:checked").val();

	var statut_select=new Array();
    statut_select=$("#statut_select").val();

	if(!date1 || !date2){
	swal("<spring:message code="label.Attention"/>!","<spring:message code="label.Mercidesaisirunedatevalide"/>","error");
	return false;
	}

	$.ajax({
	url:"/api/statistique/Autorisationparstatut",
	type:"GET",

	data:{
	"date1":date1,
	"date2":date2,
	"type":type,
	"type_date":type_date,
	"statut_select":statut_select
	}
      }).done(function(data){
    	 console.log(data);
         if(data[0]==null || data.length==0){
              swal("<spring:message code="label.AucunResultat"/>","<spring:message code="label.Aucunresultatnecorrespondavoscriterederecherche"/>","warning");
              return false;
          }

          var dataProvider = [];

          $(data).each(function(idx,el){

              dataProvider.push({
                  "nbr"   : el[0],
                  "etat"  : el[1]
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
                  "titleField": "etat",



                  "balloon": {
                      "fixedPosition": true
                  },
                  "export": {
                      "enabled": true
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
                  "categoryField": "etat",
                  "categoryAxis": {
                      "gridPosition": "start",
                      "labelRotation": 45
                  },
                  "export": {
                      "enabled": true
                  }

              });
          }else if (chart=="3"){
              var tr = "";
              $(dataProvider).each(function(ind,el){
                  tr+="<tr><td>"+el.etat+"</td><td>"+el.nbr+"</td></tr>";
              })

              var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                  '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                  '<thead class="bg-vert"> <tr> <th>Etat</th> <th>Nombre d\'autorisations</th> </tr>' +
                  ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

              $("#resultat").html(tab1);
          }


      }).fail(function(){
          alert("error");
      })
  }


</script>
<script src="/assets/js/Loginstatistique.js"></script>
<jsp:include page="../../includes/footer.jsp" />
