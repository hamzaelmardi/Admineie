<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<div class="p-0 m-0">
    <c:forEach items="${demande.documents_AE}" var="d">
        <div class="col-sm-12" >
            <div class="form-group text-left">
                <label>
                   <spring:message code="label.Descriptiondudocument"/>
                </label>
                <div class="row p-0">
                    <div class="col-10 pr-0">
                        <input type="text" class="form-control file_name" value="${d.nom_fr}" disabled>
                    </div>
                    <div class="col-2 pl-3">
                        <div class="row">
                            <div class="col-12">
                                <button onclick="delete_doc('${d.id_documents_ae}','${demande.id_demande_information}')" class="btn btn-danger-2 btn-block btn-sm pt-1"><span class="fa fa-minus"></span></button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </c:forEach>
    <div class="col-sm-12" >
        <div class="form-group text-left">
            <label>
                <spring:message code="label.Descriptiondudocument"/>
            </label>
            <div class="row p-0">
                <div class="col-10 pr-0">
                    <input type="text" id="fiel_name" class="form-control file_name">
                </div>
                <div class="col-2 pl-3">
                    <div class="row">
                        <div class="col-12">
                            <button onclick="save_doc_AE('${demande.id_demande_information}')" class="btn btn-primary-2 btn-block btn-sm pt-1"><span class="fa fa-check"></span></button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>


