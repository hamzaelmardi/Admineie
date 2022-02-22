
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

<%@ page session="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>

<style>
    .btn-primary{
        background:  #d59d32;
        border-color:  #d59d32;
    }

    .titre_abs{
        position: absolute;
        top: -15px;
        display: block;
        background:  #d59d32;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
    }
    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
    }
    .tab {
        float: left;

    }
    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }
    .tab button:hover {
        background-color: #ddd;
    }
    .tab button.active {
        background-color: red;
    }
    #my_rows{
        overflow: auto;
    }

    .bg_sucess{
        box-shadow: 0px 0px 20px #20d006;
        border-color: #20d006 !important;
    }
    .bg_error{
        box-shadow: 0px 0px 20px #ff5363;
        border-color: #ff5363 !important;
    }

    @media (max-width: 1200px){
        .myH3{
            font-size: 13pt;
            margin-left: 9rem;
        }
    }

</style>

<div class="main-panel " style="margin-top:158px">
    <div class="content-wrapper">
        <c:choose>
            <c:when test="${fn:contains(requestScope['javax.servlet.forward.request_uri'],'/api/getListeCollecte' )}">
                <c:set var="p_page" value="${pageContext.response.locale=='ar'?'جمع النفايات ونقلها':'Collecte ET Transport Des Déchets'}"/>
            </c:when>
            <c:otherwise>
                <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
            </c:otherwise>
        </c:choose>
        <div class="col-12 "  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <nav aria-label="breadcrumb ">
                <ol class="breadcrumb ml-4" style="margin-top: -18px !important;">
                    <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                    <li class="breadcrumb-item active" style="${pageContext.response.locale=='fr'?'':'margin-right:4rem !important'}" aria-current="page">Validation des codes et vihicules et documents</li>
                </ol>
            </nav>
        </div>
        <div class="row" style="display:flex;">
            <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >
                <div class="col-12 from_add" id="checkDoc" style="margin-top: 43px;">
                    <div class="row p-0 m-0 justify-content-center">
                        <div class="col-lg-8 col-md-10 col-sm-12 grid-margin stretch-card " >
                            <div class="photo  hvr-buzz-out" >
                                <i class="mdi icc mdi-trash-can-outline mdi-truck-check menu-icon"></i>
                            </div>
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>
                                    <input type="hidden" value="${id}" id="id_collecte">
                                    <h5 class="mt-3 myH3" style="float:right;color:black"><spring:message code="label.Validerdechets"/></h5>
                                    <div class="col-12 mt-4" >
                                        <div class="row p-3" id="listCode" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <section class="col-md-12">
                                                <div class="row justify-content-center">
                                                    <div class="col-lg-8 col-md-12" id="zone_tableau" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                        <table class="table table-striped" data-page-length="15">
                                                            <thead>
                                                            <tr>

                                                                <th scope="col" style="min-width: 100px"><spring:message
                                                                        code="label.code"/></th>
                                                                <th scope="col"><spring:message code="label.type"/></th>
                                                                <th scope="col"><spring:message code="label.Selectionner"/></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach items="${collecte.code}" var="c">
                                                                <tr>
                                                                    <td>${c.nom_fr }</td>
                                                                    <td>${c.nom_ar }</td>
                                                                    <td>
                                                                        <input class="h-15" type="checkbox"
                                                                               id="id-${c.id_code }"
                                                                               onchange="addCodeCT('id_collecte','${c.id_code}','add')">
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>


                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="col-lg-4 col-md-12" id="zone_list_tab">
                                                        <div class="d-block h-100 my_rows" id="my_rows">
                                                            <c:forEach items="${collecte.codeTmp}" var="code_colle" varStatus="index">
                                                                <div class="row p-0 m-0 ${index.index%2==0?'bg-light':''} ">
                                                                    <div class="col-8"> ${code_colle.nom_ar} </div>
                                                                    <div class="col-4 p-2 text-center">
                                                                        <button class="btn btn-success rounded-circle"
                                                                                onclick="addCodeCT('id_collecte','${code_colle.id_code}','delete')">
                                                                            <span class="fa fa-times"></span></button>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row  justify-content-end m-4" style="margin:14px;">
                                                    <c:if test="${cpt==0}">
                                                        <a type="button" class="btn btn-primary float-right btn-lg mx-2 col-md-4" onclick="showDocument()"><spring:message code="label.Suivant"/> <i class="fa fa-arrow-right ml-2"></i></a>
                                                    </c:if>
                                                    <c:if test="${cpt!=0}">
                                                        <a type="button" class="btn btn-primary float-right btn-lg mx-2 col-md-4" onclick="showVehicule()"><spring:message code="label.Suivant"/> <i class="fa fa-arrow-right ml-2"></i></a>
                                                    </c:if>
                                                </div>
                                            </section>
                                        </div>
                                        <div  class="row justify-content-center p-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" id="Vehicule" style="display: none">
                                            <div class="col-sm-12 table-responsive" id="vehic">
                                                <table class="table responsive table-bordered my_table ">
                                                    <thead class="" style="background-color: lightgrey">
                                                    <tr>
                                                        <th><spring:message code="label.NMatriculation"/></th>
                                                        <th><spring:message code="label.NChassis"/></th>
                                                        <th><spring:message code="label.Poidstotalencharge"/></th>
                                                        <th><spring:message code="label.Poidsnetduvehicule"/></th>
                                                        <th><spring:message code="label.Valider"/></th>
                                                        <th style="min-width: 120px"><spring:message code="label.Commentaire"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:choose>
                                                        <c:when test="${(not empty collecte.vehicules)}">
                                                            <c:forEach items="${collecte.vehicules}" var="v">
                                                                <c:if test="${!v.valid.equals('oui')}">
                                                                    <tr id="tr${v.id_vehicule}">
                                                                        <td> ${v.num_mat_enrg_voit} - ${v.num_mat_enrg_auto}
                                                                            - ${v.num_mat_id_prefect}</td>
                                                                        <td>${v.num_chassis}</td>
                                                                        <td>${v.poit_totale_charge}</td>
                                                                        <td>${v.point_net}</td>
                                                                        <td>
                                                                            <div class="form-check form-switch text-center pb-3 ">
                                                                                <input id="check${v.id_vehicule}" onchange="validate(${v.id_vehicule})"  data-choose="${v.id_vehicule}" class="form-check-input my_check" type="checkbox">
                                                                            </div>
                                                                        </td>
                                                                        <td class="">
                                                                            <div class="row">
                                                                                <div class="col" >
                                                                                    <textarea  onchange="addCommentaire('${v.id_vehicule}')" rows="2" class="form-control mb-0" name="textAr" id="id${v.id_vehicule }">${v.commantaire}</textarea>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <tr>
                                                                <td colspan="7" class="bg-primary text-center">
                                                                    <spring:message
                                                                            code="label.Aucunvehiculenestenregistre"/>
                                                                </td>
                                                            </tr>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="row  justify-content-center float-right m-4" style="margin:14px;">
                                                <a type="button" class="btn btn-secondary float-right btn-lg" onclick="showCodes()" style="background: #f95f5f;"><i class="fa fa-arrow-left mr-2"></i> <spring:message code="label.Precedent"/></a>
                                                <a type="button" class="btn btn-primary float-right btn-lg mx-2" onclick="showDocument()"><spring:message code="label.Suivant"/> <i class="fa fa-arrow-right ml-2"></i></a>
                                            </div>
                                        </div>
                                        <div class="row p-3" id="document" style="display: none;">
                                            <div class="col-md-12">
                                                <div class="row justify-content-center mx-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                    <div class="col-12 table-responsive pt-4">
                                                        <table class="table table-striped table-hover table-bordered">
                                                                <tr class="bg-vert">
                                                                    <td> <spring:message code="label.Piecejointe"/> </td>
                                                                    <td>  <spring:message code="label.Document"/> </td>
                                                                    <td> <spring:message code="label.Statut"/> </td>
                                                                    <td>  <spring:message code="label.Commentaire"/> </td>
                                                                </tr>
                                                                <tbody id="monTbody">
                                                                    <c:forEach items="${doc}" var="dc">
                                                                    <c:if test="${!dc.nom_ar.equals('oui')}">
                                                                        <tr>
                                                                            <td> <a target="_blank" download href="${fn:replace(dc.url, "/assets/myFile/", "/api/dowload_uploaded/")}" class="btn btn-success f-18 rounded-circle btn_icon"> <span class="fa fa-download"></span></a> </td>
                                                                            <td> ${dc.docImport.nom_fr } </td>
                                                                            <td>
                                                                                <div class="form-check form-switch">
                                                                                    <input id="check${dc.id_listDocNotif }" onchange="validate(${dc.id_listDocNotif })" ${dc.nom_ar.equals('oui')?'checked':'' }  data-choose="${dc.id_listDocNotif }" class="form-check-input my_check" type="checkbox" id="flexSwitchCheckDefault">
                                                                                </div>
                                                                            </td>
                                                                            <td>
                                                                                <textarea  onchange="addComment('${dc.id_listDocNotif }')" rows="2" class="form-control mb-0" id="id${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                    <div class="row justify-content-end  mb-4" style="margin:14px;">
                                                    <div class="col-md-4 ">
                                                        <c:if test="${cpt!=0}">
                                                            <a type="button" class="btn btn-secondary mt-1 col-md-5" onclick="showVehicule()"  style="background: #f95f5f;"><i class="fa fa-arrow-left mr-2"></i> <spring:message code="label.Precedent"/></a>
                                                        </c:if>
                                                        <c:if test="${cpt==0}">
                                                            <a type="button" class="btn btn-secondary mt-1 col-md-5" onclick="showCodes()"  style="background: #f95f5f;"><i class="fa fa-arrow-left mr-2"></i><spring:message code="label.Precedent"/> </a>
                                                        </c:if>
                                                        <a type="button" class="btn btn-primary mt-1 col-md-6" onclick="showAvisCommision()"><spring:message code="label.Suivant"/><i class="fa fa-arrow-right ml-2"></i></a>
                                                    </div>
                                                </div>
                                                </div>
                                             </div>
                                        </div>
                                        <div class="row justify-content-center p-3" id="avisComission" style="display: none">
                                            <div class="col-12">
                                                <div class="row mt-5">
                                                    <div class="form-group" style="width: 100%;">
                                                        <div class="form-group text-left" id="block_file">
                                                            <label><spring:message code="label.PVdelacommission"/></label>
                                                            <input id="pv_file" type="file" class="form-control" onchange="setpv_file(this,'${id}')">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-3 justify-content-start">
                                                    <section class=" col-12 m-0 p-0">
                                                        <div class="form-group dt " style="${pageContext.response.locale=='ar'?'text-align:right':'text-align-left'}">
                                                            <label> <spring:message code="label.AvisCommission"/> </label>
                                                            <select required id="etat_st" class="custom-select " onclick="testCodes(this.value)" ${dd}>
                                                                <option value="0"><spring:message code="label.Choisir"/></option>
                                                                <option value="41" id="demendeSousReserve"><spring:message code="label.Favorablesousreserve"/></option>
                                                                <option value="42" id="demendeComplement"><spring:message code="label.demandedecomplement"/></option>
                                                                <option value="28"><spring:message code="label.Favorable"/></option>
                                                                <option value="44"><spring:message code="label.Defavorable"/></option>
                                                            </select>
                                                        </div>
                                                    </section>
                                                    <textarea name="comment" id="comment" rows="2" class="form-control" style="display: none"> </textarea>
                                                </div>
                                                <div class="row  justify-content-end m-4">
                                                    <div class="col-md-12">
                                                        <a type="button" class="btn btn-secondary ml-4 col-md-5 btn-lg" onclick="showDocument()" style="background: #f95f5f;"><i class="fa fa-arrow-left mr-2"></i> <spring:message code="label.Precedent"/></a>
                                                        <a type="button" class="btn btn-primary col-md-5  btn-lg" onclick="saveEtat()"><spring:message code="label.Enregistrer"/> <i class="fa fa-save ml-2"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>



    <jsp:include page="../../includes/footer.jsp" />

    <script>

    $(document).ready(function(){
        var cpt =${cpt}
        if(cpt===0){
            $("#vehic tbody tr").remove();
        }
    })

    function addCodeCT(id_collect, id_code, type) {
        event.preventDefault();
        var id_coll = $("#" + id_collect).val();
        if (id_coll === "") {
            return false;
        }
        $.ajax({
            url: '/api/setcodeCollecte/' + id_coll + '/' + id_code + '/' + type,
            type: 'POST',
            data: {},
        })
            .done(function (data) {
                if (!data.user) {
                    window.location.href = '/index';
                }
                $("#my_rows").html("");
                $(data.codes).each(function (ind, el) {
                    var cls = "";
                    if (ind % 2 == 0) {
                        cls = "bg-light";
                    }
                    var row = '<div class="row p-0 m-0 ' + cls + ' "> <div class="col-8"> ' + el.nom_ar + ' </div> <div class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle" onclick="addCodeCT(\'' + id_collect + '\',\'' + el.id_code + '\',\'delete\')"> <span class="fa fa-times"></span> </button> </div> </div>';
                    $("#my_rows").append(row);

                    });

                })
                .fail(function () {
                    console.log("error");
                })
                .always(function () {
                    if (type == "add") {
                        $('#id-' + id_code).attr("disabled", "true");
                    }
                    if (type == "delete") {
                        var table1 = $("#DataTables_Table_0").dataTable();
                        var checkbox = table1.$("input[type=checkbox]#id-" + id_code);
                        $(checkbox).removeAttr("disabled");
                        $(checkbox).prop("checked", false);

                    }
                    console.log("complete");
                });

        }
        function showVehicule(){
            $("#listCode").hide();
            $("#Vehicule").show();
            $("#document").hide();
            $('#avisComission').hide();
            $(".myH3").text('<spring:message code="label.Validervehicules"/>')

        }
        function showDocument(){
            $("#document").show();
            $("#Vehicule").hide();
            $("#listCode").hide();
            $('#avisComission').hide();
            $(".myH3").text('<spring:message code="label.Validerdocument"/>')
        }

        function showAvisCommision(){
            $("#document").hide();
            $("#Vehicule").hide();
            $("#listCode").hide();
            $('#avisComission').show();
            $(".myH3").text('<spring:message code="label.AvisCommission"/>')
        }

        function showCodes(){
            $("#document").hide();
            $("#Vehicule").hide();
            $("#listCode").show();
            $('#avisComission').hide();
            $(".myH3").text('<spring:message code="label.Validerdechets"/>')
        }
        function addCommentaire(id){
            event.preventDefault();
            var comment=$("#id"+id).val();

            $.ajax({
                type: "POST",
                url :"/api/addCommentaire/"+id,

                data : {
                    "comment":comment
                },

                success : function(response) {
                    $("#id"+id).addClass("bg_sucess");
                },
                error : function(response) {
                    alert('Erreur ajout non effectué');
                }
            });

        }

        function testcheckBox(){
            var bool = false;

            $(".my_check").each(function(indx,el){
                if(!$(el).is(":checked") && !bool){
                    bool=true
                }
            });
            if(bool){
                $("#valider").attr("disabled","disabled");
                $("#non_conforme").removeAttr("disabled");
            }else{
                $("#non_conforme").attr("disabled","disabled");
                $("#valider").removeAttr("disabled");
            }
        }
        testcheckBox();

        function showComment(id){
            event.preventDefault();
            //$("#id"+id).removeClass("hidden");
            $("#id"+id).prop('disabled', false);
            //$("#ids"+id).removeClass("hidden");
            //$("#idd"+id).addClass("hidden");
        }
        function addComment(id){
            event.preventDefault();
            var comment=$("#id"+id).val();

            $.ajax({
                type: "POST",
                url :"/api/addComment/"+id,

                data : {
                    "comment":comment
                },

                success : function(response) {
                    $("#id"+id).addClass("bg_sucess");
                },
                error : function(response) {
                    alert('Erreur ajout non effectué');
                }
            });

        }

        $("input:checkbox").change(function() {
            var etat;
            var id=$(this).data("choose");

            var ischecked= $(this).is(':checked');
            if(!ischecked){
                etat="non";
                if($("#id"+id).hasClass("hidden"))
                    $("#id"+id).removeClass("hidden");
            }
            else{
                etat="oui";
                $("#id"+id).addClass("hidden");
            }

            $.ajax({
                type: "POST",
                url :"/api/validate/"+id,

                data : {
                    "etat":etat

                },

                success : function(response) {
                    testcheckBox();
                },
                error : function(response) {

                }
            });
        });

        $("#vehic input:checkbox").change(function() {
            var etat;
            var id=$(this).data("choose");

            var ischecked= $(this).is(':checked');
            if(!ischecked){
                etat="non";
                if($("#id"+id).hasClass("hidden"))
                    $("#id"+id).removeClass("hidden");
            }
            else{
                etat="oui";
                $("#id"+id).addClass("hidden");
            }

            $.ajax({
                type: "POST",
                url :"/api/validateVehicule/"+id,

                data : {
                    "etat":etat
                },

                success : function(response) {
                    testcheckBox();
                },
                error : function(response) {

                }
            });
        });

        function addEtatCollecte(id,etat){



            $.ajax({
                type: "POST",
                url :"/api/addEtatCollecte/"+id,

                data : {
                    "etat":etat

                },

                success : function(response) {
                    window.location="/api/getListeCollecte/0/6/0";
                },
                error : function(response) {
                    alert(' ajout non effectué');
                }
            });

        }

        function addEtat(id,etat){
            event.preventDefault();
            $.ajax({
                type: "POST",
                url :"/api/addEtatCollecte/"+id,

                data : {
                    "etat":etat
                },

                success : function(response) {
                    window.location="/api/getListeCollecte/0/6/0";
                },
                error : function(response) {
                    alert(' ajout non effectué');
                }
            });

        }

        function saveEtat(){
            event.preventDefault();

            var id = $("#id_collecte").val();
            var etat = $("#etat_st").val();
            var comment = $("#comment").val();
            var pv = document.getElementById("pv_file").files.length;

                if (pv===0) {
                    swal("Warning", "Fichier obligatoire", "warning");
                    return false;
                }


        if(etat==="0"){
            swal("<spring:message code="label.Attention"/>!","<spring:message code="label.Mercidechoisirunstatut"/>","error");
                $("#etat_st").addClass("bg_error");
                return false;
            }

            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                type: '<spring:message code="label.Attention"/>',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.Oui"/>, <spring:message code="label.continue"/>!',
                cancelButtonText: '<spring:message code="label.Annuler"/>'
            }).then((result) => {
                if (result.value) {
                    $.ajax ({
                        type: "POST",
                        url: "/api/addAvisCommission/" + id,
                        data: {
                            "etat": etat,
                            "comment": comment,
                        },
                        success: function (response) {
                            window.location = "/api/getListeCollecte/0/6/0";
                        },
                        error: function (response) {
                            alert (' ajout non effectué');
                        }
                    });
                }
            })
        }

        function testCodes(val){
            if(val==="44"){
                $("#comment").show()
            }
            else{
                $("#comment").hide()
            }
            var $checkboxes = $('#listCode td input[type="checkbox"]');
            var $checkboxes2 = $('#document td input[type="checkbox"]');
            var $checkboxes3 = $('#vehic td input[type="checkbox"]');
            var tr = $('#vehic tbody tr').length;
            var trD = $('#monTbody tr').length;

            var x=$checkboxes.filter(':checked').length
            var y=$checkboxes2.filter(':checked').length
            var z=$checkboxes3.filter(':checked').length

            if(x!==0 || z!==tr ){
                $("#demendeSousReserve").hide();
                $("#demendeComplement").show();
            }
            else if(x===0 && z===tr && y!==trD){
                $("#demendeComplement").hide();
                $("#demendeSousReserve").show();
            }
            else if(x===0 && z===tr && y===trD){
                $("#demendeComplement").hide();
                $("#demendeSousReserve").hide();
            }

        }

    </script>
    <script>
        function addStatut(etat){

            if(etat=="1"){
                $(".st").addClass("hidden");
                $(".dt").removeClass("hidden");
            }
            else if(etat=="2"){
                $(".dt").addClass("hidden");
                $(".st").removeClass("hidden");
            }

        }

        function addEtat(id){

            $.ajax({
                type: "POST",
                url :"/api/addEtatCollecte/"+id,

                data : {

                },

                success : function(response) {
                    window.location="/api/getListeCollecte/0/6/0";
                },
                error : function(response) {
                    alert(' ajout non effectué');
                }
            });

        }

        function opendemande(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

        document.getElementById('personne').onchange = function(){
            if(this.value ==28 || this.value==41){
                document.getElementById('morale').style.display = 'none';
            } else {
                document.getElementById('morale').style.display = 'block';
            }

            if(this.value ==28){
                document.getElementById('block_file').style.display = 'none';
            }else{
                document.getElementById('block_file').style.display = 'block';
            }
        };

        function updatePdf(id) {

            fetch('/api/generate_pdf_collecte/'+id)
                .then(resp => resp.blob())
                .then(blob => {
                    const url = window.URL.createObjectURL(blob);
                    const a = document.createElement('a');
                    a.style.display = 'none';
                    a.href = url;
                    // the filename you want
                    a.download = 'Collecte.pdf';
                    document.body.appendChild(a);
                    a.click();
                    window.URL.revokeObjectURL(url);
                })
                .catch(() => alert('oh no!'));


        }

        function downloadAut2(val){
            window.location.href=val;
        }

    </script>
