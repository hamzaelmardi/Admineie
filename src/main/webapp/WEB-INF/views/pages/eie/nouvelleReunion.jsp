
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

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
    @media (max-width: 1200px){
        .myH3{
            font-size: 13pt;
            margin-left: 9rem;
        }
    }
</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>

<div class="container-fluid page-body-wrapper">
    <div class="main-panel " style="margin-top:120px">
        <div class="content-wrapper">
            <div class="row ">

                <div class="col-md-12 col-sm-12 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <c:if test="${type!='AE'}">
                        <spring:message code="label.AttachementEnquettePublic" var="p_page"/>
                    </c:if>
                    <c:if test="${type=='AE' && demande.statut.id_statut_projet!=58 && demande.statut.id_statut_projet!=71}">
                        <c:set var="p_page" value="Programmation de la réunion de recevabilité "/>
                    </c:if>
                    <c:if test="${type=='AE' && demande.statut.id_statut_projet==58}">
                        <c:set var="p_page" value="Programmer la réunion" />
                    </c:if>
                    <c:if test="${type=='AE' && demande.statut.id_statut_projet==71}">
                        <c:set var="p_page" value="Programmation de la réunion de déliberation" />
                    </c:if>

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4">
                            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <c:if test="${type!='AE'}">
                                <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                            </c:if>
                            <c:if test="${type=='AE'}">
                                <spring:message code="label.Auditenvirementale" var="pp_page"/>
                            </c:if>
                            <c:set var="url_mini" value="/api/getEie/${type}/0/6/0"/>
                            <li class="breadcrumb-item ${pageContext.response.locale!='ar'?'':'mr-5'}"><a href="${url_mini}">${pp_page}</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                        </ol>
                    </nav>
                </div>

            </div>
            <div class="row mt-5">

                <div class="col-12 from_add" id="frm_etatDoss">
                    <div class="row p-0 m-0 justify-content-center">
                        <div class="col-md-8 mt-5 col-sm-12 grid-margin" >
                            <div class="photo  hvr-buzz-out" >
                                <i class="mdi icc mdi-account-clock menu-icon"></i>
                            </div>
                                <div class="card">
                                    <div class="row justify-content-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                            </div>
                                        </div>

                                        <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <h3 class="ml6 float-right" style="color:#336c4e !important; margin-top: -5px !important;">
                                                      <span class="text-wrapper">
                                                            <c:if test="${type=='AE' && demande.statut.id_statut_projet==58}">
                                                                 <span class="letters"><span class="letters"><spring:message code="label.Programmationdelareuniondevalidation"/></span></span>
                                                            </c:if>
                                                            <c:if test="${type=='AE' && demande.statut.id_statut_projet==71}">
                                                                <span class="letters"><span class="letters"><spring:message code="label.Programmationdelareunionderexaman"/></span></span>
                                                            </c:if>
                                                            <c:if test="${type=='AE' && demande.statut.id_statut_projet!=71 && demande.statut.id_statut_projet!=58}">
                                                                <span class="letters"><span class="letters"><spring:message code="label.Programmationdelareunionderecevabilite"/></span></span>
                                                            </c:if>
                                                      </span>
                                            </h3>
                                            <div class="row mt-5">
                                            </div>
                                            <form  action="/add_reunion/${typeS}" class="form-horizontal mt-3" id="formreunion" name="formreunion" method="post">
                                                <div class="row m-0 p-0 mt-5 text-left">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group text-left">
                                                            <label > <spring:message code="label.DateReunion"/></label>
                                                            <input <c:if test="${demande.statut.id_statut_projet!=58 && demande.statut.id_statut_projet!=71}">value="${reunion.date_reunion}"</c:if><c:if test="${demande.statut.id_statut_projet==58 && demande.statut.id_statut_projet==71}">value=""</c:if> onchange="tcheckdatereunion1()"  required type="date" name="date_reunion"  id="date_reunion" class="form-control">
                                                            <input type="hidden" name="id_demande_information" id="iddemandereu" value="${demande.id_demande_information}" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12 hidden">
                                                        <div class="form-group text-left">
                                                            <label> <spring:message code="label.NomReunion"/>: </label>
                                                            <select class="form-control" required name="examen" id="examen" ${dd}>
                                                                <option ${reunion.examen.equals("reexamen")?"selected":""} value="reexamen"><spring:message code="label.Reexamen"/></option>
                                                                <option ${reunion.examen.equals("examen")?"selected":""} value="examen"><spring:message code="label.Examen"/></option>
                                                                <option ${reunion.examen.equals("deliberation")?"selected":""}  value="deliberation"><spring:message code="label.Deliberation"/></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <c:if test="${type=='AE'}">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group text-left">
                                                            <label><spring:message code="label.membresdelacommision"/> </label>
                                                                <select class="form-control select2 p-0" multiple data-width="100%" id="comiteOui" name="comiteOui" ${dd}>
                                                                    <c:forEach items="${oui}" var="o">
                                                                        <option
                                                                                <c:forEach items="${reunion.comite}" var="oo">
                                                                                    ${oo.comiteId==o.comiteId && demande.statut.id_statut_projet!=58 && demande.statut.id_statut_projet!=71 ?"selected":""}
                                                                                </c:forEach>
                                                                                value="${o.comiteId}">${pageContext.response.locale=='ar'?o.nomComite_ar:o.nomComite_fr}</option>
                                                                    </c:forEach>
                                                                </select>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                </div>
                                                <div class="row m-0 p-0">
                                                    <c:if test="${type!='AE'}">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group text-left">
                                                            <label>
                                                                <spring:message code="label.Membreavoixdaliberativecentral"/></label>
                                                            <select class="form-control select2 p-0" multiple data-width="100%" id="comiteOui" name="comiteOui" ${dd}>
                                                                <c:forEach items="${oui}" var="o">
                                                                    <option
                                                                            <c:forEach items="${reunion.comite}" var="oo">
                                                                                ${oo.comiteId==o.comiteId && demande.statut.id_statut_projet!=58 && demande.statut.id_statut_projet!=71 ?"selected":""}
                                                                            </c:forEach>
                                                                            value="${o.comiteId}">${pageContext.response.locale=='ar'?o.nomComite_ar:o.nomComite_fr}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group text-left">
                                                                <label><spring:message code="label.Membreavoixdeliberativeregional"/></label>
                                                                <select class="form-control select2" multiple style="width: 100%" id="comiteNon" name="comiteNon" ${dd}>
                                                                    <c:forEach items="${non}" var="n">
                                                                        <option
                                                                                <c:forEach items="${reunion.comite}" var="oo">
                                                                                    ${oo.comiteId==n.comiteId && demande.statut.id_statut_projet!=58 && demande.statut.id_statut_projet!=71?"selected":""}
                                                                                </c:forEach>
                                                                                value="${n.comiteId}">${pageContext.response.locale=='ar'?n.nomComite_ar:n.nomComite_fr}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                                <c:if test="${type=='AE'}">
                                                    <input type="hidden" value="${reunion_type}" class="form-control" name="type">
                                                </c:if>
                                                <div class="row m-0 p-0 justify-content-center">
                                                    <div class="col-md-4 col-sm-12" style="text-align: center">
                                                        <button type="submit" class="btn btn-success mb-4 mt-3">
                                                            <spring:message code="label.Enregistrer"/>
                                                        </button>
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


        <script src="${pageContext.request.contextPath}/assets/js/sweet.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />

<script>
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


    function addDoc2(id,regionId,idInput){
        var data = new FormData();

        var ins = document.getElementById(idInput).files.length;

        for (var x = 0; x < ins; x++) {
            data.append("fileToUpload", document.getElementById(idInput).files[x]);
        }
        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url : "/api/addDocRegion/"+id+"/"+regionId,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success : function(response) {
            },
            error : function() {
            }
        });
    }

    function tcheckdatereunion1(){
        var date = $("#date_reunion").val();
        $.get("/tcheckdatereunion/"+date , function(rep) {

            if(rep>0){
                swal({
                    title: '<spring:message code="label.DateReunion"/> ',
                    text: "<spring:message code="label.Datedejaprogrammee"/> ",
                    type: 'warning',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: '<spring:message code="label.OK"/> '
                }, function () {

                });
                $(".suivantreunion").attr("disabled",true);

            }else{
                $(".suivantreunion").attr("disabled",false);
            }

        });
    }

</script>

