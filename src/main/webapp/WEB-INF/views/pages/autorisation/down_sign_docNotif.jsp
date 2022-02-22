<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    label {
        float: ${pageContext.response.locale=='ar'?'right':'left'};
    }
</style>

<div class="container-fluid" style="margin-top:180px">
    <div class="content-wrapper p-0">
        <form action="/api/setAutorisationDocumentSigner/${id}/${type}" method="post" enctype="multipart/form-data">
        <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-lg-6 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                                <c:if test="${notification.zf_et=='TR'}">
                                    <div class="btn-gris"><spring:message code="label.Telechargeretsignerlettre"/></div>
                                </c:if>
                                <c:if test="${notification.zf_et!='TR'}">
                                    <div class="btn-gris"><spring:message code="label.Telechargeretsignerleautorisation"/></div>
                                </c:if>
                            </div>
                        </div>
                        <div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                            <div class="col-lg-6 col-md-8 col-sm-12 border mb-5 p-4">
                                <div class="form-group">
                                    <div class="row justify-content-center mb-2">
                                        <div class="col-10">
                                            <a type="button" onclick="goToLienRecap('${type}/${notification.id_notification}')" class="btn btn-success btn-block"><i class="fa fa-print"></i><spring:message code="label.Afficherlerecapitulatif"/></a>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-10">
                                            <c:if test="${notification.zf_et=='ZF'}">
                                                <a href="/api/downloadRecuDepo/${notification.id_notification }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlautorisation1"/></a>
                                            </c:if>
                                            <c:if test="${notification.zf_et=='ET'}">
                                                <a href="/api/downloadRecuDepoND/${notification.id_notification }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlautorisation1"/></a>
                                            </c:if>
                                            <c:if test="${notification.zf_et=='XD'}">
                                                <a href="/api/generate_word_export/${notification.id_notification }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlautorisation1"/> </a>
                                            </c:if>
                                            <c:if test="${notification.zf_et=='TR'}">
                                                <a href="/api/generate_word_transit/${notification.id_notification }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlalettre"/> </a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <div class="row justify-content-center">
                                        <div class="col-10">
                                            <c:if test="${notification.zf_et=='TR'}">
                                            <label class=""><spring:message code="label.Importerlalettresigne"/> </label>
                                            </c:if>
                                            <c:if test="${notification.zf_et!='TR'}">
                                            <label class=""><spring:message code="label.Importerlautorisationsigne"/> </label>
                                            </c:if>
                                            <input accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc" required>
                                        </div>
                                        <c:if test="${notification.zf_et!='TR'}">
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.Datedebut"/></label>
                                                <input type="date" class="form-control dt dateDebut" name="date1" id="date1" placeholder="" required onchange="setDateFin()">
                                            </div>
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.DateFin"/></label>
                                                <input type="date" class="form-control dt" name="date2" id="date2" min="" placeholder="" required>
                                            </div>
                                        </c:if>
                                        <c:if test="${notification.zf_et=='TR'}">
                                        <div class="col-10">
                                            <label><spring:message code="label.Datesignature"/></label>
                                            <input type="date" class="form-control dt" name="date1" id="date1" placeholder="" required>
                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row p-0 justify-content-center">
                                        <div class="col-10">
                                            <div class="row justify-content-end">
                                                <div class="col-lg-4 col-md-5 col-sm-12 p-0">
                                                    <button type="submit" class="btn btn-success btn-block">
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
        </form>
    </div>
</div>



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
<script>
    function goToLienRecap(val){
        window.location.href='/api/recap_autorisation/'+val;
    }
   /* $(document).ready(function () {
        document.getElementById('date1').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    })*/

    function setDateFin(){
        var date = $("#date1").val();
        var x = new Date(date);
        document.getElementById('date2').min = new Date(x.getTime() - x.getTimezoneOffset() * 60000).toISOString().split("T")[0];
    }
</script>