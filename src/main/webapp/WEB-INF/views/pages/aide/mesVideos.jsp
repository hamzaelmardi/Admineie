<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:choose>

    <c:when test="${type=='ZF'}">
        <div class="row">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/ZFValiderlesDocumentsAdmin.mp4" data-target="#videoModal">
                - Valider les Documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/ZFCompleterlesDocumentEtValiderAdmin.mp4" data-target="#videoModal">
                - Valider la demande <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/ZFCertificatValideAdmin.mp4" data-target="#videoModal">
                - certificat validé <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/Validerletransporteur.mp4" data-target="#videoModal">
                - Transporteur valide <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/ZFSigneerAdmin.mp4" data-target="#videoModal">
                - signé l'autorisation  <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">

        </div>
    </c:when>
    <c:when test="${type=='ET'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/ETadmin.mp4" data-target="#videoModal">
                - Validation  <i class="fa fa-video"></i>
            </a>
        </div>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Compléter les documents <i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
    </c:when>
    <c:when test="${type=='RS'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">
                - Déposer ma demande <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">
                - Compléter les documents <i class="fa fa-video"></i>
            </a>
        </div>
    </c:when>
    <c:when test="${type=='XD'}">
        <div class="row">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/XDCompleterLeDeocumentAdmin.mp4" data-target="#videoModal">
                - Valider les documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/XDLettreAdmin.mp4" data-target="#videoModal">
                - valider la demande <i class="fa fa-video"></i>
            </a>
        </div>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Compléter les documents <i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
    </c:when>
    <c:when test="${type=='TR'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/TRValiderLesDocEtValideAdmin.mp4" data-target="#videoModal">
                - Valider les documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/TR_Signeeadmin.mp4" data-target="#videoModal">
                - Valider la demande <i class="fa fa-video"></i>
            </a>
        </div>
    </c:when>
    <c:when test="${type=='EE'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/EEValiderDocsAdmin.mp4" data-target="#videoModal">
                - Valider les documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/EEReunionplanifieAdmin.mp4" data-target="#videoModal">
                - Attachement du rapport de l'EP <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/EEPVreunionAdmin.mp4" data-target="#videoModal">
                - Attacher le PV <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/EEDocumentAttacheeFefinitiveAdmin.mp4" data-target="#videoModal">
                - vérification des documents valides <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/EETelechargerEtSignerAdmin.mp4" data-target="#videoModal">
                - Télécharger Et Signer <i class="fa fa-video"></i>
            </a>
        </div>
    </c:when>
    <c:when test="${type=='NT'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/NT1.mp4" data-target="#videoModal">
                - Valider les documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/NT2.mp4" data-target="#videoModal">
                - Télécharger et signé la décision de l'acceptabilité environnementale <i class="fa fa-video"></i>
            </a>
        </div>
    </c:when>
    <c:when test="${type=='AE'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE2.mp4" data-target="#videoModal">
                - Programmer la réunion  <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE3.mp4" data-target="#videoModal">
                - Ajouter PV de réunion <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE4.mp4" data-target="#videoModal">
                - Valider les documents <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE5.mp4" data-target="#videoModal">
                - Planifier une réunion de validation  <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE7.mp4" data-target="#videoModal">
                - Afficher les rapports reçus  <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/AE9.mp4" data-target="#videoModal">
                - Télécharger et signé la décision  <i class="fa fa-video"></i>
            </a>
        </div>
    </c:when>
    <c:when test="${type=='CT'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/validerdechetct.mp4" data-target="#videoModal">
                - Validation de la demande <i class="fa fa-video"></i>
            </a>
        </div>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Compléter les documents <i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Validation des déchets et véhicules<i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
    </c:when>
    <c:when test="${type=='IT'}">
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/Validationdechetit.mp4" data-target="#videoModal">
                - Validation de la demande <i class="fa fa-video"></i>
            </a>
        </div>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Compléter les documents <i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
<%--        <div class="row mt-2">--%>
<%--            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">--%>
<%--                - Validation des déchets <i class="fa fa-video"></i>--%>
<%--            </a>--%>
<%--        </div>--%>
    </c:when>
    <c:otherwise>
        <div class="row">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">
                - Demande le numero de demande <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">
                - Déposer ma demande <i class="fa fa-video"></i>
            </a>
        </div>
        <div class="row mt-2">
            <a type="button" class="video-btn text-dark" data-toggle="modal" data-src="/assets/video/videoInscription.mp4" data-target="#videoModal">
                - Compléter les documents <i class="fa fa-video"></i>
            </a>
        </div>
    </c:otherwise>
</c:choose>
<jsp:include page="../../includes/footer.jsp"/>



