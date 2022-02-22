<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<c:forEach items="${docNotifs}" var='d'>
    <div class="row ">
        <div class="col-10 border border-1 m-0 p-0">
            <div class="form-group text-left pt-3 pl-2">
                <label> <spring:message
                        code="label.EnquetePublique"/>
                    de ${d.docImport.nom_fr} </label>

            </div>
        </div>
        <div class="col-2  border border-1 m-0 p-0">
            <div class="form-group">
                <a href="${fn:replace(d.url, "/assets/myFile/", "/dowload_uploaded/")}"
                   class="btn btn-success rounded file_existe"><span
                        class="fa fa-download"></span></a>
            </div>
        </div>
    </div>
</c:forEach>