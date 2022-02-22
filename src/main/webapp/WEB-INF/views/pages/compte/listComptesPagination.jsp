<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../includes/tag.jsp" />

<c:choose>
    <c:when test="${type.equals('ZF') || type.equals('ET') || type.equals('TR') || type.equals('XD')}">
        <c:set var="idA" value="${nt.id_notification}"/>
    </c:when>
    <c:when test="${type.equals('CT')}">
        <c:set var="idA" value="${nt.id_collecte}"/>
    </c:when>
    <c:when test="${type.equals('IT')}">
        <c:set var="idA" value="${nt.id_installation}"/>
    </c:when>
    <c:otherwise>
        <c:set var="idA" value="${nt.id_demande_information}"/>
    </c:otherwise>
</c:choose>
<div class="row">
    <div class="col-lg-1"></div>
    <div class="col-md-10  col-sm-12 col-lg-10 btn-warnings " style="border: 1px #80808024 solid ;">
        <div class="col-lg-10 col-sm-8 col-md-8 divMarges"><spring:message
                code="label.Email"/></div>
        <div class="col-lg-2 col-sm-4 col-md-4 divMarges"><spring:message
                code="label.Action"/></div>
    </div>
    <div class="col-lg-1"></div>
</div>
<c:forEach items="${listeCompte }" var="cpt">
    <c:if test="${cpt.compteId!=user.compteId}">
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-md-10 col-sm-12 col-lg-10 btn-warningBody padBot  "
                 style="border: 1px #80808024 solid ;">
                <div class="col-lg-10 col-sm-8 col-md-8 bordRight">${cpt.email }</div>
                <div class="col-lg-2 col-sm-4 col-md-4 mt-2">
                    <input type="radio" name="inputR" id="input${cpt.compteId }"
                        ${cpt.compteId==nt.compteAffecte.compteId?'checked disabled':''}
                        onchange="affectNotif('${idA}','${cpt.compteId }','${type}')">
                    <label for="input${cpt.compteId }"></label>
                </div>
            </div>
            <div class="col-lg-1"></div>
        </div>
    </c:if>
</c:forEach>
<c:choose>
    <c:when test="${listeCompte!='[]'}">
        <div class="pagination pagination-lg justify-content-center mt-3" dir="ltr">
            <c:if test="${(pagee)>0}">
                <c:set value="${pagee-1}" var="page_db"/>
                <c:set value="${totalPagee-1}" var="page_LAST"/>
            </c:if>
            <c:if test="${(pagee)<=0}">
                <c:set value="0" var="page_db"/>
                <c:set value="0" var="page_LAST"/>
            </c:if>

            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listComptes(0,6,'${type}',${idA})" class="pageStyle"><i class="mdi mdi-arrow-collapse-left m-0"></i></a>
            <a  style="background-color: #206c45 !important;" onclick="listComptes(${page_db},6,'${type}',${idA})" class="pageStyle">&laquo;</a>

            <c:set var="salary" value="${totalPagee-pagee-1}"/>
            <c:choose>
                <c:when test="${salary>5 }">
                    <c:set var="toAdd" value="3"/>
                </c:when>
                <c:otherwise>
                    <c:set var="toAdd" value="${totalPagee-pagee-1}"/>
                </c:otherwise>
            </c:choose>

            <c:if test="${totalPagee>0}">
                <c:forEach begin="${pagee}" end="${pagee+toAdd}" var="c">
                    <a style="background-color: #206c45 !important;" onclick="listComptes(${c},6,'${type}',${idA})"  ${c==number ? 'class="  pageStyle"' : 'class=" pageStyle1"'}>${c+1}</a>
                </c:forEach>
            </c:if>
            <c:if test="${(pagee)>=(totalPagee-1)}">
                <c:set value="${totalPagee-1}" var="page_end"/>
            </c:if>

            <c:if test="${(pagee)<(totalPagee-1)}">
                <c:set value="${pagee+1}" var="page_end"/>
            </c:if>

            <a style="background-color: #206c45 !important;" onclick="listComptes(${page_end},6,'${type}',${idA})" class="pageStyle">&raquo;</a>
            <a style="background-color: #206c45;text-align: center;background-size: 100% 100%" onclick="listComptes(${totalPagee-1},6,'${type}',${idA})" class="pageStyle"><i class="mdi mdi-arrow-collapse-right m-0"></i></a>

        </div>
    </c:when>
    <c:otherwise>

        <h4 style="color:#1A6896;text-align: center"><spring:message
                code="label.Ilnyaaucuneenregistrement"/></h4>
    </c:otherwise>
</c:choose>
<script>

    function listComptes(page,size,type,id) {
        $.ajax({
            url: "/api/getListComptes/"+page+"/"+size+"/"+type+"/"+id,
            type: "GET",

            data: {
            },

            success: function (response) {
                $(".tableComptes").html(response);
            },
            error: function (response) {

            }
        });
    }
</script>