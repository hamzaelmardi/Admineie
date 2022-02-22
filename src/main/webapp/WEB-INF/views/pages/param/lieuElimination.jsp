
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nom_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nom_fr"/>
</c:otherwise>
</c:choose>
<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">

        <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
         <c:set var="lng" value="nom_${pageContext.response.locale}"/>
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5 grid-margin" >
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <div class="card" >
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                </div>
                            </div>

                            <div class="col-10 mt-4">

                                <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters"><spring:message code="label.Lieudelimination" /></span></span>
                                                      </span>
                                </h3>                                <div class="row p-0 m-0 mt-5">


                                </div>

                                <div class="row">
                                    <div class="col-12 mt-4">
                                        <div class="form-group">
                                            <label>Lieu d'élimination</label>
                                            <input  required type="hidden" id="id_lieuElimination" value="${lieuE.id_lieuElimination}"  class="form-control">
                                            <input  required type="text" id="nom_fr"  value="${lieuE.nom_fr}" class="form-control">
                                        </div>
                                    </div>
                                </div>

                                <%-- <div class="row">

                                    <div class="col-12" dir="rtl">
                                        <div class="form-group" dir="rtl">
                                            <label dir="rtl">مكان التخلص</label>


                                            <input  required type="text" id="nom_ar" value="${lieuE.nom_ar}"  class="form-control">
                                        </div>

                                    </div></div> --%>

                                    <div class="row">
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Classification" /></label>
                                                <select id="classification" name="classification" class="form-select bg-light" required style="height: 40px">
                                                    <c:forEach items="${classification }" var="cl">
                                                        <option  <c:if test="${cl.id_classification == lieuE.classification.id_classification}">selected</c:if> value="${cl.id_classification}">${pageContext.response.locale=='ar'?cl.nom_ar:cl.nom_fr}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.TELfax"/></label>
                                            <input  required type="text" id="tel" value="${lieuE.tel}"  class="form-control">
                                        </div>

                                    </div></div>
                                    <div class="row">

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.datededelivrance"/></label>

                                            <input  required type="text" id="dateD" value="${lieuE.dateD}"  class="form-control">
                                        </div>

                                    </div></div>

                            </div>
                        </div>
                        <div class="row  mb-4" style="margin:14px;">
                            <a  class="btn btn-success btn-block " onclick="addLieuElimination()" ><spring:message code="label.Enregistrer" /> </a>
                           <a class="btn btn-danger-2 text-white btn-block" onclick="getFunctionParam('getParamLieuElimination')"><spring:message code="label.Annuler"/></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- fin etat Dossier -->

            <div class="col-12 grid-margin z_tab" id="subtab_0">
                <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">


                    <div class="col-md-12 col-lg-12"
                         style="width: 98%;margin-left: auto;margin-right: auto;background: white;padding-top: 19px;border-radius: 5px;display:flex;">
                        <div id="gamesForm" style=" display:flex;">

                            <div class="row" style="width: 100%!important;">
                                <input name="selst" type="hidden" value="${statutEnc}">

                                <div class="col-lg-12 col-sm-12" style="margin-top: -2px">
                                    <label><spring:message code="label.Rechercher" /></label>
                                    <div class="input-group">
                                        <input onkeyup="searchBy()" name="recherche" type="text" class="form-control" id="nomtr">
                                    </div>
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
                                                <label><spring:message code="label.Code" /></label>
                                                <input type="text" name="desi" class="form-control">
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
                                        <span class="letters"><span class="letters"><spring:message code="label.Lieudelimination" /></span></span>
                                      </span>
                                    </h4>
                                </div>
                                <div class="col-9">
                                    <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                        <span><spring:message code="label.NouveauLieudelimination" /> </span></a>


                                </div>
                            </div>
                        </div>

                    </div>





                    <div class="row justify-content-center">
                        <div class="col-12" id="tr">
                            <table id="example2" class="table tablee table-hover">
                                <thead>
                                <tr>


                                          <th class="text-center"><spring:message code="label.Lieudelimination" /></th>
                	                     <th class="text-center"><spring:message code="label.Classification" /></th>
                	                      <th class="text-center"><spring:message code="label.TELfax"/></th>
                	                       <th class="text-center"><spring:message code="label.datededelivrance"/></th>
                                            <th class="text-center"><spring:message code="label.Action" /></th>

                                </tr>
                                </thead>
                                <tbody class="tbodyy">

                                <c:forEach items="${listF}" var="f">

                                    <tr id="tr-${f.id_lieuElimination}">

                                        <%-- <td>${f.nom_fr}</td> --%>
                                        <td>${f.nom_fr}</td>
                                        <td>${pageContext.response.locale=='ar'?f.classification.nom_ar:f.classification.nom_fr}</td>
                                        <td>${f.tel}</td>
                                        <td>${f.dateD}</td>

                                        <td class="text-center" style="width: 15%">
                                            <ul class="list-inline m-0">
                                                <li class="list-inline-item">
                                                    <button onclick="updateLieuElimination(${f.id_lieuElimination})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                                                        <div class="icon_trash_1">
                                                            <span class="fas fa-pencil-alt" style="color: orange"></span>
                                                        </div>

                                                    </button>
                                                </li>
                                                <li class="list-inline-item">
                                                    <button onclick="deleteLieuElimination(${f.id_lieuElimination})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
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
    function addLieuElimination(){

        var nom_fr=$("#nom_fr").val();
         var nom_ar=$("#nom_ar").val();
       var tel=$("#tel").val();
       var dateD=$("#dateD").val();
        var id_lieuElimination=$("#id_lieuElimination").val();
        var classification=$("#classification").val();

        var fournisseur={

            "nom_fr":nom_fr,
           "nom_ar":nom_ar,
            "tel":tel,
            "dateD":dateD,
            "id_lieuElimination":id_lieuElimination,
            "classification":{"id_classification":classification}

        }


        $.ajax({
            type: "POST",

            url :"/api/postParamLieuElimination",
            contentType : 'application/json; charset=utf-8',

            data : JSON.stringify(fournisseur),

            success : function(response) {

                $(".mpParam").html(response);
                getFunctionParam('getParamLieuElimination')
            },
            error : function(response) {

                alert('Erreur ajout non effectué');

            }
        });


    }




    /*  delete famille  begin */

    function deleteLieuElimination(id){
            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                type: 'Attention',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.supprimer"/>',
                cancelButtonText: '<spring:message code="label.Annuler"/>'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/api/deleteParamLieuElimination/"+id,
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
                        '<spring:message code="label.Votrefichieraetesupprime"/>.',
                        'Succès',
                    )
                }
            })


        }





    function updateLieuElimination(id){
        $.ajax({
            type : "GET",
            url :"/api/updateParamLieuElimination/"+id,
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

    function searchBy() {

        var nom=$("#nomtr").val();

        if(nom==="" ){

            return false;
        }
        $.ajax({
            url: "/api/getlieuSearch/"+nom,
            type: "GET",

            data: {},


            success: function (response) {


                $("#tr").html(response);

            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });
    }

</script>


<jsp:include page="../../includes/footer.jsp" />






