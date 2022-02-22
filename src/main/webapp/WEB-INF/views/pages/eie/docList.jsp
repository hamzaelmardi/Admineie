
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="modal fade" id="getModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Les Documents</h5>
                <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <div class="row " style="background: gray;color: white;border-color: #737373;" >

                            <div class="col-10 border p-2 font_bold btn-gris">

<%--                               <spring:message code="label.Designation"/> Désignation--%>
                                 Désignation
                            </div>
                            <div class="col-2 border p-2 font_bold btn-gris">
<%--                                <spring:message code="label.Fichier"/> Fichier--%>
                                   Fichier
                            </div>
                        </div>


                        <c:if test="${not empty docNT}">
                            <c:forEach items="${docNT}" var="d">
                                <div class="row">
                                    <div class="col-10 border p-2">
                                        <div class="form-group text-left">
                                            <label> ${d.docImport.nom_fr}</label>
                                        </div>
                                    </div>
                                    <div class="col-2 border p-2">
                                        <div class="form-group text-left">
                                            <a class="btn btn-primary btn-block " download href="${url}${fn:replace(d.url, "/assets/myFile/", "/dowload_uploaded/")}" ><span class="fa fa-download" ></span></a>
                                        </div>
                                    </div>

                                </div>
                            </c:forEach>
                        </c:if>

                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button onclick="close_modal(this)" type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>