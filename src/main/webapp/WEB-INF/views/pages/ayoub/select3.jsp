<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

    <div class="col-auto" id="regionparprefecture">
        <label><spring:message code="label.ville"/> </label>
        <select id="prefecture" class="form-control"  style="width: 100%">
            <option value="0" selected="selected"><spring:message code="label.Choisir"/> </option>
            <c:if test="${not empty prefectures}">
                <c:forEach items="${prefectures}" var="p">
                    <option value="${p.id_prefecture}" >${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
                </c:forEach>
            </c:if>
        </select>
    </div>



