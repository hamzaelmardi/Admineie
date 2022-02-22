<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />

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
                <jsp:useBean id="now" class="java.util.Date" />
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
<jsp:include page="../../includes/footer.jsp" />
