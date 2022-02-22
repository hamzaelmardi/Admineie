<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>

<table class="my_table table table-striped table-bordered table-hover">
    <thead class="bg-primary text-white">
    <tr>
        <th><spring:message code="label.Datedevisite"/></th>
        <th><spring:message code="label.Site"/></th>
        <th><spring:message code="label.Objet"/></th>
        <th><spring:message code="label.PVdevisite"/></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${demande.visites}" var="vis">
        <tr>
            <td>${vis.visite_date}</td>
            <td>${vis.visite_site}</td>
            <td>${vis.visite_objet}</td>
            <td>
                <c:if test="${not empty vis.visite_url}">
                    <a href="${vis.visite_url}" class="btn btn-primary" target="_blank" download>
                        <span class="fa fa-download"></span>
                    </a>
                </c:if>
                <c:if test="${empty vis.visite_url}">
                    <button class="btn btn-primary" onclick="AttacherPV('${vis.id_visite_AE}')">
                        <spring:message code="label.AttacherlePV"/>
                    </button>
                </c:if>
            </td>
            <div class="modal fade"
                 id="AttachePV${vis.id_visite_AE}"
                 tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered"
                     role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"> <spring:message code="label.AttacherPVdevisite"/> </h5>
                            <button onclick="close_modal(this)" type="button"
                                    class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row justify-content-center">
                               <div class="form-group">
                                   <label><spring:message code="label.AttacherlePV"/></label>
                                   <input data-id="${demande.id_demande_information}" class="form-control" type="file" onchange="set_file_vosite('${vis.id_visite_AE}',this)">
                               </div>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button onclick="close_modal(this)" type="button"
                                    class="btn btn-secondary"
                                    data-dismiss="modal"><spring:message
                                    code="button.Fermer"/></button>
                        </div>
                    </div>
                </div>
            </div>
        </tr>
    </c:forEach>
    </tbody>
</table>


