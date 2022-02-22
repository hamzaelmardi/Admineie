<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="modal fade" id="getModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
        <div class="modal-content" style="margin-top: 10%">
            <div class="modal-header">
                <h5 class="modal-title" id=""><spring:message code="label.Droitdacces"/> </h5>
                <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row justify-content-center">
                    <div class="col-10">
                        <input class="custom-control custom-checkbox custom-switch" type="hidden" id="profil" value="${Profil.profilId}">
                        <table class="table table-bordered striped mg-b-0 text-md-nowrap">
                        <thead style="background-color: grey">
                        <tr style="color: whitesmoke">
                            <th><spring:message code="label.Fonctionalite"/></th>
                            <th><spring:message code="label.Afficher"/></th>
                        </tr>
                        </thead>
                            <tbody >
                        <c:forEach items="${role}" var="r" >
                            <tr>
                                <td>${r.nom}</td>
                                <c:if test="${r.nomFr.equals('ROLE_ADMIN')}">
                                    <td><input class="custom-checkbox" type="checkbox" id="check_All" onchange="checkAll()" checked></td>
                                </c:if>
                                <c:if test="${!r.nomFr.equals('ROLE_ADMIN')}">
                                    <td><input class="checkall custom-checkbox" type="checkbox" id="check${r.roleId}" onchange="addRole(${r.roleId})" checked></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <c:forEach items="${roles}" var="r" >
                            <tr>
                                <td>${r.nom}</td>
                                <c:if test="${r.nomFr.equals('ROLE_ADMIN')}">
                                    <td><input class=" custom-checkbox" type="checkbox" id="check_All" onchange="checkAll()" ></td>
                                </c:if>
                                <c:if test="${!r.nomFr.equals('ROLE_ADMIN')}">
                                    <td><input class="checkall custom-checkbox" type="checkbox" id="check${r.roleId}" onchange="addRole(${r.roleId})" ></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


            </div>
            <div class="modal-footer">
                <button onclick="close_modal(this)" type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="label.Fermer"/></button>
            </div>
        </div>
    </div>
</div>

<script>

    function addRole(id){
        var action="ajouter";
        var profil=$("#profil").val();

        if($('#check' + id).is(":checked")==true){

        }
        else{
            action="supprimer";
        }
        $.ajax({
            url :"/api/actionProfil/"+action+"/"+id+"/"+profil,
            type :"POST",

            success : function(response) {

            },
            error : function(response) {
                alert("error");
            }
        });
    }

    function checkAll(){
        var action="add";
        var profil=$("#profil").val();

        if($('#check_All').is(":checked")==true){
            $(".checkall").prop("checked",true);
        }
        else{
            action="delete";
            $(".checkall").prop("checked",false);
        }
        $.ajax({
            url :"/api/addProfilInfo/"+action+"/"+profil,
            type :"POST",

            success : function(response) {

            },
            error : function(response) {
                alert("error");
            }
        });
    }

    function close_modal(val) {
        $(val).closest(".modal").modal('hide');
    }

</script>
