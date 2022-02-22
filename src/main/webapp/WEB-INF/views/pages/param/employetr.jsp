
<jsp:include page="../../includes/tag.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:forEach items="${listF}" var="f">
    <tr id="tr-${f.empId}">


        <td>${f.nom}</td>
        <td>${f.adresse}</td>
        <td>${f.tel}</td>
        <td>${f.departement.departementnom}</td>

        <td style="display:flex;">
            <!-- Modal -->
            <div style="margin-top: 123px;" class="modal fade" id="idModal${f.empId }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-lg " role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"><spring:message code='label.Details'/></h5>
                            <button type="button" class="close" onclick="hideModal(${f.empId })" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row" >
                                <div class="col-2" >nom :</div>
                                <div class="col-10" >${f.nom}</div>
                                <div class="col-2" >tel :</div>
                                <div class="col-10" >${f.tel}</div>
                                <div class="col-2" >adresse :</div>
                                <div class="col-10" >${f.adresse}</div>
                                <div class="col-2" >departement :</div>
                                <div class="col-10" >${f.departement.departementnom}</div>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" onclick="hideModal(${f.empId })" ><spring:message code='label.Fermer'/></button>

                        </div>
                    </div>
                </div>
            </div>
            <button type="button" class="btn btn-primary" onclick="showdetail(${f.empId })">
                <spring:message code='label.Details'/>
            </button>

        </td>
        <td class="text-center">
            <ul class="list-inline m-0">
                <li class="list-inline-item">
                    <button onclick="editemp(${f.empId})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                        <div class="icon_trash_1">
                            <span class="fa fa-edit" style="color: orange"></span>
                        </div>

                    </button>
                </li>
                <li class="list-inline-item">
                    <button onclick="deleteemp(${f.empId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
                        <div class="icon_trash_1">
                            <span class="fas fa-trash" style="color: red"></span>
                        </div>
                    </button>
                </li>
            </ul>
        </td>
    </tr>
</c:forEach>





