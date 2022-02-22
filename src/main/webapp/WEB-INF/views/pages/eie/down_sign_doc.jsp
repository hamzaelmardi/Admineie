<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />


<div class="container-fluid" style="margin-top:180px">
    <div class="content-wrapper p-0">
        <div class="row" >
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                       <div class="row justify-content-center">
                           <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                               <div class="btn-gris"><spring:message code="label.TelechargeretsignerleautorisationEIE"/></div>
                           </div>
                       </div>
                        <div class="row justify-content-center">
                            <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                <div class="form-group">
                                    <div class="row justify-content-center mb-2">
                                        <div class="col-md-10 col-sm-12">
                                            <a type="button" onclick="goToLienRecap('${dmd.type}/${dmd.id_demande_information}')" class="btn btn-success btn-block"><i class="fa fa-print"></i><spring:message code="label.Afficherlerecapitulatif"/></a>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-md-10 col-sm-12">
                                            <a href="/api/demande_print/${dmd.id_demande_information}" class="btn btn-success btn-block"> <spring:message code="label.TelechargeretsignerleautorisationEIE"/></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <div class="row justify-content-center">
                                        <div class="col-10 text-left">
                                            <label class=""><spring:message code="label.TelechargeretsignerleautorisationEIE"/></label>
                                            <input type="file" class="form-control" onchange="setdemandeDocumentSigner(this,'${dmd.id_demande_information}')" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <div class="row justify-content-center">
                                        <div class="col-10 text-left">
                                            <label class=""><spring:message code="label.DateDebut"/></label>
                                            <input type="date" class="form-control dateDebut" id="date_debut" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row p-0 justify-content-center">
                                        <div class="col-10">
                                            <div class="row justify-content-end">
                                                <div class="col-md-4 col-sm-12 p-0">
                                                    <button onclick="fun_save_document('${dmd.id_demande_information}','${dmd.type}')" class="btn btn-success btn-block">
                                                      <spring:message code="label.Enregistrer"/>  
                                                    </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>

<script>
    function goToLienRecap(val){
        window.location.href='/api/recap_evaluation/'+val;
    }
    $(document).ready(function () {
        document.getElementById('date_debut').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    })
</script>
<jsp:include page="../../includes/footer.jsp" />
