
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-theme/0.1.0-beta.10/select2-bootstrap.min.css" integrity="sha512-kq3FES+RuuGoBW3a9R2ELYKRywUEQv0wvPTItv3DSGqjpbNtGWVdvT8qwdKkqvPzT93jp8tSF4+oN4IeTEIlQA==" crossorigin="anonymous" />
<style>
    .tab_eye{
        width: 40px;
        height: 40px;
        padding-left: 8px;
    }
    .close1{
        background: #ce2828 !important;
        opacity: 1 !important;
        color: white !important;
        border-bottom-right-radius: 47px;
        font-size: 1.5rem;
        font-weight: 700;
        line-height: 1;
        text-shadow: 0 1px 0 #fff;
        border-color: #ce2828;
    }

    .modal-header .close1 {
        padding: 1rem 1rem;
        margin: -1rem auto -1rem -1rem;
    }
</style>
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

<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">
        <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
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
                                                        <span class="letters"><span class="letters"><spring:message code="label.Transporteur" /></span></span>
                                                      </span>
                                    </h3>                                          <div class="row p-0 m-0 mt-5">


                                    </div>


                                    <div class="row">

                                        <div class="col-12 mt-4">
                                            <div class="form-group">
                                                <label><spring:message code="label.Transporteur" /></label>
                                                <input required type="hidden" id="id_transporteurParam" value="${transporteurP.id_transporteurParam}" class="form-control">
                                                <input required type="text" id="nom" value="${transporteurP.nom}" class="form-control">
                                                <small style="color: red;font-style: italic" id="spnom"></small>
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Adresse" /></label>
                                                <input type="text" id="adresse" value="${transporteurP.adresse}" class="form-control">
                                            </div>

                                        </div>
                                        </div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Telephone" /></label>
                                                <input  required type="text" id="tel" value="${transporteurP.tel}" class="form-control">
                                                <small style="color: red;font-style: italic" id="sptel"></small>
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Fax" /></label>
                                                <input  required type="text" id="fax" value="${transporteurP.fax}" class="form-control">
                                                <small style="color: red;font-style: italic" id="spfax"></small>
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.Identifiantfiscale"/> </label>
                                                <input  required type="text" id="identifiant" value="${transporteurP.identifiant}" class="form-control">
                                                <small style="color: red;font-style: italic" id="IF"></small>
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.typededechet" /></label>
                                                <select  data-width="100%" multiple id="code" class="form-control select2" required="required">
                                                    <c:forEach items="${code }" var="c">
                                                        <option <c:forEach items="${transporteurP.code }" var="tc"> <c:if test="${c.id_code == tc.id_code}">selected</c:if> </c:forEach> value="${c.id_code}">${c.nom_ar }</option>
                                                    </c:forEach>
                                                </select>
                                                <small style="color: red;font-style: italic" id="spcode"></small>
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code="label.MoyendeTransport" /></label>
                                                <select  data-width="100%" multiple id="moyenTransport" class="form-control select2" >
                                                    <c:forEach items="${moyenTransport }" var="m">
                                                        <option <c:forEach items="${transporteurP.moyenTransport }" var="tm"> <c:if test="${m.id_moyenTransport == tm.id_moyenTransport}">selected</c:if> </c:forEach> value="${m.id_moyenTransport}">${m.nom_fr }</option>
                                                    </c:forEach>
                                                </select>
                                                <small style="color: red;font-style: italic" id="moyenT"></small>
                                            </div>

                                        </div></div>
                                        <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code='label.numerodelautorisation'/></label>
                                                <input  required type="text" id="numero_autorisation" value="${transporteurP.numero_autorisation}" class="form-control">
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><spring:message code='label.dateExpiration'/></label>
                                                <input  required type="date" id="dateFin" value="${transporteurP.dateFin}" class="form-control">
                                                <small style="color: red;font-style: italic" id="dt"></small>
                                            </div>

                                        </div></div>
                                </div>
                            </div>
                            <div class="row b mb-4" style="margin:14px;">
                                <a  class="btn btn-success btn-block " onclick="addTransporteur()" > <spring:message code="label.Enregistrer" /></a>
                                <a class="btn btn-danger-2 text-white btn-block" onclick="getFunctionParam('getParamTransporteur/0/6')"><spring:message code="label.Annuler"/></a>

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
                                                <label><spring:message code="label.Transporteur" /></label>
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
                                        <span class="letters"><span class="letters"><spring:message code="label.Transporteur" /></span></span>
                                      </span>
                                    </h4>
                                </div>
                                <div class="col-9">
                                    <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                        <span><spring:message code="label.NouveauTransporteur" /></span>
                                    </a>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-12" id="tr">
                            <table id="example2" class="table tablee">
                                <thead>
                                <tr>
                                    <th class="text-center"><spring:message code="label.Transporteur"/></th>
                                    <th class="text-center"><spring:message code="label.Adresse"/></th>
                                    <th class="text-center"><spring:message code="label.Telephone"/></th>
                                    <th class="text-center"><spring:message code="label.Fax"/></th>
                                    <th class="text-center"><spring:message code="label.dateExpiration"/></th>
                                    <th class="text-center"><spring:message code="label.typededechet"/></th>
                                    <th class="text-center"><spring:message code="label.MoyendeTransport"/></th>
                                        <th class="text-center"><spring:message code='label.numerodelautorisation'/></th>
                                    <th class="text-center"><spring:message code="label.Action"/></th>
                                </tr>
                                </thead>
                                <tbody class="tbodyy">
                                <c:forEach items="${listF}" var="f">
                                    <tr id="tr-${f.id_transporteurParam}">
                                        <td>${f.nom}</td>
                                        <td>${f.adresse}</td>
                                        <td>${f.tel}</td>
                                        <td>${f.fax}</td>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" dateStyle="long" value="${f.dateFin }"/></td>
                                        <td class="text-center">
                                            <c:if test="${not empty f.code}">
                                                <button class="btn btn-primary btn-sm rounded-circle tab_eye" onclick="show_code('${f.id_transporteurParam}')">
                                                    <span class="fa fa-dumpster"></span>
                                                </button>
                                            </c:if>
                                            <c:if test="${empty f.code}">
                                                <span class="f-12">
                                                    <spring:message code="label.Aucuncodenestenregistre" />
                                                </span>
                                            </c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:if test="${not empty f.moyenTransport}">
                                                <button class="btn btn-primary btn-sm rounded-circle tab_eye" onclick="show_moyen('${f.id_transporteurParam}')">
                                                    <span class="fa fa-truck"></span>
                                                </button>
                                            </c:if>
                                            <c:if test="${empty f.moyenTransport}">
                                                <span class="f-12">
                                                    <spring:message code="label.Aucunmoyentransportnestenregistre" />
                                                </span>
                                            </c:if>
                                        </td>
                                 <td>${f.numero_autorisation}</td>
                                        <td class="text-center" style="width: 100px !important;">
                                            <ul class="list-inline m-0">
                                                <li class="list-inline-item">
                                                    <button onclick="editTransporteur(${f.id_transporteurParam})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                                                        <div class="icon_trash_1">
                                                            <span class="fas fa-pencil-alt" style="color: orange"></span>
                                                        </div>

                                                    </button>
                                                </li>
                                                <li class="list-inline-item">
                                                    <button onclick="deleteTransporteur(${f.id_transporteurParam})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
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
                            <c:choose>
                                <c:when test="${listF!='[]'}"> <div class="text-center" dir="ltr">
                                    <c:if test="${(page)>0}">
                                        <c:set value="${page-1}" var="page_db"/>
                                        <c:set value="${totalPage-1}" var="page_LAST"/>
                                    </c:if>
                                    <c:if test="${(page)<=0}">
                                        <c:set value="0" var="page_db"/>
                                        <c:set value="0" var="page_LAST"/>
                                    </c:if>


                                    <c:set var = "salary"  value = "${totalPage-page-1}"/>
                                    <c:choose>
                                        <c:when test="${salary>5 }">
                                            <c:set var = "toAdd"  value = "5"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set var = "toAdd"  value = "${totalPage-page-1}"/>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:if test="${totalPage>0}">

                                        <select class="custom-select" id="optionselected" onchange="getParamT(this.value)" style="margin: auto; width: 100px" >

                                            <c:forEach begin="${page}" end="${totalPage-1}" var="c">
                                                <option  value="${c}"   ${c==number ? 'selected' : ''} >
                                                        ${c+1}
                                                </option>
                                            </c:forEach>

                                        </select>

                                    </c:if>
                                    <c:if test="${(page)>=(totalPage-1)}">
                                        <c:set value="${totalPage-1}" var="page_end"/>
                                    </c:if>

                                    <c:if test="${(page)<(totalPage-1)}">
                                        <c:set value="${page+1}" var="page_end"/>
                                    </c:if>




                                </div></c:when>
                                <c:otherwise>

                                    <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                </div>
            </div>
</div>

<div class="modal fade" id="staticBackdrop1" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content" style="margin-top: 15%">
            <div class="modal-header">
                <c:if test="${pageContext.response.locale!='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedescodes"/></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            onclick="hide_code()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.Listedescodes"/></h5>
                    <button type="button" class="close1" data-dismiss="modal" aria-label="Close"
                            onclick="hide_code()">
                        <span aria-hidden="true">&times;</span>
                    </button>


                </c:if>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-hover table-striped table-bordered" id="tab_vehicule">
                            <thead style="background: gray;color: white;border-color: #737373;">
                            <tr>
                                <th style="width: 15%"><spring:message code="label.Code"/></th>
                                <th><spring:message code="label.Typededechets"/> </th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td><spring:message code="label.Erreur"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hide_code()" data-dismiss="modal"><spring:message code="label.Fermer"/></button>

            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content" style="margin-top: 15%">
            <div class="modal-header">
                <c:if test="${pageContext.response.locale!='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.ListedesMoyendetransporteur"/></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            onclick="hide_moyen()">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </c:if>
                <c:if test="${pageContext.response.locale=='ar'}">
                    <h5 class="modal-title" id="staticBackdropLabel"><spring:message code="label.ListedesMoyendetransporteur"/></h5>
                    <button type="button" class="close1" data-dismiss="modal" aria-label="Close"
                            onclick="hide_moyen()">
                        <span aria-hidden="true">&times;</span>
                    </button>


                </c:if>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-12 table-responsive">
                        <table class="table table-hover table-striped table-bordered" id="tab_moyen">
                            <thead style="background: gray;color: white;border-color: #737373;">
                            <tr>
                                <th><spring:message code="label.MoyendeTransport"/> </th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr>
                                <td><spring:message code="label.Erreur"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" onclick="hide_moyen()" data-dismiss="modal"><spring:message code="label.Fermer"/></button>

            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>
<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">

    function addTransporteur(){

        var id_transporteurParam=$("#id_transporteurParam").val();
        var nom=$("#nom").val();
        var adresse=$("#adresse").val();
        var tel=$("#tel").val();
        var fax=$("#fax").val();
        var identifiant=$("#identifiant").val();
        var numero_autorisation=$("#numero_autorisation").val();
        var code=$("#code").val();
        var moyenTransport=$("#moyenTransport").val();
        var dateFin = $("#dateFin").val();

        if(code==""){
           document.getElementById('spcode').innerHTML="Choisir Un Code";
        }else{
            document.getElementById('spcode').innerHTML="";
        }
        if(code==""){
            document.getElementById('spcode').innerHTML="Choisir Un Code";
        }else{
            document.getElementById('spcode').innerHTML="";
        }
        if(nom==""){
            document.getElementById('spnom').innerHTML="Entrez Un Nom";
        }else{
            document.getElementById('spnom').innerHTML="";
        }
        if(moyenTransport==""){
            document.getElementById('moyenT').innerHTML="Choisir Un Moyen Transport";
        }
        if(dateFin==""){
            document.getElementById('dt').innerHTML="Entrez une date d'expiration";
        }
        else {
            var fournisseur = {

                "id_transporteurParam": id_transporteurParam,
                "nom": nom,
                "adresse": adresse,
                "tel": tel,
                "fax": fax,
                "identifiant": identifiant,
                "numero_autorisation": numero_autorisation,
                "dateFin":dateFin
            }
            $.ajax({
                type: "POST",

                url: "/api/addParamTransporteur/" + code + "/" + moyenTransport,
                contentType: 'application/json; charset=utf-8',

                data: JSON.stringify(fournisseur),

                success: function (response) {

                    $(".mpParam").html(response);
                },
                error: function (response) {

                    alert('Erreur ajout non effectué');

                }
            });
        }
    }

    function deleteTransporteur(id){

            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.supprimer"/>',
                cancelButtonText: '<spring:message code="label.Annuler"/>'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/api/deleteParamTransporteur/"+id,
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
                        'success',
                    )
                }
            })



        }
    function editTransporteur(id){
        $.ajax({
            type : "GET",
            url :"/api/editParamTransporteur/"+id,
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

    $(document).ready(function() {
        $(".select2").select2();
        $('.dropdown-toggle').dropdown();

    });

    function searchBy() {

        var nom=$("#nomtr").val();

        if(nom==="" ){

            return false;
        }
        $.ajax({
                url: "/api/getTransporteurSearch/"+nom,
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

    function show_code(id) {
        event.preventDefault();
        $("#staticBackdrop1").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getOneCodeTransporteur",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    /*if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/";
                    }*/
                    $("#tab_vehicule tbody").html("");
                    if ($(response.code).length > 0)

                        $(response.code)
                            .each(
                                function(idx, el) {
                                    var btn_url = "";

                                    var tr = "<tr> <td>"
                                        + el.nom_fr
                                        + "</td> <td>"
                                        + el.nom_ar
                                        + "</td> </tr>";

                                    $("#tab_vehicule tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }

    function hide_code(){
        $("#staticBackdrop1").modal("hide")
    }

    function show_moyen(id) {
        event.preventDefault();
        $("#staticBackdrop2").modal("show")
        var data = new FormData();
        data.append("id", id);
        $
            .ajax({
                type : "POST",
                enctype : 'multipart/form-data',
                url : "/api/getOneMoyenTransporteur",
                data : data,
                processData : false,
                contentType : false,
                cache : false,
                success : function(response) {
                    console.log(response);
                    /*if(response.url_Admin==null || response.url_Admin==""){
                        window.location.href="/";
                    }*/
                    $("#tab_moyen tbody").html("");
                    if ($(response.moyenTransporteur).length > 0)
                        $(response.moyenTransporteur)
                            .each(
                                function(idx, el) {
                                    var btn_url = "";

                                    var tr = "<tr> <td>"
                                        + el.nom_ar
                                        + "</td> </tr>";

                                    $("#tab_moyen tbody")
                                        .append(tr);
                                })

                },
                error : function() {

                }
            });
    }
    function hide_moyen(){
        $("#staticBackdrop2").modal("hide")
    }

</script>








