

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>


<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>


<div class="main-panel " style="margin-top:120px">
    <div class="content-wrapper">

        <div class="row" style="display:flex;">

            <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >

                <!-- debut from etat dossier -->
                <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-lg-6 col-sm-12 grid-margin stretch-card " >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-eye-check menu-icon"></i>
                        </div>
                        <form id="formVisite">
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>

                                    <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">

                                        <h5 style="float:right;color:black"><spring:message code="label.Planificationdevisite"/></h5>
                                        <div class="row p-0 m-0 mt-5">
                                            <div class="form-group mt-5" style="width: 100%;">

                                                <div class="form-group text-left">
                                                    <label ><spring:message code="label.Datedevisite"/>   </label>
                                                    <input class="form-control datepicker" data-date-format="dd/mm/yyyy" name="date_visite_S" value="${visite.date_visite_S}"  id="date_visite" ${dd}>

                                                    <!--  <fmt:formatDate value="${visite.date_visite}" pattern="yyyy/MM/dd HH:mm" var="d_t"/>
                                                    <input class="form-control" name="date_visite_S" value="${d_t}" id='datetime' onchange="fun_date100(this)">
                                                   -->
                                                    <input type="hidden" class="form-control dt"  name="id_visite_installation" value="${visite.id_visite_installation}" placeholder="">
                                                </div>
                                                
                                                <div class="form-group text-left">
                                                    <label > <spring:message code="label.Raisonsocial"/>   </label>
                                                    <input  class="form-control"  name="raison" value="${inst.raison}" disabled id="raison" class="form-control">
                                                </div>
                                                <div class="form-group dt text-left">
                                                    <div class="form-group st text-left">
                                                    <label ><spring:message code="label.Objet"/></label>
                                                    <input type="text" name="object" class="form-control st" value="visite" >
                                                </div>

                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                                <div class="row  mb-4" style="margin:14px;">
                                    <a  class="btn btn-primary btn-block suivantvisite" id="suivantvisite" onclick="add_visite('${id}')" ><spring:message code="label.Enregistrer"/>  </a>
                                    <a class="btn btn-secondary btn-block"  href="/api/getListeInstallation/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Annuler"/></a>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div> </div>
<!-- main-panel ends -->

<jsp:include page="../../includes/footer.jsp" />
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<script type="text/javascript">

    $('#date_visite').datepicker({
        startDate: '-3d'
    });

    function addStatut(etat){

        if(etat=="1"){
            $(".st").addClass("hidden");
            $(".dt").removeClass("hidden");
        }
        else if(etat=="2"){
            $(".dt").addClass("hidden");
            $(".st").removeClass("hidden");
        }

    }

    function add_visite(id){
    	$.fn.serializeObject = function () {
    	    var o = {};
    	    var a = this.serializeArray();
    	    $.each(a, function () {
    	        if (o[this.name]) {
    	            if (!o[this.name].push) {
    	                o[this.name] = [o[this.name]];
    	            }
    	            o[this.name].push(this.value || '');
    	        } else {
    	            o[this.name] = this.value || '';
    	        }
    	    });
    	    return o;
    	};
    	var se = $("#formVisite").serializeObject();
       var date = $("#date_visite").val();
       if($.trim(date)==="" || date==false){
           swal("<spring:message code="label.Avertissement"/> ! ","<spring:message code="label.Ladateestobligatoire"/>","error");
           return false;
       }
        $.ajax({
            type: "POST",
            url :"/api/add_visiteInstallation/"+id,
            contentType : 'application/json; charset=utf-8',
            data :  JSON.stringify(se),

            success : function(response) {
                window.location="/api/getListeInstallation/0/6/0";
            },
            error : function(response) {
                alert(' ajout non effectué');
            }
        });

    }
</script>
