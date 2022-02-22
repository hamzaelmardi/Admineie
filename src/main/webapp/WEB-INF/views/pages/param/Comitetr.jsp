<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



<table class="table tablee">
    <thead>
    <tr>
        <th class="text-center"><spring:message code="label.Membresdecomite" /></th>
        <th class="text-center"><spring:message code="label.Email"/></th>
        <th class="text-center"><spring:message code="label.Adresse"/></th>
        <th class="text-center"><spring:message code="label.TelFax"/></th>
        <th class="text-center"><spring:message code="label.Type"/></th>
        <th class="text-center"><spring:message code="label.Region"/></th>
        <th class="text-center"><spring:message code="label.Permanent"/></th>
        <th class="text-center"><spring:message code="label.Action"/></th>
    </tr>
    </thead>
    <tbody class="tbodyy">

    <c:choose>
        <c:when test="${pageContext.response.locale=='ar'}">
            <c:set var="lng" value="nomComite_ar"/>
        </c:when>
        <c:otherwise>
            <c:set var="lng" value="nomComite_fr"/>
        </c:otherwise>
    </c:choose>

    <c:forEach items="${comiteP}" var="f">

        <tr id="tr-${f.comiteId}">
            <td class="font-monospace">${f[lng]}</td>
            <td class="font-monospace">${f.email}</td>
            <td class="font-monospace">${f.adresse}</td>
            <td class="font-monospace">${f.tel}</td>
            <td class="font-monospace">${f.type.equals("1")?"Régionale":"Nationale"}</td>
            <td class="font-monospace">${f.region.nom_fr}</td>
            <td class="font-monospace">
                <c:if test="${f.permanent.equals('non')}">
                    <spring:message code="label.Non"/>
                </c:if>
                <c:if test="${f.permanent.equals('oui')}">
                    <spring:message code="label.Oui"/>
                </c:if>
            </td>
            <td>
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <button onclick="editComite(${f.comiteId})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white;">
                            <div class="icon_trash_1">
                                <span class="fas fa-pencil-alt" style="color: orange; font-size: 18px"></span>
                            </div>

                        </button>
                    </li>
                    <li class="list-inline-item">
                        <button onclick="deleteComite(${f.comiteId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white;">
                            <div class="icon_trash_1">
                                <span class="fas fa-trash" style="color: red; font-size: 18px"></span>
                            </div>
                        </button>
                    </li>
                </ul>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

<c:choose>
    <c:when test="${comiteP!='[]'}"> <div class="text-center" dir="ltr">

    </c:when>
    <c:otherwise>

        <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
    </c:otherwise>
</c:choose>