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
    <div class="content-wrapper p-0">
        <%--<div id="correspondance">
            <div class="row">
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="row justify-content-center">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                                    <div class="btn-gris"><spring:message code="label.Telechargeretsignerlettre"/> </div>
                                </div>
                            </div>
                            <div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                    <div class="form-group mt-4">
                                        <div class="row justify-content-center">
                                            <div class="col-10 text-left">
                                                <label class=""><spring:message code="label.corespondance"/> </label>
                                                <input id="id_notification" type="hidden" name="id_notification">
                                                <input id="numerCorrespondance" type="text" class="form-control" name="numerCorrespondance">
                                            </div>
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.dateCorespondance"/> </label>
                                                <input type="date" class="form-control" name="dateCoresspondance" id="dateCoresspondance">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row p-0 justify-content-center">
                                            <div class="col-10">
                                                <div class="row justify-content-end">
                                                    <div class="col-md-4 col-sm-12 p-0">
                                                        <a onclick="addAndShowForm(${id},'TR')" class="btn btn-success btn-block">
                                                            <spring:message code="label.Enregistrer"/>
                                                        </a>
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
        </div>--%>
        <form id="lettre" action="/api/setAutorisationLettreDoc/${id}/TR" method="post" enctype="multipart/form-data">
            <div class="row" >
                <div class="col-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="row justify-content-center"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                                    <div class="btn-gris"><spring:message code="label.Telechargeretsignerlettre"/> </div>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                    <div class="form-group">
                                        <div class="row justify-content-center">
                                            <div class="col-md-10 col-sm-12">
                                                <a href="/api/generate_word_transit/${notification.id_notification }" class="btn btn-success btn-block"><spring:message code="label.Telechargerlalettre"/> </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-4">
                                        <div class="row justify-content-center">
                                            <div class="col-10 text-left">
                                                <label class=""><spring:message code="label.Importerlalettresigne"/> </label>
                                                <input accept=".doc,.docx,.pdf" id="doc" required type="file" class="form-control" name="doc">
                                            </div>
                                            <div class="col-10 text-left">
                                                <label><spring:message code="label.Datesignature"/> </label>
                                                <input type="date" class="form-control dt" required name="date1" id="date1" placeholder="">
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
    function addAndShowForm(id,type){
        var dateCoresspondance=$("#dateCoresspondance").val();
        var numerCorrespondance=$("#numerCorrespondance").val();
        if(dateCoresspondance==="" || numerCorrespondance===""){
            swal("<spring:message code="label.Avertissement"/> ","Merci de remplir tous les champs","error");
            return false;
        }
        $.ajax({
            type: "GET",
            url :"/api/setCorrespondance/"+id+"/"+type,

            data : {
                "dateCoresspondance":dateCoresspondance,
                "numerCorrespondance":numerCorrespondance
            },

            success : function(response) {
                $("#lettre").show();
                $("#correspondance").hide();
            },
            error : function(response) {
                alert('Erreur ajout non effectué');
            }
        });
    }
</script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />