<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="card-body">
    <div class="row mb-2">
        <div class="col-12">
            <div class="panel-body table-responsive">
                <table class="table table-hover">
                    <thead>
                    <tr class="active">
                        <th><spring:message code="label.code"/></th>
                        <th><spring:message code="label.type"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${collecte.code}" var="code">
                        <tr>
                            <td>${code.nom_fr}</td>
                            <td>${code.nom_ar}</td>
                        </tr>
                    </c:forEach>
                    <c:forEach items="${collecte.codeTmp2}" var="code">
                        <tr style="background-color: #fa92a5">
                            <td>${code.nom_fr}</td>
                            <td>${code.nom_ar}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty collecte.code}">
                        <tr>
                            <td colspan="2"><spring:message code="label.Ilnyaaucuneenregistrement"/></td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


