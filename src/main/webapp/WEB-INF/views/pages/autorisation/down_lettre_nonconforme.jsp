 <jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />


<div class="container-fluid" style="margin-top: 110px">
    <div class="content-wrapper p-0" style="margin-top: 80px">
        <form action="/api/setAutorisationLettreNonConforme/${id}/XD" method="post" enctype="multipart/form-data">
            <div class="row" >
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="col-6 border mb-5 p-4">
                                    <div class="form-group mt-4">
                                        <div class="row justify-content-center">
                                            <div class="col-10 text-left">
                                                <label class=""> <spring:message code="label.Importerlalettredenonconforme"/></label>
                                                <input required accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc">
                                            </div>
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.Ladatedesignature"/></label>
                                                <input required type="date" class="form-control dt" name="date1" id="date1" placeholder="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row p-0 justify-content-center">
                                            <div class="col-10">
                                                <div class="row justify-content-end">
                                                    <div class="col-md-3 col-sm-12 p-0">
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
            /* document.getElementById('f').style.display = 'none';*/
            document.getElementById('n').style.display = 'block';
        } else {
            /* document.getElementById('f').style.display = 'block';*/
            document.getElementById('n').style.display = 'none';
        }
    };
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />