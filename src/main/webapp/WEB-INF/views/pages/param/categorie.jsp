
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">
    <c:if test="${pageContext.response.locale=='ar' }">
        <style>
            .button {
                float: left;
            }
        </style>
    </c:if>
    <c:if test="${pageContext.response.locale!='ar' }">
        <style>
            .button {
                float: right;
            }
        </style>
    </c:if>
<c:set var="lng" value="nom_${pageContext.response.locale=='fr_FR'?'fr':pageContext.response.locale}"/>

        <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5" >
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <form name="categorie" id="categorie">
                        <div class="card" >
                            <div class="row justify-content-center">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                    </div>
                                </div>

                                <div class="col-10 mt-4">

                                    <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters"><spring:message code="label.Categorie" /></span></span>
                                                      </span>
                                    </h3>
                                    <div class="row p-0 m-0 mt-5">


                                    </div>

                                    <div class="row">

                                        <div class="col-12 mt-4">
                                            <div class="form-group">
                                                <label>Catégorie</label>
                                                <input  required type="text" id="nom_fr" value="${categorie.nom_fr}" class="form-control">
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12" dir="rtl">
                                            <div class="form-group" dir="rtl">
                                                <label dir="rtl"> فئة   </label>
                                                <input  required type="hidden" id="id_categorie" value="${categorie.id_categorie}" class="form-control">

                                                <input  required type="text" id="nom_ar" value="${categorie.nom_ar}" class="form-control">
                                            </div>

                                        </div></div>


                                </div>
                            </div>
                            <div class="row  mb-4" style="margin:14px;">
                                <a  class="btn btn-success btn-block " onclick="addcategorie()" > <spring:message code="label.Enregistrer" /></a>
                               <a class="btn btn-danger-2 btn-block text-white" onclick="getFunctionParam('getParamCategorie')"><spring:message code="label.Annuler"/></a>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- fin etat Dossier -->
            <div class="col-12 grid-margin z_tab" id="subtab_0">
                <div>
                    <div class="row justify-content-center">

                        <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >

                            <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                            <div class="row p-4 justify-content-center">
                                <div class="col-8">
                                    <div class="row p-0">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Categorie" /></label>
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row p-0 justify-content-end">
                                        <div class="col-12">
                                            <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')"><spring:message code="label.rechercher" /></button>
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
                                        <span class="letters"><span class="letters"><spring:message code="label.Categorie" /></span></span>
                                      </span>
                                    </h4>
                                </div>
                                <div class="col-9">
                                    <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                        <span><spring:message code="label.NouvelleCategorie" /> </span></a>


                                </div>
                            </div>
                        </div>

                    </div>





                    <div class="row justify-content-center">
                        <div class="col-12">
                            <table id="example2" class="table tablee table-hover">
                                <thead>
                                <tr>
                
                	
                	                  <th class="text-center"><spring:message code="label.Categorie"/></th>

                	                      <th class="text-center"><spring:message code="label.Action"/></th>
                                        
                                   
                                </tr>
                                </thead>
                                <tbody class="tbodyy">

                                <c:forEach items="${listF}" var="f">
                                <tr id="tr-${f.id_categorie}">

                                    <%-- <td>${f.nom_fr}</td> --%>
                                    <td>${f[lng]}</td>

                                    <td class="text-center">
                                        <ul class="list-inline m-0">
                                            <li class="list-inline-item">
                                                <button onclick="editcategorie(${f.id_categorie})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                                                    <div class="icon_trash_1">
                                                        <span class="fas fa-pencil-alt" style="color: orange"></span>
                                                    </div>

                                                </button>
                                            </li>
                                            <li class="list-inline-item">
                                                <button onclick="deletecategorie(${f.id_categorie})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
                                                    <div class="icon_trash_1">
                                                        <span class="fas fa-trash" style="color: red"></span>
                                                    </div>
                                                </button>
                                            </li>
                                        </ul>
                                    </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>

</div>





<script type="text/javascript">
    function addcategorie(){

        var nom_fr=$("#nom_fr").val();
        var nom_ar=$("#nom_ar").val();
        var id_categorie=$("#id_categorie").val();

        //var obj = $("#categorie").serializeObject();

        var fournisseur={

            "nom_fr":nom_fr,
            "nom_ar":nom_ar,
            "id_categorie":id_categorie
        }


        $.ajax({
            type: "POST",

            url :"/api/postParamCategorie",
            contentType : 'application/json; charset=utf-8',

            data : JSON.stringify(fournisseur),

            success : function(response) {

                $(".mpParam").html(response);
            },
            error : function(response) {

                alert('Erreur ajout non effectué');

            }
        });
_

    }




    /*  delete famille  begin */

    function deletecategorie(id){
            Swal.fire({
                title: 'Êtes-vous sûr?',
                text: "si vous cliquez sur supprimer, vous ne pouvez pas le récupérer?",
                type: 'Attention',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: 'supprimer',
                cancelButtonText: 'Annuler'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/api/deleteParamCategorie/"+id,
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
                        'Supprimer!',
                        'Votre fichier a été supprimé.',
                        'Succès',
                    )
                }
            })


        }








    function editcategorie(id){
        $.ajax({
            type : "GET",
            url :"/api/updateParamCategorie/"+id,
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

    /*  delete famille  end */

    function checkCode(val){
        $('#codeLabel').css("display","none");
        $.ajax({
            type : "GET",
            url :"/checkCode",
            data:{
                'val':val
            },
            success : function(data) {
                /* alert()  */
                if(data=="oui"){
                    $('#codeLabel').css("display","block");
                    $(".btnTo").prop("disabled", true);

                }
                else{
                    $(".btnTo").prop("disabled", false);
                }


            },
            error : function(response) {
                alert("error")
            }
        });

    }

</script>

<jsp:include page="../../includes/footer.jsp" />







