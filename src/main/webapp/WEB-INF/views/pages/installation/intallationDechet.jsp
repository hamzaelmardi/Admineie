<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>
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
            left: ${pageContext.response.locale!='ar'?'358px':'32cm'};
            top: 12px;
        }
    }
    @media(max-width:575px){
        .dropdown-content1 {
            display: none;
            background-color: #d59d32!important;
            min-width: 180px;
            z-index: 1;
            position: absolute;
            left: ${pageContext.response.locale!='ar'?'83px':'45px'};
            top: 70px !important;
        }
    }
    .dropdown-content1 a {
        float: none;
        color: white;
        text-decoration: none;
        display: block;
        //text-align: left;
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
    .btn-circle {
        width: 30px;
        height: 30px;
        padding: 6px 6px;
        border-radius: 15px;
        text-align: center;
        font-size: 12px;
        line-height: 1.42857;
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
    <div class="main-panel " style="margin-top:117px">
        <div class="content-wrapper">




            <div>
                <c:choose>
                    <c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/api/getListeInstallation' )}">
                        <c:set var="p_page" value="${pageContext.response.locale=='ar'?'منشأة معالجة النفايات':'Instalation De traitement des déchets'}"/>
                    </c:when>

                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${pageContext.response.locale=='ar'}">
                        <c:set var="lng" value="nom_ar"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="lng" value="nom_fr"/>
                    </c:otherwise>
                </c:choose>
                <div class="col-12 mt-5"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4" style="margin-top: -32px !important;">
                            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}"  aria-current="page">${p_page}</li>
                            <li class="breadcrumb-item dropdown1 " style="float: left;">
                                <a style="font-size: 14px;" class="dropbtn1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="affichehover()">
                                    ${pageContext.response.locale=="ar"?ar:sp}
                                </a>
                            </li>
                        </ol>
                    </nav>
                    <div class="dropdown-content1" aria-labelledby="dropdownMenuLink" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                        <a style="padding: 4px" href="/api/getListeInstallation/0/6/0"><spring:message code='label.Tous'/></a>
                        <c:forEach items="${statut}" var="st">
                            <c:if test="${st.nom_fr!='Brouillon'}">
                                <a style="border-bottom: 1px solid white; padding: 4px"
                                    ${statNow==st.id_statut_projet?"selected":""}
                                   href="/api/getListeInstallation/0/6/${st.id_statut_projet}">${st[lng] }</a>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-12 mt-3 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">

                    <div class="col-md-12 col-lg-12" style="width: 98%;margin-left: auto;margin-right: auto;background: white;padding-top: 19px;border-radius: 5px;display:flex;">
                        <form id="gamesForm" style=" display:flex;" action="/api/getListeInstallationSearch/0/6" method="GET">

                            <div class="row" style="width: 100%!important;">
                                <input name="selst" type="hidden" value="${statutEnc}">
<%--                                <div class="col-lg-3 col-sm-12">--%>
<%--                                    <label class="h5"><spring:message code="label.Statut"/></label>--%>
<%--                                    <div class="input-group">--%>
<%--                                    <select class="select2 form-control" onchange="go_link(this.value)">--%>
<%--                                        <option value="/api/getListeInstallation/0/6/0"><spring:message code='label.Tous'/></option>--%>
<%--                                        <c:forEach items="${statut}" var="st">--%>
<%--                                            <c:if test="${st.nom_fr!='Brouillon'}">--%>
<%--                                                <option--%>
<%--                                                    ${statNow==st.id_statut_projet?"selected":""}--%>
<%--                                                        value="/api/getListeInstallation/0/6/${st.id_statut_projet}">${st[lng] }</option>--%>
<%--                                            </c:if>--%>
<%--                                        </c:forEach>--%>
<%--                                    </select>--%>
<%--                                </div></div>--%>
                                <div class="col-lg-3 col-md-3 col-sm-12">
                                    <div class="form-group text-left">
                                        <label> <spring:message code='label.DateDebut'/></label>
                                        <div class="input-group">
                                            <input required type="date" value="" placeholder="Date Début" class="form-control mydatepicker dateDebut" id="date1" name="date1">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-12">
                                    <div class="form-group text-left">
                                        <label><spring:message code='label.DateFin'/></label>
                                        <div class="input-group">
                                            <input required type="date" value="" placeholder="Date Fin" class="form-control mydatepicker" id="date2" name="date2">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-2 col-sm-12" style="margin-top: -2px">
                                    <label><spring:message code='label.Date'/> </label>
                                    <div class="input-group">
                                        <select class="form-select " id="inlineRadioOptions" name="inlineRadioOptions" style="height: 39px " ${dd}>
                                            <option value="date_depot"><spring:message code='label.Datedepot'/></option>
                                            <option value="date_validation"><spring:message code='label.DateValidation'/></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-1 col-sm-12 mb-2">
                                    <a style="padding: 5px;margin-top: 32px;background-color: #206c45 !important"class="btn btn-primary" onclick="searchByDate1(0)"><spring:message code='label.Rechercher'/></a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="input-group col-xl-2 col-lg-3 col-md-4 col-sm-6 m-0 p-0 mb-3">
                        <div class="input-group-prepend" style="height:38px !important">
                            <span class="input-group-text" id="basic-addon1"><i class="fa fa-sort m-0 mx-1"></i></span>
                        </div>
                        <select class="custom-select" name="filter" aria-label="basic-addon1" aria-describedby="basic-addon1" id="filter" onchange="getListFiltrerInstallation(this.value)">
                            <option value="asc"><spring:message code="label.Ascendant"/></option>
                            <option value="desc"><spring:message code="label.Descendant"/></option>
                        </select>
                    </div>
                </div>
                <div id="table_result">
                    <div class="col-12 table-responsive"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <table style="width:100% !important" id="tbody" class="table table-bordered display responsive nowrap">
                        <thead style="background: gray;color: white;border-color: #737373;">
                        <tr style="background-color: #206c45 !important;">
                            <th class=""  style="width: 120px !important;"><spring:message code="label.Numerodedemande"/></th>
                            <th class=""  style="width: 120px !important;"><spring:message code="label.datedepot"/></th>
                            <th class=""  style="width: 120px !important;"><spring:message code="label.Site"/></th>
                            <th class=""  style="width: 120px !important;"><spring:message code="label.Statut"/></th>
                            <th class=""><spring:message code="label.Raisonsocial"/> </th>
                            <th class=""><spring:message code="label.IF"/> </th>
                            <th class=""><spring:message code="label.Email"/></th>
                            <th class=""> <spring:message code="label.Fax"/> </th>
                            <th class=""><spring:message code="label.Telephone"/></th>
                            <th class="" > <spring:message code="label.Nombredequipe"/> </th>
                            <th class="" ><spring:message code="label.nbrEffectif"/></th>
                            <th class="" ><spring:message code="label.Datedevisite"/></th>
                            <th class=""  style="width: 120px;"><spring:message code="label.code" /></th>
                            <th class="all" ><spring:message code="label.Action"/></th>
                        </tr>
                        </thead>
                        <tbody class="myT">
                        <c:forEach items="${install}" var="nt" varStatus="loopp">
                            <tr>
                                <td class="font-weight-semibold">
                                    <c:choose>
                                        <c:when test="${affecter==null && user.poste.id_Poste!=1 && (nt.statut.id_statut_projet!=57)}">
                                            <a title="Affecter" href="#"
                                               onclick="show_compte_it('${nt.id_installation }','IT')">${nt.num_demande}</a>
                                        </c:when>
                                        <c:otherwise>
                                            ${nt.num_demande}
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>
                                    <fmt:formatDate   dateStyle="long" value="${nt.dateDepot }" />

                                </td>
                                <td> ${nt.site } </td>
                                <td> <span class="badge badge-info"> ${nt.statut.nom_fr }</span>  </td>

                                <td> ${nt.raison }</td>
                                <td>  ${nt.ife } </td>
                                <td> ${nt.email }  </td>
                                <td> ${nt.fax }</td>
                                <td> ${nt.tel }  </td>
                                <td> ${nt.nbr_equipe_travail} </td>
                                <td> ${nt.formation}</td>
                                <fmt:parseDate pattern="dd/MM/yyyy" value="${nt.visite.date_visite_S}" var="dateVisite" />
                                <fmt:parseNumber value="${(dateVisite.time - now.time) / (1000*60*60*24) }"
                                                 integerOnly="true" var="nbJour" parseLocale="fr"/>
                                <td>
                                    <c:if test="${not empty nt.visite and nbJour>0}">
                                        après ${nbJour} Jours
                                    </c:if>
                                    <c:if test="${not empty nt.visite and nbJour<0}">
                                        avant ${-nbJour} Jours
                                    </c:if>
                                    <c:if test="${not empty nt.visite and nbJour==0}">
                                        Aujourd'hui
                                    </c:if>
                                </td>                                <td>
                                    <c:if test="${not empty nt.code}">
                                    <button class="btn btn-success btn-circle"
                                            onclick="show_code('${nt.id_installation}')">
                                        <span class="fa fa-dumpster"></span>
                                    </button>
                                </c:if>
                                    <c:if test="${empty nt.code && nt.type!='3'}">
								                            <span class="f-12">
                                                                <spring:message code="label.Aucuncodenestenregistre" />
                                                            </span>
                                    </c:if>
                                    <c:if test="${empty nt.code && nt.type=='3'}">
								                            <span class="f-12">
                                                                <spring:message code="label.vouschoisitouslescodes" />
                                                            </span>
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <div id="toolbar-options${loopp.index+1}" class="hidden">
                                        <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap_IT('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapulatif" />"><i class="fa fa-print"></i></a>
                                        <c:if test="${nt.statut.id_statut_projet == 14 || nt.statut.id_statut_projet == 15 }">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments" />"><i class="fa fa-upload"></i></a>
                                        </c:if>
                                        <c:if test="${(nt.statut.id_statut_projet == 17 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet == 17 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien4('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsignerlautorisation" />"><i class="fa fa-signature"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet == 57 }">
                                            <a type="button" style="background-color:  #d59d32" onclick="downloadIns('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation" />"><i class="fa fa-download"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet == 16 }">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${nt.id_installation}/${nt.visite.id_visite_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Reprogrammerlavisite" />"><i class="fa fa-calendar"></i></a>
                                            <a onclick="goToLien3('${nt.id_installation}')" style="background-color:  #d59d32" type="button" data-popover="true" data-html=true data-content="<spring:message code="label.Attacherlerapport" />"><i class="fa fa-file-signature"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet == 45}">
                                            <a onclick="goToLien5('${nt.id_installation}')" style="background-color:  #d59d32" type="button" data-popover="true" data-html=true data-content="<spring:message code="label.Attentedevalidationdeladestination" />"><i class="fa fa-file-signature"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet == 88}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_installation}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments" />"><i class="fa fa-check"></i></a>
                                        </c:if>
                                        <c:if test="${nt.statut.id_statut_projet ==62}">
                                            <a onclick="goToLien6('${nt.id_installation}/0')" style="background-color:  #d59d32" type="button" data-popover="true" data-html=true data-content="<spring:message code="label.Programmerunevisite" />"><i class="fa fa-calendar"></i></a>
                                        </c:if>
                                        <c:if test="${isAccessible.equals('oui')}">
                                            <a type="button" style="background-color:  #d59d32" onclick="goToLienHistoriqueAffectation('${nt.id_installation}')" data-popover="true" data-html=true data-content="Historique Affectation"><i class="fa fa-history"></i></a>
                                        </c:if>
                                    </div>
                                    <div class="tool-box">
                                        <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #ffd88e, #d59d32) !important;"><i class="fa fa-cog"></i></div>
                                        <div class="clear"></div>
                                    </div>
                                </td>
                            </tr>
                            <div class="modal fade" id="staticBackdrop-${nt.id_installation }" data-backdrop="static"
                                 data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel" style="font-family: serif;">
                                                    <spring:message code="label.Listedescomptes"/></h5>
                                                <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                                        onclick="hide_compte_it('${nt.id_installation }')">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>

                                        </div>
                                        <div class="modal-body tableComptes" style="padding-top:0px; margin-top: 10px;">

                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                    onclick="hide_compte_it('${nt.id_installation }')" data-dismiss="modal">
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
                    <c:when test="${install!='[]'}">
                        <div class="pagination pagination-lg justify-content-center" dir="ltr">
                            <c:if test="${(page)>0}">
                                <c:set value="${page-1}" var="page_db"/>
                                <c:set value="${totalPage-1}" var="page_LAST"/>
                            </c:if>
                            <c:if test="${(page)<=0}">
                                <c:set value="0" var="page_db"/>
                                <c:set value="0" var="page_LAST"/>
                            </c:if>


                            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation(0,6,'${statutEnc}')" class="pageStyle"><i class="mdi mdi-arrow-collapse-left m-0"></i></a>
                            <a  style="background-color: #206c45 !important;" onclick="listAlimentation(${page_db},6,'${statutEnc}')" class="pageStyle">&laquo;</a>


                            <c:set var = "salary"  value = "${totalPage-page-1}"/>
                            <c:choose>
                                <c:when test="${salary>5 }">
                                    <c:set var = "toAdd"  value = "5"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var = "toAdd"  value = "${totalPage-page-1}"/>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${totalPage>0}">
                                <c:forEach begin="${page}" end="${page+toAdd}" var="c">
                                    <a style="background-color: #206c45 !important;" onclick="listAlimentation(${c},6,'${statutEnc}')"  ${c==number ? 'class=" btnss pageStyle"' : 'class="btnss pageStyle1"'}>${c+1}</a>
                                </c:forEach>
                            </c:if>
                            <c:if test="${(page)>=(totalPage-1)}">
                                <c:set value="${totalPage-1}" var="page_end"/>
                            </c:if>

                            <c:if test="${(page)<(totalPage-1)}">
                                <c:set value="${page+1}" var="page_end"/>
                            </c:if>

                            <a style="background-color: #206c45 !important;" onclick="listAlimentation(${page_end},6,'${statutEnc}')" class="pageStyle">&raquo;</a>
                            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listAlimentation(${totalPage-1},6,'${statutEnc}')" class="pageStyle"><i class="mdi mdi-arrow-collapse-right m-0"></i></a>

                        </div></c:when>
                    <c:otherwise>

                        <h4 style="color:#1A6896;text-align: center"><spring:message code="label.Ilnyaaucuneenregistrement"/> </h4>
                    </c:otherwise>
                </c:choose>
            </div>

        </div>
    </div>

</div>

<div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <c:if test="${pageContext.response.locale!='ar'}">
                    <h5 class="modal-title" id="myH"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            onclick="hide_code()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                    <button type="button" class="close1" data-dismiss="modal" aria-label="Close"
                            onclick="hide_code()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="myH"></h5>

                </c:if>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-hover table-striped table-bordered" id="tab_code">
                            <thead style="background: gray;color: white;border-color: #737373;">
                            <tr>
                                <th><spring:message code="label.Code"/></th>
                                <th><spring:message code="label.Typededechets"/> </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><spring:message code="label.Erreur"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hide_code()" data-dismiss="modal"><spring:message code="label.Fermer"/></button>

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
<script>

    function hide_compte_it(id) {
        $("#staticBackdrop-" + id).modal("hide")
    }

    function show_compte_it(id,type) {
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

                swal("<spring:message code="label.lademandeabieneteaffecte"/>")
                $("input[name=inputR]").removeAttr("disabled")
                $("#input"+cpt).attr("disabled","true")
            },
            error: function (response) {

                swal("<spring:message code="label.lecomptepossededejauneaffectation"/>");

            }
        });
    }

    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});

    function searchByDate1(page){

        var form=$('#gamesForm').serialize();
        var inlineRadioOptions=$("#inlineRadioOptions").val();
        var date1=$("#date1").val();
        var date2=$("#date2").val();

        if(inlineRadioOptions==="" || date1==="" || date2===""){
            swal("<spring:message code="label.Attention"/>!", "<spring:message code="label.Mercidesaisirunedatevalide"/>", "error")
            return false;
        }
        $('#loader_modal').modal('show');
        $.ajax({
            url:"/api/getListeInstallationSearch/"+page+"/6",
            type:"GET",

            data:$('#gamesForm').serialize(),


            success : function(response) {

                $('#loader_modal').modal('hide');
                $("#table_result").html(response);

                /*$("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");*/

            },
            error : function(response) {
                $('#loader_modal').modal('hide');
                alert('Erreur ajout non effectué');

            }
        });
    }

    function hide_code(){
        $("#staticBackdrop1").modal("hide")
    }
    function show_code(id) {
        event.preventDefault();
        $("#staticBackdrop1").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getOneCodeInstall",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    if(response.typeIT=="1"){
                        $("#myH").text("<spring:message code="label.Lescodesnontraiter"/>");
                    }
                    else if(response.typeIT=="2"){
                        $("#myH").text("<spring:message code="label.Lescodesatraiter"/>");
                    }
                    else{
                        $("#myH").text("<spring:message code="label.vouschoisisseztouslescodes"/>");
                    }

                    if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/";
                    }
                    $("#tab_code tbody").html("");
                    if ($(response.code).length > 0)

                        $(response.code)
                            .each(
                                function(idx, el) {
                                    var btn_url = "";

                                    var tr = "<tr> <td>"
                                             + el.nom_fr
                                             + "</td> <td>"
                                             + el.nom_ar
                                             + "</td> </tr>";

                                    $("#tab_code tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }

    function listAlimentation(page, size, statut) {
        window.location.href='/api/getListeInstallation/'+page+'/6'+'/'+statut;
    }

    function goToLien(val){
        window.location.href='/api/validateDocInstallation/'+val;
    }
    function goToLienRecap_IT(val){
        window.location.href='/api/recap_installation/'+val;
    }
    function  goToLien2(val){
        window.location.href='/api/visiteInstallation/'+val;
    }
    function  goToLien3(val){
        window.location.href='/api/documentAttche/'+val;
    }
    function goToLien4(val){
        window.location.href='/api/down_sign_docInstall/'+val;
    }
    function goToLien5(val){
        window.location.href='/api/validationDestination/'+val;
    }
    function goToLien6(val){
        window.location.href='/api/visiteInstallation/'+val;
    }
    function downloadIns(val){
        window.location.href=val;
    }

    $(document).ready(function() {
        $('[data-toggle="tooltip"]').tooltip({
            selector: true,
            title: function() {
                return $('.myT').attr('href');
            }
        });
    });

    function goToLienHistoriqueAffectation(id){
        window.location.href="/api/HistoriqueAffectation/"+id+"/installation"
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
    function getListFiltrerInstallation(order){
        $('#loader_modal').modal('show');
        $.ajax({
            url: "/api/getListeInstallationDesc/0/6/0/"+order,
            type: "GET",
            data: {
            },
            success: function (response) {
                $('#loader_modal').modal('hide');
                $("#table_result").html(response);
            },
            error: function (response) {
                alert("Error");
            }
        });
    }
</script>



