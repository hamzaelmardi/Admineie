<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

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
            left: ${pageContext.response.locale!='ar'?'334px':'90rem'};
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
            left: ${pageContext.response.locale!='ar'?'83px':'45px'};
            top: 52px !important;
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
    .btn-circle {
        width: 30px;
        height: 30px;
        padding: 6px 6px;
        border-radius: 15px;
        text-align: center;
        font-size: 12px;
        line-height: 1.42857;
    }
    table.dataTable.dtr-inline.collapsed > tbody > tr[role="row"] > td.dtr-control::before{
        box-shadow:none;
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
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nom_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nom_fr"/>
</c:otherwise>
</c:choose>
<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
    <div class="main-panel " style="margin-top:150px" >
        <div class="content-wrapper">
            <div>
                <c:choose>
                    <c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/api/getListeCollecte' )}">
                        <c:set var="p_page" value="${pageContext.response.locale=='ar'?'جمع النفايات ونقلها':'Collecte ET Transport Des Déchets'}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <div class="col-12 "  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                     <nav aria-label="breadcrumb ">
                         <ol class="breadcrumb ml-4" style="margin-top: -18px !important;">
                             <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                             <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page">${p_page}</li>
                             <li class="breadcrumb-item dropdown1 " style="float: left;">
                                 <a style="font-size: 14px;" class="dropbtn1" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="affichehover()">
                                     ${sp}
                                 </a>
                             </li>
                         </ol>
                     </nav>
                    <div class="dropdown-content1" aria-labelledby="dropdownMenuLink">
                        <a style="padding: 4px" href="/api/getListeCollecte/0/6/0"><spring:message code='label.Tous'/></a>

                        <c:forEach items="${statu}" var="st">
                            <c:if test="${st.nom_fr!='Brouillon'}">
                                <a style="border-bottom: 1px solid white; padding: 4px"
                                    ${statNow==st.id_statut_projet?"selected":""}
                                   href="/api/getListeCollecte/0/6/${st.id_statut_projet}">${st[lng] }</a>

                            </c:if>
                        </c:forEach>
                    </div>


                </div>
                 <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">


                     <div class="col-md-12 col-lg-12" style="width: 98%;margin-left: auto;margin-right: auto;background: white;border-radius: 5px;display:flex;">
                         <form id="gamesForm" style=" display:flex;">
                             <div class="row" style="width: 100%!important;">
                                 <input name="selst" type="hidden" value="${statutEnc}">
<%--                                 <div class="col-lg-3 col-sm-12">--%>
<%--                                     <label class="h5"><spring:message code="label.Statut"/></label>--%>
<%--                                     <div class="input-group">--%>
<%--                                     <select class="select2 form-control" onchange="go_link(this.value)">--%>
<%--                                         <option value="/api/getListeCollecte/0/6/0"><spring:message code='label.Tous'/></option>--%>
<%--                                         <c:forEach items="${statu}" var="st">--%>
<%--                                             <c:if test="${st.nom_fr!='Brouillon'}">--%>
<%--                                                 <option--%>
<%--                                                     ${statNow==st.id_statut_projet?"selected":""}--%>
<%--                                                         value="/api/getListeCollecte/0/6/${st.id_statut_projet}">${st[lng] }</option>--%>
<%--                                             </c:if>--%>
<%--                                         </c:forEach>--%>
<%--                                     </select>--%>
<%--                                 </div></div>--%>
                                 <div class="col-lg-3 col-sm-12">
                                     <div class="form-group text-left">
                                         <label><spring:message code='label.DateDebut'/></label>
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
                                     <label><spring:message code='label.Date'/></label>
                                     <div class="input-group">
                                         <select class="form-select " id="inlineRadioOptions" name="inlineRadioOptions" style="height: 39px">
                                             <option value="date_depot"><spring:message code='label.datedepot'/></option>
                                             <option value="date_validation"><spring:message code='label.Datevalidation'/></option>
                                         </select>
                                     </div>
                                 </div>
                                 <div class="col-lg-1 col-sm-12 mb-2">
                                     <a style="padding: 5px;margin-top: 32px;background-color: #206c45 !important;"class="btn btn-primary" onclick="searchByDate(0)"><spring:message code='label.rechercher'/></a>
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
                        <select class="custom-select" name="filter" aria-label="basic-addon1" aria-describedby="basic-addon1" id="filter" onchange="getListFiltrerCollecte(this.value)">
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
                             <th class="" ><a href="/api/getMenu" style="color: whitesmoke"><spring:message code='label.Ndemande'/></a></th>
                             <th class=""><spring:message code="label.Raisonsocial"/></th>
                             <th class="">IF</th>
                             <th class=""><spring:message code='label.Datedepot'/></th>
                             <th class=""><spring:message code="label.Etatdelademande"/></th>
                             <th class=""><spring:message code="label.Adresse" /></th>
                             <th class=""><spring:message code="label.Telephone" /></th>
                             <th class=""><spring:message code="label.Fax" /></th>
                             <th class=""><spring:message code="label.Email" /></th>
                             <th class=""><spring:message code="label.CIN" /></th>
                             <th class=""><spring:message code="label.Representant" /></th>
                             <th class=""><spring:message code="label.TypedeDemande" /></th>
                             <th class=""><spring:message code="label.code" /></th>
                             <th class=""><spring:message code="label.Nombredevehicule"/></th>
                             <th class=""><spring:message code="label.Nombredeconteneurs"/>
                             </th>
                             <th class=""><spring:message code="label.Motif"/>
                             </th>
                             <th class=""><spring:message code="label.Pvdelacommission"/></th>
                             <th class=""><spring:message code="label.informationvehicule"/>
                             </th>
                             <th class="all"><spring:message code="label.Action" /></th>
                         </tr>
                         </thead>
                         <tbody>
                         <c:forEach items="${collect}" var="n" varStatus="loopp">
                             <tr>
                                 <td class="font-weight-semibold">
                                     <c:choose>
                                         <c:when test="${affecter==null && user.poste.id_Poste!=1 && (n.statut.id_statut_projet!=56)}">
                                             <a title="Affecter" href="#"
                                                onclick="show_compte_ct('${n.id_collecte }','CT')">${n.num_demande}</a>
                                         </c:when>
                                         <c:otherwise>
                                             ${n.num_demande}
                                         </c:otherwise>
                                     </c:choose>
                                 </td>
                                 <td>${n.raison}</td>
                                 <td>${n.idfiscale}</td>
                                 <td><fmt:formatDate   dateStyle="long" value="${n.dateDepot }" /></td>
                                 <td>
                                     <i class="badge badge-success"> ${n.statut.nom_fr} </i>
                                 </td>

                                 <td>${n.demandeurAdresse}</td>
                                 <td>${n.demandeurTel}</td>
                                 <td>${n.demandeurFax}</td>
                                 <td>${n.demandeurEmail}</td>
                                 <td>${n.cin}</td>
                                 <td>${n.demandeur_Nom}</td>
                                 <td>${n.typeRenouvellement.nom_fr}</td>
                                 <td><c:if test="${not empty n.code}">
                                     <button class="btn btn-success btn-circle"
                                             onclick="show_code('${n.id_collecte}')">
                                         <span class="fa fa-dumpster"></span>
                                     </button>
                                 </c:if>
                                     <c:if test="${empty n.code}">
                                                                    <span class="f-12">
                                                                        <spring:message code="label.Aucuncodenestenregistre" />
                                                                    </span>
                                     </c:if></td>
                                 <td>${n.nombre_vehicule}</td>
                                 <td>${n.nombre_conteneur}</td>
                                 <td> <c:if test="${not empty n.document_attache }">
                                     <a class="removeStyle" download
                                        href="${url}${fn:replace(n.document_attache, "/assets/myFile/", "/dowload_uploaded/")}">
                                         <button class="btn btn-outline-success btn-circle">
                                             <span class="fa fa-file-download" style="color: green"></span>
                                         </button>
                                     </a>
                                 </c:if>
                                 </td>
                                 <td>
                                     <c:if test="${not empty n.url_pv_commission }">
                                         <a class="removeStyle" download
                                            href="${url}${fn:replace(n.url_pv_commission, "/assets/myFile/", "/dowload_uploaded/")}">
                                             <button class="btn btn-outline-success ml-2 btn-circle">
                                                 <span class="fa fa-file-download"></span>
                                             </button>
                                         </a>
                                     </c:if>
                                 </td>
                                 <td><c:if test="${not empty n.vehicules}">
                                     <button class="btn btn-success btn-circle"
                                             onclick="show_vehicule('${n.id_collecte}')">
                                         <span class="fa fa-truck"></span>
                                     </button>
                                 </c:if> <c:if test="${empty n.vehicules}">
                                        <span class="f-12"><spring:message
                                                code="label.Aucunvehiculenestenregistre" /></span>
                                 </c:if></td>

                                 <td>
                                     <div id="toolbar-options${loopp.index+1}" class="hidden">
                                         <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap_CT('${n.id_collecte}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapulatif" />"><i class="fa fa-print"></i></a>
                                         <c:if test="${n.statut.id_statut_projet == 19}">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLien('${n.id_collecte}/0')" data-popover="true" data-html=true data-content="<spring:message code="label.Planificationreuniondecommission" />"><i class="fa fa-edit"></i></a>
                                         </c:if>
                                         <c:if test="${n.statut.id_statut_projet == 15 }">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLien1('${n.id_collecte}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments" />"><i class="fa fa-edit"></i></a>
                                         </c:if>
                                         <c:if test="${n.statut.id_statut_projet == 43 || n.statut.id_statut_projet == 44}">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${n.id_collecte}')" data-popover="true" data-html=true data-content="<spring:message code="label.avisdeministre" />"><i class="fa fa-edit"></i></a>
                                         </c:if>
                                         <c:if test="${(n.statut.id_statut_projet == 28 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || (n.statut.id_statut_projet == 28 && user.poste.id_Poste!=1 && user.compteId!=n.compteAffecte.compteId)}">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLien3('${n.id_collecte}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsignerlautorisation" />"><i class="fa fa-signature"></i></a>
                                         </c:if>
                                         <c:if test="${n.statut.id_statut_projet==56}">
                                             <a type="button" style="background-color:  #d59d32" onclick="downloadColl('${fn:replace(n.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation" />"><i class="fa fa-download"></i></a>
                                         </c:if>
                                         <c:if test="${isAccessible.equals('oui')}">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLienHistoriqueAffectation('${n.id_collecte}')" data-popover="true" data-html=true data-content="Historique Affectation"><i class="fa fa-history"></i></a>
                                         </c:if>
                                         <c:if test="${n.statut.id_statut_projet == 23 || n.statut.id_statut_projet==70 }">
                                             <a type="button" style="background-color:  #d59d32" onclick="goToLien4('${n.id_collecte}')" data-popover="true" data-html=true data-content="<spring:message code="label.attentedavisdecommission" />"><i class="fa fa-check"></i></a>
                                             <c:if test="${n.reunions.size()>0}">
                                                 <a onclick="goToLien5('${n.id_collecte}/${n.reunions.get(n.reunions.size()-1).id_reunion}')" style="background-color:  #d59d32" type="button" data-popover="true" data-html=true data-content="<spring:message code="label.Editreunionde"/>${n.reunions.get(n.reunions.size()-1).date_reunion}"><i class="fa fa-edit"></i></a>
                                             </c:if>
                                         </c:if>
                                     </div>
                                     <div class="tool-box">
                                         <div data-toolbar="user-options" class="btn-toolbar btn-toolbar-primary" id="info-toolbar${loopp.index+1}" style="background: linear-gradient(to right, #ffd88e, #d59d32) !important;"><i class="fa fa-cog"></i></div>
                                         <div class="clear"></div>
                                     </div>
                                 </td>
                             </tr>
                             <div class="modal fade" id="staticBackdrop-${n.id_collecte }" data-backdrop="static"
                                  data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                  aria-hidden="true">
                                 <div class="modal-dialog modal-lg modal-dialog-centered">
                                     <div class="modal-content">
                                         <div class="modal-header">
                                             <h5 class="modal-title" id="staticBackdropLabel" style="font-family: serif;">
                                                 <spring:message code="label.Listedescomptes"/></h5>
                                             <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                                     onclick="hide_compte_ct('${n.id_collecte}')">
                                                 <span aria-hidden="true">&times;</span>
                                             </button>
                                         </div>
                                         <div class="modal-body tableComptes" style="padding-top:0px; margin-top: 10px;">

                                         </div>

                                         <div class="modal-footer">
                                             <button type="button" class="btn btn-secondary"
                                                     onclick="hide_compte_ct('${n.id_collecte }')" data-dismiss="modal">
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
                    <c:when test="${collect!='[]'}"> <div class="pagination pagination-lg justify-content-center" dir="ltr">
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
                            

<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <c:if test="${pageContext.response.locale!='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedesvehicules"/></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            onclick="hide_vehicule()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                    <button type="button" class="close1" data-dismiss="modal" aria-label="Close"
                            onclick="hide_vehicule()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedesvehicules"/></h5>

                </c:if>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-hover table-striped table-bordered" id="tab_vehicule">
                            <thead style="background: gray;color: white;border-color: #737373;">
                            <tr>
                                <th><spring:message code="label.NMatriculation"/> </th>
                                <th> <spring:message code="label.NChassis"/> </th>
                                <th> <spring:message code="label.Poidstotalencharge"/>  </th>
                                <th> <spring:message code="label.Poidsnetduvehicule"/>  </th>
                                <th> <spring:message code="label.Typedevehicule"/>  </th>
                                <th> <spring:message code="label.typedeconteneurs"/> </th>
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
                <button type="button" class="btn btn-secondary" onclick="hide_vehicule()" data-dismiss="modal"><spring:message code="label.Fermer"/></button>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <c:if test="${pageContext.response.locale!='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedescodes"/></h5>
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
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedescodes"/></h5>

                </c:if>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-hover table-striped table-bordered" id="tab_vehicule">
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

<!-- main-panel ends -->
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
<script>

    function hide_compte_ct(id) {
        $("#staticBackdrop-" + id).modal("hide")
    }

    function show_compte_ct(id,type) {
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

                swal("la demande a bien été affecté")
                $("input[name=inputR]").removeAttr("disabled")
                $("#input"+cpt).attr("disabled","true")
            },
            error: function (response) {

                swal("le compte possède déjà une affectation");

            }
        });
    }

    function listAlimentation(page, size,statut) {
        window.location.href='/api/getListeCollecte/'+page+'/6'+'/'+statut;
    }

    function hide_code(){
        $("#staticBackdrop1").modal("hide")
    }
    function hide_vehicule(){
        $("#staticBackdrop").modal("hide")
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
                url : "/api/getOneCode",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/";
                    }
                    $("#tab_vehicule tbody").html("");
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

                                    $("#tab_vehicule tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }

    function show_vehicule(id) {
        event.preventDefault();
        $("#staticBackdrop").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getOneCollecte",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
console.log(response);
                    if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/";
                    }
                    $("#tab_vehicule tbody").html("");
                    if ($(response.vehicules).length > 0)

                        $(response.vehicules)
                            .each(
                                function(idx, el) {

                                    var btn_url = "";
                                    if(el.doc_assurance!=null && el.doc_assurance!=""){
                                        btn_url = el.doc_assurance
                                            .replace(
                                                '/assets/myFile/',
                                                '/dowload_uploaded/');

                                        btn_url = '<a href="'+response.url_Admin+btn_url+'" target="_blank" download class="btn btn-primary btn-circle"><span class="fa fa-download"></span></a>'
                                    }

                                    var btn_url2 = "aucun équipement de sécurité";
                                    if(el.equipementSecurite!=null && el.equipementSecurite!=""){
                                        btn_url2 = el.equipementSecurite
                                            .replace(
                                                '/assets/myFile/',
                                                '/dowload_uploaded/');

                                        btn_url2 = '<a href="'+response.url_Admin+btn_url2+'" target="_blank" download class="btn btn-primary btn-circle"><span class="fa fa-download"></span></a>'
                                    }

                                    var tr = "<tr> <td>"
                                        + el.num_mat_enrg_voit
                                        + " - "
                                        + el.num_mat_enrg_auto
                                        + " - "
                                        + el.num_mat_id_prefect
                                        +"</td> <td>"
                                        + el.num_chassis
                                        + "</td> <td>"
                                        + el.poit_totale_charge
                                        + "</td> <td>"
                                        + el.point_net
                                        + "</td><td>"
                                        + el.typeVehicule
                                        +"</td><td>"
                                        + el.typeConteneur
                                        +"</td></tr>";

                                    $("#tab_vehicule tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }

    function searchByDate(page){

        var form=$('#gamesForm').serialize();
        var inlineRadioOptions=$("#inlineRadioOptions").val();
        var date1=$("#date1").val();
        var date2=$("#date2").val();

        if(inlineRadioOptions==="" || date1==="" || date2===""){
            swal("<spring:message code="label.Attention"/>!", "<spring:message code="label.Mercidesaisirunedatevalide"/>", "error")
            return false;
        }
        $.ajax({
            url:"/api/getListeCollecteSearch/"+page+"/6",
            type:"GET",

            data:$('#gamesForm').serialize(),


            success : function(response) {


                $("#table_result").html(response);
                /*$("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");*/
            },
            error : function(response) {

                alert('Erreur ajout non effectué');

            }
        });
    }
    function goToLienRecap_CT(val){
        window.location.href='/api/recap_collecte/'+val;
    }
    function goToLien(val){
        window.location.href='/api/reunionCollecte/'+val;
    }
    function  goToLien1(val){
        window.location.href='/api/validateDocCollecte/'+val;
    }
    function  goToLien2(val){
        window.location.href='/api/validationFinalCollecte/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/down_sign_docCollecte/'+val;
    }
    function goToLien4(val){
        window.location.href='/api/ValidationCodesAndVehicules/'+val;
    }
    function goToLien5(val){
        window.location.href='/api/reunionCollecte/'+val;
    }
    function downloadColl(val){
        window.location.href=val;
    }
    function goToLienHistoriqueAffectation(id){
        window.location.href="/api/HistoriqueAffectation/"+id+"/collecte"
    }
    $('body').popover({ selector: '[data-popover]', trigger: 'click hover', placement: 'top', delay: {show: 50, hide: 400}});
    function affichehover(){
        $(".dropdown-content1").slideToggle();
    }
    // $(".dropdown1").hover(function(){
    //     $(".dropdown-content1").slideToggle();
    // });
    // $(".dropdown2").hover(function(){
    //     $(".dropdown-content2").slideToggle();
    // });

    function getListFiltrerCollecte(order){
        $('#loader_modal').modal('show');
        $.ajax({
            url: "/api/getListeCollecteDesc/0/6/0/"+order,
            type: "GET",
            data: {
            },
            success: function (response) {
                $('#loader_modal').modal('hide');
                $("#table_result").html(response);
            },
            error: function (response) {
                $('#loader_modal').modal('hide');
                alert("Error");
            }
        });
    }
</script>
