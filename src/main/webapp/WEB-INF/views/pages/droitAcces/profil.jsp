

<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../menu/menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="main-panel " style="margin-top:70px">
    <div class="content-wrapper">
        <div class="row" style="margin-top: 100px;display:flex;">
            <div class="col-md-3 col-sm-12 col-lg-3" >
            </div>
            <div class="col-md-6 card p-4 col-sm-12 col-lg-6">
                        <div class="" style="height: 70px; display: flex; justify-content: center;background-color: #206c45">
                            <div class="col-md-12 my-4 text-center">
                                <strong class="profil text-white"><spring:message code="label.Nouveauprofil"/><i class="ml-2 fa fa-user"></i></strong><br>
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-md-12 col-sm-12 col-lg-12" >
                        <div class="form-group">
                            <label><spring:message code="label.Designation"/></label>
                            <input class="form-control" type="hidden" name="profil" id="profil" value="${Profil.profilId}">
                            <input class="form-control" type="text" name="nom" id="nom" value="${Profil.nom}" required>
                        </div>

                        <div class="form-group">
                            <label><spring:message code="label.Details"/></label>
                            <textarea class="form-control" type="text" name="detail" id="detail" rows="3">${Profil.detail}</textarea>
                        </div>
                            <button id="button" class="btn btn-success float-right" onclick="save()"><b>+</b><spring:message code="label.Ajouter"/></button>

                            </div>

                        </div>
                            <br>
                            <div class="table" id="table" style="display: none">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive">
                                        <table class="table table-bordered striped mg-b-0 text-md-nowrap">
                                            <thead style="background-color: grey">
                                            <tr class="bgMyColor text-white">
                                                <th><spring:message code="label.Fonctionalite"/></th>
                                                <th><spring:message code="label.Afficher"/></th>
                                            </tr>
                                            </thead>
                                            <tbody >
                                            <c:forEach items="${role}" var="r" >
                                                <tr>
                                                    <td>${r.nom}</td>
                                                    <c:if test="${r.nomFr.equals('ROLE_ADMIN')}">
                                                        <td><input type="checkbox" id="check_All" onchange="checkAll()" checked></td>
                                                    </c:if>
                                                    <c:if test="${!r.nomFr.equals('ROLE_ADMIN')}">
                                                        <td><input class="checkall" type="checkbox" id="check${r.roleId}" onchange="addRole(${r.roleId})" checked></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>
                                            <c:forEach items="${roles}" var="r" >
                                                <tr>
                                                    <td>${r.nom}</td>
                                                    <c:if test="${r.nomFr.equals('ROLE_ADMIN')}">
                                                        <td><input type="checkbox" id="check_All" onchange="checkAll()" ></td>
                                                    </c:if>
                                                    <c:if test="${!r.nomFr.equals('ROLE_ADMIN')}">
                                                        <td><input class="checkall" type="checkbox" id="check${r.roleId}" onchange="addRole(${r.roleId})" ></td>
                                                    </c:if>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>

                                    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row justify-content-center sw">
                                <div class="col-3 toolbar">
                                    <button class="btn sw-btn-next btn-danger-2 rounded btn-block" onclick="goToList()"><spring:message code="label.Retour"/></button>
                                </div>
                            </div>
            <div class="col-md-1 col-sm-12 col-lg-1" ></div>
        </div>
        </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery.smartWizard.min.js"></script>
<script type="text/javascript">

    function showTable(id, btn) {
        document.getElementById(id).style.display = 'block';
        btn.style.display = 'none';
    }

    $(document).ready(function(){
        <c:if test="${action.equals('modifier')}">
        $(".table").show();
        $("#button").html("modifier");
        $("#modification").show();
        $("#ajout").hide();
        $(".profil").html("Modifier le Profil");
        </c:if>
    });
    function goToList() {
        window.location.href="/api/getListProfile/0/6"
}


function success() {
        if(document.getElementById("nom").value==="") {
            document.getElementById('button').disabled = true;
        } else {
            document.getElementById('button').disabled = false;
        }
    }

    function showRole(){
        var val=$("#profil").val();
        $.ajax({
            type : "GET",
            url :"/api/getProfilDetails",
            data:{
                'val':val
            },

            success : function(data) {

                $(".profilTr").html(data);


            },
            error : function(response) {
                alert("error")
            }
        });

    }

    function getParamProfil(vals){
        window.location.href='/api/getListProfile/'+vals+'/6';
    }

    function save(){
        var id=$("#profil").val();
        var nom=$("#nom").val();
        var detail=$("#detail").val();

        var profil={
            "profilId":id,
            "nom":nom,
            "detail":detail
        }

        if ($.trim(nom) == "" || nom == null) {
            swal("<spring:message code="label.Avertissement"/> ! ", '<spring:message code="label.LechampsDesignationestobligatoire"/>', 'error');
            return false;
        }
        if ($.trim(detail) == "" || detail == null) {
            swal("<spring:message code="label.Avertissement"/> ! ", '<spring:message code="label.LechampsDetailsestobligatoire"/>', 'error');
            return false;
        }
        if(${!action.equals("modifier")}) {
            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.Voulezvousajouterlesdroitsdacces"/>",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.Oui"/>',
                cancelButtonText: '<spring:message code="label.Non"/>'
            }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            type: "POST",
                            contentType: 'application/json; charset=utf-8',
                            url: "/api/saveProfile",
                            data: JSON.stringify(profil),

                            success: function (data) {
                                $('.toast').toast('show');
                                $("#profil").val(data)
                                $(".table").removeAttr('hidden');
                                showTable('table', this);

                            },
                            error: function (response) {
                                alert("error")
                            }
                        });
                    } else {
                        window.location.href = '/api/getListProfile/0/6';
                    }
                },
            );
        }else {
            let timerInterval
            Swal.fire({
                position: 'top-center',
                icon: 'success',
                title: '',
                html: 'Le profil '+nom+' a bien été modifié',
                timer: 1500,
                timerProgressBar: false,
                showConfirmButton: false,
                didOpen: () => {
                    Swal.showLoading()
                    timerInterval = setInterval(() => {
                        const content = Swal.getHtmlContainer()
                        if (content) {
                            const b = content.querySelector('b')
                            if (b) {
                                b.textContent = Swal.getTimerLeft()
                            }
                        }
                    }, 100)
                },
                willClose: () => {
                    clearInterval(timerInterval)
                }
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                }
            });
            $.ajax({
                type: "POST",
                contentType: 'application/json; charset=utf-8',
                url: "/api/saveProfile",
                data: JSON.stringify(profil),

                success: function (data) {
                    $('.toast').toast('show');
                    $("#profil").val(data)
                    showTable('table', this);
                    window.location.href = '/api/getListProfile/0/6';
                },
                error: function (response) {
                    alert("error")
                }
            });
        }
    }


    function saveGroupe(){

        var nom_fr=$("#nom_fr").val();

        var group={
            "nom_fr":nom_fr
        }

        $.ajax({
            type : "POST",
            contentType :'application/json; charset=utf-8',
            url :"/api/saveGroupe",
            data:JSON.stringify(group),

            success : function(data) {
                $("#group").val(data)
            },
            error : function(response) {
                alert("error")
            }
        });
    }


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


</script>
<script>
</script>
<jsp:include page="../../includes/footer.jsp" />
