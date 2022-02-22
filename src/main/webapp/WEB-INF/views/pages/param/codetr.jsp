<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>


<table class="table tablee">
    <thead>
    <tr>
        <th class="text-center"><spring:message code="label.Code"/></th>
        <th class="text-center"><spring:message code="label.Typededechet"/></th>
        <th class="text-center"><spring:message code="label.Classification"/></th>
        <th class="text-center"><spring:message code="label.Action"/></th>
    </tr>
    </thead>
    <tbody class="tbodyy">

    <c:forEach items="${listF}" var="f">

        <tr id="tr-${f.id_code}">

            <td class="font-monospace">${f.nom_fr}</td>
            <td class="font-monospace">${f.nom_ar}</td>
            <td class="font-monospace">${f.classification[lng]}</td>

            <td class="text-center" style="width: 15%">
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <button onclick="editCode(${f.id_code})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                            <div class="icon_trash_1">
                                <span class="fas fa-pencil-alt" style="color: orange"></span>
                            </div>

                        </button>
                    </li>
                    <li class="list-inline-item">
                        <button onclick="deleteCode(${f.id_code})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
                            <div class="icon_trash_1">
                                <span class="fas fa-trash" style="color: red"></span>
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
    <c:when test="${listF!='[]'}"> <div class="text-center" dir="ltr">

    </c:when>
    <c:otherwise>

        <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
    </c:otherwise>
</c:choose>