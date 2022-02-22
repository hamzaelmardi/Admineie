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
                               <div class="btn-gris"><spring:message code="label.Telechargeretsignerleautorisation"/></div>
                           </div>
                       </div>
                        <div class="row justify-content-center">
                            <div class="col-xl-6 col-lg-8 col-md-8 col-sm-12 border mb-5 p-4">
                                <div dir="rtl" class="p-2 ${collecte.typeRenouvellement.id_type_renouvellement==3?'d-block':'d-none'}" id="divQarar">
                                    <div class="form-group">
                                        <div class="row justify-content-center">
                                            <div class="col-md-10 col-sm-12">
                                                <label class="float-right">المرجو إدخال السلطة الحكومية التي صادقت على القرار </label>
                                                <input type="text" class="form-control" id="qarar" placeholder="" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row justify-content-center">
                                            <div class="col-md-10 col-sm-12">
                                                <label class="float-right">وزيرة التحول الطاقي والتنمية المستدامة</label>
                                                <input type="text" class="form-control" id="tatmim" placeholder="" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="row p-0 justify-content-center">
                                            <div class="col-10">
                                                <div class="row justify-content-end">
                                                    <div class="col-md-4 col-sm-12 p-0">
                                                        <button type="button" class="btn btn-success btn-block" onclick="NextSigne(${collecte.id_collecte})">
                                                            <spring:message code="label.Suivant"/>
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="${collecte.typeRenouvellement.id_type_renouvellement==3?'d-none':'d-block'}" id="signe">
                                    <form action="/api/setAutorisationDocumentSigner/${id}/CT" method="post" enctype="multipart/form-data">
                                        <div class="form-group mt-4">
                                            <div class="row justify-content-center">
                                                <div class="col-md-10 col-sm-12">
                                                    <c:if test="${collecte.typeRenouvellement.id_type_renouvellement==3}">
                                                        <a href="/api/generate_word_collecte_Avenant/${collecte.id_collecte }" class="btn btn-success btn-block"> <spring:message code="label.Telechargeretsignerleautorisation"/></a>
                                                    </c:if>
                                                    <c:if test="${collecte.typeRenouvellement.id_type_renouvellement!=3}">
                                                        <a href="/api/generate_word_collecte/${collecte.id_collecte }" class="btn btn-success btn-block"> <spring:message code="label.Telechargeretsignerleautorisation"/></a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-4">
                                            <div class="row justify-content-center">
                                                <div class="col-10 text-left">
                                                    <label class=""> <spring:message code="label.Telechargeretsignerleautorisation"/></label>
                                                    <input accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc" required>
                                                </div>
                                                <div class="col-10 text-left">
                                                    <label><spring:message code="label.Datedebut"/></label>
                                                    <input type="date" class="form-control dt dateDebut" name="date1" onchange="setDateFin()" id="date1" placeholder="" required>
                                                </div>
                                                <div class="col-10 text-left">
                                                    <label><spring:message code="label.DateFin"/></label>
                                                    <input type="date" class="form-control dt" name="date2" id="date2" placeholder="" required>
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
                                    </form>
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
    $(document).ready(function () {
        document.getElementById('date1').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    })

    function setDateFin(){
        var date = $("#date1").val();
        var x = new Date(date);
        document.getElementById('date2').min = new Date(x.getTime() - x.getTimezoneOffset() * 60000).toISOString().split("T")[0];
    }

    function NextSigne(id){

            var qarar = $("#qarar").val();
            var tatmim = $("#tatmim").val();
            $.ajax({
                type: "POST",
                url :"/api/addQarar/"+id,
                data : {
                    "qarar":qarar,
                    "tatmim":tatmim
                },
                success : function(response) {
                    $("#signe").removeClass("d-none");
                    $("#divQarar").removeClass("d-block");
                    $("#divQarar").hide();
                },
                error : function(response) {
                    alert(' ajout non effectué');
                }
            });
    }
</script>
<jsp:include page="../../includes/footer.jsp" />
