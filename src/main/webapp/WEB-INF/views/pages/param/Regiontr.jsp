
<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<table class="table tablee ">
    <thead>
    <tr>
        <th class="text-center"><spring:message code="label.Region" /></th>
        <th class="text-center"><spring:message code="label.Prefecture" /></th>
        <th class="text-center"><spring:message code="label.Action" /></th>
    </tr>
    </thead>
    <tbody class="tbodyy">

    <c:choose>
        <c:when test="${pageContext.response.locale=='ar'}">
            <c:set var="lng" value="nom_ar"/>
        </c:when>
        <c:otherwise>
            <c:set var="lng" value="nom_fr"/>
        </c:otherwise>
    </c:choose>


    <c:forEach items="${listF}" var="f">

        <tr id="tr-${f.regionId}">

            <td>${f[lng]}</td>

            <td style="text-transform: lowercase"><c:forEach items="${f.prefecture}" var="p">
                ${p.nom_fr}
            </c:forEach> </td>

            <td class="text-center">
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <button onclick="editRegion(${f.regionId})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                            <div class="icon_trash_1">
                                <span class="fas fa-pencil-alt" style="color: orange"></span>
                            </div>

                        </button>
                    </li>
                    <li class="list-inline-item">
                        <button onclick="deleteRegion(${f.regionId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
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
        <c:if test="${(page)>0}">
            <c:set value="${page-1}" var="page_db"/>
            <c:set value="${totalPage-1}" var="page_LAST"/>
        </c:if>
        <c:if test="${(page)<=0}">
            <c:set value="0" var="page_db"/>
            <c:set value="0" var="page_LAST"/>
        </c:if>


        <c:set var = "salary"  value = "${totalPage-page-1}"/>
        <c:choose>
            <c:when test="${salary>5 }">
                <c:set var = "toAdd"  value = "5"/>
            </c:when>
            <c:otherwise>
                <c:set var = "toAdd"  value = "${totalPage-page-1}"/>
            </c:otherwise>
        </c:choose>

        <c:if test="${totalPage>0}">

            <select class="custom-select" id="optionselected" onchange="getParamf(this.value)" style="margin: auto; width: 100px" >

                <c:forEach begin="${page}" end="${totalPage-1}" var="c">
                    <option  value="${c}"   ${c==number ? 'selected' : ''} >
                            ${c+1}
                    </option>
                </c:forEach>

            </select>

        </c:if>
        <c:if test="${(page)>=(totalPage-1)}">
            <c:set value="${totalPage-1}" var="page_end"/>
        </c:if>

        <c:if test="${(page)<(totalPage-1)}">
            <c:set value="${page+1}" var="page_end"/>
        </c:if>




    </c:when>
    <c:otherwise>

        <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
    </c:otherwise>
</c:choose>