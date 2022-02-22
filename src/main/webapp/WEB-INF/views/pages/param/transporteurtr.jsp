<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<table class="table tablee table-hover" >
    <thead>
    <tr>
        <th class="text-center"><spring:message code="label.Transporteur"/></th>
        <th class="text-center"><spring:message code="label.Adresse"/></th>
        <th class="text-center"><spring:message code="label.Telephone"/></th>
        <th class="text-center"><spring:message code="label.Fax"/></th>
        <th class="text-center"><spring:message code="label.dateExpiration"/></th>
        <th class="text-center"><spring:message code="label.typededechet"/></th>
        <th class="text-center"><spring:message code="label.MoyendeTransport"/></th>
        <th class="text-center"><spring:message code='label.numerodelautorisation'/></th>
        <th class="text-center"><spring:message code="label.Action"/></th>
    </tr>
    </thead>
    <tbody class="tbodyy">
    <c:forEach items="${listF}" var="f">
        <tr id="tr-${f.id_transporteurParam}">
            <td>${f.nom}</td>
            <td>${f.adresse}</td>
            <td>${f.tel}</td>
            <td>${f.fax}</td>
            <td><fmt:formatDate pattern="dd/MM/yyyy" dateStyle="long" value="${f.dateFin }"/></td>
            <td class="text-center">
                <c:if test="${not empty f.code}">
                    <button class="btn btn-primary btn-sm rounded-circle tab_eye" onclick="show_code('${f.id_transporteurParam}')">
                        <span class="fa fa-dumpster"></span>
                    </button>
                </c:if>
                <c:if test="${empty f.code}">
                                                <span class="f-12">
                                                    <spring:message code="label.Aucuncodenestenregistre" />
                                                </span>
                </c:if>
            </td>
            <td class="text-center">
                <c:if test="${not empty f.moyenTransport}">
                    <button class="btn btn-primary btn-sm rounded-circle tab_eye" onclick="show_moyen('${f.id_transporteurParam}')">
                        <span class="fa fa-truck"></span>
                    </button>
                </c:if>
                <c:if test="${empty f.moyenTransport}">
                                                <span class="f-12">
                                                    <spring:message code="label.Aucunmoyentransportnestenregistre" />
                                                </span>
                </c:if>
            </td>
            <td>${f.numero_autorisation}</td>
            <td class="text-center" style="width: 100px !important;">
                <ul class="list-inline m-0">
                    <li class="list-inline-item">
                        <button onclick="editTransporteur(${f.id_transporteurParam})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                            <div class="icon_trash_1">
                                <span class="fas fa-pencil-alt" style="color: orange"></span>
                            </div>

                        </button>
                    </li>
                    <li class="list-inline-item">
                        <button onclick="deleteTransporteur(${f.id_transporteurParam})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
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

            <select class="custom-select" id="optionselected" onchange="getParamT(this.value)" style="margin: auto; width: 100px" >

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




    </div></c:when>
    <c:otherwise>

        <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
    </c:otherwise>
</c:choose>
