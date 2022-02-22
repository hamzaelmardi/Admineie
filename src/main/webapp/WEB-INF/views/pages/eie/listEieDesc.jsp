<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date"/>

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
                    <th ><spring:message code="label.IntituleProjet"/></th>
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
                                        class="fa fa-eye"
                                        style="font-size:21px;color: #33994c;"></span>
                                </a>
                            </td>
                            <td>
                            </td>
                            <td>
                                <a class="removeStyle" download
                                   href="${fn:replace(nt.url_cachier_defenitive, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                        class="fa fa-eye"
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
                                    <span class="fa fa-eye"></span>
                                </a>
                            </td>
                            <td>
                                <c:forEach items="${nt.rapports_AE}" var="ar">
                                    <a class="removeStyle" download
                                       href="${fn:replace(ar.url_file, "/assets/myFile/", "/dowload_uploaded/")}"><span
                                            class="fa fa-eye"
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
                                    <span class="fa fa-eye"></span>
                                </a>
                            </td>
                        </c:if>
                        <td class="text-center">
                            <div id="toolbar-options${loopp.index+1}" class="hidden">
                                <a type="button" style="background-color:  #d59d32" onclick="goToLienRecap('${type}/${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Afficherlerecapitulatif"/>"><i class="fa fa-print"></i></a>
                                <c:if test="${(nt.statut.id_statut_projet==12 && type=='AE' && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || nt.statut.id_statut_projet==12 && type=='AE' && user.poste.id_Poste!=1 && user.compteId!=nt.compteAffecte.compteId}">
                                    <a type="button" style="background-color:  #d59d32" onclick="goToLienDownloadDecision('${nt.id_demande_information}')" data-popover="true" data-html=true data-content="<spring:message code="label.Telechargeretsigneladecision"/>"><i class="fa fa-signature"></i></a>
                                </c:if>
                                <c:if test="${nt.statut.id_statut_projet==59 && type!='AE'}">
                                    <a type="button" style="background-color:  #d59d32" onclick="goToLien('${nt.id_demande_information}/${nt.type}')" data-popover="true" data-html=true data-content="<spring:message code="label.Validerlesdocuments"/>"><i class="fa fa-check"></i></a>
                                </c:if>
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
                                        <a type="button" style="background-color:  #d59d32" onclick="goTo4('${nt.id_demande_information}/etude')" data-popover="true" data-html=true data-content="<spring:message code="label.PlanifierunereunionDevalidation"/>"><i class="fa fa-calendar"></i></a>
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

<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp"/>


