<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<div class="col-auto" id="autorisationpartransporteur">
    <label><spring:message code="label.Societe"/> </label>
    <select id="transporteur" class="form-control"  style="width: 100%">
        <option value="0" selected="selected"><spring:message code="label.Choisir"/> </option>
        <c:if test="${id_dang==1}">
            <c:if test="${not empty transporteurParams}">
                <c:forEach items="${transporteurParams}" var="s">
                    <option value="${s.id_transporteurParam}" >${s.nom}</option>
                </c:forEach>
            </c:if>
        </c:if>
        <c:if test="${id_dang==2}">
            <c:if test="${not empty transporteurEtrangers}">
                <c:forEach items="${transporteurEtrangers}" var="s">
                    <option value="${s.id_TransporteurEtranger}" >${s.raison_social}</option>
                </c:forEach>
            </c:if>
        </c:if>
    </select>
</div>
<div class="col-auto" id="autorisationparzonnefranche">
    <label><spring:message code="label.ZonneFranche"/> </label>
    <select id="zonneFranche" class="form-control"  style="width: 100%">
        <option value="0" selected="selected"><spring:message code="label.Choisir"/> </option>
        <c:if test="${not empty zonneFranche}">
            <c:forEach items="${zonneFranche}" var="s">
                <option value="${s.id_zonnefranche}" >${pageContext.response.locale=='ar'?s.nom_ar:s.nom_fr}</option>
            </c:forEach>
        </c:if>
    </select>
</div>


