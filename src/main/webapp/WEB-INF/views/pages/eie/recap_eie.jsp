<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<jsp:include page="../../includes/header.jsp"/>
<jsp:include page="../../menu/menu.jsp"/>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date"/>
<style>
    .accordion .panel{
        border: none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 0 10px;
        overflow: hidden;
        position: relative;
    }
    .accordion .panel-heading{
        padding: 0;
        border: none;
        border-radius: 0;
        margin-bottom: 10px;
        z-index: 1;
        position: relative;
    }
    .accordion .panel-heading:before,
    .accordion .panel-heading:after{
        content: "";
        width: 50%;
        height: 20%;
        box-shadow: 0 15px 5px rgba(0, 0, 0, 0.4);
        position: absolute;
        bottom: 15px;
        left: 10px;
        transform: rotate(-1deg);
        z-index: -1;
    }
    .accordion .panel-heading:after{
        left: auto;
        right: 10px;
        transform: rotate(1deg);
    }
    .accordion .panel-title a{
        display: block;
        padding: 15px 70px 15px 70px;
        margin: 0;
        background: #206c45;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
        color: #fff !important;
        border-radius: 0;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        position: relative;
    }
    .accordion .panel-title a:before,
    .accordion .panel-title a.collapsed:before{
        content: "\f106";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        width: 55px;
        height: 100%;
        text-align: center;
        line-height: 50px;
        border-right: 5px solid #fff;
        position: absolute;
        top: 0;
    ${pageContext.response.locale=="fr"?'right':'left'}: 0;
    }
    .accordion .panel-title a.collapsed:before{ content: "\f107"; }
    .accordion .panel-title a .icon{
        display: inline-block;
        width: 55px;
        height: 100%;
    ${pageContext.response.locale=="fr"?'border-right':'border-left'}: 5px solid #fff;
        font-size: 20px;
        color: #fff;
        line-height: 50px;
        text-align: center;
        position: absolute;
        top: 0;
    ${pageContext.response.locale=="fr"?'left':'right'}: 0;
    }
    .panel-body .table{
        margin: 0;
        border: 1px solid #e7e7e7;
    }
    .panel-body .table tr td{ border-color: #e7e7e7; }
    .panel-body .table thead tr.active th{
        color: #fff;
        background-color: #6D7AE0;
        font-size: 16px;
        font-weight: 500;
        padding: 12px;
        border: 1px solid #6D7AE0;
    }
    .panel-body .table tbody tr:hover{ background-color: rgba(109, 122, 224, 0.1); }
    .panel-body .table tbody tr td{
        color: #555;
        padding: 8px 12px;
        vertical-align: middle;
    }
    .panel-body .table tbody .btn{
        border-radius: 0;
        transition: all 0.3s ease;
    }
    .panel-body .table tbody .btn:hover{ box-shadow: 0 0 0 2px #333; }
    .panel-footer{
        background-color: #fff;
        padding: 0 15px 5px;
        border: none;
    }

</style>

<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );
</script>

<style>
    body{ font-family: 'Arvo', sans-serif !important; }
</style>

<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>

<div class="row-fluid mt-5 ml-4" style="margin-top:150px !important;">
    <div class="col-12">
        <c:choose>


            <c:when test="${type=='EE'}">
                <spring:message code="label.EtudeImpactEnvironnemental" var="p_page"/>
            </c:when>
            <c:when test="${type=='NT'}">
                <spring:message code="label.NoticeImpact" var="p_page"/>
            </c:when>
            <c:when test="${type=='AE'}">
                <spring:message code="label.Auditenvirementale" var="p_page"/>
            </c:when>
            <c:when test="${type=='RS'}">
                <spring:message code="label.Renseignementprealable" var="p_page"/>
            </c:when>
            <c:otherwise>
                <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
        </c:choose>

        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
            <ol class="breadcrumb ml-4">
                <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'margin-right:4rem !important':''}" aria-current="page"><a href="/api/getEie/${type}/0/6/0" >${p_page}</a></li>
                <li class="breadcrumb-item active"><spring:message code="label.Recapitulation"/></li>
            </ol>
        </nav>
    </div>
</div>

<div class="row justify-content-center pl-3 pr-3  mt-4"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="jumbotron p-3">
            <spring:message code="label.Statutdelademande"/>: <span class="h4 font-weight-bold" style="color: #3b5998"> ${demandeInformation.statut.nom_fr} </span><span>
        </span>
        </div>
    </div>
</div>

<div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-md-10 col-sm-12">
        <div class="row p-0 mb-2">

            <div class="col-md-auto col-sm-6 m-1">
                <a href="/api/generate_recap_Eie/${demandeInformation.id_demande_information }" class="btn btn-primary btn-block"><i class="fa fa-print  ml-2"></i><spring:message code="label.ImprimerleRecap"/></a>
            </div>

           <%-- <c:if test="${demandeInformation.statut.id_statut_projet==59 && type!='AE'}">
                <div class="col-md-auto col-sm-6 m-1">
                    <a style="background-color:  #d59d32" href="/api/validationDocumentEIE/${demandeInformation.id_demande_information }/${type}" class="  btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.Validerlesdocuments"/></a>
                </div>
            </c:if>--%>
            <c:if test="${demandeInformation.statut.id_statut_projet==1 && type=='AE'}">
            <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/ajouterReunion_AE/${demandeInformation.id_demande_information }/etude" class="btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.Programmerlareunion"/></a>
            </div>
                </c:if>
            <c:if test="${demandeInformation.statut.id_statut_projet==1 && type!='AE'}">
            <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/validationDocumentEIE/${demandeInformation.id_demande_information }/${type}" class="  btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.Validerlesdocuments"/></a>
            </div>
            </c:if>
            <c:if test="${demandeInformation.statut.id_statut_projet==76 || (demandeInformation.statut.id_statut_projet==78 && type=='AE')}">
            <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/validationDocumentEIE/${demandeInformation.id_demande_information }/${type}" class="btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.Validerlesdocuments"/></a>
            </div>
            </c:if>

            <c:if test="${demandeInformation.statut.id_statut_projet==6 && type!='AE'}">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="${fn:replace(demandeInformation.url_document_signee, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.TelechargerleCertificatdeConformiteEnvironnementale"/></a>
                </div>
            </c:if>

            <c:if test="${demandeInformation.type!='NT'}">
            <c:if test="${(demandeInformation.statut.id_statut_projet==4 || demandeInformation.statut.id_statut_projet==61 ||(demandeInformation.statut.id_statut_projet==58 && type!='AE')) && type!='AE' }">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/editdemande/${demandeInformation.id_demande_information }/all/${type}" class="btn btn-primary btn-block"><i class="fa fa-edit ml-2"></i><spring:message code="label.AttacherlerapportdelEP"/></a>
                </div>
            </c:if>

            <c:if test="${demandeInformation.statut.id_statut_projet==2 || demandeInformation.statut.id_statut_projet==74 || demandeInformation.statut.id_statut_projet==80 || demandeInformation.statut.id_statut_projet==81}">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/depotdeposeetat/${demandeInformation.id_demande_information }/${type}" class="btn btn-primary btn-block"><i class="fa fa-plus ml-2"></i><spring:message code="label.AjouterPVdelareunion"/></a>
                </div>
            </c:if>

            <c:if test="${demandeInformation.statut.id_statut_projet==9}">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/depotDefinitive/${demandeInformation.id_demande_information }/${type}" class="btn btn-primary btn-block"><i class="fa fa-info-circle ml-2"></i><spring:message code="label.Verifierlesdocumentsdefinitives"/></a>
                </div>
            </c:if>

            <c:if test="${(demandeInformation.statut.id_statut_projet==5 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || demandeInformation.statut.id_statut_projet==5 && user.poste.id_Poste!=1 && user.compteId!=demandeInformation.compteAffecte.compteId}">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/down_sign_doc/${demandeInformation.id_demande_information}" class="btn btn-primary btn-block"><i class="fa fa-upload ml-2"></i><spring:message code="label.TelechargerleCertificatdeConformiteEnvironnementale"/></a>
                </div>
            </c:if>
                <c:if test="${demandeInformation.statut.id_statut_projet==6 && type=='AE'}">
                    <div class="col-md-auto col-sm-6 m-1">
                        <a type="button" class="btn btn-primary btn-block" style="background-color:  #d59d32" onclick="goToDoc('${fn:replace(demandeInformation.url_decision, "/assets/myFile/", "/dowload_uploaded/")}')" ><i class="fa fa-upload"></i> <spring:message code="label.TelechargerladecisiondeConformiteEnvironnementale"/></a>
                    </div>
                </c:if>

                <c:if test="${(demandeInformation.statut.id_statut_projet==71) && type=='AE'}">
                <div class="col-md-auto col-sm-6 m-1">
                    <a style="background-color:  #d59d32" href="/api/showListRaportAE/${demandeInformation.id_demande_information }" class="btn btn-primary btn-block"><i class="fa fa-file ml-2"></i> <spring:message code="label.AfficherLesRapportsRecus"/></a>
                </div>
                <div class="col-md-auto col-sm-6 m-1">
                    <a style="background-color:  #d59d32" href="/api/getVisites_AE/${demandeInformation.id_demande_information }" class="btn btn-primary btn-block"><i class="fa fa-file ml-2"></i><spring:message code="label.Programerlavisite"/></a>
                </div>
                <c:if test="${demandeInformation.statut.id_statut_projet==71}">
                    <div class="col-md-auto col-sm-6 m-1">
                        <a style="background-color:  #d59d32" href="/api/ajouterReunion_AE/${demandeInformation.id_demande_information}/deliberation" class="btn btn-primary btn-block"><i class="fa fa-file ml-2"></i><spring:message code="label.Programerlareuniondedeliberation"/></a>
                    </div>
                </c:if>
            </c:if>

            <c:if test="${demandeInformation.statut.id_statut_projet==58 && type=='AE'}">
                <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/ajouterReunion_AE/${demandeInformation.id_demande_information}/etude" class="btn btn-primary btn-block"><i class="fa fa-upload ml-2"></i><spring:message code="label.PlanifierunereunionDevalidation"/></a>
                </div>
            </c:if>
            </c:if>

            <c:if test="${demandeInformation.type=='NT'}">
                <jsp:useBean id="dateValue" class="java.util.Date" />
                <jsp:setProperty name="dateValue" property="time" value="${demandeInformation.dateFinValidation.time}" />
                <c:if test="${(demandeInformation.statut.id_statut_projet==58 && (not empty demandeInformation.dateFinValidation) && (dateValue>now) && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || demandeInformation.statut.id_statut_projet==58 && user.poste.id_Poste!=1 && user.compteId!=demandeInformation.compteAffecte.compteId && (not empty demandeInformation.dateFinValidation) && (dateValue>now) }">
            <div class="col-md-auto col-sm-6 m-1">
                    <a style="background-color:  #d59d32" href="/api/down_sign_doc/${demandeInformation.id_demande_information}" class="btn btn-primary btn-block"><i class="fa fa-upload ml-2"></i><spring:message code="label.Telechargeretignerladecisiondelacceptabilitaenvironnementale"/></a>
            </div>
                </c:if>

                <c:if test="${(demandeInformation.statut.id_statut_projet==58 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3 && (empty demandeInformation.dateFinValidation) ) || demandeInformation.statut.id_statut_projet==58 && user.poste.id_Poste!=1 && user.compteId!=demandeInformation.compteAffecte.compteId && (empty demandeInformation.dateFinValidation) }">
            <div class="col-md-auto col-sm-6 m-1">
                    <a style="background-color:  #d59d32" href="/api/down_sign_doc/${demandeInformation.id_demande_information}" class="btn btn-primary btn-block"><i class="fa fa-upload ml-2"></i><spring:message code="label.Telechargeretignerladecisiondelacceptabilitaenvironnementale"/></a>
            </div>
                </c:if>

                <c:if test="${demandeInformation.statut.id_statut_projet==58 && (not empty demandeInformation.dateFinValidation) && (dateValue<=now) }">
            <div class="col-md-auto col-sm-6 m-1">
                    <button><spring:message code="label.Delaisdepasse"/></button>
            </div>
                </c:if>

                <c:if test="${demandeInformation.statut.id_statut_projet==69 }">
            <div class="col-md-auto col-sm-6m-1">
                    <a style="background-color:  #d59d32" href="/api/PV_visite/${demandeInformation.id_demande_information}" class="btn btn-primary btn-block"><i class="fa fa-file-text ml-2"></i><spring:message code="label.AttacherlePVdevisite"/></a>
            </div>
                </c:if>
            </c:if>

            <c:if test="${type=='AE' && (demandeInformation.statut.id_statut_projet==4 || demandeInformation.statut.id_statut_projet==61 ||demandeInformation.statut.id_statut_projet==58) }">
            <div class="col-md-auto col-sm-6 m-1">
                <a style="background-color:  #d59d32" href="/api/ajouterReunion_AE/${demandeInformation.id_demande_information}/etude" class="btn btn-primary btn-block"><i class="fa fa-file-text ml-2"></i><spring:message code="label.AttacherlePVdevisite"/></a>
            </div>
            </c:if>
        </div>
    </div>
</div>

<div class="row justify-content-center mt-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-md-10 col-sm-12">
        <div class="bg-white" id="accordion-style-1">
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingOne1">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn text-white" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <i class="icon fa fa-user-friends mr-3"></i>
                                        <c:if test="${type=='AE'}">
                                            <spring:message code="label.informationssurlepetitionnaireAE"/>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <spring:message code="label.Informationdupetitionnaire"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
                                <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Numerodedemande"/>  </label>
                                        <input type="text" disabled value="${demandeInformation.num_demande}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Representant"/>  </label>
                                        <input type="text" disabled value="${demandeInformation.represantant}" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.RaisonSocial"/>  </label>
                                        <input type="text" disabled value="${demandeInformation.raison_social}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Adresse"/> </label>
                                        <input type="text" disabled value="${demandeInformation.adresse}" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Tel"/>  </label>
                                        <input type="text" disabled value="${demandeInformation.tel}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Fax"/>  </label>
                                        <input type="text" disabled value="${demandeInformation.fax}" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Email"/> </label>
                                        <input type="text" disabled value="${demandeInformation.email}" class="form-control">
                                    </div>
                                </div>
                            </div>
                                </div>
                            </div>
                    </div>

                        <div class="panel">
                            <div class="card-header panel-heading" id="headingOne">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <i class="icon fa fa-file-text mr-3"></i>
                                        <c:if test="${type=='AE'}">
                                        <spring:message code="label.Informationssurlactivite"/>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <spring:message code="label.Informationssurleprojet"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                <div class="card-body">
                                    <c:if test="${type=='EE' || type=='RS'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.IntituleProjet"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Transfrontalier"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.tronsfrontalier}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Interregion"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.interregion}">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${type=='AE'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Intituledelactivite"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Naturedactivite"/> </label>
                                                    <textarea disabled type="text" class="form-control" rows="3">${demandeInformation.nature_projet}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="input-group" style="margin-top: 32px">
                                                    <input type="text" class="form-control" disabled value="<spring:message code="label.consistancedelactivite"/>" aria-label="Username" aria-describedby="basic-addon1">
                                                    <span id="basic-addon1"><a target="_blank" class="btn btn-success btn-rounded" href="${fn:replace(demandeInformation.url_file_AE,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${type=='NT'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.IntituleProjet"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.intitule_projet}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.MontantdinvestissementenMDH"/></label>
                                                    <input disabled type="text" class="form-control" value="${demandeInformation.montant_investissement}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Naturedeprojet"/></label>
                                                    <textarea disabled type="text" class="form-control">${demandeInformation.nature_projet}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>

                        <div class="panel">
                            <div class="card-header panel-heading" id="headingTwo">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <i class="icon fa fa-search-location"></i>
                                        <c:if test="${type=='AE'}">
                                            <spring:message code="label.Localisationdelactivite"/>
                                        </c:if>
                                        <c:if test="${type!='AE'}">
                                            <spring:message code="label.Localisationduprojet"/>
                                        </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <div class="row justify-content-center">
                                                <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                    <div class="row "
                                                         style="background: gray;color: white;border-color: #737373;">
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.Regions"/>
                                                        </div>
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.prefecturesp"/>
                                                        </div>
                                                        <div class="col-4 border p-2 font_bold  btn-gris">
                                                            <spring:message code="label.Communes"/>
                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demandeInformation.detailRegion.region}">
                                                                <ul>
                                                                    <c:forEach items="${demandeInformation.detailRegion.region}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demandeInformation.detailRegion.region}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demandeInformation.detailRegion.prefectures}">
                                                                <ul>
                                                                    <c:forEach items="${demandeInformation.detailRegion.prefectures}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demandeInformation.detailRegion.prefectures}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty demandeInformation.detailRegion.communes}">
                                                                <ul>
                                                                    <c:forEach items="${demandeInformation.detailRegion.communes}" var="det">
                                                                        <li> - ${pageContext.response.locale=='ar'?det.nom_ar:det.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty demandeInformation.detailRegion.communes}">
                                                                -
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="panel">
                            <div class="card-header panel-heading" id="headingeight">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed text-white" type="button" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <i class="icon fa fa-files-o mr-3"></i> <spring:message code="label.Piecesaccompagnealademande"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseeight" class="collapse fade" aria-labelledby="headingeight" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table my_table table-striped table-bordered table-hover">
                                        <c:if test="${not empty doc}">
                                            <c:forEach items="${doc}" var="file">
                                                <tr>
                                                    <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                                                    <td>
                                                        <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(file.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${empty doc}">
                                            <tr>
                                                <td colspan="2"> <spring:message code="label.AucunFichier"/> </td>
                                            </tr>
                                        </c:if>

                                    </table>
                                </div>
                            </div>
                        </div>


                        <div class="panel">
                            <div class="card-header panel-heading" id="headingeight3">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed text-white" type="button" data-toggle="collapse" data-target="#collapseeight3" aria-expanded="false" aria-controls="collapseeight3" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <i class="icon fa fa-file-download mr-3"></i><spring:message code="label.Listedestelechargements"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseeight3" class="collapse fade" aria-labelledby="headingeight3" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table my_table table-striped table-bordered table-hover">
                                        <tbody>

                                        <c:forEach items="${demandeInformation.regiondoc}" var="reg">
                                            <c:if test="${not empty reg.doc}">
                                        <tr>
                                            <td><spring:message code="label.Lerapportdelenquetepubliquede"/> <b>${pageContext.response.locale=='ar'?reg.region.nom_ar:reg.region.nom_fr}</b></td>
                                            <td><a target="_blank" class="btn btn-success" href="${fn:replace(reg.doc,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                        </tr>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${not empty demandeInformation.url_registre}">
                                            <tr>
                                                <td><spring:message code="label.Leregistre"/></td>
                                                <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.url_registre,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                            </tr>
                                        </c:if>
                                            <c:if test="${not empty demandeInformation.reunions[demandeInformation.reunions.size()-1].url_pv && not empty demandeInformation.reunions[demandeInformation.reunions.size()-1].url_presence}">
                                            <tr>
                                                <td><spring:message code="label.PVdereunion"/></td>
                                                <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.reunions[demandeInformation.reunions.size()-1].url_pv,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                            </tr>
                                            <tr>
                                                <td><spring:message code="label.Listedepresence"/></td>
                                                <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.reunions[demandeInformation.reunions.size()-1].url_presence,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                            </tr>
                                            </c:if>
                                        <c:if test="${not empty demandeInformation.url_enquette_defenitive}">
                                        <tr>
                                            <td><spring:message code="label.EtudedImpactsurlEnvironnementdefinitive"/></td>
                                            <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.url_enquette_defenitive,"/assets/myFile/","/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${not empty demandeInformation.url_cachier_defenitive}">
                                        <tr>
                                            <td><spring:message code="label.Cahierdeschargesdefinitif"/></td>
                                            <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.url_cachier_defenitive,"/assets/myFile/","/dowload_uploaded/")}" > <span class="fa fa-download"></span> </a></td>
                                        </tr>
                                        </c:if>
                                        <c:if test="${not empty demandeInformation.url_document_signee}">
                                            <tr>
                                                <c:if test="${type=='EE'}">
                                                    <td> <spring:message code="label.Ladecisiondelacceptabiliteenvironnementalesignee"/></td>
                                                </c:if>
                                                <c:if test="${type=='NT'}">
                                                    <td> <spring:message code="label.Lecertificatdeconformiteenvironnementalesignee"/></td>
                                                </c:if>
                                                <c:if test="${type=='AE'}">
                                                    <td><spring:message code="label.Ladecisiondelacceptabiliteenvironnementalesignee"/> </td>
                                                </c:if>
                                                <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.url_document_signee,"/assets/myFile/","/dowload_uploaded/")}"><span class="fa fa-download"></span></a></td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${not empty demandeInformation.url_decision}">
                                        <tr>
                                            <td> <spring:message code="label.Ladecisiondeconformiteenvironnementalesignee"/> </td>
                                            <td><a target="_blank" class="btn btn-success" href="${fn:replace(demandeInformation.url_decision,"/assets/myFile/","/dowload_uploaded/")}"><span class="fa fa-download"></span></a></td>
                                        </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
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

<jsp:include page="../../includes/footer.jsp"/>
<script>
    function goToDoc(val){
        window.location.href=val;
    }
</script>
