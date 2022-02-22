<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    .select2-container .select2-selection--single{
        height: 35px;
    }
    .select2-container--default .select2-selection--single .select2-selection__arrow{
        top: 3px;
    }
    .select2-container--default .select2-selection--single .select2-selection__rendered{
        line-height:30px
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
                    <spring:message code="label.ajouterPvReunion" var="p_page"/>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4">
                            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <c:if test="${type=='EE'}">
                                <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                            </c:if>
                            <c:if test="${type=='NT'}">
                                <spring:message code="label.Noticedimpact" var="pp_page"/>
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
            <div class="row mt-4 justify-content-center">
                <div class="col-12 from_add" id="frm_etatDoss">
                    <div class="row p-0 m-0 justify-content-center">
                        <div class="col-md-8 mt-5 col-sm-12 grid-margin" >
                            <div class="photo  hvr-buzz-out" >
                                <i class="mdi icc mdi-file-plus menu-icon"></i>
                            </div>
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>

                                    <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                        <h3 class="ml6 float-right" style="color:#336c4e !important; margin-top: -5px">
                                                      <span class="text-wrapper">
                                                                <span class="letters"><span class="letters"><spring:message code="label.AttacherlePV"/></span></span>
                                                      </span>
                                        </h3>
                                        <div class="row p-0 m-0 mt-5">
                                        </div>
                                        <form style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="form-horizontal mt-3" id="deposestatut" name="deposestatut" method="post">

                                            <div class="row m-0 p-0 mt-5">
                                                <div class="col-md-6 col-sm-12">
                                                    <label > <spring:message code="label.PvReunion"/> </label>
                                                    <input type="file" class="form-control"  id="doc_pv"/>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <label > <spring:message code="label.ListePresence"/> </label><br/>
                                                    <input type="file" class="form-control"  id="doc_presence"/>
                                                </div>
                                            </div>
                                            <div class="row m-0 p-0">
                                                <div class="col-md-6 col-sm-12">
                                                    <label > <spring:message code="label.Statut"/> </label>
                                                    <spring:message code="label.demandecomplement" var="ss"/>
                                                    <c:if test="${demande.statut.id_statut_projet==2 && type=='AE'}" >
                                                        <select id="statut_pv" class="form-control select2" data-width="100%" ${dd}>
                                                            <option  value=""><spring:message code="label.Choisirrr"/> </option>
                                                            <option  value="76"><spring:message code="label.Recevable"/> </option>
                                                            <option  value="77"><spring:message code="label.NonRecevable"/></option>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${type!='AE'}">
                                                        <select id="statut_pv" class="form-control select2" data-width="100%" ${dd}>
                                                            <option  value=""><spring:message code="label.Choisirrr"/> </option>
                                                            <option  value="7"><spring:message code="label.Acceptable"/> </option>
                                                            <option  value="3"> <spring:message code="label.nonAcceptable"/></option>
                                                            <option  value="60"> ${type!='AE'?ss:'AE A compléter'}</option>
                                                            <option  value="4">  <spring:message code="label.QuoruMnonAtteint"/></option>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${demande.statut.id_statut_projet==80}">
                                                        <select id="statut_pv" class="form-control select2" data-width="100%" ${dd}>
                                                            <option  value=""><spring:message code="label.Choisirrr"/> </option>
                                                            <option  value="78"><spring:message code="label.Valide"/> </option>
                                                            <option  value="79"><spring:message code="label.Nonvalide"/></option>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${demande.statut.id_statut_projet==81}">
                                                        <select id="statut_pv" class="form-control select2" data-width="100%" ${dd}>
                                                            <option  value="12"><spring:message code="label.Conforme"/></option>
                                                            <option  value="82"><spring:message code="label.Nonconforme"/></option>
                                                        </select>
                                                    </c:if>
                                                </div>
                                                <c:choose>
                                                    <c:when test="${type=='AE'}">
                                                        <div class="col-md-6 col-sm-12  ${demande.statut.id_statut_projet==74 || demande.statut.id_statut_projet==81 || demande.statut.id_statut_projet==2?'d-none':''}">
                                                            <label > <spring:message code="label.Periodedenvoidusuivi"/> </label><br/>
                                                            <select class="custom-select mb-3" name="periode_send_rapport" id="periode_send_rapport" ${dd}>
                                                                <option value="1"><spring:message code="label.Mensuel"/></option>
                                                                <option value="2"><spring:message code="label.Bimestrielmois"/></option>
                                                                <option value="3"><spring:message code="label.Trimestrielmois"/></option>
                                                                <option value="6"><spring:message code="label.Semestrielmois"/></option>
                                                                <option value="12"><spring:message code="label.Annuellemois"/></option>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 ${demande.statut.id_statut_projet==2 || demande.statut.id_statut_projet==81 ?'d-none':''}">
                                                            <label> <spring:message code="label.Datededebutdelaudit"/></label>
                                                            <input class="form-control" type="date" id="date_debut">
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 mt-3 d-none" >
                                                            <label> <spring:message code="label.DateFin"/> </label>
                                                            <input class="form-control"  type="date" id="date_fin">
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <label > <spring:message code="label.AjouterCommentaire"/> </label><br/>
                                                            <textarea rows="2" class="form-control" name="cause" id="causereuni" ></textarea>
                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="col-md-6 col-sm-12">
                                                            <label > <spring:message code="label.AjouterCommentaire"/> </label><br/>
                                                            <textarea rows="2" class="form-control" name="cause" id="causereuni" ></textarea>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <div class="row m-0 p-0 mt-3">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group text-left">
                                                        <label><spring:message code="label.Typedeprojet"/></label>
                                                        <select class="form-control select2" multiple onchange="addCategorieToDemande(this,'${demande.id_demande_information}')" style="width: 100% !important" ${dd}>
                                                            <c:forEach items="${categories}" var="cat" >
                                                                <option
                                                                        <c:forEach items="${demande.categories}" var="cc" >
                                                                            ${cc.id_categorie==cat.id_categorie?"selected":""}
                                                                        </c:forEach>
                                                                        value="${cat.id_categorie}"> ${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr} </option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group text-left">
                                                        <label><spring:message code="label.Soustypedeprojet"/></label>
                                                        <select name="souscategorie_id" id="soucat"  class="form-control select2" multiple onchange="addSousCategorieToDemande(this,'${demande.id_demande_information}')" style="width: 100% !important" ${dd}>

                                                            <c:forEach items="${souscategories}" var="p">
                                                                <option <c:forEach items="${demande.sousCategories}" var="pp">

                                                                    ${pp.id_souscategorie==p.id_souscategorie?"selected":""}

                                                                </c:forEach> value="${p.id_souscategorie}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>



                                            <div class="row m-0 p-0 mt-5 justify-content-center">

                                                <div class="col-md-4 col-sm-6" style="text-align: center">
                                                    <button onclick="save_addPVReunion('${demande.id_demande_information}','${not empty reunion?reunion.id_reunion:0}','${demande.type}')"  class="btn btn-success mt-3 mb-3 btn-block" ><spring:message code="label.Enregistrer"/></button>
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
</div>



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
