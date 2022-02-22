<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<select name="souscategorie_id" id="souscategorie_id" class="form-control select2" multiple>
    <c:forEach items="${souscategorie}" var="p">
        <option <c:forEach items="${demande.sousCategories}" var="pp">
            ${pp.id_souscategorie==p.id_souscategorie?"selected":""}
        </c:forEach> value="${p.id_souscategorie}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
    </c:forEach>
</select>
