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

<c:choose>
    <c:when test="${type=='ZF' && pageContext.response.locale!='ar'}">
        <c:set var="left" value="420px"/>
    </c:when>
    <c:when test="${type=='ZF' && pageContext.response.locale=='ar'}">
        <c:set var="left" value="93rem"/>
    </c:when>
    <c:when test="${type=='ET' && pageContext.response.locale!='ar'}">
        <c:set var="left" value="552px"/>
    </c:when>
    <c:when test="${type=='ET' && pageContext.response.locale=='ar'}"

    >
        <c:set var="left" value="93rem"/>
    </c:when>
    <c:when test="${type=='XD' && pageContext.response.locale!='ar'}">
        <c:set var="left" value="375px"/>
    </c:when>
    <c:when test="${type=='XD' && pageContext.response.locale=='ar'}">
        <c:set var="left" value="93rem"/>
    </c:when>
    <c:when test="${type=='XD' && pageContext.response.locale!='ar'}">
        <c:set var="left" value="375px"/>
    </c:when>
    <c:when test="${type=='TR' && pageContext.response.locale!='ar'}">
        <c:set var="left" value="262px"/>
    </c:when>
    <c:otherwise>
        <c:set var="left" value="93rem"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${type=='ZF' && pageContext.response.locale!='ar'}">
        <c:set var="left_min" value="125px"/>
        <c:set var="top" value="236px"/>
    </c:when>
    <c:when test="${type=='ZF' && pageContext.response.locale=='ar'}">
        <c:set var="left_min" value="45px"/>
        <c:set var="top" value="236px"/>
    </c:when>
    <c:when test="${type=='ET' && pageContext.response.locale!='ar'}">
        <c:set var="left_min" value="125px"/>
        <c:set var="top" value="262px"/>
    </c:when>
    <c:when test="${type=='ET' && pageContext.response.locale=='ar'}">
        <c:set var="left_min" value="45px"/>
        <c:set var="top" value="245px"/>
    </c:when>
    <c:when test="${type=='XD' && pageContext.response.locale!='ar'}">
        <c:set var="left_min" value="125px"/>
        <c:set var="top" value="220px"/>
    </c:when>
    <c:when test="${type=='XD' && pageContext.response.locale=='ar'}">
        <c:set var="left_min" value="45px"/>
        <c:set var="top" value="220px"/>
    </c:when>
    <c:when test="${type=='TR' && pageContext.response.locale!='ar'}">
        <c:set var="left_min" value="125px"/>
        <c:set var="top" value="220px"/>
    </c:when>
    <c:otherwise>
        <c:set var="left_min" value="45px"/>
        <c:set var="top" value="220px"/>
    </c:otherwise>
</c:choose>
<style>

    .model_lang_close{
    margin : ${pageContext.response.locale=='ar'?'-1rem auto -1rem -1rem':'-1rem -1rem -1rem auto'} !important;
    ${pageContext.response.locale=='ar'?'border-bottom-right-radius':'border-bottom-left-radius'} : 47px;
    ${pageContext.response.locale=='ar'?'border-bottom-left-radius':'border-bottom-right-radius'} : 0px;
    }


    .label_lang{
        float: ${pageContext.response.locale=='ar'?'right':'left'};
    }

    .nav-tabs .nav-link.active{
        background:  #d59d32 !important;
        color: white !important;
    }
    .nav-tabs .nav-link.active{
        background:  #d59d32 !important;
        color: white !important;
    }
    .dropdown1 {
        overflow: hidden;
    }

    .dropdown1 .dropbtn1 {
        font-size: 16px;
        border: none;
        outline: none;
        background-color: inherit;
        font-family: inherit;
        margin: 0;
        margin-top: -15px;
    }
    @media(min-width:576px) {
        .dropdown-content1 {
            display: none;
            background-color: gray !important;
            min-width: 180px;
            z-index: 1;
            position: absolute;
            left: ${left};
            top: 166px;
        }
    }
    @media(max-width:575px){
        .dropdown-content1 {
            display: none;
            background-color: #d59d32 !important;
            min-width: 180px;
            z-index: 1;
            position: absolute;
            left:${left_min} !important;
            top: ${top} !important;;
        }
    }
    .dropdown-content1 a {
        float: none;
        color: white;
        text-decoration: none;
        display: block;
        text-align: left;
    }
    .dropdown-content1 a:hover {
        background-color: #d59d32;
    }



    .select2-container .select2-selection--single {
        box-sizing: border-box;
        cursor: pointer;
        display: block;
        height: 36px;
        user-select: none;
        -webkit-user-select: none;
    }

    @media (max-width: 575px){
        .num_notification{
            font-size: 7pt !important;
        }
    }

    .close1{
        background: #ce2828 !important;
        opacity: 1 !important;
        color: white !important;
        border-bottom-right-radius: 47px;
        font-size: 1.5rem;
        font-weight: 700;
        line-height: 1;
        text-shadow: 0 1px 0 #fff;
        border-color: #ce2828;
    }

    .modal-header .close1 {
        padding: 1rem 1rem;
        margin: -1rem auto -1rem -1rem;
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

<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>
<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
    <div class="main-panel myPanel2" style="margin-top:115px">
        <div class="content-wrapper">
            <div id="table_resultat">
                <c:choose>

                    <c:when test="${type=='ZF'}">
                        <spring:message code="label.ImpartationDechetsZoneFranche" var="p_page"/>
                    </c:when>
                    <c:when test="${type=='ET'}">
                        <spring:message code="label.ImpartationDechetsNondangereuxDunPaysEtrange" var="p_page"/>
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
                <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4" style="margin-top: 17px !important;">
                            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page">${p_page}</li>
                            <li class="breadcrumb-item dropdown1 " style="float: left;">
                                <a style="font-size: 14px;" class="dropbtn1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  onclick="affichehover()">
                                    ${pageContext.response.locale=='ar'?ar:sp}
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="dropdown-content1 bg-white" aria-labelledby="dropdownMenuLink" style="display: none;">
                    <a style="padding: 4px; text-align: ${pageContext.response.locale=='ar'?'right':'left'}" href="/api/getListeAutorisation/${type}/0/6/0"><spring:message code='label.Tous'/></a>
                    <c:forEach items="${statut}" var="st">
                        <c:if test="${st.nom_fr!='Brouillon' && st.nom_fr!='Brouillon1'}">
                            <a style="border-bottom: 1px solid white; padding: 4px; text-align: ${pageContext.response.locale=='ar'?'right':'left'}"
                                ${statNow==st.id_statut_projet?"selected":"" }
                               href="/api/getListeAutorisation/${type}/0/6/${st.id_statut_projet}">${st[lng] }</a>
                        </c:if>
                    </c:forEach>
                </div>





                <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">


                    <div class="col-md-12 col-lg-12"
                         style="width: 98%;margin-left: auto;margin-right: auto;background: white;padding-top: 19px;border-radius: 5px;display:flex;">
                        <form id="gamesForm" style=" display:flex;">

                            <div class="row" style="width: 100%!important;">
                                <input name="selst" type="hidden" value="${statutEnc}">
<%--                                <div class="col-lg-3 col-sm-12 mb-2">--%>
<%--                                     <label class="h5"><spring:message code="label.Statut"/></label>--%>
<%--                                      <div class="input-group">--%>
<%--                            <select class="select2 form-control" onchange="go_link(this.value)">--%>
<%--                                <option value="/api/getListeAutorisation/${type}/0/6/0"><spring:message code='label.Tous'/></option>--%>
<%--                                <c:forEach items="${statut}" var="st">--%>
<%--                                    <c:if test="${st.nom_fr!='Brouillon'}">--%>
<%--                                        <option--%>
<%--                                            ${statNow==st.id_statut_projet?"selected":""}--%>
<%--                                                value="/api/getListeAutorisation/${type}/0/6/${st.id_statut_projet}">${st[lng] }</option>--%>
<%--                                    </c:if>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                                </div></div>--%>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group text-left">
                                        <label><spring:message code='label.DateDebut'/></label>
                                        <div class="input-group">
                                            <input required type="date" value="" placeholder="Date Début"
                                                   class="form-control mydatepicker dateDebut" id="date1" name="date1">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-12">
                                    <div class="form-group text-left">
                                        <label><spring:message code='label.DateFin'/></label>
                                        <div class="input-group">
                                            <input required type="date" value="" placeholder="Date Fin"
                                                   class="form-control mydatepicker" id="date2" name="date2">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-12" style="margin-top: -2px">
                                    <label><spring:message code='label.Date'/></label>
                                    <div class="input-group">
                                        <select class="form-select" id="inlineRadioOptions" name="inlineRadioOptions" style="height: 39px">
                                            <option value="date_depot"><spring:message code='label.datedepot'/></option>
                                            <option value="date_validation"><spring:message
                                                    code='label.Datevalidation'/></option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-1 col-sm-12 mb-2">
                                    <a style="margin-top: 32px;background-color: #206c45 !important;" class="btn btn-primary"
                                       onclick="searchByDate1(0)"><spring:message code='label.rechercher'/></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="input-group col-xl-2 col-lg-3 col-md-4 col-sm-6 m-0 p-0 mb-3">
                            <div class="input-group-prepend" style="height:38px !important">
                                <span class="input-group-text" id="basic-addon1">
                                    Affichage</span>
                            </div>
                            <select class="custom-select" name="filter" aria-label="basic-addon1" aria-describedby="basic-addon1" id="filter" onchange="getListFiltrer(this.value)">
                                <option value="asc"><spring:message code="label.Ascendant"/></option>
                                <option value="desc"><spring:message code="label.Descendant"/></option>
                            </select>
                        </div>
                </div>
                <div id="tableDesc">
                    <div class="col-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
                        <table style="width:100% !important" id="tbody" class="table table-bordered display responsive nowrap">
                            <thead style="background: gray;color: white;border-color: #737373;">
                                <tr style="background-color: #206c45 !important;">
                                    <th class=""><spring:message code="label.Nnotification"/></th>
                                    <th class=""><spring:message code="label.code"/></th>
                                    <th class=""><spring:message code="label.datedepot"/></th>
                                    <th class=""><spring:message code="label.Njour"/></th>
                                    <th class=""><spring:message code="label.Statut"/></th>
                                    <th class=""><spring:message code="label.nomsociete"/></th>
                                    <th class=""><spring:message code="label.Adresse"/></th>
                                    <th class=""><spring:message code="label.Telephone"/></th>
                                    <th class=""><spring:message code="label.Fax"/></th>
                                    <th class="all"><spring:message code="label.Action"/></th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${notif}" var="nt" varStatus="loopp">

                                    <tr>
                                        <td class="${type.equals('ZF')?'num_notification':'font-weight-semibold'}">
                                            <c:choose>
                                                <c:when test="${affecter==null && user.poste.id_Poste!=1 && (nt.statut.id_statut_projet!=54 && nt.statut.id_statut_projet!=55 && nt.statut.id_statut_projet!=58 && nt.statut.id_statut_projet!=59 && nt.statut.id_statut_projet!=64 && nt.statut.id_statut_projet!=96 && nt.statut.id_statut_projet!=97 && nt.statut.id_statut_projet!=65 && nt.statut.id_statut_projet!=92 && nt.statut.id_statut_projet!=93 && nt.statut.id_statut_projet!=40)}">
                                                    <a title="Affecter" href="#"
                                                       onclick="show_compte('${nt.id_notification }','ZF')">${nt.num_notification}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    ${nt.num_notification}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td> ${nt.code.nom_fr } </td>
                                        <td>
                                            <fmt:formatDate dateStyle="long" value="${nt.dateDepot }"/>
                                        </td>
                                        <td class="text-center">
                                            <c:set var="nbr" value="${nt.zf_et.equals('TR')?21:30}"/>


                                            <c:if test="${nt.statut.id_statut_projet != 37 && nt.dateConteur != null}">
                                                <fmt:parseNumber integerOnly="true"
                                                        value="${(now.time - nt.dateConteur.time) / (1000*60*60*24) }" var="tt"
                                                />
                                                <button class="btn" style="background-color: #fa92a5!important;text-align: center;background-size: 100% 100%;border-radius: 50%!important;">
                                                    <c:choose>
                                                        <c:when test="${nbr-tt >= 0}">
                                                            ${nbr-tt }
                                                        </c:when>
                                                        <c:otherwise>
                                                            0
                                                        </c:otherwise>
                                                    </c:choose>
                                                </button>
                                            </c:if>
                                        </td>
                                        <td><c:if test="${nt.statut.id_statut_projet == 39 && nt.zf_et.equals('ET')}">
                                            <i class="badge badge-info"><spring:message
                                                    code="label.Attentedevalidationdedepartementconcerne"/> </i>
                                        </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 39 && nt.zf_et.equals('XD')}">
                                                <i class="badge badge-info"><spring:message
                                                        code="label.Attentedevalidationdedepartementconcerne"/> </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 39 && !nt.zf_et.equals('XD') && !nt.zf_et.equals('ET')}">
                                                <i class="badge badge-info">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 33}">
                                                <i class="badge badge-primary">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 93}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 92}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 37}">
                                                <i class="badge badge-warning text-white">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 54 || nt.statut.id_statut_projet == 55 || nt.statut.id_statut_projet == 58 || nt.statut.id_statut_projet == 59 }">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 38}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 83}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 84}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 85}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 86}">
                                                <i class="badge badge-danger">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 95 ||nt.statut.id_statut_projet == 94 || nt.statut.id_statut_projet == 63 || nt.statut.id_statut_projet==66}">
                                                <i class="badge badge-info">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 96 || nt.statut.id_statut_projet == 64 || nt.statut.id_statut_projet==67}">
                                                <i class="badge badge-success">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 97 || nt.statut.id_statut_projet == 65 || nt.statut.id_statut_projet==68}">
                                                <i class="badge badge-danger">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 40}">
                                                <i class="badge badge-danger">${nt.statut.nom_fr } </i>
                                            </c:if>
                                            <c:if test="${nt.statut.id_statut_projet == 29}">
                                                <i class="badge badge-dark">${nt.statut.nom_fr } </i>
                                            </c:if>
                                        </td>

                                        <td> ${nt.importateur.nom_fr} </td>
                                        <td> ${nt.importateur.adresse_fr} </td>
                                        <td> ${nt.importateur.tel} </td>
                                        <td> ${nt.importateur.fax} </td>
                                        <td class="text-center">
                                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapitulatif"/>"><i class="fa fa-print"></i></a>
                                                <c:if test="${(nt.statut.id_statut_projet==38 && type=='TR' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==38 && type=='TR' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien12('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsignerlalettre"/>"><i class="fa fa-signature"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==38 && type=='XD' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==38 && type=='XD' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien5('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredavisdunpaysdedestination"/>"><i class="fa fa-signature"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==38 && type!='XD' && type!='TR'  && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==38 && type!='XD' && type!='TR' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien1('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsignerlautorisation"/>"><i class="fa fa-signature"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLienNonFavorable('/api/downloadRecuDepo/${nt.id_notification }')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLienNonFavorable('/api/downloadRecuDepoND/${nt.id_notification }')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || (nt.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId)}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien6('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredeconsentement"/>"><i class="fa fa-signature"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==86 && nt.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==86 && nt.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien7('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredenonconforme"/>"><i class="fa fa-signature"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==33}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-upload"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==84 }">
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut2('${fn:replace(nt.url_lettre_conforme,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredeconsentement"/>"><i class="fa fa-upload"></i></a>
                                                </c:if>
                                                <c:if test="${(nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien8('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Attacherlavisdepaysdedestination"/>"><i class="fa fa-edit"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==63}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlecertificat"/> "><i class="fa fa-check"></i></a>
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==95}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien4('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerledocumentdemouvement"/> "><i class="fa fa-check"></i></a>
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==94}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.validerlesdocuments"/> "><i class="fa fa-check"></i></a>
                                                    </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==96 ||nt.statut.id_statut_projet==97 || nt.statut.id_statut_projet==64 || nt.statut.id_statut_projet==65 || nt.statut.id_statut_projet==67 || nt.statut.id_statut_projet==68}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==54 || nt.statut.id_statut_projet==55 || nt.statut.id_statut_projet==58 || nt.statut.id_statut_projet==59}">
                                                    <c:if test="${nt.zf_et=='ZF' && nt.classification.id_classification==1}"><a type="button" style="background-color:  #d59d32" onclick="modal_garantie_financiere('${nt.id_notification}',92,'<spring:message code="label.depose"/> ')" data-popover="true" data-html=true data-content="<spring:message code="label.deposerlagarantiefinanciere"/>"><i class="fa fa-edit"></i></a></c:if>
                                                    <c:if test="${nt.zf_et=='XD'}"><a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredavisdepaysdedestination"/>"><i class="fa fa-download"></i></a></c:if>
                                                    <c:if test="${nt.zf_et=='TR'}"><a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettre"/>"><i class="fa fa-download"></i></a></c:if>
                                                    <c:if test="${nt.zf_et!='XD' && nt.zf_et!='TR'}"><a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a></c:if>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==66}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="affiche_modal_transporteur('${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerletransporteur"/>"><i class="fa fa-check"></i></a>
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==39 }">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien3('${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Avisdudepartementconcernes"/>"><i class="fa fa-edit"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==93 || nt.statut.id_statut_projet==92}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                                                </c:if>
                                                <c:if test="${nt.statut.id_statut_projet==64}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="modal_garantie_financiere('${nt.id_notification}',93,'<spring:message code="label.recupere"/> ')" data-popover="true" data-html=true data-content="<spring:message code="label.recuperelagarantiefinanciere"/>"><i class="fa fa-check"></i></a>
                                                </c:if>
                                                <c:if test="${isAccessible.equals('oui')}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goToLienHistoriqueAffectation('${nt.id_notification}')" data-popover="true" data-html=true data-content="Historique Affectation"><i class="fa fa-history"></i></a>
                                                </c:if>
                                            </div>
                                            <div class="tool-box">
                                                <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #ffd88e, #d59d32) !important;"><i class="fa fa-cog"></i></div>
                                                <div class="clear"></div>
                                            </div>
                                        </td>
                                    </tr>



                                <div class="modal fade mt-5" id="staticBackdrop-${nt.id_notification }" data-backdrop="static"
                                     data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                     aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                    <h5 class="modal-title" id="staticBackdropLabel" style="font-family: serif;">
                                                        <spring:message code="label.Listedescomptes"/></h5>
                                                    <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                                            onclick="hide_compte('${nt.id_notification }')">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                            </div>
                                            <div class="modal-body tableComptes" style="padding-top:0; margin-top: 10px;">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                        onclick="hide_compte('${nt.id_notification }')" data-dismiss="modal">
                                                    <spring:message code="label.Fermer"/></button>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${notif!='[]'}">
                        <div class="pagination pagination-lg justify-content-center" dir="ltr">
                            <c:if test="${(page)>0}">
                                <c:set value="${page-1}" var="page_db"/>
                                <c:set value="${totalPage-1}" var="page_LAST"/>
                            </c:if>
                            <c:if test="${(page)<=0}">
                                <c:set value="0" var="page_db"/>
                                <c:set value="0" var="page_LAST"/>
                            </c:if>

                            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation(0,6,'${type}','${statutEnc}')" class="pageStyle"><i class="mdi mdi-arrow-collapse-left m-0"></i></a>
                            <a  style="background-color: #206c45 !important;" onclick="listAlimentation(${page_db},6,'${type}','${statutEnc}')" class="pageStyle">&laquo;</a>

                            <c:set var="salary" value="${totalPage-page-1}"/>
                            <c:choose>
                                <c:when test="${salary>5 }">
                                    <c:set var="toAdd" value="3"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="toAdd" value="${totalPage-page-1}"/>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${totalPage>0}">
                                <c:forEach begin="${page}" end="${page+toAdd}" var="c">
                                    <a style="background-color: #206c45 !important;" onclick="listAlimentation(${c},6,'${type}','${statutEnc}')"  ${c==number ? 'class="  pageStyle"' : 'class=" pageStyle1"'}>${c+1}</a>
                                </c:forEach>
                            </c:if>
                            <c:if test="${(page)>=(totalPage-1)}">
                                <c:set value="${totalPage-1}" var="page_end"/>
                            </c:if>

                            <c:if test="${(page)<(totalPage-1)}">
                                <c:set value="${page+1}" var="page_end"/>
                            </c:if>

                            <a style="background-color: #206c45 !important;" onclick="listAlimentation(${page_end},6,'${type}','${statutEnc}')" class="pageStyle">&raquo;</a>
                            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation(${totalPage-1},6,'${type}','${statutEnc}')" class="pageStyle"><i class="mdi mdi-arrow-collapse-right m-0"></i></a>

                        </div>
                    </c:when>
                    <c:otherwise>

                        <h4 style="color:#1A6896;text-align: center"><spring:message
                                code="label.Ilnyaaucuneenregistrement"/></h4>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

</div>

<!-- Modal -->
<div class="modal fade" id="declarationTransp" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="direction: ${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Validationdutransporteur"/></h5>
                <button onclick="Modalclose_modal('declarationTransp')" type="button" class="${pageContext.response.locale=='ar'?'close1':'close'} model_lang_close" data-dismiss="modal" aria-label="Close" >
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                <div class="row">
                    <div class="col-12" >
                        <label><spring:message code="label.Validationdutransporteur"/> </label>
                       <input type="text" class="form-control" value="" id="name_trans" disabled>
                        <input class="from-control" type="hidden" value="" id="id_declaration">
                        <input class="from-control" type="hidden" value="" id="id_notif">
                        <input class="from-control" type="hidden" value="" id="type">
                    </div>
                    <div class="col-12 mt-3">
                        <a class="btn btn-primary btn-block" id="file_down" ><span class="fa fa-download"></span> <spring:message code="label.Telechargerlassurance"/></a>
                    </div>
                    <div class="col-12 mt-3">
                        <label><spring:message code="label.Statut"/></label>
                       <select data-width="100%" class="form-control select2" id="id_select" ${dd}>
                           <option value="1"><spring:message code="label.Valide"/></option>
                           <option value="2"><spring:message code="label.Nonvalide"/></option>
                       </select>
                    </div>

                    <div class="col-12 mt-3" id="msg_comment" style="display: none">
                        <label><spring:message code="label.Commentaire"/></label>
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

<!-- main-panel ends -->
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>

<jsp:include page="../../includes/footer.jsp"/>

<script type="text/javascript">

    document.getElementById('id_select').onchange = function(){
        if(this.value == 2){
            document.getElementById('msg_comment').style.display = 'block';
        } else {
            document.getElementById('msg_comment').style.display = 'none';
        }
    };

    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});

    function listAlimentation(page, size, type, statut) {
        window.location.href = '/api/getListeAutorisation/' + type + '/' + page + '/6' + '/' + statut;

    }

    function getStat10() {
        var date1 = $("#date1").val();
        var date2 = $("#date2").val();
        var type_date = $("input[name=inlineRadioOptions]:checked").val();
        if (!date1 || !date2) {
            swal("<spring:message code="label.Attention"/>!", "<spring:message code="label.Mercidesaisirunedatevalide"/>", "error");
            return false;
        }
        $.ajax({
            url: "/api/getListeAutorisationSearch/ZF/0/6",
            type: "GET",

            data: {
                "date1": date1,
                "date2": date2,
                "type_date": type_date
            },
            success: function (response) {
                getFunctionParam('getParamDoc/0/6');
                $(".mpParam").html(response);
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }


    //-->
    function searchByDate1(page) {
        var form = $('#gamesForm').serialize();
        var inlineRadioOptions=$("#inlineRadioOptions").val();
        var date1=$("#date1").val();
        var date2=$("#date2").val();

        if(inlineRadioOptions==="" || date1==="" || date2===""){
            swal("<spring:message code="label.Attention"/>!", "<spring:message code="label.Mercidesaisirunedatevalide"/>", "error")
            return false;
        }
        $.ajax({
            url: "/api/getListeAutorisationSearch/${type}/"+page+"/6",
            type: "GET",

            data: $('#gamesForm').serialize(),


            success: function (response) {


                $("#tableDesc").html(response);
               /* $("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");*/
            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });
    }

    function hide_compte(id) {
        $("#staticBackdrop-" + id).modal("hide")
    }

    function show_compte(id,type) {
        $.ajax({
            url: "/api/getAllComptes/"+id+"/"+type,
            type: "GET",
            data: {
            },
            success: function (response) {
                $(".tableComptes").html(response);
                $(".trigger").attr("checked","true");
                $("#staticBackdrop-" + id).modal("show")
            },
            error: function (response) {

            }
        });
    }

    function affectNotif(notif, cpt,type) {
        $.ajax({
            url: "/api/affectNotif",
            type: "POST",

            data: {
                "id": notif,
                "cpt": cpt,
                "type": type,
            },
            success: function (response) {
                swal("<spring:message code="label.lademandeabieneteaffecte"/>")
                $("input[name=inputR]").removeAttr("disabled")
                $("#input"+cpt).attr("disabled","true")
            },
            error: function (response) {

                swal("<spring:message code="label.lecomptepossededejauneaffectation"/>");

            }
        });
    }
    function affichehover(){
        $(".dropdown-content1").slideToggle();
    }
    // $(".dropdown1").hover(function(){
    //     $(".dropdown-content1").slideToggle();
    // });
    // $(".dropdown2").hover(function(){
    //     $(".dropdown-content2").slideToggle();
    // });

    function goToLien(val){
        window.location.href='/api/validateDoc/'+val;
    }
    function goToLienRecap(val){
        window.location.href='/api/recap_autorisation/'+val;
    }
    function  goToLien1(val){
        window.location.href='/api/down_sign_docNotif/'+val;
    }
    function  goToLienNonFavorable(val){
        window.location.href=val;
    }
    function  goToLien12(val){
        window.location.href='/api/down_sign_lettreNotif/'+val;
    }
    function  goToLien5(val){
        window.location.href='/api/down_lettre/'+val;
    }
    function  goToLien8(val){
        window.location.href='/api/down_lettre_attachement/'+val;
    }
    function  goToLien6(val){
        window.location.href='/api/down_lettre_conforme/'+val;
    }
    function  goToLien7(val){
        window.location.href='/api/down_lettre_nonconforme/'+val;
    }
    function  goToLien2(val){
        window.location.href='/api/certificatElimination/'+val;
    }
    function  goToLien4(val){
        window.location.href='/api/documentdemouvement/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/validationFinal/'+val;
    }
    function downloadAut(val){
        window.location.href=val;
    }
    function downloadAut2(val){
        window.location.href=val;
    }
    function goToLienHistoriqueAffectation(id){
        window.location.href="/api/HistoriqueAffectation/"+id+"/notification"
    }
    function modal_garantie_financiere(id_notification,id_statut,type){

        Swal.fire({
            title: '<spring:message code="label.garantie"/> ',
            text: "<spring:message code="label.Estcequelagarantiefinanciereest"/> "+type+"",
            icon: 'warning',
            showCancelButton: true,
            showConfirmButton: true,
            confirmButtonText: '<spring:message code="label.Oui"/> ',
            cancelButtonText: '<spring:message code="label.Non"/> ',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: "/api/updateStatut/"+id_notification+"/"+id_statut+"/"+type,
                    type: "GET",
                    data: {},
                    success: function (response) {
                        window.location.href="/api/getListeAutorisation/ZF/0/6/0";
                    },
                    error: function (response) {
                        alert('Erreur ajout non effectué');
                    }
                });
            } else {}
        })
    }

    function getListFiltrer(order){
        $('#loader_modal').modal('show');
        $.ajax({
            url: "/api/getListeAutorisationDesc/${type}/0/6/0/"+order,
            type: "GET",
            data: {
            },
            success: function (response) {
                $('#loader_modal').modal('hide');
                $("#tableDesc").html(response);
            },
            error: function (response) {
                $('#loader_modal').modal('hide');
                alert("Error");
            }
        });
    }
</script>
