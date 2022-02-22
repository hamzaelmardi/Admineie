<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />


<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
    <div class="main-panel " style="margin-top:100px">
        <div class="row mt-5">
            <div class="col-12 p-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <nav aria-label="breadcrumb" style="background-color: lightblue" >
                    <ol class="breadcrumb ml-4">
                        <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'};top: 14px !important;"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                        <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}"><a href="">Historique Affectation</a></li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="accordion ml-2 mt-4" id="accordionExample">
            <div class="card">
                <div class="card-header" id="headingOne" style=" border-left: 4px solid #65c465" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <h5 class="mb-0">
                        <a class="btn text-left" style="color: #65c465!important;" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <i class="fa fa-angle-double-right mr-3"></i><span style="color: #65c465">Affectation Actuelle </span>
                        </a>
                    </h5>
                </div>
                <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="card-body">
                        <c:if test="${not empty lastAffecte}">
                            <table class="table table-striped hover compact table-bordered  text-center  text-md-nowrap">
                            <thead class="bgMyColor text-white">
                            <th>#</th>
                            <th><spring:message code="label.Numerodelademande"/></th>
                            <th><spring:message code="label.Acteur"/></th>
                            <th>Date Affectation</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <c:if test="${type.equals('notification')}">
                                    <td>${lastAffecte.notification.num_notification}</td>
                                </c:if>
                                <c:if test="${type.equals('collecte')}">
                                    <td>${lastAffecte.collecte.num_demande}</td>
                                </c:if>
                                <c:if test="${type.equals('installation')}">
                                    <td>${lastAffecte.installation.num_demande}</td>
                                </c:if>
                                <c:if test="${type.equals('demandeInformation')}">
                                    <td>${lastAffecte.demandeInformation.num_demande}</td>
                                </c:if>
                                <td>${lastAffecte.compte.nom}</td>
                                <fmt:formatDate   dateStyle="long" value="${lastAffecte.dateAffectation}" pattern="dd-MM-yyyy HH:mm:ss" var="dateAction" />
                                <td>
                                    ${dateAction}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </c:if>
                        <c:if test="${empty lastAffecte}">
                            <span><spring:message code="label.AucuneResultat"/></span>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" id="headingTwo" style=" border-left: 4px solid #f38787;" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <h5 class="mb-0">
                        <a class="btn collapsed text-left" style="color: #f38787!important;" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fa fa-angle-double-right mr-3"></i><span style="color: #f38787"><spring:message code="label.historiques"/></span>
                        </a>
                    </h5>
                </div>
                <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body">
                        <c:if test="${not empty affectationList}">
                            <table class="table table-striped hover compact table-bordered text-center text-md-nowrap" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <thead class="bgMyColor text-white">
                                <th>#</th>
                                <th><spring:message code="label.Numerodelademande"/></th>
                                <th><spring:message code="label.Acteur"/></th>
                                <th>Date Affectation</th>
                                </thead>
                                <tbody>
                                <tr>
                                    <c:forEach items="${affectationList}" var="o" varStatus="loopp">
                                <tr>
                                    <td>${loopp.index+1}</td>
                                    <c:if test="${type.equals('notification')}">
                                        <td>${o.notification.num_notification}</td>
                                    </c:if>
                                    <c:if test="${type.equals('collecte')}">
                                        <td>${o.collecte.num_demande}</td>
                                    </c:if>
                                    <c:if test="${type.equals('installation')}">
                                        <td>${o.installation.num_demande}</td>
                                    </c:if>
                                    <c:if test="${type.equals('demandeInformation')}">
                                        <td>${o.demandeInformation.num_demande}</td>
                                    </c:if>
                                    <td>${o.compte.nom}</td>
                                    <fmt:formatDate   dateStyle="long" value="${o.dateAffectation}" pattern="dd-MM-yyyy HH:mm:ss" var="dateAction" />
                                    <td>
                                        ${dateAction}
                                    </td>
                                </tr>
                                </c:forEach>
                                </tr>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty affectationList}">
                            <span><spring:message code="label.AucuneResultat"/></span>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../includes/footer.jsp" />
