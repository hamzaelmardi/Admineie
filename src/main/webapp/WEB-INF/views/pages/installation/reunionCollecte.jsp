

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

<div class="main-panel " style="margin-top:120px">
    <div class="content-wrapper">

        <div class="row" style="display:flex;">

            <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >




                <!-- debut from etat dossier -->
                <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-xl-6 col-lg-8 col-md-10 col-sm-12 grid-margin stretch-card " >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-calendar-clock menu-icon"></i>
                        </div>
                        <form id="formReunion">
                            <input type="hidden" value="${reunion.id_reunion}" class="form-control">
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>

                                    <div class="col-10 mt-4">

                                        <h5 style="float:right;color:black"><%--<spring:message code="label.Planificationdereunion"/>--%> <spring:message code="label.Planificationdelareunion"/></h5>
                                        <div class="row p-0 m-0 mt-5">
                                            <div class="form-group mt-5" style="width: 100%;">
                                                <div class="form-group text-left">
                                                    <label > <spring:message code="label.Datedereunion"/>  </label>
                                                    <input type="date" name="date_reunion" value="${reunion.date_reunion}"  id="date_reunion" class="form-control">
                                                    <input type="hidden" class="form-control dt"  name="id_reunion" value="${reunion.id_reunion}" placeholder="">
                                                </div>
                                                <div class="form-group dt text-left">
<%--
                                                    <label><spring:message code="label.Nomdureunion"/></label>
--%>
                                                    <input type="hidden" class="form-control dt" name="nom_fr" value="${reunion.nom_fr}" placeholder="">
                                                </div>

                                            </div>

                                        </div>


                                    </div>
                                </div>
                                <div class="row  mb-4" style="margin:14px;">
                                    <a  class="btn btn-primary btn-block suivantvisite" id="suivantvisite" onclick="add_reunion('${id}')" ><%-- <spring:message code="label.Valider"/>--%> <spring:message code="label.Programmer"/></a>
                                    <a class="btn btn-secondary btn-block"  href="/api/getListeCollecte/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Annuler"/></a>

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

<script type="text/javascript">

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

    function add_reunion(id){
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
        var se = $("#formReunion").serializeObject();

        $.ajax({
            type: "POST",
            url :"/api/add_reunionCollecte/"+id,
            contentType : 'application/json; charset=utf-8',
            data :  JSON.stringify(se),

            success : function(response) {
                window.location="/api/getListeCollecte/0/6/0";
            },
            error : function(response) {
                alert(' ajout non effectué');
            }
        });

    }
</script>
