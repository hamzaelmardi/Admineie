<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<jsp:include page="../../includes/header.jsp"/>
<jsp:include page="../../menu/menu.jsp"/>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date"/>

<script>
    $( function() {
    $( "#accordion" ).accordion({
    collapsible: true,
    heightStyle: "content",
    });
    } );
    </script>
<style>
    body{ font-family: 'Arvo', sans-serif !important; }
</style>
<style>
    .accordion .panel{
        border: none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 0 10px;
        overflow: hidden;
        position: relative;
    }
    .accordion .panel-heading{
        padding: 0;
        border: none;
        border-radius: 0;
        margin-bottom: 10px;
        z-index: 1;
        position: relative;
    }
    .accordion .panel-heading:before,
    .accordion .panel-heading:after{
        content: "";
        width: 50%;
        height: 20%;
        box-shadow: 0 15px 5px rgba(0, 0, 0, 0.4);
        position: absolute;
        bottom: 15px;
        left: 10px;
        transform: rotate(-1deg);
        z-index: -1;
    }
    .accordion .panel-heading:after{
        left: auto;
        right: 10px;
        transform: rotate(1deg);
    }
    .accordion .panel-title a{
        display: block;
        padding: 15px 70px 15px 70px;
        margin: 0;
        background: #206c45;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
        color: #fff !important;
        border-radius: 0;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1), 0 0 40px rgba(0, 0, 0, 0.1) inset;
        position: relative;
    }
    .accordion .panel-title a:before,
    .accordion .panel-title a.collapsed:before{
        content: "\f106";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        width: 55px;
        height: 100%;
        text-align: center;
        line-height: 50px;
        border-right: 5px solid #fff;
        position: absolute;
        top: 0;
    ${pageContext.response.locale=="fr"?'right':'left'}: 0;
    }
    .accordion .panel-title a.collapsed:before{ content: "\f107"; }
    .accordion .panel-title a .icon{
        display: inline-block;
        width: 55px;
        height: 100%;
    ${pageContext.response.locale=="fr"?'border-right':'border-left'}: 5px solid #fff;
        font-size: 20px;
        color: #fff;
        line-height: 50px;
        text-align: center;
        position: absolute;
        top: 0;
    ${pageContext.response.locale=="fr"?'left':'right'}: 0;
    }
    .panel-body .table{
        margin: 0;
        border: 1px solid #e7e7e7;
    }
    .panel-body .table tr td{ border-color: #e7e7e7; }
    .panel-body .table thead tr.active th{
        color: #fff;
        background-color: #6D7AE0;
        font-size: 16px;
        font-weight: 500;
        padding: 12px;
        border: 1px solid #6D7AE0;
    }
    .panel-body .table tbody tr:hover{ background-color: rgba(109, 122, 224, 0.1); }
    .panel-body .table tbody tr td{
        color: #555;
        padding: 8px 12px;
        vertical-align: middle;
    }
    .panel-body .table tbody .btn{
        border-radius: 0;
        transition: all 0.3s ease;
    }
    .panel-body .table tbody .btn:hover{ box-shadow: 0 0 0 2px #333; }
    .panel-footer{
        background-color: #fff;
        padding: 0 15px 5px;
        border: none;
    }

</style>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>

<div class="row-fluid mt-2 ml-4" style="margin-top:182px !important;">
    <div class="col-12">
        <nav aria-label="breadcrumb ml-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" >
            <ol class="breadcrumb ml-4" style="margin-top: -24px !important;">
                <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page"><a href="/api/getListeCollecte/0/6/0"><spring:message code="label.CollecteETTransportDesDEchets"/></a></li>
            </ol>
        </nav>
    </div>
</div>

<div class="row justify-content-center pl-3 pr-3 mt-4" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
    <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="jumbotron p-3">
         <spring:message code="label.Statutdelademande"/> : <span class="h4 font-weight-bold" style="color: #3b5998"> ${collecte.statut.nom_fr} </span><span>
        </span>
        </div>
    </div>
</div>

<div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-md-10 col-sm-12" style="margin-right: ${pageContext.response.locale=="ar"?"-7px":"7px"}">
        <div class="row p-0 mb-2">
                <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                    <a href="/api/generate_recap_collecte/${collecte.id_collecte }" class="btn btn-primary btn-block"><i class="fa fa-print" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.TelechargerleRecap"/> </a>
                </div>
                <c:if test="${collecte.statut.id_statut_projet == 19  }">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="goToLien('${collecte.id_collecte}/0')" class="btn btn-primary btn-block"><i class="fa fa-edit" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.Planificationreuniondecommission"/></a>
                    </div>
                </c:if>

                <c:if test="${collecte.statut.id_statut_projet == 15 }">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="goToLien1('${collecte.id_collecte}')" class="btn btn-primary btn-block" ><i class="fa fa-edit" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.Validerlesdocuments"/> </a>
                    </div>
                </c:if>
                <c:if test="${collecte.statut.id_statut_projet == 43 || collecte.statut.id_statut_projet == 44}">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="goToLien2('${collecte.id_collecte}')" class="btn btn-primary btn-block" ><i class="fa fa-edit" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.avisdeministre"/> </a>
                    </div>
                </c:if>
                 <c:if test="${(collecte.statut.id_statut_projet == 28 && user.poste.id_Poste!=1 && user.poste.id_Poste!=3) || (collecte.statut.id_statut_projet == 28 && user.poste.id_Poste!=1 && user.compteId!=collecte.compteAffecte.compteId)}">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="goToLien3('${collecte.id_collecte}')" class="btn btn-primary btn-block" ><i class="fa fa-signature" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i> <spring:message code="label.Telehargeretsignerlautorisation"/></a>
                    </div>
                </c:if>
                <c:if test="${collecte.statut.id_statut_projet==56}">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="downloadColl('${fn:replace(collecte.url_doc_signer,"/assets/myFile/","/dowload_uploaded/")}')" class="btn btn-primary btn-block"><i class="fa fa-download" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.Telechargerlautorisation"/> </a>
                    </div>
                </c:if>
                <c:if test="${collecte.statut.id_statut_projet == 23 || collecte.statut.id_statut_projet==70 }">
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <a type="button" style="background-color:  #d59d32" onclick="goToLien4('${collecte.id_collecte}')" class="btn btn-primary btn-block"><i class="fa fa-check" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i><spring:message code="label.attentedavisdecommission"/>  </a>
                    </div>
                    <div class="col-mt-4 col-md-auto col-sm-6 m-1">
                        <c:if test="${collecte.reunions.size()>0}">
                            <a onclick="goToLien5('${collecte.id_collecte}/${collecte.reunions.get(collecte.reunions.size()-1).id_reunion}')" style="background-color:  #d59d32" type="button" class="btn btn-primary btn-block" ><i class="fa fa-edit" style="margin-left: ${pageContext.response.locale=="ar"?"6px":""}"></i> <spring:message code="label.Editreunionde"/> ${collecte.reunions.get(collecte.reunions.size()-1).date_reunion}</a>
                        </c:if>
                    </div>
                </c:if>
        </div>
    </div>
</div>

<input type="hidden" id="id_collecte" value="${collecte.id_collecte}" />
<%--
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <i class="icon fa fa-globe"></i>
                                Section 1
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem, dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <i class="icon fa fa-briefcase"></i>
                                Section 2
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem, dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="icon fa fa-mobile"></i>
                                Section 3
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem, dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
--%>

<div class="row justify-content-center mt-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
    <div class="col-md-10 col-sm-10">
        <div class="bg-white" id="accordion-style-1">
            <div class="row">
                <div class="col-12">
                    <div class="accordion" id="accordionExample">
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingTwo">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn  " type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-user"></i>
                                       <spring:message code="label.Informationdemandeur"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseTwo" class="collapse show fade" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                <div class="card-body">
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Numerodedemande"/>  </label>
                                                <input type="text" disabled value="${collecte.num_demande}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 ${collecte.typeRenouvellement.id_type_renouvellement==3?'d-block':'d-none'}">
                                             <div class="form-group">
                                                 <label> Date de demande d'avenant </label>
                                                 <fmt:formatDate value="${collecte.dateAvenant}" pattern="dd-MM-yyyy" var="dateAvenant"/>
                                                 <input type="text" disabled value="${dateAvenant}" class="form-control">
                                             </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Raisonsociale"/>  </label>
                                                <input type="text" disabled value="${collecte.raison}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Identifiantfiscale"/> </label>
                                                <input type="text" disabled value="${collecte.idfiscale}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.CIN"/> </label>
                                                <input type="text" disabled value="${collecte.cin}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Representant"/> </label>
                                                <input type="text" disabled value="${collecte.demandeur_Nom}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Adresse"/> </label>
                                                <input type="text" disabled value="${collecte.demandeurAdresse}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Telephone"/>  </label>
                                                <input type="text" disabled value="${collecte.demandeurTel}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Fax"/>  </label>
                                                <input type="text" disabled value="${collecte.demandeurFax}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group">
                                                <label> <spring:message code="label.Email"/> </label>
                                                <input type="text" disabled value="${collecte.demandeurEmail}" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingOne">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn  collapsed " type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-trash-restore"></i><spring:message code="label.Catalougue"/>
                                    </a>
                                </h5>
                            </div>

                            <div id="collapseOne" class="collapse fade" aria-labelledby="headingOne" data-parent="#accordionExample">

                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingThree">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  " type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-car mr-3"></i>
                                        <spring:message code="label.Donneessurvehicules"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseThree" class="collapse fade" aria-labelledby="headingThree" data-parent="#accordionExample">

                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingFour">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  " type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-files-o mr-3"></i><spring:message code="label.PiecesJointes"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFour" class="collapse fade" aria-labelledby="headingFour" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table my_table table-striped table-bordered table-hover">
                                        <c:if test="${not empty doc}">
                                            <c:forEach items="${doc}" var="file">
                                                <tr>
                                                    <td>${pageContext.response.locale=='ar'?file.docImport.nom_ar:file.docImport.nom_fr}</td>
                                                    <td>
                                                        <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(file.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty doc}">
                                            <tr>
                                                <td colspan="2"><spring:message code="label.AucunFichier"/>  </td>
                                            </tr>
                                        </c:if>

                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="card-header panel-heading" id="headingFive">
                                <h5 class="mb-0 panel-title">
                                    <a class="accordion-toggle btn collapsed  " type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <i class="icon fa fa-file-download mr-3"></i><spring:message code="label.Telechargement"/>
                                    </a>
                                </h5>
                            </div>
                            <div id="collapseFive" class="collapse fade" aria-labelledby="headingFive" data-parent="#accordionExample">
                                <div class="card-body">
                                    <table class="table my_table table-striped table-bordered table-hover">
                                        <tr>
                                            <c:if test="${not empty collecte.document_attache }">
                                            <td style="width: 93%">
                                                <spring:message code="label.rapportdeconformite"/>
                                            </td>
                                            <td class="text-center">
                                                        <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(collecte.document_attache, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                            </td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <c:if test="${not empty collecte.url_pv_commission }">
                                            <td style="width: 93%">
                                                <spring:message code="label.Pvdelacommission"/>
                                            </td>
                                            <td class="text-center">
                                                    <a target="_blank" class="btn btn-success" href="${url_Admin}${fn:replace(collecte.url_pv_commission, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-download"></span></a>
                                            </td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td style="width: 93%">
                                                <spring:message code="label.lautorisationpoursignature"/>
                                            </td>
                                            <td class="text-center">
                                                <a  class="btn btn-success" href="/api/generate_word_collecte/${collecte.id_collecte}"> <span class="fa fa-download"></span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>

<jsp:include page="../../includes/footer.jsp"/>
<script>
    function goToLienRecap_CT(val){
        window.location.href='/api/recap_collecte/'+val;
    }
    function goToLien(val){
        window.location.href='/api/reunionCollecte/'+val;
    }
    function  goToLien1(val){
        window.location.href='/api/validateDocCollecte/'+val;
    }
    function  goToLien2(val){
        window.location.href='/api/validationFinalCollecte/'+val;
    }
    function goToLien3(val){
        window.location.href='/api/down_sign_docCollecte/'+val;
    }
    function goToLien4(val){
        window.location.href='/api/avis_commission/'+val;
    }
    function goToLien5(val){
        window.location.href='/api/reunionCollecte/'+val;
    }
    function downloadColl(val){
        window.location.href=val;
    }

    $(document).ready(function(){
        var id = $("#id_collecte").val();
        $.ajax({
            type: "GET",
            url :"/api/getVihucules/"+id,
            data : {
            },

            success : function(response) {
                $("#collapseThree").html(response)
            },
            error : function(response) {
                alert(' ajout non effectué');
            }
        });
    });

    $(document).ready(function(){
        var id = $("#id_collecte").val();
        $.ajax({
            type: "GET",
            url :"/api/getCodes/"+id,
            data : {
            },
            success : function(response) {
                $("#collapseOne").html(response)
            },
            error : function(response) {
                alert(' ajout non effectué');
            }
        });
    });
</script>
