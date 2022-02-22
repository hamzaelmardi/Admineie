<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>
<div class="container-fluid" style="margin-top: 150px">
    <div class="content-wrapper p-0">
        <form action="/api/setAutorisationLettreAttachement/${id}/XD" method="post" enctype="multipart/form-data">
            <div class="row" >
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                                    <div class="btn-gris"><spring:message code="label.Attacherlavisdepaysdedestination"/></div>
                                </div>
                            </div>
                            <div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                    <div class="form-group mt-4">
                                        <div class="row justify-content-center">
                                            <div class="col-md-10 col-sm-12 text-left">
                                                <label class=""> <spring:message code="label.Attacherlavisdepaysdedestination"/></label>
                                                <input required accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc">
                                            </div>
                                            <div class="col-10 " style="${pageContext.response.locale=='ar'?'text-align:right':'text-align:left'}">
                                                <label><spring:message code="label.Avis"/></label>
                                            <select class="custom-select " id="attachement" name="etat" ${dd}>
                                                <option value="85"><spring:message code="label.Favorable"/></option>
                                                <option value="86"><spring:message code="label.NonFavorable"/></option>

                                            </select>
                                            </div>
                                            <div class="col-10 text-left mt-2" id="n" style="display: none">
                                                <label><spring:message code='label.Commentaire'/> </label>
                                                <textarea id="comment" type="text" class="form-control" name="comment" rows="3"></textarea>
                                            </div>
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.Ladatedereceptiondelalettre"/></label>
                                                <input required type="date" class="form-control dt" name="date1" id="date1" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row p-0 justify-content-center">
                                            <div class="col-10">
                                                <div class="row justify-content-end">
                                                    <div class="col-md-4 col-sm-12 p-0">
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


<script>
    document.getElementById('attachement').onchange = function(){
        if(this.value == 86){
            /!* document.getElementById('f').style.display = 'none';*!/
            document.getElementById('n').style.display = 'block';
        } else {
            /!* document.getElementById('f').style.display = 'block';*!/
            document.getElementById('n').style.display = 'none';
        }
    };
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
