<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="now" class="java.util.Date" />

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
                               onclick="show_compte_ct('${n.id_collecte }')">${n.num_demande}</a>
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
                        <div class="modal-body" style="padding-top:0px; margin-top: 10px;">

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
<jsp:include page="../../includes/footer.jsp" />
