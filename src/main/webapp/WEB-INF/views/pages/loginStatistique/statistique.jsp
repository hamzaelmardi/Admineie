
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<script src="/assets/js/amchartV3/amcharts.js"></script>
<script src="/assets/js/amchartV3/pie.js"></script>
<script src="/assets/js/amchartV3/serial.js"></script>
<script src="/assets/js/amchartV3/export.min.js"></script>
<link rel="stylesheet" href="/assets/css/amchartV3/export.css" type="text/css" media="all" />

<div class="container-fluid">
    <div class="row ">
        <div class=" col-md-12 col-sm-12 ">
           <div class="m-0 p-0 row justify-content-center text-left">
               <div class="col-md-8 text-center mt-2 mb-3">
                   <h1>${titre}</h1>
               </div>

               <div class="col-5 pl-1 pr-1 ">
                   <div class="row mr-2 ml-2">
                       <div class="col-12 text-white bg-vert">
                           <p class="text-center h4">Recherche</p>
                       </div>
                       <div class="col-12 border-success border">
                           <div class="row p-0 m-0 justify-content-center">
                               <div class="col-auto">
                                   <div class="form-group">
                                       <div class="form-check form-check-inline">
                                           <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="1">
                                           <label class="form-check-label m_4p" for="inlineRadio1">Date dépots</label>
                                       </div>
                                   </div>
                               </div>
                               <div class="col-auto">
                                   <div class="form-group">
                                       <div class="form-check form-check-inline">
                                           <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="2">
                                           <label class="form-check-label m_4p" for="inlineRadio2">Date validation</label>
                                       </div>
                                   </div>
                               </div>
                           </div>
                           <div class="row p-0 m-0">
                               <div class="col-md-6 col-sm-12">
                                   <div class="form-group">
                                       <label>Date début : </label>
                                       <input type="date" class="form-control" id="date1">
                                   </div>
                               </div>
                               <div class="col-md-6 col-sm-12">
                                   <div class="form-group">
                                       <label>Date Fin : </label>
                                       <input type="date" class="form-control" id="date2">
                                   </div>
                               </div>
                           </div>

                           <input id="type" type="hidden" value="${type}">


                               <button onclick="getStat1()" class="btn btn-primary float-right mb-3"> <span class="fa fa-search-plus"></span> Recherche</button>
                       </div>
                   </div>
               </div>

               <div class="col-5 pl-1 pr-1" style="min-height: 100%;">
                   <div class="row mr-2 ml-2" style="height: 100%;">
                       <div class="col-12 text-white bg-vert">
                           <p class="text-center h4">Type d'affichage</p>
                       </div>
                       <div class="col-12 border-success border " style="display: block;height: 83%;">
                           <div class="row mb-4 mt-2">
                               <div class="col-4">
                                   <img src="/assets/images/chart1.png" class="w-100 img_chart" onclick="fun_change(1,this)">
                               </div>
                               <div class="col-4">
                                   <img src="/assets/images/chart2_gris.png" class="w-100 img_chart" onclick="fun_change(2,this)">
                               </div>
                               <div class="col-4">
                                   <img src="/assets/images/chart3_gris.png" class="w-100 img_chart" onclick="fun_change(3,this)">
                               </div>
                               <input type="hidden" value="1" id="affiche_shart">
                           </div>
                       </div>
                   </div>
               </div>



               <div class="col-12">
                   <div id="resultat" style="height: 400px">

                   </div>
               </div>


           </div>
        </div>
    </div>
</div>

<script src="/assets/js/Loginstatistique.js"></script>
<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />




