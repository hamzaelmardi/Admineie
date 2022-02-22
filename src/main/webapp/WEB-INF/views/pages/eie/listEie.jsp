<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<jsp:include page="../../includes/header.jsp"/>
<jsp:include page="../../menu/menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date"/>
<c:choose>
    <c:when test="${type=='AE'}">
        <c:set var="left" value="260px"/>
    </c:when>
    <c:otherwise>
        <c:set var="left" value="350px"/>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${type=='AE'}">
        <c:set var="left_min" value="108px"/>
        <c:set var="top" value="52px"/>
    </c:when>
    <c:otherwise>
        <c:set var="left_min" value="83px"/>
        <c:set var="top" value="70px"/>
    </c:otherwise>
</c:choose>
<style>
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
    }
    @media(min-width:576px) {
        .dropdown-content1 {
            display: none;
            background-color: gray !important;
            min-width: 180px;
            z-index: 1;
            position: absolute;
            ${pageContext.response.locale=='ar'?'right':'left'}: ${left};
            top: 40px;
        }
    }
    @media(max-width:575px){
        .dropdown-content1 {
            display: none;
            background-color: #d59d32!important;
            min-width: 180px;
            z-index: 1;
            position: absolute;
            ${pageContext.response.locale=='ar'?'right':'left'}: ${left_min} !important;
            top: ${top} !important;
        }
    }
    .dropdown-content1 {
        height: 300px;
        overflow-y: scroll;
    }
    .dropdown-content1 {
        --scrollbarBG: #CFD8DC;
        --thumbBG: #d59d32;
    }
    .dropdown-content1::-webkit-scrollbar {
        width: 11px;
    }
    .dropdown-content1 {
        scrollbar-width: thin;
        scrollbar-color: var(--thumbBG) var(--scrollbarBG);
    }
    .dropdown-content1::-webkit-scrollbar-track {
        background: var(--scrollbarBG);
    }
    .dropdown-content1::-webkit-scrollbar-thumb {
        background-color: var(--thumbBG) ;
        border-radius: 6px;
        border: 3px solid var(--scrollbarBG);
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


    table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > td.dtr-control::before{
        box-shadow: none;
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
<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
    <div class="main-panel" style="margin-top:150px" >
        <div class="content-wrapper">
            <c:choose>
                <c:when test="${pageContext.response.locale=='ar'}">
                    <c:set var="lng" value="nom_ar"/>
                </c:when>
                <c:otherwise>
                    <c:set var="lng" value="nom_fr"/>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/listRensignement/11/0/6')}">
                </c:when>
                <c:otherwise>
                    <c:set var="p_page" value="Renseignement préalable"/>
                </c:otherwise>
            </c:choose>
            <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb ml-4" style="margin-top: -18px !important;">
                        <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                        <li class="breadcrumb-item"><a style="${pageContext.response.locale!='ar'?'color: black;cursor: default':'margin-right:4rem !important;color: black;cursor: default'}" href="/api/getEie/${type}/0/6/0">${titre} </a></li>
                        <li class="breadcrumb-item dropdown1 ">
                            <a style="font-size: 14px;" class="dropbtn1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  onclick="affichehover1()">
                                ${sp}
                            </a>
                        </li>
                    </ol>
                </nav>
                <div class="dropdown-content1" aria-labelledby="dropdownMenuLink">
                    <a style="padding: 4px" href="/api/getEie/${type}/0/6/0"><spring:message code='label.Tous'/></a>
                    <c:forEach items="${statut}" var="st">
                        <c:if test="${st.nom_fr!='Brouillon'}">
                            <a style="border-bottom: 1px solid white; padding: 4px"
                                ${statNow==st.id_statut_projet?"selected":"" }
                               href="/api/getEie/${type}/0/6/${st.id_statut_projet}">${st[lng] }</a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="col-12 mt-3">
                <div class="row justify-content-center pt-2 pb-4 rounded m-auto" style="background: white !important;">
                    <div class="col-sm-4">
                        <%--                        <label class="h5">Statut</label>--%>
                        <%--                        <select class="select2 form-control" onchange="go_link(this.value)">--%>
                        <%--                            <option value="/api/getEie/${type}/0/6/0"><spring:message code='label.Tous'/></option>--%>
                        <%--                            <c:forEach items="${statut}" var="st">--%>
                        <%--                                <c:if test="${st.nom_fr!='Brouillon'}">--%>
                        <%--                                    <option--%>
                        <%--                                        ${statNow==st.id_statut_projet?"selected":""}--%>
                        <%--                                            value="/api/getEie/${type}/0/6/${st.id_statut_projet}">${st[lng] }</option>--%>
                        <%--                                </c:if>--%>
                        <%--                            </c:forEach>--%>
                        <%--                            <option--%>
                        <%--                            ${statNow==-1?"selected":""}--%>
                        <%--                                    value="/api/getEie/${type}/0/6/-1">Moin de 3 mois</option>--%>
                        <%--                        </select>--%>
                    </div>
                </div>
            </div>
            <c:if test="${type=='EE'}">
                <div class="col-12 mt-2">
                    <a class="btn float-right" style="background-color: #7dc7bd" href="/api/listRensignement/11/0/6"><spring:message code='label.Renseignementsprealables'/></a>
                </div>
            </c:if>
            <div class="col-md-12 mt-5 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="input-group col-xl-2 col-lg-3 col-md-4 col-sm-6 m-0 p-0 mb-3">
                    <div class="input-group-prepend" style="height:38px !important">
                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-sort m-0 mx-1"></i></span>
                    </div>
                    <select class="custom-select" name="filter" aria-label="basic-addon1" aria-describedby="basic-addon1" id="filter" onchange="getListFiltrerEIE(this.value)">
                        <option value="asc"><spring:message code="label.Ascendant"/></option>
                        <option value="desc"><spring:message code="label.Descendant"/></option>
                    </select>
                </div>
            </div>
            <div id="tableDesc">
                <div class="col-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <table style="width:100% !important; " id="tableProfils"
                       class="table table-bordered display responsive nowrap">
                    <thead style="background: gray;color: white;border-color: #737373;">
                    <tr style="background-color:#206c45">
                        <th ><spring:message code="label.Numerodelademande"/></th>
                        <th ><spring:message code="label.dateDepot"/></th>
                        <th ><spring:message code="label.Statut"/></th>
                        <th ><spring:message code="label.RaisonSocial"/></th>
                        <th ><spring:message code="label.Email"/></th>
                        <th ><spring:message code="label.Representant"/></th>
                        <th ><spring:message code="label.Telephone"/></th>
                        <th ><spring:message code="label.Fax"/></th>
                        <th >
                            <c:if test="${type=='AE'}">
                                <spring:message code="label.Intituledelactivite"/>
                            </c:if>
                            <c:if test="${type!='AE'}">
                                <spring:message code="label.IntituleProjet"/>
                            </c:if>
                        </th>
                        <c:if test="${type=='AE'}">
                            <th>
                                <spring:message code="label.consistancedelactivite"/>
                            </th>
                        </c:if>
                        <th ><spring:message code="label.Categorie"/></th>
                        <th ><spring:message code="label.Tronsfrontalier"/></th>
                        <th ><spring:message code="label.situation_Region"/></th>
                        <c:if test="${type=='EE' || type=='AE'}">
                            <th><spring:message code="label.DatedelaReunion"/></th>
                        </c:if>
                        <c:if test="${type=='EE'}">
                            <th ><spring:message code="label.RapportdelEP"/></th>
                            <th ><spring:message code="label.EIE"/></th>
                            <th ><spring:message code="label.ComplementdelEIE"/></th>
                            <th >CC</th>
                            <th ><spring:message code="label.PVetlistedeprsence"/></th>
                        </c:if>
                        <c:if test="${type=='NT'}">
                            <th >NIE</th>
                            <th ><spring:message code="label.NIEfinale"/></th>
                        </c:if>
                        <c:if test="${type=='AE'}">
                            <th ><spring:message code="label.DemandeetdossierdobtentionduCertificatdeconformiteEnvironnementale"/></th>
                            <th ><spring:message code="label.RapportdelAEetduCC"/></th>
                            <th ><spring:message code="label.ComplementsdurapportdelAE"/></th>
                            <th ><spring:message code="label.RapportfinaldelAEetduCC"/></th>
                            <th ><spring:message code="label.PVetlistedeprsence"/></th>
<%--                            <th >Le rapport de la visite </th>--%>
                        </c:if>
                        <th class="all"><spring:message code="label.Action"/></th>
                    </tr >
                    </thead>
                    <tbody>
                    <c:forEach items="${all_demande}" var="nt" varStatus="loopp">

                        <tr>
                            <td class="font-weight-semibold">
                                <c:choose>
                                    <c:when test="${affecter==null && user.poste.id_Poste!=1 && (nt.statut.id_statut_projet!=6)}">
                                        <a title="Affecter" href="#"
                                           onclick="show_compte_EE('${nt.id_demande_information }','${type}')">${nt.num_demande}</a>
                                    </c:when>
                                    <c:otherwise>
                                        ${nt.num_demande}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><fmt:formatDate dateStyle="long" value="${nt.dateDepot }"/></td>
                            <td><span class="badge badge-info"> ${nt.statut.nom_fr}</span></td>
                            <td>${nt.raison_social}</td>
                            <td>${nt.email}</td>
                            <td>${nt.represantant}</td>
                            <td>${nt.tel}</td>
                            <td>${nt.fax}</td>
                            <td> ${nt.intitule_projet} </td>
                            <c:if test="${type=='AE'}">
                                <td>
                                    <a class="removeStyle" download
                                       href="${fn:replace(nt.url_file_AE, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                            class="fa fa-download ml-2"
                                            style="font-size:21px;color: #33994c;"></span>
                                    </a>
                                </td>
                            </c:if>
                            <td>
                                <c:if test="${not empty nt.categories}">
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_categorie','${nt.id_demande_information}')">
                                        <span class="fa fa-eye"></span>
                                    </a>
                                </c:if>
                                <c:if test="${empty nt.categories}">
                                    -
                                </c:if>
                            </td>
                            <td> ${nt.tronsfrontalier=='no'?"Non":nt.tronsfrontalier} </td>
                            <td>
                                <c:if test="${not empty nt.detailRegion}">
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_DetailRegion','${nt.id_demande_information}')">
                                        <span class="fa fa-eye"></span>
                                    </a>
                                </c:if>
                                <c:if test="${empty nt.detailRegion}"> - </c:if>

                            </td>
                            <c:if test="${type=='EE' || type=='AE'}">
                                <td>
                                    <c:choose>
                                        <c:when test="${nt.reunions.size()>0}">
                                            ${nt.reunions.get(nt.reunions.size()-1).date_reunion}
                                        </c:when>
                                        <c:otherwise> - </c:otherwise>
                                    </c:choose>
                                </td>
                            </c:if>
                            <c:if test="${type=='EE'}">
                                <td>
                                <c:if test="${not empty nt.regiondoc}">
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_enquette_public','${nt.id_demande_information}')">
                                        <span class="fa fa-eye"></span>
                                    </a>
                                </c:if>
                                <c:if test="${ empty nt.regiondoc}">
                                    -
                                </c:if>
                            </td>
                                <td>
                                        <a class="removeStyle" download
                                           href="${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                class="fa fa-download"
                                                style="font-size:21px;color: #33994c;"></span>
                                        </a>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <a class="removeStyle" download
                                       href="${fn:replace(nt.url_cachier_defenitive, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                            class="fa fa-download"
                                            style="font-size:21px;color: #33994c;"></span>
                                    </a>
                                </td>
                                <td>
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_pv_présence','${nt.id_demande_information}')">
                                        <span class="fa fa-eye"></span>
                                    </a>
                                </td>
                            </c:if>
                            <c:if test="${type=='NT'}">
                                <td></td>
                                <td></td>
                            </c:if>
                            <c:if test="${type=='AE'}">
                                <td>

                                </td>
                                <td>
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="getDocNotif('${nt.id_demande_information}')">
                                        <c:if test="${nt.statut.id_statut_projet!=1 && nt.statut.id_statut_projet!=2   && nt.statut.id_statut_projet!=76}">
                                            <span class="fa fa-eye"></span>
                                        </c:if>

                                    </a>
                                </td>
                                <td>
                                    <c:forEach items="${nt.rapports_AE}" var="ar">
                                        <a class="removeStyle" download
                                           href="${fn:replace(ar.url_file, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                class="fa fa-download"
                                                style="font-size:21px;color: #33994c;"></span>
                                        </a>
                                    </c:forEach>
                                </td>
                                <td><c:if test="${not empty nt.url_cachier_defenitive || not empty nt.url_enquette_defenitive}">
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_ae_cc_finale','${nt.id_demande_information}')">
                                        <span class="fa fa-eye"></span>
                                    </a>
                                </c:if>
                                   </td>
                                <td>
                                    <a class="" style="font-size:21px;color: #33994c;"
                                       onclick="fun_affiche_modal('#modal_pv_présence','${nt.id_demande_information}')">
                                        <c:if test="${nt.statut.id_statut_projet!=1 && nt.statut.id_statut_projet!=2   && nt.statut.id_statut_projet!=76}">
                                            <span class="fa fa-eye"></span>
                                        </c:if>



                                    </a>
                                </td>
                                <%--<td>
                                    <a class="removeStyle" download
                                       href="${fn:replace(nt.visite_object, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                            class="fa fa-download"
                                            style="font-size:21px;color: #33994c;"></span>
                                    </a>
                                </td>--%>
                            </c:if>
                            <td class="text-center">
                                <div id="toolbar-options${loopp.index+1}" class="hidden">
                                    <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap('${type}/${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapitulatif"/>"><i class="fa fa-print"></i></a>
                                    <c:if test="${(nt.statut.id_statut_projet==12 && type=='AE' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==12 && type=='AE' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLienDownloadDecision('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsigneladecision"/>"><i class="fa fa-signature"></i></a>
                                    </c:if>
                                    <%--<c:if test="${nt.statut.id_statut_projet==59 && type!='AE'}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-check"></i></a>
                                    </c:if>--%>
                                    <c:if test="${nt.statut.id_statut_projet==1 && type=='AE'}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goTo4('${nt.id_demande_information}/etude')" data-popover="true" data-html=true data-content="<spring:message code="label.Programmerlareunion"/>"><i class="fa fa-calendar"></i></a>
                                    </c:if>
                                    <c:if test="${nt.statut.id_statut_projet==1 && type!='AE'}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-check"></i></a>
                                    </c:if>
                                    <c:if test="${nt.statut.id_statut_projet==76 || (nt.statut.id_statut_projet==78 && type=='AE')}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-check"></i></a>
                                    </c:if>
                                    <c:if test="${nt.statut.id_statut_projet==6 && type!='AE'}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToDoc('${fn:replace(nt.url_document_signee, "/assets/myFile/", "/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.TelechargerleCertificatdeConformiteEnvironnementale"/>"><i class="fa fa-upload"></i></a>
                                    </c:if>
                                    <c:if test="${nt.statut.id_statut_projet==6 && type=='AE'}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToDoc('${fn:replace(nt.url_decision, "/assets/myFile/", "/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.TelechargerladecisiondeConformiteEnvironnementale"/>"><i class="fa fa-upload"></i></a>
                                    </c:if>
                                    <c:if test="${isAccessible.equals('oui')}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLienHistoriqueAffectation('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="Historique Affectation"><i class="fa fa-history"></i></a>
                                    </c:if>
                                    <c:if test="${nt.type!='NT'}">
                                        <c:if test="${(nt.statut.id_statut_projet==4 || nt.statut.id_statut_projet==61 ||(nt.statut.id_statut_projet==58 && type!='AE')) && type!='AE' }">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLien1('${nt.id_demande_information}/all/${type}')" data-popover="true" data-html=true data-content="<spring:message code="label.AttacherlerapportdelEP"/>"><i class="fa fa-plus"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==2 || nt.statut.id_statut_projet==74 || nt.statut.id_statut_projet==80 || nt.statut.id_statut_projet==81}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.AjouterPVdelareunion"/>"><i class="fa fa-plus"></i></a>
                                        </c:if>

                                        <c:if test="${nt.statut.id_statut_projet==9}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLien3('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.Verifierlesdocumentsdefinitives"/>"><i class="fa fa-info-circle"></i></a>
                                        </c:if>

                                        <c:if test="${(nt.statut.id_statut_projet==5 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==5 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLien4('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.TelechargerleCertificatdeConformiteEnvironnementale"/>"><i class="fa fa-upload"></i></a>
                                        </c:if>
                                        <c:if test="${(nt.statut.id_statut_projet==71) && type=='AE'}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goTo1('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.AfficherLesRapportsRecus"/>"><i class="fa fa-file"></i></a>
                                                <a type="button" style="background-color:  #d59d32" onclick="goTo2('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Programerlavisite"/>"><i class="fa fa-calendar"></i></a>
                                                <c:if test="${nt.statut.id_statut_projet==71}">
                                                    <a type="button" style="background-color:  #d59d32" onclick="goTo3('${nt.id_demande_information}/deliberation')" data-popover="true" data-html=true data-content="<spring:message code="label.Programerlareuniondedeliberation"/>"><i class="fa fa-calendar"></i></a>
                                                </c:if>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==58 && type=='AE'}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goTo4('${nt.id_demande_information}/validation')" data-popover="true" data-html=true data-content="<spring:message code="label.PlanifierunereunionDevalidation"/>"><i class="fa fa-calendar"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==89 && type=='AE' || nt.statut.id_statut_projet==72 && type=='AE'}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToLienAE('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-check"></i></a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${nt.type=='NT'}">
                                        <jsp:useBean id="dateValue" class="java.util.Date" />
                                        <jsp:setProperty name="dateValue" property="time" value="${nt.dateFinValidation.time}" />
                                        <c:if test="${(nt.statut.id_statut_projet==58 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==58 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId && (not empty nt.dateFinValidation) && (dateValue>now) }">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToNotice('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretignerladecisiondelacceptabilitaenvironnementale"/>"><i class="fa fa-upload"></i></a>
                                        </c:if>
                                        <c:if test="${(nt.statut.id_statut_projet==58 && (empty nt.dateFinValidation) && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==58 && (empty nt.dateFinValidation) && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToNotice2('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretignerladecisiondelacceptabilitaenvironnementale"/>"><i class="fa fa-signature"></i></a>
                                        </c:if>
                                       <c:if test="${(nt.statut.id_statut_projet==58 && (not empty nt.dateFinValidation) && (dateValue<=now) && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==58 && (not empty nt.dateFinValidation) && (dateValue<=now) && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                               <a type="button" style="background-color:  #d59d32" onclick="goToNotice2('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretignerladecisiondelacceptabilitaenvironnementale"/>"><i class="fa fa-signature"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet==69 }">
                                                <a type="button" style="background-color:  #d59d32" onclick="goToNotice1('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.AttacherlePVdevisite"/>"><i class="fa fa-file-text"></i></a>
                                        </c:if>

                                    </c:if>
                                    <c:if test="${type=='AE' && (nt.statut.id_statut_projet==4 || nt.statut.id_statut_projet==61)}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goTo4('${nt.id_demande_information}/etude')" data-popover="true" data-html=true data-content="<spring:message code="label.Programmerlareunion"/>"><i class="fa fa-calendar"></i></a>
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap('${type}/${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapitulatif"/>"><i class="fa fa-print"></i></a>
                                    </c:if>
                                </div>
                                <div class="tool-box">
                                    <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #ffd88e, #d59d32) !important;"><i class="fa fa-cog"></i></div>
                                    <div class="clear"></div>
                                </div>
                            </td>
                        </tr>
                        <!-- Modal -->

                        <div class="modal fade"
                             id="modal_enquette_public_${nt.id_demande_information}"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                            <h5 class="modal-title" id=""><spring:message code="label.LesEnquettespublic"/></h5>
                                            <button onclick="close_modal(this)" type="button"
                                                    class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">

                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.EnquetePublique"/>
                                                    </div>
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Telecharger"/>
                                                    </div>
                                                </div>


                                                <c:forEach items="${nt.regiondoc}" var='reg'>
                                                    <div class="row ">
                                                        <div class="col-10 border border-1 m-0 p-0">
                                                            <div class="form-group text-left pt-3 pl-2">
                                                                <label> <spring:message
                                                                        code="label.EnquetePubliquede"/>${pageContext.response.locale=='ar'?reg.region.nom_ar:reg.region.nom_fr} </label>

                                                            </div>
                                                        </div>
                                                        <div class="col-2  border border-1 m-0 p-0">
                                                            <div class="form-group">
                                                                <a class="btn btn-primary btn-rounded mt-2"
                                                                   download
                                                                   href="${fn:replace(reg.doc, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                        class="fa fa-download"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>


                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade"
                             id="modal_ae_cc_finale${nt.id_demande_information}"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.RapportfinaldelAEetduCC"/></h5>
                                        <button onclick="close_modal(this)" type="button"
                                                class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">

                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.RapportfinaldelAEetduCC"/>
                                                    </div>
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Telecharger"/>
                                                    </div>
                                                </div>

                                                <div class="row ">
                                                    <div class="col-10 border border-1 m-0 p-0">
                                                        <div class="form-group text-left pt-3 pl-2">
                                                            <label><spring:message code="label.RapportfinaldelAE"/></label>

                                                        </div>
                                                    </div>
                                                    <div class="col-2  border border-1 m-0 p-0">
                                                        <div class="form-group">
                                                            <a class="btn btn-primary btn-rounded mt-2"
                                                               download
                                                               href="${fn:replace(nt.url_enquette_defenitive, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                    class="fa fa-download"></span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row ">
                                                    <div class="col-10 border border-1 m-0 p-0">
                                                        <div class="form-group text-left pt-3 pl-2">
                                                            <label><spring:message code="label.RapportfinaldeCC"/></label>

                                                        </div>
                                                    </div>
                                                    <div class="col-2  border border-1 m-0 p-0">
                                                        <div class="form-group">
                                                            <a class="btn btn-primary btn-rounded mt-2"
                                                               download
                                                               href="${fn:replace(nt.url_cachier_defenitive, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                    class="fa fa-download"></span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade"
                             id="modal_pv_présence_${nt.id_demande_information}"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.PVetlistedeprsence"/></h5>
                                        <button onclick="close_modal(this)" type="button"
                                                class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">

                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.PVetlistedeprsence"/>
                                                    </div>
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Telecharger"/>
                                                    </div>
                                                </div>

                                                    <div class="row ">
                                                        <div class="col-10 border border-1 m-0 p-0">
                                                            <div class="form-group text-left pt-3 pl-2">
                                                                <label><spring:message code="label.PVdereunion"/></label>

                                                            </div>
                                                        </div>
                                                        <div class="col-2  border border-1 m-0 p-0">
                                                            <div class="form-group">
                                                                <a class="btn btn-primary btn-rounded mt-2"
                                                                   download
                                                                   href="${fn:replace(nt.reunions[nt.reunions.size()-1].url_pv, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                        class="fa fa-download"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <div class="row ">
                                                    <div class="col-10 border border-1 m-0 p-0">
                                                        <div class="form-group text-left pt-3 pl-2">
                                                            <label><spring:message code="label.ListePresence"/></label>

                                                        </div>
                                                    </div>
                                                    <div class="col-2  border border-1 m-0 p-0">
                                                        <div class="form-group">
                                                            <a class="btn btn-primary btn-rounded mt-2"
                                                               download
                                                               href="${fn:replace(nt.reunions[nt.reunions.size()-1].url_presence, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                    class="fa fa-download"></span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade"
                             id="modal_rapport_AE_CC_${nt.id_demande_information}"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.RapportdelAEetduCC"/></h5>
                                        <button onclick="close_modal(this)" type="button"
                                                class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row"
                                                     style="background: gray;color: white;border-color: #737373;">

                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Rapportdauditenvironnemental"/>
                                                    </div>
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Telecharger"/>
                                                    </div>
                                                </div>

                                                <div class="row ">
                                                    <div class="col-10 border border-1 m-0 p-0">
                                                        <div class="form-group text-left pt-3 pl-2">
                                                            <label> <spring:message code="label.RapportdelAEetduCC"/></label>

                                                        </div>
                                                    </div>
                                                    <div class="col-2  border border-1 m-0 p-0">
                                                        <div class="form-group">
                                                            <c:forEach items="${nt.rapports_AE}" var="ae">
                                                            <a class="btn btn-primary btn-rounded mt-2"
                                                               download
                                                               href="${fn:replace(ae.url_file, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                    class="fa fa-download"></span></a>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row ">
                                                    <div class="col-10 border border-1 m-0 p-0">
                                                        <div class="form-group text-left pt-3 pl-2">
                                                            <label><spring:message code="label.ListePresence"/></label>

                                                        </div>
                                                    </div>
                                                    <div class="col-2  border border-1 m-0 p-0">
                                                        <div class="form-group">
                                                            <a class="btn btn-primary btn-rounded mt-2"
                                                               download
                                                               href="${fn:replace(nt.url_presence, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                                                    class="fa fa-download"></span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="modal fade"
                             id="modal_rapport_ae"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.RapportdelAEetduCC"/></h5>
                                        <button onclick="close_modal(this)" type="button"
                                                class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">

                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.RapportdelAEetduCC"/>
                                                    </div>
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Telecharger"/>
                                                    </div>
                                                </div>
                                                <div id="modal_ae"></div>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="modal fade"
                             id="modal_DetailRegion_${nt.id_demande_information}"
                             tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg"
                                 role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                            <h5 class="modal-title"><spring:message code="label.DetailsRegions"/> </h5>
                                            <button onclick="close_modal(this)" type="button"
                                                    class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                    aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Regions"/>
                                                    </div>
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Prefectures"/>
                                                    </div>
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Communes"/>
                                                    </div>
                                                </div>

                                                <div class="row">

                                                    <div class="col-4 border p-2">
                                                        <c:if test="${not empty nt.detailRegion.region}">
                                                            <ul>
                                                                <c:forEach
                                                                        items="${nt.detailRegion.region}"
                                                                        var="det">
                                                                    <li> ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                                                </c:forEach>
                                                            </ul>
                                                        </c:if>
                                                        <c:if test="${empty nt.detailRegion.region}">
                                                            -
                                                        </c:if>
                                                    </div>
                                                    <div class="col-4 border p-2">
                                                        <c:if test="${not empty nt.detailRegion.prefectures}">
                                                            <ul>
                                                                <c:forEach
                                                                        items="${nt.detailRegion.prefectures}"
                                                                        var="det">
                                                                    <li> ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                                                </c:forEach>
                                                            </ul>
                                                        </c:if>
                                                        <c:if test="${empty nt.detailRegion.prefectures}">
                                                            -
                                                        </c:if>
                                                    </div>
                                                    <div class="col-4 border p-2">
                                                        <c:if test="${not empty nt.detailRegion.communes}">
                                                            <ul>
                                                                <c:forEach
                                                                        items="${nt.detailRegion.communes}"
                                                                        var="det">
                                                                    <li> ${pageContext.response.locale!='ar'?det.nom_fr:det.nom_ar}</li>
                                                                </c:forEach>
                                                            </ul>
                                                        </c:if>
                                                        <c:if test="${empty nt.detailRegion.communes}">
                                                            -
                                                        </c:if>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade"
                             id="modal_categorie_${nt.id_demande_information}" tabindex="-1"
                             role="dialog" aria-labelledby="exampleModalCenterTitle"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.Categories"/></h5>
                                        <button onclick="close_modal(this)" type="button"
                                                class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal"
                                                aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div class="row "
                                                     style="background: gray;color: white;border-color: #737373;">
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        #
                                                    </div>
                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                        <spring:message code="label.Nom"/>
                                                    </div>
                                                </div>
                                                <c:forEach items="${nt.categories}"
                                                           var="cat" varStatus="loopp">
                                                    <div class="row">
                                                        <div class="col-2 border p-2">
                                                                ${loopp.index+1}
                                                        </div>
                                                        <div class="col-10 border p-2">
                                                                ${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr}
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button"
                                                class="btn btn-secondary"
                                                data-dismiss="modal"><spring:message
                                                code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdrop-${nt.id_demande_information }" data-backdrop="static"
                             data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel" style="font-family: serif;">
                                                <spring:message code="label.Listedescomptes"/></h5>
                                            <button type="button" class="${pageContext.response.locale!='ar'?'close':'close1'}" data-dismiss="modal" aria-label="Close"
                                                    onclick="hide_compte_EE('${nt.id_demande_information }')">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                    </div>
                                    <div class="modal-body tableComptes" style="padding-top:0px; margin-top: 10px;">

                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                                onclick="hide_compte_EE('${nt.id_demande_information }')" data-dismiss="modal">
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
                <c:when test="${all_demande!='[]'}">
                    <div class="pagination pagination-lg justify-content-center" dir="ltr">
                        <c:if test="${(page)>0}">
                            <c:set value="${page-1}" var="page_db"/>
                            <c:set value="${totalPage-1}" var="page_LAST"/>
                        </c:if>
                        <c:if test="${(page)<=0}">
                            <c:set value="0" var="page_db"/>
                            <c:set value="0" var="page_LAST"/>
                        </c:if>

                        <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation('${type}',0,6,)" class="pageStyle"><i class="mdi mdi-arrow-collapse-left m-0"></i></a>
                        <a  style="background-color: #206c45 !important;" onclick="listAlimentation('${type}', ${page_db}, 6)" class="pageStyle">&laquo;</a>

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
                                <a onclick="listAlimentation('${type}', ${c}, 6)"  ${c==number ? 'class=" btnss pageStyle"' : 'class="btnss pageStyle1"'}>${c+1}</a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${(page)>=(totalPage-1)}">
                            <c:set value="${totalPage-1}" var="page_end"/>
                        </c:if>

                        <c:if test="${(page)<(totalPage-1)}">
                            <c:set value="${page+1}" var="page_end"/>
                        </c:if>


                        <a style="background-color: #206c45 !important;" onclick="listAlimentation('${type}',${page_end},6)" class="pageStyle">&raquo;</a>
                        <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation('${type}',${totalPage-1},6)" class="pageStyle"><i class="mdi mdi-arrow-collapse-right m-0"></i></a>



                    </div>
                </c:when>
                <c:otherwise>

                    <h4 style="color:black;text-align: center"><spring:message
                            code="label.AucuneEnregistrement"/></h4>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>



<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp"/>

<script>

    function hide_compte_EE(id) {
        $("#staticBackdrop-" + id).modal("hide")
    }

    function show_compte_EE(id,type) {
        $.ajax({
            url: "/api/getAllComptes/"+id+"/"+type,
            type: "GET",

            data: {
            },

            success: function (response) {
                $(".tableComptes").html(response);
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

                swal("<spring:message code='label.lademandeabieneteaffecte'/>")
                $("input[name=inputR]").removeAttr("disabled")
                $("#input"+cpt).attr("disabled","true")
            },
            error: function (response) {

                swal("<spring:message code='label.lecomptepossededejauneaffectation'/>");

            }
        });
    }

    function goToLienRecap(val){
        window.location.href='/api/recap_evaluation/'+val;
    }

    function goToLienDownloadDecision(val){
        window.location.href='/api/down_sign_doc_AE/'+val;
    }

    function affichehover1(){
        $(".dropdown-content1").slideToggle();
    }
    function listAlimentation(type, page, size) {
        window.location.href = '/api/getEie/' + type + '/' + page + '/6/0';
    }

    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }

    function close_modal(val) {
        $(val).closest(".modal").modal('hide');
    }

    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }

    function close_modal(val) {
        $(val).closest(".modal").modal('hide');
    }

    function goToLienHistoriqueAffectation(id){
        window.location.href="/api/HistoriqueAffectation/"+id+"/demandeInformation"
    }

    function refresh(id) {
        $.ajax({
            url: "/api/get_doc_impact/" + id,
            type: "GET",

            data: {},

            success: function (response) {
                $("#mydoc").html(response);
                $("#getModal").modal('show');
            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });
    }

    function getDocNotif(id) {
        $.ajax({
            url: "/api/addRapportAEToDemande/" + id,
            type: "GET",

            data: {},

            success: function (response) {
                $("#modal_ae").html(response);
                $("#modal_rapport_ae").modal('show');
            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });
    }
    function go_link(url){
        window.location.href=url;
    }

    function goToLienAE(val){
        window.location.href='/api/validationDocumentAE/'+val;
    }
    function goToLien(val){
        window.location.href='/api/validationDocumentEIE/'+val;
    }
    function  goToLien1(val){
        window.location.href='/api/editdemande/'+val;
    }
    function goToDoc(val){
        window.location.href=val;
    }
    function  goToLien2(val){
        window.location.href='/api/depotdeposeetat/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/depotDefinitive/'+val;
    }
    function goToLien4(val){
        window.location.href='/api/down_sign_doc/'+val;
    }
    function goTo(val){
        window.location.href='/api/validationDocumentAE/'+val;
    }
    function goTo1(val) {
        window.location.href='/api/showListRaportAE/'+val;
    }
    function goTo2(val) {
        window.location.href='/api/getVisites_AE/'+val;
    }
    function goTo3(val) {
        window.location.href='/api/ajouterReunion_AE/'+val;
    }
    function goTo4(val) {
        window.location.href='/api/ajouterReunion_AE/'+val;
    }
    function goToNotice(val){
        window.location.href='/api/down_sign_doc/'+val;
    }
    function goToNotice1(val) {
        window.location.href='/api/PV_visite/'+val;
    }
    function goToNotice2(val) {
        window.location.href='/api/down_sign_doc/'+val;
    }
    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});
    function getListFiltrerEIE(order){
        $('#loader_modal').modal('show');
        $.ajax({
            url: "/api/getEieDesc/${type}/0/6/0/"+order,
            type: "GET",
            data: {
            },
            success: function (response) {
                $('#loader_modal').modal('hide');
                $("#tableDesc").html(response);
            },
            error: function (response) {
                alert("Error");
            }
        });
    }
</script>
