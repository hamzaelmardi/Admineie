<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="card-body">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label><spring:message code="label.Nombredevehicule"/></label>
                <input disabled type="text" class="form-control" value="${collecte.nombre_vehicule}">
            </div>
        </div>
        <div class="col-md-6 col-sm-12">
            <div class="form-group">
                <label><spring:message code="label.Nombredeconteneur"/></label>
                <input disabled type="text" class="form-control" value="${collecte.nombre_conteneur}">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 panel-body" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="table-responsive">
                <table class="table mon_table responsive table-hover">
                    <thead>
                    <tr class="active">
                        <th><spring:message code="label.NMatriculation"/></th>
                        <th><spring:message code="label.NChassis"/></th>
                        <th><spring:message code="label.Poidstotalencharge"/></th>
                        <th><spring:message code="label.Poidsnetduvehicule"/></th>
                        <th><spring:message code="label.Typedevehicule"/></th>
                        <th><spring:message code="label.Typedeconteneur"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listVehicules}" var="v">
                        <tr>
                            <td>${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto} - ${v.num_mat_id_prefect}</td>
                            <td>${v.num_chassis}</td>
                            <td>${v.poit_totale_charge}</td>
                            <td>${v.point_net}</td>
                            <td>${v.typeVehicule}</td>
                            <td>${v.typeConteneur}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${ empty listVehicules}">
                        <tr>
                            <td colspan="6" class="bg-primary text-center"><spring:message code="label.AucunVehicule"/></td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


