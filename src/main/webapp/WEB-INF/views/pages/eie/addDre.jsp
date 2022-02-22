
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    .not-button:hover{
        cursor: unset !important;
        background:  #d59d32 !important;
    }
</style>
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<style>
	label{float:right}
	.select2-results__option{
direction:rtl;
text-align:right !important;


}
	</style>
</c:when>
<c:otherwise>
<style>
	label{float:left}
	.select2-results__option{
direction:rtl;
text-align:right !important;


}
	</style>
</c:otherwise>
</c:choose>
<div class="row justify-content-center">
    <div class="col-lg-xl-8 col-lg-10 col-md-10 col-sm-11 pb-4 justify-content-center grid-margin grid-margin-md-0" style="margin-top: 180px;">
        <div class="card crdt">
            <div class="col-12 from_add" id="frm_etatDoss"  style="margin-top: 3%;">
                <div class="row justify-content-center">
                    <div class=" col-md-4 col-sm-12 mt-0 ml-5 mr-5 mb-5">
                        <div class="btn btn-primary btn-block not-button"><spring:message code="label.InformationsRenseignerDRE"/></div>
                    </div>
                </div>
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-md-9 col-sm-12 grid-margin stretch-card " >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                        </div>
                        <form name="type" id="type">
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>
                                    <div class="col-10 mt-4">
                                        <h3 class="ml6 float-right mb-1" style="color:#336c4e !important">
                                            <span class="text-wrapper">
                                                <span class="letters"><span class="letters"><spring:message code="label.EtudeImpactEnvironnemental"/></span></span>
                                            </span>
                                        </h3>
                                        <div class="row p-0 m-0 mt-5">


                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.IntituleProjet"/></label>
                                                    <input class="form-control" type="text" id="intitule" value="${eie.nom_fr}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.Petitionnaire"/></label>

                                                    <input class="form-control" type="text" id="petitionnaire" value="${eie.petitionaire}">
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                                <div class="col-md-6 col-sm-12" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <div class="form-group" >
                                                        <label><spring:message code="label.Region"/></label>
                                                        <select id="region" class="custom-select" onchange="select_region(this.value)">
                                                            <c:forEach items="${regions}" var="reg">
                                                                <option value="${reg.regionId}" ${eie.region.regionId==reg.regionId?"selected":""}>${reg.nom_fr}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >
                                                        <label><spring:message code="label.province"/></label>
                                                        <select id="select_province" class="custom-select" onchange="select_Province(this.value)">
                                                            <c:forEach items="${provinces}" var="prov">
                                                                <option value="${prov.id_prefecture}" ${eie.province.id_prefecture==prov.id_prefecture?"selected":""}>${prov.nom_fr}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                    <label><spring:message code="label.Commune"/></label>
                                                    <select id="select_commune" class="custom-select" >
                                                        <c:forEach items="${communes}" var="com">
                                                            <option value="${com.id_commune}" ${com.id_commune==eie.commune.id_commune?"selected":""}>${com.nom_fr}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.DateReunion"/></label>
                                                    <input class="form-control" type="date" id="date_reun" value="${eie.date}" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >
                                                    <label><spring:message code="label.ObjetReunion"/></label>
                                                    <select class="custom-select" id="objet_reun">
                                                        <option value="examen" ${eie.objet.equals("examen")?"selected":""}> <spring:message code="label.Examen"/> </option>
                                                        <option value="r�examen" ${eie.objet.equals("r�examen")?"selected":""}> <spring:message code="label.Reexamen"/> </option>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >
                                                    <label><spring:message code="label.Decision"/></label>

                                                    <select name="decision" class="custom-select" id="decision">
                                                        <option value="0" ${eie.decision.equals("0")?"selected":""}><spring:message code="label.Favorable"/></option>
                                                        <option value="1" ${eie.decision.equals("1")?"selected":""}><spring:message code="label.NonFavorable"/></option>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.Montant"/></label>
                                                    <input class="form-control" type="text" id="montant" value="${eie.montant}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.ConsistanceDuProjet"/></label>
                                                    <input class="form-control" type="text" id="consistance" value="${eie.consistance}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row justify-content-center  mb-4" style="margin:14px;">
                                    <input type="hidden" id="id_eie" value="${eie.id_eiedre}">
                                    <a  class="btn btn-primary btn-block col-md-4" onclick="addDRE()" ><spring:message code="label.Enregistrer"/></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<jsp:include page="../../includes/footer.jsp" />
<script>
        function select_region(val){
            var id=val;
            $.get('/api/getProvinceByRegion/'+val, function(data) {
                $("#select_province option").remove();
                $(data.province).each(function (indx,el){
                    $("#select_province").append("<option value='"+el.id_prefecture+"'>"+el.nom_fr+"</option>");
                })
            });
        }

        function select_Province(val){
            var id=val;
            $.get('/api/getComuneByProvince/'+val, function(data) {
                $("#select_commune option").remove();
                $(data.Commune).each(function (indx,el){
                    console.log(this);
                    $("#select_commune").append("<option value='"+el.id_commune+"'>"+el.nom_fr+"</option>");
                })
            });
        }


        function addDRE(){
            var id_eie = $("#id_eie").val();
            var nom_fr = $("#intitule").val();
            var date=$("#date_reun").val();
            var petitionnaire = $("#petitionnaire").val();
            var objet = $("#objet_reun").val();
            var decision = $("#decision").val();
            var montant = $("#montant").val();
            var consistance = $("#consistance").val();
            var region_id = $("#region").val();
            var province_id = $("#select_province").val();
            var commune_id = $("#select_commune").val();
            var region = {"regionId":region_id};
            var province = {"id_prefecture":province_id};
            var commune = {"id_commune":commune_id};
            id_eie===""?"0":id_eie;
            if(nom_fr=="" || date=="" || petitionnaire=="" || objet=="" || decision=="" || montant=="" || consistance==""){
                swal("<spring:message code="label.Avertissement"/> ! ","<spring:message code="label.Tousleschampsestobligatoire"/>","error");
                return false
            }
            var eie={
                "id_eiedre":id_eie,
                "nom_fr":nom_fr,
                "region":region,
                "commune":commune,
                "province":province,
                "consistance":consistance,
                "date":date,
                "petitionaire":petitionnaire,
                "objet" : objet,
                "montant":montant,
                "decision":decision,
            }

            $.ajax({
                type: "POST",
                url :"/api/addEieDre2",
                contentType : 'application/json; charset=utf-8',
                data : JSON.stringify(eie),
                success : function(response) {
                    document.location.href="/api/getDre/0/6";
                    //$(".mpParam").html(response);
                },
                error : function(response) {
                    alert('Erreur ajout non effectu�');
                }
            });
        }




    </script>



    <!-- main-panel ends -->




