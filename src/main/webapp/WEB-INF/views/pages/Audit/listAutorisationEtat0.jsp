
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>

<div style="margin-top: 123px;" class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><spring:message code='label.DetailsOperation'/></h5>
                <button type="button" class="close" onclick="close_modal(this)" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="accordion" id="accordionExample">
                    <div class="card">
                        <div class="card-header" id="headingOne" style=" border-left: 4px solid #f38787;">
                            <h5 class="mb-0">
                                <a class="btn text-left" style="color: #f38787!important;" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <i class="fa fa-angle-double-right mr-3"></i><span style="color: #f38787">historiques</span>
                                </a>
                            </h5>
                        </div>

                        <div id="collapseOne" class="collapse show fade" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div class="card-body">
                                <c:if test="${not empty old}">
                                    <table class="table table-striped hover compact table-bordered text-md-nowrap">
                                    <thead style="background-color: gray">
                                    <th class="text-center text-white">Numéro de la demande</th>
                                    <th class="text-center text-white">Acteur</th>
                                    <th class="text-center text-white">Date de l'action</th>
                                    <th class="text-center text-white">Statut du projet</th>
                                    <th class="text-center text-white">Historiques</th>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${old}" var="o">
                                        <tr>
                                            <td>${o.num_aut}</td>
                                            <td>${o.compte.nom}</td>
                                            <javatime:format value="${o.dateAction}" pattern="dd-MM-yyyy HH:mm:ss" var="dateAction" />
                                            <td>${dateAction}</td>
                                            <td>${o.statut.nom_fr}</td>
                                            <td>${o.action}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                </c:if>
                                <c:if test="${empty old}">
                                   <span>Aucune Résultat !!!</span>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTwo" style=" border-left: 4px solid #65c465">
                            <h5 class="mb-0">
                                <a class="btn collapsed text-left" style="color: #65c465!important;" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fa fa-angle-double-right mr-3"></i><span style="color: #65c465">état actuelle </span>
                                </a>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <div class="card-body">
                                <table class="table table-striped hover compact table-bordered text-md-nowrap">
                                    <thead style="background-color: gray">
                                    <th class="text-center text-white">Numéro de la demande</th>
                                    <th class="text-center text-white">Pétitionnaire</th>
                                    <th class="text-center text-white">Date de l'action</th>
                                    <th class="text-center text-white">Statut du projet</th>
                                    <th class="text-center text-white">Historiques</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>${nn.num_aut}</td>
                                        <td>${nn.compte.nom}</td>
                                        <td>${nn.dateAction}</td>
                                        <td>${nn.statut.nom_fr}</td>
                                        <td>${nn.action}</td>
                                    </tr>
                                    </tbody>
                                </table>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="close_modal(this)"><spring:message code='label.Fermer'/></button>

            </div>
        </div>
    </div>
</div>

<script>
    function close_modal(val) {
        $(val).closest(".modal").modal('hide');
    }
</script>

