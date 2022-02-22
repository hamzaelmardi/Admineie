<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<c:choose>
    <c:when test="${not empty statuts}">
		<option value="0" selected="selected">Choisir</option>
	    <c:forEach items="${statuts}" var="s">
	    	<option value="${s.id_statut_projet}" >${s.nom_fr}</option>
	    </c:forEach>
    </c:when>
</c:choose>
