<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />


<div class="container-fluid" style="margin-top: 150px">
    <div class="content-wrapper p-5 mt-5"  style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <form action="/api/setAutorisationDocumentSigner/${id}/IT" method="post" enctype="multipart/form-data">
        <div class="row" >
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                       <div class="row justify-content-center">
                           <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                               <div class="btn-gris"><spring:message code="label.Telechargeretsignerleautorisation"/> </div>
                           </div>
                       </div>
                        <div class="row justify-content-center">
                            <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                <div class="form-group">
                                    <div class="row justify-content-center">
                                        <div class="col-md-10 col-sm-12">
                                            <a href="/api/generate_word_installation/${installlation.id_installation }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlautorisation1"/> </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <div class="row justify-content-center">
                                        <div class="col-10 text-left">
                                            <label class=""><spring:message code="label.Importerlautorisationsigne"/> </label>
                                            <input accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc" required>
                                        </div>
                                        <div class="col-10 text-left">
                                            <label><spring:message code="label.Datesignature"/> </label>
                                            <input type="date" class="form-control dt" name="date1" id="date1" placeholder="" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="row p-0 justify-content-center">
                                        <div class="col-10">
                                            <div class="row ">
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



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />