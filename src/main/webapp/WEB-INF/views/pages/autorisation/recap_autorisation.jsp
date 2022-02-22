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

<script>
    $( function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            heightStyle: "content",
        });
    } );

    function updatePdf(id) {

        fetch('/api/test/'+id)
            .then(resp => resp.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Notification.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
            });

    }

    function updatePdfmouvement(id) {

        fetch('/api/okPDF/'+id)
            .then(resp => resp.blob())
            .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Mouvement.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
            });

    }
</script>
<style>
    body{ font-family: 'Arvo', sans-serif !important; }
</style>
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
        width: 45px;
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

    @media (max-width: 776px) {
        .panel-title a {
            font-size: 7pt !important;
        }
    }

</style>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>
<div class="row-fluid mt-2 ml-4" style="margin-top:182px !important;">
    <div class="col-12">
        <c:choose>

            <c:when test="${type=='ZF'}">
                <spring:message code="label.ImpartationDechetsZoneFranche" var="p_page"/>
            </c:when>
            <c:when test="${type=='ET'}">
                <spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger" var="p_page"/>
            </c:when>
            <c:when test="${type=='XD'}">
                <spring:message code="label.ExportationDesDechetsDangereux" var="p_page"/>
            </c:when>
            <c:when test="${type=='TR'}">
                <spring:message code="label.TransitDesDechets" var="p_page"/>
            </c:when>
            <c:otherwise>
                <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
        </c:choose>

        <nav aria-label="breadcrumb" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
            <ol class="breadcrumb ml-4">
                <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page"><a href="/api/getListeAutorisation/${type}/0/6/0" >${p_page}</a></li>
            </ol>
        </nav>
    </div>
</div>

<div class="row justify-content-center pl-3 pr-3  mt-4"  style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="jumbotron p-3">
            <spring:message code="label.Statutdelademande"/>   : <span class="h4 font-weight-bold" style="color: #3b5998"> ${notification.statut.nom_fr} </span><span>
        </span>
        </div>
    </div>
</div>

<div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-md-10 col-sm-12">
        <div class="row p-0 mb-2">
            <div class="col-md-auto col-sm-6 m-1">
                <a href="/api/getListeAutorisation/${type}/0/6/0" class="btn btn-primary btn-block"><i class="${pageContext.response.locale=='ar'?'fa fa-arrow-right':'fa fa-arrow-left'} ml-2"></i><spring:message code="label.Retour"/></a>
            </div>
            <div class="col-md-auto col-sm-6 m-1">
                <a href="/api/generate_recap_imp/${notification.id_notification }" class="btn btn-primary btn-block"><i class="fa fa-print ml-2"></i><spring:message code="label.ImprimerleRecap"/></a>
            </div>

             <c:if test="${notification.statut.id_statut_projet==33}">
            <div class="col-md-auto col-sm-6  m-1">
                <a style="background-color:  #d59d32" href="/api/validateDoc/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-double ml-2"></i><spring:message code="label.Validerlesdocuments"/></a>
            </div>
                </c:if>
            <c:if test="${(notification.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || (notification.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId)}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_lettre_conforme/${type}/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-signature ml-2"></i><spring:message code="label.Telechargeretsignerlalettredeconsentement"/></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==84}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="${fn:replace(notification.url_lettre_conforme,"/assets/myFile/","/dowload_uploaded/")}" class="  btn btn-primary btn-block"><i class="fa fa-check-upload ml-2"></i><spring:message code="label.Telechargerlalettredeconsentement"/></a>
            </div>
                </c:if>
            <c:if test="${(notification.statut.id_statut_projet==86 && notification.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==86 && notification.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_lettre_nonconforme/${type}/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-upload ml-2"></i><spring:message code="label.Telechargerlalettredenonconforme"/></a>
            </div>
                </c:if>
            <c:if test="${(notification.statut.id_statut_projet==38 && type=='XD' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==38 && type=='XD' && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_lettre/${type}/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-upload ml-2"></i><spring:message code="label.Telechargerlalettredavisdunpaysdedestination"/></a>
            </div>
                </c:if>
            <c:if test="${(notification.statut.id_statut_projet==38 && type=='TR' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==38 && type=='TR' && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_sign_docNotif/${type}/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-upload ml-2"></i><spring:message code="label.Telechargeretsignerlalettre"/></a>
            </div>
                </c:if>
            <c:if test="${(notification.statut.id_statut_projet==38 && type!='XD' && type!='TR'  && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==38 && type!='XD' && type!='TR' && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
                <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_sign_docNotif/${type}/${notification.id_notification }" class="  btn btn-primary btn-block"><i class="fa fa-check-upload ml-2"></i><spring:message code="label.Telechargeretsignerlautorisation"/></a>
                </div>
            </c:if>
            <c:if test="${(nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/down_lettre_attachement/${type}/${notification.id_notification }" class=" btn btn-primary btn-block"><i class="fa fa-edit ml-2"></i><spring:message code="label.Attacherlavisdepaysdedestination"/></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==63}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="/api/certificatElimination/${type}/${notification.id_notification }" class=" btn btn-primary btn-block"><i class="fa fa-check ml-2"></i><spring:message code="label.Validerlecertificat"/></a>
            </div>
                    <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="  btn btn-primary btn-block"><i class="fa fa-download ml-2"></i><spring:message code="label.Telechargerlautorisation"/></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65 || notification.statut.id_statut_projet==67 || notification.statut.id_statut_projet==68}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="  btn btn-primary btn-block"><i class="fa fa-download ml-2"></i><spring:message code="label.Telechargerlautorisation"/></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==54 || notification.statut.id_statut_projet==55 || notification.statut.id_statut_projet==58 || notification.statut.id_statut_projet==59}">
            <div class="col-md-auto col-sm-6  m-1">
                <a style="background-color:  #d59d32" href="${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="  btn btn-primary btn-block"><i class="fa fa-download ml-2"></i><c:if test="${notification.zf_et=='TR'}"><spring:message code="label.Telechargerlalettre"/> </c:if>
                    <c:if test="${notification.zf_et=='XD'}"><spring:message code="label.Lalettredavisdepaysdedestination"/> </c:if>
                    <c:if test="${notification.zf_et!='TR'&&notification.zf_et!='XD'}"><spring:message code="label.Telechargerlautorisation"/></c:if></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==66}">
            <div class="col-md-auto col-sm-6  m-1">
                    <a type="button" style="background-color:  #d59d32" onclick="affiche_modal_transporteur('${notification.id_notification}')" class="  btn btn-primary btn-block"><i class="fa fa-check ml-2"></i><spring:message code="label.Validerletransporteur"/></a>
            </div>
                    <div class="col-md-auto col-sm-6  m-1">
                    <a style="background-color:  #d59d32" href="${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}" class="  btn btn-primary btn-block"><i class="fa fa-download ml-2"></i><spring:message code="label.Telechargerlautorisation"/></a>
            </div>
                </c:if>
                <c:if test="${notification.statut.id_statut_projet==39}">
                    <div class="col-md-auto col-sm-6  m-1">
                            <a style="background-color:  #d59d32" href="/api/validationFinal/${notification.id_notification}" class="  btn btn-primary btn-block"><i class="fa fa-edit ml-2"></i><spring:message code="label.Avisdudepartementconcernes"/></a>
                    </div>
                </c:if>
                <c:if test="${(notification.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
                    <div class="col-md-auto col-sm-6  m-1">
                            <a type="button" class="btn btn-primary btn-block" onclick="goToLienNonFavorable('/api/downloadRecuDepo/${notification.id_notification }')"><i class="fa fa-signature ml-2"></i> <spring:message code="label.Telechargerlautorisation"/></a>
                    </div>
                </c:if>
                <c:if test="${(notification.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || notification.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.compteId!=notification.compteAffecte.compteId}">
                    <div class="col-md-auto col-sm-6  m-1">
                        <a type="button" class="btn btn-primary btn-block" onclick="goToLienNonFavorable('/api/downloadRecuDepoND/${notification.id_notification }')"><i class="fa fa-signature ml-2"></i><spring:message code="label.Telechargerlautorisation"/></a>
                    </div>
                </c:if>
        </div>
    </div>
</div>


<div class="row justify-content-center pl-2 pr-2" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-10">
        <div class="bg-white" id="accordion-style-1">
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">
                        <c:if test="${type=='XD' || type=='ZF'}">
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingOne1">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn  text-white" type="button" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-sort-numeric-asc mr-3"></i><spring:message code="label.Numerodenotification"/>
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne1" class="collapse show fade" aria-labelledby="headingOne1" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Numerodenotification"/></label>
                                                <input class="form-control" value="${notification.num_notification}" disabled>
                                            </div>
                                        </div>

                                        <div class="col-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Classification"/> </label>
                                                <input class="form-control" value="${notification.classification.nom_fr}" disabled>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.code"/> </label>
                                                <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.typededechet"/> </label>
                                                <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0 mt-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>
                                                    <c:choose>
                                                        <c:when test="${type=='ZF'}">
                                                            <spring:message code="label.ZonneFranche"/>
                                                        </c:when>
                                                        <c:when test="${type=='ET'}">
                                                            <spring:message code="label.paysetranger"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <spring:message code="label.paysExport"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </label>
                                                <input type="text" disabled value="${notification.zonneFranche.nom_fr} ${notification.pays.nom_fr}" class="form-control">
                                            </div>
                                        </div>


                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Quantitetotaleprevue"/></label>
                                                <input type="text" disabled value="${notification.quantite}" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row m-0 p-0 mt-2">


                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Unite"/>  </label>
                                                <input type="text" disabled value="${notification.unite.nom_fr}" class="form-control">
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${notification.zf_et!='ZF'}">
                        <div class="panel">
                                <div class="card-header panel-heading" id="headingOne">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn  text-white" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon user-face mr-3"></i><spring:message code="label.ExportateurNotifiant"/>
                                        </a>
                                    </h5>
                                </div>

                                <div id="collapseOne" class="collapse ${notification.zf_et=='XD'?'':'show'} fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <c:if test="${notification.zf_et!='TR' && notification.zf_et != 'XD'}">
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.NomdelexportateurNotifiant"/> </label>
                                                        <input type="text" disabled value="${notification.nom}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Operation"/> </label>
                                                        <input type="text" disabled value="${notification.operation}" class="form-control">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.code"/> </label>
                                                        <input type="text" disabled value="${notification.code.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.typededechet"/> </label>
                                                        <input type="text" disabled value="${notification.code.nom_ar}" class="form-control">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                                                    </div>
                                                </div>
                                                <c:if test="${!notification.zf_et.equals('ET')}">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                                            <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.codeCE}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.etat}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Quantite"/></label>
                                                        <input type="text" disabled value="${notification.quantite}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Unite"/>  </label>
                                                        <input type="text" disabled value="${pageContext.response.locale=="ar"?notification.unite.nom_ar:notification.unite.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${notification.zf_et == 'XD'}">
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.nomsociete"/> </label>
                                                        <input type="text" disabled value="${notification.importateur.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label dir="rtl"> إسم الشركة </label>
                                                        <input dir="rtl" value="${notification.importateur.nom_ar}" disabled type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Personneacontacter"/> </label>
                                                        <input value="${notification.importateur.contact_fr}" disabled type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Adresse"/> </label>
                                                        <input value="${notification.importateur.adresse_fr}" disabled type="text"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Telephone"/> </label>
                                                        <input value="${notification.importateur.tel}" disabled type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${!notification.zf_et.equals('TR')}">
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Region"/>  </label>
                                                        <input type="text" disabled value="${notification.region.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.province"/>  </label>
                                                        <input type="text" disabled value="${notification.prefecture.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                            </c:if>
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Telecopie"/>  </label>
                                                        <input value="${notification.importateur.fax}" disabled type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.Courrierelectronique"/> </label>
                                                        <input value="${notification.importateur.mail}" disabled type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                        <c:if test="${notification.zf_et=='TR'}">
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.NomdelexportateurNotifiant"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.nom}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Telecopie"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.telecopie}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Personneacontacter"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.personne}">
                                                    </div>
                                                </div>

                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Telephone"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.tel}">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Courrierelectronique"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.courrier}">
                                                    </div>
                                                </div>

                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Adresse"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.adresse}">
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                                                    </div>
                                                </div>
                                                <c:if test="${!notification.zf_et.equals('ET')}">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                                            <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.codeCE}">
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-sm-12 ">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                                                        <input class="form-control" type="text" disabled value="${notification.etat}">
                                                    </div>
                                                </div>
                                            </div>

                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingTwo">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-user-friends"></i>
                                        <c:if test="${type.equals('ZF')}">
                                            <spring:message code="label.ImportateurNotifiant"/>
                                        </c:if>
                                        <c:if test="${!type.equals('ZF')}">
                                            <spring:message code="label.Destinataire"/>
                                        </c:if>
                                        </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <c:if test="${notification.zf_et=='XD'}">
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Nomdelimportateurdestinataire"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.nom}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Telecopie"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.telecopie}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Personneacontacter"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.personne}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Telephone"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.tel}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Courrierelectronique"/> </label>
                                                    <input class="form-control" type="text" disabled value="${notification.courrier}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Adresse"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.adresse}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.CodeNationaldanslepaysdexportation"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.codeNationalXD}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.CodeNationaldanslepaysdimportation"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.codeNationalIm}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12 ">
                                                <div class="form-group">
                                                    <label><spring:message code="label.ListeDesdechetsdeleCE"/></label>
                                                    <input class="form-control" type="text" disabled value="${notification.codeCE}">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label>
                                                        <c:choose>
                                                            <c:when test="${notification.zf_et.equals('XD')}">
                                                                <label><spring:message code="label.Etatdexportationdexpedition"/></label>
                                                            </c:when>
                                                            <c:when test="${notification.zf_et.equals('TR')}">
                                                                <label><spring:message code="label.Etatsdetransitentreeetsortie"/></label>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <label><spring:message code="label.Etatdimportationdedestination"/></label>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </label>
                                                    <input type="text" disabled value="${notification.etat}" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${notification.zf_et!='XD'}">
                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" ${pageContext.response.locale=='ar'?'rtl':'ltr'}>
                                                    <label> <spring:message code="label.nomsociete"/>  </label>
                                                    <c:choose>
                                                        <c:when test="${pageContext.response.locale=='ar'}">
                                                            <input value="${notification.importateur.nom_ar}" disabled type="text" name="Nom_ar" id="Nom_ar" class="form-control" dir="rtl">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="text" disabled value="${notification.importateur.nom_fr}" disabled class="form-control">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Personneacontacter"/></label>
                                                    <input type="text" disabled value="${notification.importateur.contact_fr}" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Adresse"/> </label>
                                                    <input type="text" disabled value="${notification.importateur.adresse_fr}" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Email"/> </label>
                                                    <input type="text" disabled value="${notification.importateur.mail}" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-2">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label> <spring:message code="label.Telephone"/>  </label>
                                                    <input type="text" disabled value="${notification.importateur.tel}" class="form-control">
                                                </div>
                                            </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Fax"/> </label>
                                                <input type="text" disabled value="${notification.importateur.fax}" class="form-control">
                                            </div>
                                        </div>
                                        </div>


                                        <c:if test="${!notification.zf_et.equals('TR')}">
                                            <div class="row mb-2">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Region"/> </label>
                                                        <input type="text" disabled value="${notification.region.nom_fr}" class="form-control">
                                                    </div>
                                                </div>

                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label> <spring:message code="label.province"/>  </label>
                                                        <input type="text" disabled value="${notification.prefecture.nom_fr}" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>

                                        <div class="row mb-2">
                                            <c:if test="${type.equals('ZF')}">
                                                <div class="col-md-6 col-sm-12">
                                                    <div class="form-group">
                                                        <label><spring:message code="label.Identifiantfiscale"/> </label>
                                                        <input type="text" disabled value="${notification.importateur.idf}" class="form-control">
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                        </div>
                        <c:if test="${notification.zf_et=='XD' || notification.zf_et=='TR'}">
                        <div class="panel">
                                <div class="card-header panel-heading" id="headingThree">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-user-circle mr-3"></i>
                                            <c:if test="${notification.zf_et=='XD'}">
                                                <spring:message code="label.Autoritedimportation"/>
                                            </c:if>
                                            <c:if test="${notification.zf_et=='TR'}">
                                                <spring:message code="label.Autoritedetransit"/>
                                            </c:if>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <c:if test="${notification.zf_et=='XD'}">
                                            <div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Denominationdelautorite"/> </label>
                                                                <input disabled class="form-control" value="${notification.autorite.denomination}" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Email"/></label>
                                                                <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Adresse"/></label>
                                                                <textarea disabled rows ="2" class="form-control">${notification.autorite.adresse} </textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Genre"/> </label>
                                                                <input disabled class="form-control" value="${notification.autorite.genre_A}" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Telephone"/></label>
                                                                <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label><spring:message code="label.Fax"/></label>
                                                                <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <label>
                                                                    <spring:message code="label.paysExport"/>
                                                                </label>
                                                                <input disabled class="form-control" value="${notification.pays.nom_fr}" type="text">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                        </c:if>


                                        <c:if test="${notification.zf_et=='TR'}">
                                            <div>
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Genre"/> </label>
                                                            <input disabled class="form-control" value="${notification.autorite.genre_A}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Username"/> </label>
                                                            <input disabled class="form-control" value="${notification.autorite.denomination}" type="text">
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Qualite"/> </label>
                                                            <input disabled class="form-control" value="${notification.autorite.poste}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Email"/></label>
                                                            <input disabled class="form-control" value="${notification.autorite.email}" type="text">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Telephone"/></label>
                                                            <input disabled class="form-control" value="${notification.autorite.tel}" type="text">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Fax"/></label>
                                                            <input disabled class="form-control" value="${notification.autorite.fax}" type="text">
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.Adresse"/></label>
                                                            <textarea disabled rows ="2" class="form-control">${notification.autorite.adresse} </textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <label><spring:message code="label.pay"/> </label>
                                                            <input disabled class="form-control" value="${pageContext.response.locale=='ar'?notification.autorite.pays.nom_ar:notification.autorite.pays.nom_fr}" type="text">
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table my_table table-striped table-bordered table-hover">
                                                    <thead>
                                                    <tr>
                                                        <th><spring:message code="label.pay"/></th>
                                                        <th><spring:message code="label.Autorite"/></th>
                                                        <th> <spring:message code="label.Autorisationdesdechets"/> </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:if test="${not empty notification.paysAutorites}">
                                                        <c:forEach items="${notification.paysAutorites}" var="tr">
                                                            <tr>
                                                                <td>${pageContext.response.locale=='ar'?tr.pays.nom_ar:tr.pays.nom_fr}</td>
                                                                <td>${tr.desc_autorite}</td>
                                                                <td><a href="/downloadFile/${fn:replace(tr.url_autorite,"/assets/myFile/","")}" class="btn btn-primary rounded-circle"><span class="fa fa-download"></span></a></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${empty notification.paysAutorites}">
                                                        <tr>
                                                            <td class="text-center" colspan="5"><spring:message code="label.Aucuneautorite"/>   </td>
                                                        </tr>
                                                    </c:if>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </c:if>


                                    </div>

                                </div>
                            </div>
                        </c:if>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingFor">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseFor" aria-expanded="false" aria-controls="collapseFor" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-file-download mr-3"></i>
                                        <div class="row">
                                            <div class="col-lg-5 col-sm-12">
                                                <spring:message code="label.Documentdenotification"/>
                                            </div>
                                            <div class="col-lg-7 mt-1 col-sm-12">
                                                <button style="font-size: 12px !important; background-color: #ffc107;" type="button" id="Suivante" onclick="updatePdf(${notification.id_notification })" class="btn btn-sm text-white">
                                                    <spring:message code="label.Documentdenotification"/>
                                                </button>
                                            </div>
                                        </div>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFor" class="collapse fade" aria-labelledby="headingFor" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Quantitetotaleprevue"/></label>
                                                <input disabled type="text" class="form-control" value="${notification.quantite}">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Nombretotaldexpeditionsprevues"/></label>
                                                <input disabled type="text" class="form-control" value="${notification.expedition}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Operation"/></label>
                                                <input disabled type="text" class="form-control" value="${notification.operation}">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.NotificationConcernant"/></label>
                                                <input disabled type="text" class="form-control" value="${notification.uniques}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Premierdepart"/></label>
                                                <input disabled class="form-control" value="${notification.premier}" type="text">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Dernierdepart"/></label>
                                                <input disabled class="form-control" value="${notification.dernier}" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Nomdeladestinationfinale"/></label>
                                                <input disabled class="form-control" value="${notification.destination_final}" type="text">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Prescriptionsspecialesdemanutention"/></label>
                                                <input disabled class="form-control" value="${notification.manutention}" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Typesdeconditionnement"/></label>
                                                <input disabled class="form-control" value="${notification.typeconditionnement.nom_fr}" type="text">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Caracteristiquesphysiques"/></label>
                                                <c:if test="${notification.caracteristquePhysique.id_classification!=5}">
                                                    <input disabled class="form-control" value="${notification.caracteristquePhysique.nom_fr}" type="text">
                                                </c:if>
                                                <c:if test="${notification.caracteristquePhysique.id_classification==5}">
                                                    <input disabled class="form-control" value="${notification.autre}" type="text">
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <c:if test="${notification.operation=='traitement'}">
                                                    <label><spring:message code="label.Operationdelimination"/></label>
                                                </c:if>
                                                <c:if test="${notification.operation=='valorisation'}">
                                                    <label><spring:message code="label.Operationdevalorisation"/></label>
                                                </c:if>
                                                <input disabled class="form-control" value="${notification.operationdelimination}" type="text">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label>Code H</label>
                                                <input disabled class="form-control" value="${notification.codeH}" type="text">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingFive">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-file-contract mr-3"></i>
                                        <div class="row">
                                            <div class="col-lg-5 col-sm-12">
                                                <spring:message code="label.documentdemouvement"/>
                                            </div>
                                            <div class="col-lg-7 mt-1 col-sm-12">
                                                <button onclick="updatePdfmouvement('${notification.id_notification}')" style="font-size: 12px !important;background-color: #ffc107;" class="btn text-white btn-sm">
                                                    <spring:message code="label.documentdemouvement"/>
                                                </button>
                                            </div>
                                        </div>

                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFive" class="collapse fade" aria-labelledby="headingFive" data-parent="#accordionExample">
                                <div class="card-body">

                                </div>
                            </div>
                        </div>
                        <c:if test="${notification.zf_et=='ET' ||notification.zf_et=='XD' || notification.zf_et=='ZF'}">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingZero">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseZero" aria-expanded="false" aria-controls="collapseZero" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-truck-pickup mr-3"></i><spring:message code="label.Transporteurnationalprevu"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseZero" class="collapse fade" aria-labelledby="headingZero" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==1}">
                                            <div class="table-responsive">
                                                <table id="tableProfils" class="table my_table table-striped hover compact table-bordered text-md-nowrap">
                                                <thead class="thead-bleu">
                                                <tr>
                                                    <th class=""><spring:message code="label.nomsociete"/></th>
                                                    <th class=""><spring:message code="label.Identifiantfiscale"/></th>
                                                    <th class=""><spring:message code="label.Telephone"/></th>
                                                    <th class=""><spring:message code="label.Fax"/></th>
                                                    <th class=""><spring:message code="label.Adresse"/></th>
                                                </tr>
                                                </thead>
                                                <tbody id="tbodyTransporteur">
                                                <c:forEach items="${notification.transporteur}" var="Tr_l">
                                                    <tr>
                                                        <td>${Tr_l.nom} </td>
                                                        <td>${Tr_l.identifiant} </td>
                                                        <td>${Tr_l.tel} </td>
                                                        <td>${Tr_l.fax} </td>
                                                        <td>${Tr_l.adresse} </td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${(notification.zf_et=='XD' || notification.zf_et=='ZF') && notification.classification.id_classification==2}">
                                        <div class="table-responsive">
                                            <table class="table my_table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th> <spring:message code="label.nomsociete"/> </th>
                                                    <th> <spring:message code="label.NMatriculation"/> </th>
                                                    <th> <spring:message code="label.Typedetransport"/> </th>
                                                    <th> <spring:message code="label.Assurance"/> </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${not empty notification.transporteur_etranger}">
                                                    <c:forEach items="${notification.transporteur_etranger}" var="tr">
                                                        <tr>
                                                            <c:if test="${tr.type=='tn'}">
                                                                <td>${tr.raison_social}</td>
                                                                <td>${tr.num_matricule}</td>
                                                                <td>${tr.typeVehicule}</td>
                                                                <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${not empty declaration}">
                                                    <tr class="bg-primary">
                                                        <td>${declaration.transporteurParam.nom}</td>
                                                        <td>${declaration.transporteurParam.identifiant}</td>
                                                        <td>${declaration.transporteurParam.tel}</td>
                                                        <td>${declaration.transporteurParam.fax}</td>
                                                        <td>${declaration.transporteurParam.adresse}</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${(empty notification.transporteur_etranger && empty declaration)}">
                                                    <tr>
                                                        <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/> </td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        </c:if>
                                        <c:if test="${notification.zf_et !='ZF' && notification.zf_et!='XD'}">
                                        <div class="table-responsive">
                                            <table class="table my_table table-striped table-bordered table-hover">
                                                <thead>
                                                <tr>
                                                    <th> <spring:message code="label.nomsociete"/> </th>
                                                    <th> <spring:message code="label.NMatriculation"/> </th>
                                                    <th> <spring:message code="label.Typedetransport"/> </th>
                                                    <th> <spring:message code="label.Assurance"/> </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${not empty notification.transporteur_etranger}">
                                                    <c:forEach items="${notification.transporteur_etranger}" var="tr">
                                                        <tr>
                                                            <c:if test="${tr.type=='tn'}">
                                                                <td>${tr.raison_social}</td>
                                                                <td>${tr.num_matricule}</td>
                                                                <td>${tr.typeVehicule}</td>
                                                                <td class="text-center"><a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded"><span class="fa fa-download"></span></a></td>
                                                            </c:if>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${not empty declaration}">
                                                    <tr class="bg-primary">
                                                        <td>${declaration.transporteurParam.nom}</td>
                                                        <td>${declaration.transporteurParam.identifiant}</td>
                                                        <td>${declaration.transporteurParam.tel}</td>
                                                        <td>${declaration.transporteurParam.fax}</td>
                                                        <td>${declaration.transporteurParam.adresse}</td>
                                                    </tr>
                                                </c:if>
                                                <c:if test="${(empty notification.transporteur_etranger && empty declaration)}">
                                                    <tr>
                                                        <td class="text-center" colspan="5"> <spring:message code="label.AucunTransporteur"/> </td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${notification.zf_et=='XD' || notification.zf_et=='ET' ||notification.zf_et=='TR'}">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingZero1">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseZero1" aria-expanded="false" aria-controls="collapseZero1" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-truck mr-3"></i><spring:message code="label.TransporteurInternational"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseZero1" class="collapse fade" aria-labelledby="headingZero1" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table my_table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th> <spring:message code="label.nomsociete"/> </th>
                                                <th> <spring:message code="label.Typedetransport"/> </th>
                                                <th> <spring:message code="label.Assurance"/> </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${not empty notification.transporteur_etranger}">
                                                <c:forEach items="${notification.transporteur_etranger}" var="tr">
                                                    <tr>
                                                        <c:if test="${tr.type=='ti'}">
                                                            <td>${tr.raison_social}</td>
                                                            <td>${tr.typeVehicule}</td>
                                                            <td class="text-center">
                                                                <c:if test="${not empty tr.url_assurance}">
                                                                    <a download="assurance" target="_blank" href="${fn:replace(tr.url_assurance, "/assets/myFile/","/dowload_uploaded/" )}" class="btn btn-success rounded">
                                                                        <span class="fa fa-download"></span>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${empty tr.url_assurance}">
                                                                    <spring:message code="label.aucuneAssurance"/>
                                                                </c:if>
                                                            </td>
                                                        </c:if>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty notification.transporteur_etranger}">
                                                <tr>
                                                    <td class="text-center" colspan="5"><spring:message code="label.AucunTransporteur"/></td>
                                                </tr>
                                            </c:if>
                                            </tbody>
                                        </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingSix">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-box-open mr-3"></i>
                                        <c:if test="${notification.zf_et=='XD'}"><spring:message code="label.Producteurs"/></c:if>
                                        <c:if test="${notification.zf_et.equals('ET')}"><spring:message code="label.producteursdedechet"/></c:if>
                                        <c:if test="${notification.zf_et!='XD' && !notification.zf_et.equals('ET')}"><spring:message code="label.Producteur"/> </c:if>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseSix" class="collapse fade" aria-labelledby="headingSix" data-parent="#accordionExample">
                                <div class="card-body">
                                    <c:if test="${notification.zf_et=='XD'}">
                                        <div class="table-responsive">
                                            <table class="table my_table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th> <spring:message code="label.Personneacontacter"/> </th>
                                                <th> <spring:message code="label.Adresse"/> </th>
                                                <th> <spring:message code="label.Telephone"/> </th>
                                                <th> <spring:message code="label.Fax"/> </th>
                                                <th> <spring:message code="label.Email"/> </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${not empty notification.producteurs}">
                                                <c:forEach items="${notification.producteurs}" var="tr">
                                                    <tr>
                                                        <td>${tr.contact_fr}</td>
                                                        <td>${tr.adresse_fr}</td>
                                                        <td>${tr.tel}</td>
                                                        <td>${tr.fax}</td>
                                                        <td>${tr.mail}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${empty notification.producteurs}">
                                                <tr>
                                                    <td class="text-center" colspan="7"><spring:message code="label.Aucunproducteur"/>   </td>
                                                </tr>
                                            </c:if>
                                            </tbody>
                                        </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${notification.zf_et!='XD'}">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.nomsociete"/></label>
                                                    <c:choose>
                                                        <c:when test="">
                                                            <input disabled class="form-control" value="${notification.producteur.nom_ar}" type="text">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input disabled class="form-control" value="${notification.producteur.nom_fr}" type="text">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Personneacontacter"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.contact_fr}" type="text">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Identifiantfiscale"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.idf}" type="text">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Adresse"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.adresse_fr}" type="text">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Telephone"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.tel}" type="text">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Fax"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.fax}" type="text">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Email"/></label>
                                                    <input disabled class="form-control" value="${notification.producteur.mail}" type="text">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingSeven">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseseven" aria-expanded="false" aria-controls="collapseseven" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-home mr-3"></i><spring:message code="label.Installationdevalorisationelimination"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseseven" class="collapse fade" aria-labelledby="headingseven" data-parent="#accordionExample">
                                <div class="card-body">
                                    <c:if test="${!notification.zf_et.equals('XD')}">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.nomsociete"/></label>
                                                    <c:choose>
                                                        <c:when test="">
                                                            <input disabled class="form-control" value="${notification.eliminateur.nom_ar}" type="text">
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input disabled class="form-control" value="${notification.eliminateur.nom_fr}" type="text">
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Personneacontacter"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.contact_fr}" type="text">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Identifiantfiscale"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.idf}" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Adresse"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.adresse_fr}" type="text">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Telephone"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.tel}" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Fax"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.fax}" type="text">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Email"/></label>
                                                <input disabled class="form-control" value="${notification.eliminateur.mail}" type="text">
                                            </div>
                                        </div>
                                    </div>
                                    </c:if>

                                    <c:if test="${notification.zf_et.equals('XD')}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Personneacontacter"/></label>
                                                    <input disabled class="form-control" value="${notification.eliminateur.contact_fr}" type="text">
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Adresse"/></label>
                                                    <input disabled class="form-control" value="${notification.eliminateur.adresse_fr}" type="text">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Telephone"/></label>
                                                    <input disabled class="form-control" value="${notification.eliminateur.tel}" type="text">
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Fax"/></label>
                                                    <input disabled class="form-control" value="${notification.eliminateur.fax}" type="text">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                    <label><spring:message code="label.Email"/></label>
                                                    <input disabled class="form-control" value="${notification.eliminateur.mail}" type="text">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingeight">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseeight" aria-expanded="false" aria-controls="collapseeight" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-files-o mr-3"></i><spring:message code="label.Piecesaccompagnealademande"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseeight" class="collapse fade" aria-labelledby="headingeight" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table my_table table-striped table-bordered table-hover">
                                        <c:if test="${not empty doc}">
                                            <c:forEach items="${doc}" var="file">
                                                <tr>
                                                    <td>${file.docImport.nom_fr}</td>
                                                    <td>
                                                        <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(file.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>

                                        <tr>
                                        <c:if test="${empty doc}">
                                                <td colspan="2"><spring:message code="label.AucunFichier"/> </td>
                                            </tr>
                                        </c:if>

                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification==1}">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingeight1">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseeight1" aria-expanded="false" aria-controls="collapseeight1" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-file-signature mr-3"></i>
                                            <div class="row">
                                                <div class="col-lg-5 col-sm-12">
                                                    <spring:message code="label.Certificatdelimination"/>
                                                </div>
                                                <div class="col-lg-7 mt-1 col-sm-12">
                                                    <c:if test="${notification.statut.id_statut_projet==63}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==64}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==65}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                </div>
                                            </div>
                                           </a>
                                    </h5>
                                </div>
                                <div id="collapseeight1" class="collapse fade" aria-labelledby="headingeight1" data-parent="#accordionExample"
                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <div class="card-body">

                                        <c:if test="${not empty notification.url_certicat_elimination}">
                                            <div class="row">
                                                <div class="col-md-4 col-sm-12">
                                                    <label><spring:message code="label.Nombredecolis"/></label>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" disabled value="${notification.nbr_colis}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-12">
                                                    <label><spring:message code="label.Quantiteprevue"/></label>
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" disabled value="${notification.quantite}">
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-sm-12">
                                                    <label><spring:message code="label.Datedevalidationducertificat"/></label>
                                                    <div class="form-group">
                                                        <fmt:formatDate var="date_dp" pattern="dd-MM-yyyy" value="${notification.dateValidation}"/>
                                                        <input type="text" class="form-control" disabled value="${date_dp}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table my_table table-striped table-bordered table-hover"
                                                       style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">

                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" value="Cerificat d'élimination" disabled>
                                                                <div class="input-group-append">
                                                                    <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(notification.url_certicat_elimination, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <c:if test="${notification.url_quantite_justificatif != null}">
                                                        <div class="col-md-6 col-sm-12">
                                                            <div class="form-group">
                                                                <div class="input-group">
                                                                    <input type="text" class="form-control" value="Justificatif" disabled>
                                                                    <div class="input-group-append">
                                                                        <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(notification.url_quantite_justificatif, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </table>
                                            </div>
                                            <div class="table-responsive">
                                                <table class="table my_table table-striped table-bordered table-hover"
                                                       style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <thead>
                                                <tr>
                                                    <th style="width: 50%"> <spring:message code="label.Quantite"/> </th>
                                                    <th style="width: 50%"> <spring:message code="label.Documentdemouvement"/> </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:if test="${not empty notification.docMouvement}">
                                                    <c:forEach items="${notification.docMouvement}" var="tr">
                                                        <tr>
                                                            <td>${tr.quantite}</td>
                                                            <td><a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(tr.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                                <c:if test="${empty notification.docMouvement}">
                                                    <tr>
                                                        <td class="text-center" colspan="5"> <spring:message code="label.Aucunequantite"/> </td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${empty notification.url_certicat_elimination}">
                                            <p><spring:message code="label.Aucunecertificatdelimination"/></p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification==2}">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingeight21">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseeight21" aria-expanded="false" aria-controls="collapseeight21" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-file-signature mr-3"></i>
                                            <div class="row">
                                                <div class="col-lg-5 col-sm-12">
                                                    <spring:message code="label.documentdemouvement"/>
                                                </div>
                                                <div class="col-lg-7 mt-1 col-sm-12">
                                                    <c:if test="${notification.statut.id_statut_projet==95}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==96}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==97}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                </div>
                                            </div>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseeight21" class="collapse fade" aria-labelledby="headingeight21" data-parent="#accordionExample"
                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <div class="card-body">

                                        <c:if test="${not empty notification.url_document_mouvement}">
                                            <div class="row">

                                                <div class="col-md-6 col-sm-12" style="margin-top: 31px">
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" value="<spring:message code="label.Documentdemouvementapresleliminationdesdechets"/> " disabled>
                                                            <div class="input-group-append">
                                                                <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(notification.url_document_mouvement, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="col-md-6 col-sm-12">
                                                    <label><spring:message code="label.Datedevalidationdudocument"/></label>
                                                    <div class="form-group">
                                                        <fmt:formatDate var="date_dp" pattern="dd-MM-yyyy" value="${notification.dateValidation}"/>
                                                        <input type="text" class="form-control" disabled value="${date_dp}">
                                                    </div>
                                                </div>
                                            </div>


                                        </c:if>
                                        <c:if test="${empty notification.url_document_mouvement}">
                                            <p><spring:message code="label.Aucundocumentdemouvement"/></p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${notification.zf_et.equals('ZF') && notification.classification.id_classification ==1 }">
                            <div class="panel">
                                <div class="card-header panel-heading" id="headingeight2">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseeight2" aria-expanded="false" aria-controls="collapseeight2" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-truck-loading mr-3"></i>
                                            <div class="row">
                                                <div class="col-lg-5 col-sm-12">
                                                    <spring:message code="label.Changementdutransporteur"/>
                                                </div>
                                                <div class="col-lg-7 col-sm-12 mt-1">
                                                    <c:if test="${notification.statut.id_statut_projet==63 || notification.statut.id_statut_projet==64 || notification.statut.id_statut_projet==65}">
                                                        <c:if test="${declaration.etat==0}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.AttentedevalidationduTransporteur"/></span></c:if>
                                                        <c:if test="${declaration.etat==1}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.Transporteurvalide"/></span></c:if>
                                                        <c:if test="${declaration.etat==2}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm"><spring:message code="label.Transporteurinvalide"/></span></c:if>
                                                    </c:if>

                                                    <c:if test="${notification.statut.id_statut_projet==66}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==67}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                    <c:if test="${notification.statut.id_statut_projet==68}"><span style="font-size: 12px !important;" class="bg-warning text-white btn-sm">${notification.statut.nom_fr}</span></c:if>
                                                </div>
                                            </div>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseeight2" class="collapse fade" aria-labelledby="headingeight2" data-parent="#accordionExample"
                                     style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <div class="card-body">

                                        <c:if test="${declaration.etat != null}">
                                            <div class="table-responsive">
                                                <table class="table my_table table-striped table-bordered table-hover"
                                                       style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <thead>
                                                <tr>
                                                    <th> <spring:message code="label.Nomdelasociete"/> </th>
                                                    <th> <spring:message code="label.Telephone"/> </th>
                                                    <th> <spring:message code="label.Adresse"/> </th>
                                                    <th> <spring:message code="label.Assurance"/> </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>${declaration.transporteurParam.nom}</td>
                                                    <td>${declaration.transporteurParam.tel}</td>
                                                    <td>${declaration.transporteurParam.adresse}</td>
                                                    <td><a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(declaration.url_file, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a></td>
                                                </tr>

                                                </tbody>
                                            </table>
                                            </div>
                                        </c:if>
                                        <c:if test="${declaration.etat == null}">
                                          <p><spring:message code="label.Aucuntransporteur"/></p>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                        <div class="panel">
                           <div class="card-header panel-heading" id="headingeight3">
                                    <h5 class="mb-0 panel-title">
                                        <a class="accordion-toggle btn collapsed  text-white" type="button" data-toggle="collapse" data-target="#collapseeight3" aria-expanded="false" aria-controls="collapseeight3" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                            <i class="icon fa fa-truck-loading mr-3"></i><spring:message code="label.Listedestelechargements"/>
                                        </a>
                                    </h5>
                                </div>
                                <div id="collapseeight3" class="collapse fade" aria-labelledby="headingeight3" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table my_table table-striped table-bordered table-hover">
                                                <tbody>
                                                <tr>
                                                    <c:if test="${not empty notification.url_doc_signer && notification.zf_et!='TR' && notification.zf_et!='XD'}">
                                                    <td style="width: 93%!important;"> <spring:message code="label.Lautorisation"/> </td>
                                                    <td><a target="_blank" class="btn btn-success" href="/api/downloadRecuDepo/${notification.id_notification}"> <span class="fa fa-download"></span></a></td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <c:if test="${not empty notification.url_doc_signer && notification.zf_et!='TR' && notification.zf_et!='XD'}">
                                                    <td style="width: 93%!important;"> <spring:message code="label.Lautorisationsignee"/></td>
                                                        <td><a type="button" target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <c:if test="${not empty notification.url_doc_signer && notification.zf_et=='TR'}">
                                                        <td style="width: 93%!important;"> <spring:message code="label.Lalettre"/></td>
                                                        <td><a type="button" target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                    </c:if>
                                                </tr>
                                                <c:if test="${notification.zf_et=='XD'}">
                                                    <tr>
                                                    <c:if test="${not empty notification.url_lettre}">
                                                        <td style="width: 93%"><spring:message code="label.Lalettredavisdepaysdedestination"/></td>
                                                        <td><a target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_lettre,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                    </c:if>
                                                        </tr>
                                                    <tr>
                                                        <c:if test="${not empty notification.url_lettre_conforme}">
                                                        <td style="width: 93%"><spring:message code="label.Lalettredeconsentement"/></td>
                                                        <td><a type="button" target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_lettre_conforme,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                        </c:if>
                                                            </tr>
                                                    <tr>
                                                        <c:if test="${not empty notification.url_lettre_nonconforme}">
                                                            <td style="width: 93%"><spring:message code="label.Lalettredenonconforme"/></td>
                                                            <td><a type="button" target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_lettre_nonconforme,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                        </c:if>
                                                    </tr>
                                                    <tr>
                                                        <c:if test="${not empty notification.url_doc_signer}">
                                                            <td style="width: 93%"><spring:message code="label.Lalettresignee"/></td>
                                                            <td><a type="button" target="_blank" class="btn btn-success" onclick="downloadAut2('${fn:replace(notification.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')"> <span class="fa fa-download"></span></a></td>
                                                        </c:if>
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
</div>

<!-- Modal -->
<div class="modal fade" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Validationdutransporteur"/></h5>
                <button onclick="Modalclose_modal('declarationTransp')" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12" >
                        <label><spring:message code="label.ValiderleTransporteur"/> : </label>
                        <input type="text" class="form-control" value="" id="name_trans" disabled>
                        <input class="from-control" type="hidden" value="" id="id_declaration">
                        <input class="from-control" type="hidden" value="" id="id_notif">
                        <input class="from-control" type="hidden" value="" id="type">
                    </div>
                    <div class="col-12 mt-3">
                        <a class="btn btn-primary btn-block" id="file_down" ><span class="fa fa-download"></span><spring:message code="label.Telechargerlassurance"/> </a>
                    </div>
                    <div class="col-12 mt-3">
                        <label><spring:message code="label.Statut"/> </label>
                        <select data-width="100%" class="form-control select2" id="id_select">
                            <option value="1"><spring:message code="label.Valide"/></option>
                            <option value="2"><spring:message code="label.Nonvalide"/></option>
                        </select>
                    </div>

                    <div class="col-12 mt-3" id="msg_comment" style="display: none">
                        <label><spring:message code="label.commentaire"/></label>
                        <textarea class="form-control" rows="3" id="id_comment"></textarea>
                    </div>
                </div>

            </div>
            <div class="modal-footer">
                <button  onclick="Modalclose_modal('declarationTransp')" type="button" class="btn btn-danger-2" data-dismiss="modal"><spring:message code="label.Annuler"/></button>
                <button type="button" class="btn btn-primary" onclick="saveDeclarationTransporteur()"><spring:message code="button.Enregistrer"/></button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp"/>

<script>

    function downloadAut2(val){
        window.location.href=val;
    }

    function  goToLienNonFavorable(val){
        window.location.href=val;
    }

    document.getElementById('id_select').onchange = function(){
        if(this.value == 2){
            document.getElementById('msg_comment').style.display = 'block';
        } else {
            document.getElementById('msg_comment').style.display = 'none';
        }
    };

    function affiche_modal_transporteur(id_notif){
        $("#declarationTransp").modal("show");
        $.ajax({
            url: '/api/getOneDeclarationTransporteur/'+id_notif,
            type: 'POST',
            data: {},
        })
            .done(function(response) {
                console.log(response.declaration);
                var id_decl = response.declaration.declarationId;
                var transp = response.declaration.transporteurParam.nom;
                var url_file = response.declaration.url_file;
                var type = response.declaration.notification.zf_et;

                $("#name_trans").val(transp);
                $("#id_declaration").val(id_decl);
                $("#id_notif").val(id_notif);
                $("#type").val(type);
                console.log(url_file==null);
                if(url_file==null || $.trim(url_file)===""){
                    $("#file_down").attr("onclick","no_file()");
                    $("#file_down").attr("href","");
                }
                else{
                    $("#file_down").attr("onclick","");
                    $("#file_down").attr("href",url_file);
                }

            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
</script>



