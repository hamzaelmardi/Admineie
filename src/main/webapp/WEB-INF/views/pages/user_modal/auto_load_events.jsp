<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:choose>
    <c:when test="${type=='Reunion'}">

        <table class="my_table border border-dark table text-center" id="tabinfo" >
            <thead class="th_vert">
            <tr>
                <th><spring:message code="label.Titueprojet"/> </th>
                <th><spring:message code="label.RaisonSocial"/> </th>
                <th ><spring:message code="label.Reunion"/></th>
            </tr>
            </thead>
            <tbody >
                <c:if test="${not empty demande}">
                    <tr>
                        <td class="p-2">${empty demande.intitule_projet?' - ':demande.intitule_projet}</td>
                        <td class="p-2">${empty demande.raison_social?' - ':demande.raison_social}</td>
                        <td class="p-2">

                            <fmt:parseDate value="${empty demande.reunions.get(demande.reunions.size()-1).date_reunion?' - ':demande.reunions.get(demande.reunions.size()-1).date_reunion}" type="DATE" pattern="yyyy-MM-dd" var="formatedDate"/>
                            <fmt:formatDate value="${formatedDate}" pattern="dd/MM/yyyy" type="DATE"/>

                        </td>
                    </tr>
                </c:if>
            <c:if test="${empty demande}">
                <tr>
                    <td colspan='3' class='text-center bg-light'><spring:message code="label.AucunResultat"/></td>
                </tr>
            </c:if>
            </tbody>
        </table>

    </c:when>
    <c:when test="${type=='Installation'}">
        <table class="my_table border border-dark table text-center" id="tabinfo" style="width: 100%;text-align:center;border: 1px solid black;border-collapse: collapse;">
            <thead class="th_vert">
            <tr>
                <th><spring:message code="label.Numerodedemande"/></th>
                <th><spring:message code="label.RaisonSocial"/></th>
                <th ><spring:message code="label.Visites"/></th>
            </tr>
            </thead>
            <tbody >
            <c:if test="${not empty installation}">
                <tr>
                    <td class="p-2">${empty installation.num_demande?' - ':installation.num_demande}</td>
                    <td class="p-2">${empty installation.raison?' - ':installation.raison}</td>
                    <td class="p-2"><fmt:formatDate pattern="dd/MM/yyyy" value="${empty installation.visite.date_visite?' - ':installation.visite.date_visite}"/></td>
                </tr>
            </c:if>
            <c:if test="${empty installation}">
                <tr>
                    <td colspan='3' class='text-center bg-light'><spring:message code="label.AucunResultat"/></td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </c:when>
    <c:when test="${type=='Collecte'}">
        <table class="my_table border border-dark table text-center" id="tabinfo" style="width: 100%;text-align:center;border: 1px solid black;border-collapse: collapse;">
            <thead class="th_vert">
            <tr>
                <th><spring:message code="label.Numerodedemande"/></th>
                <th><spring:message code="label.RaisonSocial"/></th>
                <th ><spring:message code="label.Reunion"/></th>
            </tr>
            </thead>
            <tbody >
            <c:if test="${not empty collecte}">
                    <tr>
                        <td class="p-2">${empty collecte.num_demande?' - ':collecte.num_demande}</td>
                        <td class="p-2">${empty collecte.raison?' - ':collecte.raison}</td>
                        <td class="p-2">
                            <fmt:parseDate value="${empty collecte.reunions.get(collecte.reunions.size()-1).date_reunion?' - ':collecte.reunions.get(collecte.reunions.size()-1).date_reunion}" type="DATE" pattern="yyyy-MM-dd" var="formatedDate"/>
                            <fmt:formatDate value="${formatedDate}" pattern="dd/MM/yyyy" type="DATE"/>
                        </td>
                    </tr>
            </c:if>
            <c:if test="${empty collecte}">
                <tr>
                    <td colspan='3' class='text-center bg-light'><spring:message code="label.AucunResultat"/></td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </c:when>

    <c:otherwise>
        <table class="table my_table">
            <tr>
                <td class='text-center bg-light'><spring:message code="label.AucunResultat"/></td>
            </tr>
        </table>

    </c:otherwise>
</c:choose>


