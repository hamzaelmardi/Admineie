<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h5 class="mx-2"> ${inst.type.equals('1')?'La liste des déchets exclus par le pétitionnaire':'La liste des déchets exclus par l\'admin'}</h5>
<div class="d-block h-100 my_rows">
    <div class="row pb-2 m-0" id="my_rows">
        <table class="table table-striped">
            <thead>
            <tr>
                <th><spring:message code="label.Typededechet"/></th>
                <th><spring:message code="label.Action"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${inst.code}" var="code_colle" varStatus="loopp" >
                <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
                    <td class="col-8">${code_colle.nom_ar}</td>
                    <td class="col-4 p-2 text-center">
                        <button class="btn btn-success rounded-circle"
                                disabled style="cursor: not-allowed">
                            <span class="fa fa-times"></span></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <input type="hidden" value="${empty inst.codeTmp?'true':'false'}" id="is_empty">
            <c:forEach items="${inst.codeTmp}" var="code_colle" varStatus="loopp" >
                <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
                    <td class="col-8">${code_colle.nom_ar}</td>
                    <td class="col-4 p-2 text-center">
                        <button class="btn btn-success rounded-circle"
                                onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                            <span class="fa fa-times"></span></button>
                    </td>
                </tr>
            </c:forEach>
            </tfoot>
        </table>
    </div>
</div>