<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="col-12 table-responsive" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <table style="width:100% !important" id="tbody" class="table table-bordered display responsive nowrap">
        <thead style="background: gray;color: white;border-color: #737373;">
        <tr style="background-color: #206c45 !important;">
            <th class=""><spring:message code="label.Nnotification"/></th>
            <th class=""><spring:message code="label.code"/></th>
            <th class=""><spring:message code="label.datedepot"/></th>
            <th class=""><spring:message code="label.Njour"/></th>
            <th class=""><spring:message code="label.Statut"/></th>
            <th class=""><spring:message code="label.nomsociete"/></th>
            <th class=""><spring:message code="label.Identifiantfiscale"/></th>
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
                        <c:when test="${affecter==null && user.poste.id_Poste!=1 && (nt.statut.id_statut_projet!=54 && nt.statut.id_statut_projet!=55 && nt.statut.id_statut_projet!=58 && nt.statut.id_statut_projet!=59)}">
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
                        <button class="btn" style="background-color: #fa92a5;text-align: center;background-size: 100% 100%;border-radius: 50%;">
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
                    <c:if test="${nt.statut.id_statut_projet == 63 || nt.statut.id_statut_projet==66}">
                        <i class="badge badge-info">${nt.statut.nom_fr } </i>
                    </c:if>
                    <c:if test="${nt.statut.id_statut_projet == 64 || nt.statut.id_statut_projet==67}">
                        <i class="badge badge-success">${nt.statut.nom_fr } </i>
                    </c:if>
                    <c:if test="${nt.statut.id_statut_projet == 65 || nt.statut.id_statut_projet==68}">
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
                <td> ${nt.importateur.idf} </td>
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
                        <c:if test="${(nt.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || (nt.statut.id_statut_projet==85 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId)}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLien6('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredeconsentement"/>"><i class="fa fa-signature"></i></a>
                        </c:if>
                        <c:if test="${(nt.statut.id_statut_projet==86 && nt.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==86 && nt.url_lettre_nonconforme==null && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLien7('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredenonconforme"/>"><i class="fa fa-signature"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==33 || nt.statut.id_statut_projet==37}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-upload"></i></a>
                        </c:if>
                        <c:if test="${(nt.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==40 && type=='ZF' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLienNonFavorable('/api/downloadRecuDepo/${nt.id_notification }')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-signature"></i></a>
                        </c:if>
                        <c:if test="${(nt.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==40 && type=='ET' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLienNonFavorable('/api/downloadRecuDepoND/${nt.id_notification }')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-signature"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==84 }">
                            <a type="button" style="background-color:  #d59d32" onclick="downloadAut2('${fn:replace(nt.url_lettre_conforme,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlalettredeconsentement"/>"><i class="fa fa-upload"></i></a>
                        </c:if>
                        <c:if test="${(nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==83 && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLien8('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="<spring:message code="label.Attacherlavisdepaysdedestination"/>"><i class="fa fa-edit"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==63}">
                            <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${type}/${nt.id_notification}')" data-popover="true" data-html=true data-content="Valider le certificat"><i class="fa fa-check"></i></a>
                            <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==64 || nt.statut.id_statut_projet==65 || nt.statut.id_statut_projet==67 || nt.statut.id_statut_projet==68}">
                            <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==54 || nt.statut.id_statut_projet==55 || nt.statut.id_statut_projet==58 || nt.statut.id_statut_projet==59}">
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
                        <c:if test="${nt.statut.id_statut_projet==93}">
                            <a type="button" style="background-color:  #d59d32" onclick="downloadAut('${fn:replace(nt.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargerlautorisation"/>"><i class="fa fa-download"></i></a>
                        </c:if>
                        <c:if test="${nt.statut.id_statut_projet==64}">
                            <a type="button" style="background-color:  #d59d32" onclick="modal_garantie_financiere('${nt.id_notification}',93,'récupérée')" data-popover="true" data-html=true data-content="<spring:message code="label.recuperelagarantiefinanciere"/>"><i class="fa fa-check"></i></a>
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



            <div class="modal fade" id="staticBackdrop-${nt.id_notification }" data-backdrop="static"
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
                        <div class="modal-body" style="padding-top:0px; margin-top: 10px;">
                            <div class="row">
                                <div class="col-lg-1"></div>
                                <div class="col-md-10 col-sm-12 col-lg-10 btn-warnings "
                                     style="border: 1px #80808024 solid ;">
                                    <div class="col-lg-5 col-sm-12 col-md-5 divMarges"><spring:message
                                            code="label.Email"/></div>
                                    <div class="col-lg-5 col-sm-12 col-md-5 divMarges"><spring:message
                                            code="label.Nom"/></div>
                                    <div class="col-lg-2 col-sm-12 col-md-2 divMarges"><spring:message
                                            code="label.Action"/></div>
                                </div>
                                <div class="col-lg-1"></div>
                            </div>
                            <c:forEach items="${listeCompte }" var="cpt">
                                <c:if test="${cpt.compteId!=user.compteId}">
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-md-10 col-sm-12 col-lg-10 btn-warningBody padBot  "
                                         style="border: 1px #80808024 solid ;">
                                        <div class="col-lg-5 col-sm-12 col-md-5 bordRight">${cpt.email }</div>
                                        <div class="col-lg-5 col-sm-12 col-md-5 bordRight">${cpt.nom }</div>
                                        <div class="col-lg-2 col-sm-4 col-md-4 mt-2">
                                            <input type="radio" name="inputR" id="input${cpt.compteId }"
                                                ${cpt.compteId==nt.compteAffecte.compteId?'checked disabled':''}
                                                   onchange="affectNotif('${nt.id_notification }','${cpt.compteId }','ZF')">
                                            <label for="input${cpt.compteId }"></label>
                                        </div>

                                    </div>
                                    <div class="col-lg-1"></div>
                                </div>
                                </c:if>
                            </c:forEach>

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


<jsp:include page="../../includes/footer.jsp" />


