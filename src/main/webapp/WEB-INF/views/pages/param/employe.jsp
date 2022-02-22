
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flag.css" >

<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .button {
            float: left;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale=='fr' }">
    <style>
        .button {
            float: right;
        }
    </style>
</c:if>
<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">
  <c:set var="lng" value="nom_${pageContext.response.locale}"/>
        <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5 grid-margin" >
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <form name="code" id="code">
                        <div class="card" >
                            <div class="row justify-content-center">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                    </div>
                                </div>

                                <div class="col-10 mt-4">

                                    <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters">Employe</span></span>
                                                      </span>
                                    </h3>                                    <div class="row p-0 m-0 mt-5">


                                    </div>

                                    <div class="row">

                                        <div class="col-12 mt-4">
                                            <div class="form-group">
                                                <label>Nom d'employe</label>
                                                <input  required type="text" id="nom" value="${employe.nom}" class="form-control">
                                                <input  required type="hidden" id="empId" value="${employe.empId}" class="form-control">
                                                <span style="color: red;font-style: italic" id="enom"></span>
                                            </div>

                                        </div></div>


                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>adresse</label>
                                                <textarea class="form-control"  rows="3" required type="text" id="adresse">${employe.adresse}</textarea>
                                                <span style="color: red;font-style: italic" id="eadresse"></span>
                                            </div>

                                        </div></div>

                                    <div class="col-12">
                                            <div class="form-group">
                                                <label>tel</label>
                                                <input  required type="tel" id="tel"  value="${employe.tel}" class="form-control" >
                                                <span style="color: red;font-style: italic" id="etel"></span>
                                            </div>

                                        </div></div>

                                <div class="row departement">
                                    <div class="col-12" dir="ltr">
                                        <div class="form-group" id="departement_form_group">
                                            <label>departement</label>

                                            <select id="departement" class="form-select bg-light" style="height: 40px">
                                                <option  selected value="0"><spring:message code="label.Choisir" /></option>
                                                <c:forEach items="${departement }" var="d">
                                                    <option value="${d.departementid}"
                                                        ${employe.departement.departementid== d.departementid ?'selected':''}>${d.departementnom }
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                    </div>
                                </div>

                                    


                                </div>
                            </div>
                            <div class="row  mb-4" style="margin:14px;">
                                <a  class="btn btn-success btn-block " onclick="addemp()" > <spring:message code="label.Enregistrer" /></a>
                                <a class="btn btn-danger-2 text-white btn-block" onclick="getFunctionParam('getEmploye')"><spring:message code="label.Annuler"/></a>

                            </div>

                    </form>
                </div>
            </div>
        </div>


    <div class="col-12 grid-margin z_tab" id="subtab_0">
        <!-- fin etat Dossier -->

        <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">


            <div class="col-md-12 col-lg-12"
                 style="width: 98%;margin-left: auto;margin-right: auto;background: white;padding-top: 19px;border-radius: 5px;display:flex;">
                <div id="gamesForm" style=" display:flex;" >

                    <div class="row" style="width: 100%!important;">
                        <input name="selst" type="hidden" value="${statutEnc}">

                        <div class="col-lg-10 col-sm-12" style="margin-top: -2px">
                            <label>search</label>
                            <div class="input-group">
                                <input  onkeyup="searchByname()" name="recherche" type="text" class="form-control" id="nomep" >
                            </div>
                        </div>

                        <div class="col-lg-1 col-sm-12 mb-2">
                            <a style="margin-top: 32px;background-color: #206c45 !important;" class="btn btn-primary"
                               onchange="searchByname()"><spring:message code='label.rechercher'/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div>
                    <div class="row justify-content-center">

                        <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >

                            <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                            <div class="row p-4 justify-content-center">
                                <div class="col-8">
                                    <div class="row p-0">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Employe</label>
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row p-0 justify-content-end">
                                        <div class="col-12">
                                            <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')"><spring:message code="label.rechercher" /> </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 pr-0 pl-0" >
                            <div class="row m-0">
                                <div class="col-3">
                                    <h4 class="ml6">
                                      <span class="text-wrapper">
                                        <span class="letters"><span class="letters">Employe</span></span>
                                      </span>
                                    </h4>
                                </div>
                                <div class="col-9">
                                    <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                        <span> new employe </span>
                                    </a>

                                </div>
                            </div>
                        </div>

                    </div>





                    <div class="row justify-content-center">
                        <div class="col-12">
                            <table id="example2" class="table tablee table-hover">
                                <thead>
                                <tr>
                 
                                           
                                         <th class="text-center">nom</th>
                	                  <th class="text-center">adresse</th>
                                    <th class="text-center">tel</th>
                                    <th class="text-center">departement</th>
                                    <th class="text-center"><spring:message code="label.Details"/></th>
                                    <th class="text-center"><spring:message code="label.Action"/></th>


                                   
                                </tr>
                                </thead>
                                <tbody class="tbodyy">

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
                                                            <h5 style="color: #0b2e13;font-weight: bolder" class="modal-title" id="exampleModalLabel"><spring:message code='label.Details'/></h5>
                                                            <button type="button" class="close" onclick="hideModal(${f.empId })" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="row" >
                                                              <div class="col-2" style="font-weight: bold" >nom :</div>
                                                              <div class="col-10" >${f.nom}</div>
                                                              <div class="col-2" style="font-weight: bold">tel :</div>
                                                              <div class="col-10" >${f.tel}</div>
                                                              <div class="col-2" style="font-weight: bold">adresse :</div>
                                                              <div class="col-10" >${f.adresse}</div>
                                                              <div class="col-2" style="font-weight: bold">departement:</div>
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







<script type="text/javascript">
    function addemp(){

        var nom=$("#nom").val();
        var adresse=$("#adresse").val();
        var tel=$("#tel").val();
        var empId=$("#empId").val();
        var departement=$("#departement").val();

        if(nom==""){
            document.getElementById('enom').innerHTML="Choissir Un Nom";
        }
        if(adresse==""){
            document.getElementById('eadresse').innerHTML="Choissir Une adresse";
        }
        if(!tel.match("[0-9]{10}")  || tel==""){
            document.getElementById('etel').innerHTML="Choissir Un num correct";

            return false
        }
else {
        var employe={

            "nom":nom,
            "adresse":adresse,
            "empId":empId,
            "tel":tel,
            "departement": {"departementid":departement},

        }



        $.ajax({
            type: "POST",

            url :"/api/addEmploye/"+departement,
            contentType : 'application/json; charset=utf-8',

            data : JSON.stringify(employe),

            success : function(response) {

                $(".mpParam").html(response);
            },
            error : function() {

                alert('Erreur ajout non effectué');

            }
        });


    }
    }




    /*  delete famille  begin */

    function deleteemp(id){

            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                type: 'Attention',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.supprimer"/>!',
                cancelButtonText: '<spring:message code="label.Annuler"/>'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/api/deleteEmploye/"+id,
                        data:{
                            "id":id
                        },
                        success : function(data) {
                            $("#tr-"+id).css("display","none");
                        },
                        error : function(response) {
                            alert("error")
                        }
                    });
                    Swal.fire(
                        '<spring:message code="label.Supprimer"/>!',
                        '<spring:message code="label.Votrefichieraetesupprime"/>',
                        'Succès',
                    )
                }
            })


        }








    function editemp(id){
        $.ajax({
            type : "GET",
            url :"/api/updateEmploye/"+id,
            data:{

            },
            success : function(data) {

                $(".mpParam").html(data);
                $("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");
            },
            error : function(response) {
                alert("error")
            }
        });

    }


    function searchByname() {

        var nom=$("#nomep").val();
        if(nom==="" ){
            return false;
        }


        $.ajax({
            url: "/api/getemployesearch",
            type: "POST",

            data: {
                "nom":nom
            },

            success: function (response) {

                $(".tbodyy").html(response);

            },
            error: function (response) {
                alert('Erreur ajout non effectué');

            }
        });
    }
    function showdetail(id){

        $("#idModal"+id).modal("show");
        $("#oldData-"+id).removeClass("dataTable");

    }

    function hideModal(id){

        $("#idModal"+id).modal("hide");
    }

</script>



<jsp:include page="../../includes/footer.jsp" />




