
<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<table class="table tablee table-hover">
    <thead>
    <tr>


        <th class="text-center"><spring:message code="label.Lieudelimination" /></th>
        <th class="text-center"><spring:message code="label.Classification" /></th>
        <th class="text-center"><spring:message code="label.TELfax"/></th>
        <th class="text-center"><spring:message code="label.datededelivrance"/></th>
        <th class="text-center"><spring:message code="label.Action" /></th>

    </tr>
    </thead>
    <tbody class="tbodyy">

    <c:forEach items="${listF}" var="f">

        <tr id="tr-${f.id_lieuElimination}">

                <%-- <td>${f.nom_fr}</td> --%>
            <td>${f.nom_fr}</td>
            <td>${f.classification[lng]}</td>
            <td>${f.tel}</td>
            <td>${f.dateD}</td>

            <td class="text-center" style="width: 15%">
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <button onclick="updateLieuElimination(${f.id_lieuElimination})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                            <div class="icon_trash_1">
                                <span class="fas fa-pencil-alt" style="color: orange"></span>
                            </div>

                        </button>
                    </li>
                    <li class="list-inline-item">
                        <button onclick="deleteLieuElimination(${f.id_lieuElimination})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
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