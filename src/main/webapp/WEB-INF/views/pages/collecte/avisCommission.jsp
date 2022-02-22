
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    .btn-primary{
        background:  #d59d32;
        border-color:  #d59d32;
    }

    .titre_abs{
        position: absolute;
        top: -15px;
        display: block;
        background:  #d59d32;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
    }
    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
    }
    .tab {
        float: left;

    }
    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }
    .tab button:hover {
        background-color: #ddd;
    }
    .tab button.active {
        background-color: red;
    }

</style>

<div class="main-panel " style="margin-top:120px" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="content-wrapper">
        <div class="row" style="margin-top: 100px;display:flex;">

            <div class="col-md-12 col-sm-12 col-lg-12" style="display:flex;" >

                <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;" >
                    <div class="row p-0 m-0 justify-content-center">
                        <div class="col-xl-4 col-lg-8 col-md-10 col-sm-12 col-sm-12 grid-margin stretch-card " >
                            <div class="photo  hvr-buzz-out" >
                                <i class="mdi icc mdi-file-eye menu-icon"></i>
                            </div>
                            <div>
                                <div class="card">
                                    <div class="row justify-content-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                            </div>
                                        </div>
                                        <div class="col-10 mt-4">
                                            <h5 style="float:right;color:black"><%--<spring:message code="label.Validation"/> --%><spring:message code="label.PVdelacommission"/></h5>
                                            <div class="row p-0 m-0 mt-5 ">
                                                <div class="form-group mt-5" style="width: 100%;">
                                                    <div class="form-group text-left" id="block_file">
                                                        <label><spring:message code="label.PVdelacommission"/></label>
                                                        <div class="input-group mb-3">
                                                            <input id="pv_file" type="file" class="form-control" onchange="setpv_file(this,'${id}')">
                                                            <c:if test="${collecte.url_pv_commission!=null and collecte.typeRenouvellement.id_type_renouvellement!=3}">
                                                                <div class="input-group-prepend" style="height: 38px">
                                                                    <span class="input-group-text bg-light" id="basic-addon5">
                                                                            <a type="button" target="_blank" class="btn btn-success btn-existe"
                                                                               onclick="downloadAut2('${fn:replace(collecte.url_pv_commission,"/assets/myFile/","/dowload_uploaded/")}')">
                                                                                <span class="fa fa-download"></span>
                                                                            </a>
                                                                    </span>
                                                                </div>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row  mb-4" style="margin:14px;">
                                        <a class="btn btn-primary btn-block" type="button" onclick="redirectToValidation('/api/ValidationCodesAndVehicules/${id}')"> <spring:message code="label.Suivant"/></a>
                                        <a class="btn btn-secondary btn-block"  href="/api/getListeCollecte/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Retour"/></a>
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
<jsp:include page="../../includes/footer.jsp" />

<script>
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

        function addEtat(id){

            $.ajax({
                type: "POST",
                url :"/api/addEtatCollecte/"+id,

                data : {

                },

                success : function(response) {
                    window.location="/api/getListeCollecte/0/6/0";
                },
                error : function(response) {
                    alert(' ajout non effectué');
                }
            });

        }

        function opendemande(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        document.getElementById('personne').onchange = function(){
            if(this.value ==28 || this.value==41){
                document.getElementById('morale').style.display = 'none';
            } else {
                document.getElementById('morale').style.display = 'block';
            }

            if(this.value ==28){
                document.getElementById('block_file').style.display = 'none';
            }else{
                document.getElementById('block_file').style.display = 'block';
            }
        };

        function updatePdf(id) {

            fetch('/api/generate_pdf_collecte/'+id)
                .then(resp => resp.blob())
                .then(blob => {
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.style.display = 'none';
                    a.href = url;
                    // the filename you want
                    a.download = 'Collecte.pdf';
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(url);
                })
                .catch(() => alert('oh no!'));


        }

        function redirectToValidation(url){
            var file = $("#pv_file")[0].files.length;
            var btn = $(".btn-existe");
            if(btn.length == 0 && file === 0){
                swal("Avertissement !","Le fichier de PV est obligatoire","warning");
                return false;
            }
            window.location.href = url;
        }

        function downloadAut2(val){
            window.location.href=val;
        }

    </script>

