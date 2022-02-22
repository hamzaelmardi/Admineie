
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>
<style>
    .bg_sucess{
        box-shadow: 0px 0px 20px #20d006;
        border-color: #20d006 !important;
    }
    .bg_error{
        box-shadow: 0px 0px 20px #ff5363;
        border-color: #ff5363 !important;
    }
</style>
<div class="main-panel " style="margin-top:80px">
    <div class="content-wrapper mt-4">

        <div class="row mt-5">

            <div class="col-md-12 col-sm-12 col-lg-12" >
                <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <nav aria-label="breadcrumb ml-4">
                    <ol class="breadcrumb ml-4">
                        <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'};top: -8px !important;"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                        <spring:message code="label.validerlesdocuments" var="p_page"/>
                        <c:if test="${type=='EE'}">
                            <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                        </c:if>
                        <c:if test="${type=='NT'}">
                            <spring:message code="label.Noticedimpact" var="pp_page"/>
                        </c:if>
                        <c:if test="${type=='AE'}">
                            <spring:message code="label.Auditenvirementale" var="pp_page"/>
                        </c:if>

                        <c:set var="url_mini" value="/api/getEie/${type}/0/6/0"/>
                        <li class="breadcrumb-item ${pageContext.response.locale!='ar'?'':'mr-5'}"><a href="${url_mini}">${pp_page}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                    </ol>
                </nav>
                </div>

                <div class="row justify-content-center mt-3 myrow">
                    <div class="col-md-10 col-sm-12 table-responsive pt-4">

                        <c:choose>
                            <c:when test="${type!='AE' }">
                                <form name="doc" id="doc_tmp">
                                    <table class="table table-striped table-hover table-bordered tw_tab">
                                        <tr class="bg-vert">
                                            <td > <spring:message code="label.Piecejointe"/> </td>
                                            <td style="width: 50%"> <spring:message code="label.Document"/>  </td>
                                            <td> <spring:message code="label.Statut"/>  </td>
                                            <td> <spring:message code="label.Commentaire"/>  </td>
                                        </tr>
                                        <c:forEach items="${doc}" var="dc">
                                            <c:if test="${!dc.nom_ar.equals('oui')}">
                                                <tr>
                                                    <td> <a target="_blank" download href="${fn:replace(dc.url, "/assets/myFile/", "/api/dowload_uploaded/")}" class="btn btn-success f-18 rounded-circle btn_icon"> <span class="fa fa-download"></span></a> </td>
                                                    <td> ${pageContext.response.locale=='ar'?dc.docImport.nom_ar:dc.docImport.nom_fr } </td>
                                                    <td>
                                                        <div class="form-check form-switch">
                                                            <input id="check${dc.id_listDocNotif }" onchange="validate(${dc.id_listDocNotif })" ${dc.nom_ar.equals('oui')?'checked':'' }  data-choose="${dc.id_listDocNotif }" class="form-check-input my_check" type="checkbox" id="flexSwitchCheckDefault" name="transport">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="row">
                                                            <div class="col" >
                                                                <textarea  onchange="addComment('${dc.id_listDocNotif }')" rows="2"class="form-control mb-0" id="id${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </table>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-striped table-hover table-bordered tw_tab z_ae" >
                                    <tr class="bg-vert">
                                        <td > <spring:message code="label.Piecejointe"/> </td>
                                        <td style="width: 50%"> <spring:message code="label.Document"/>  </td>
                                        <td> <spring:message code="label.Commentaire"/>  </td>
                                    </tr>
                                            <tr>
                                                <td> <a target="_blank" download href="${demande.url_file_AE}" class="btn btn-success f-18 rounded-circle btn_icon"> <span class="fa fa-download"></span></a> </td>
                                                <td> <spring:message code="label.Descriptionduprojet"/> </td>
                                                <td>
                                                    <div class="row">
                                                        <div class="col" >
                                                            <textarea  onchange="addComment_AE('${demande.id_demande_information}',this)" rows="2" class="form-control mb-0" >${demande.commentaire_url_file_AE }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                </table>
                            </c:otherwise>
                        </c:choose>


                        <div class="row justify-content-end z_ae">

                            <c:choose>
                                <c:when test="${type!='AE'}">
                                    <div class="col-xl-2 col-lg-4 p-1">
                                        <button class="btn btn-primary btn-block " id="valider" onclick="changer_statu('${demande.id_demande_information}','58','${type}')" ><spring:message code="label.Valider"/> </button>
                                    </div>

                                    <div class="col-xl-2 col-lg-4 p-1">
                                        <button class="btn btn-secondary btn-block" id="non_conforme" onclick="changer_statu('${demande.id_demande_information}','59','${type}')" style="background: #f95f5f;"><spring:message code="label.Incomplet"/> </button>
                                    </div>
                                    <%--<c:if test="${demande.type=='NT'}">
                                        <div class="col-2 p-1">
                                            <button class="btn btn-success btn-block" onclick="go_link('/api/planifier_visite/${demande.id_demande_information}')" style="background: #f95f5f;">Planifier une visite </button>
                                        </div>
                                    </c:if>--%>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-xl-2 col-lg-4 p-1">
                                        <button class="btn btn-primary btn-block "  onclick="changer_statu('${demande.id_demande_information}','73','${type}')" ><spring:message code="label.Valider"/> </button>
                                    </div>
                                    <div class=" col-xl-2 col-lg-4 p-1">
                                        <button class="btn btn-secondary btn-block text-dark" onclick="changer_statu('${demande.id_demande_information}','59','${type}')" style="background: #f95f5f;"><spring:message code="label.Incomplet"/> </button>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>

                        <c:if test="${type=='AE'}">
                            <div class="row justify-content-center d-none" id="zone_document_complementaire" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="col-6 border p-2">
                                    <button class="btn btn-primary-2 btn-block"><spring:message code="label.Documentscomplementaires"/></button>
                                    <div class="row mt-4" id="rows_document">
                                        <c:forEach items="${demande.documents_AE}" var="d">
                                            <div class="col-sm-12" >
                                                <div class="form-group">
                                                    <label>
                                                        <spring:message code="label.Descriptiondudocument"/>
                                                    </label>
                                                    <div class="row p-0">
                                                        <div class="col-10 pr-0">
                                                            <input type="text" class="form-control file_name" value="${d.nom_fr}" disabled>
                                                        </div>
                                                        <div class="col-2 pl-3">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <button onclick="delete_doc('${d.id_documents_ae}','${demande.id_demande_information}')" class="btn btn-danger-2 btn-block btn-sm pt-1"><span class="fa fa-minus"></span></button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </c:forEach>
                                        <div class="col-sm-12" >
                                            <div class="form-group text-left">
                                                <label>
                                                    <spring:message code="label.Descriptiondudocument"/>
                                                </label>
                                                <div class="row p-0">
                                                    <div class="col-10 pr-0">
                                                        <input type="text" id="fiel_name" class="form-control file_name">
                                                    </div>
                                                    <div class="col-2 pl-3">
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <button onclick="save_doc_AE('${demande.id_demande_information}')" class="btn btn-primary-2 btn-block btn-sm pt-1"><span class="fa fa-check"></span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-md-4 col-sm-12">
                                            <a href="/api/getEie/AE/0/6/0" class="btn btn-primary btn-block">
                                                <spring:message code="label.Enregistrer"/>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </div>
                <div class="row justify-content-center m-0 p-0 mt-3 souscat" style="display: none;">
                    <div class="col-12">
                        <div class="row mt-4 justify-content-center">
                            <div class="col-12 from_add" id="frm_etatDoss">
                                <div class="row p-0 m-0 justify-content-center">
                                    <div class="col-md-8 p-4 mt-5 col-sm-12 grid-margin" >
                                        <div class="photo  hvr-buzz-out" >
                                            <i class="mdi icc mdi-file-plus menu-icon"></i>
                                        </div>
                                        <div class="card">
                                            <div class="row justify-content-center">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                                    </div>
                                                </div>

                                                <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                    <h3 class="ml6 float-right" style="color:#336c4e !important; margin-top: -5px">
                                                      <span class="text-wrapper">
                                                                <span class="letters"><span class="letters">Ajouter categorie</span></span>
                                                      </span>
                                                    </h3>
                                                    <div class="row p-0 m-0 mt-5">
                                                    </div>
                                                    <form style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}" class="form-horizontal mt-3" id="deposestatut" name="deposestatut" method="post">
                                                        <div class="row m-0 p-0 mt-5">
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="form-group text-left">
                                                                    <label><spring:message code="label.Typedeprojet"/></label>
                                                                    <select class="form-control select2" multiple onchange="addCategorieToDemande(this,'${demande.id_demande_information}')" style="width: 100% !important" ${dd}>
                                                                        <c:forEach items="${categories}" var="cat" >
                                                                            <option
                                                                                    <c:forEach items="${demande.categories}" var="cc" >
                                                                                        ${cc.id_categorie==cat.id_categorie?"selected":""}
                                                                                    </c:forEach>
                                                                                    value="${cat.id_categorie}"> ${pageContext.response.locale=='ar'?cat.nom_ar:cat.nom_fr} </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 col-sm-12">
                                                                <div class="form-group text-left">
                                                                    <label><spring:message code="label.Soustypedeprojet"/></label>
                                                                    <select name="souscategorie_id" id="soucat"  class="form-control select2" multiple onchange="addSousCategorieToDemande(this,'${demande.id_demande_information}')" style="width: 100% !important" ${dd}>

                                                                        <c:forEach items="${souscategories}" var="p">
                                                                            <option <c:forEach items="${demande.sousCategories}" var="pp">

                                                                                ${pp.id_souscategorie==p.id_souscategorie?"selected":""}

                                                                            </c:forEach> value="${p.id_souscategorie}">${pageContext.response.locale=='ar'?p.nom_ar:p.nom_fr}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row m-0 p-0 mt-5 pb-4 justify-content-end">
                                                            <div class=" col-xl-2 col-lg-4 p-1">
                                                                <button class="btn btn-secondary btn-block text-white" onclick="retourNT()" style="background: #f95f5f;"><spring:message code="label.Retour"/> </button>
                                                            </div>
                                                            <div class="col-xl-2 col-lg-4 p-1">
                                                                <a type="button" class="btn btn-primary btn-block" href="/api/getEie/NT/0/6/0" ><spring:message code="label.Enregistrer"/> </a>
                                                            </div>
                                                        </div>
                                                    </form>
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
</div>
<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<script type="text/javascript">

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
                /*  swal("Commentaire Enregistrer","Votre commentaire a été enregistrer avec success","success"); */
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
                alert(' ajout non effectué');
            }
        });
    });

    function changer_statu(id,statut,type1){

        if(statut ==="59") {
            var test = false;
            var tr = $ (".myrow").find ("textarea").not (".hidden")
            $ (tr).each (function (idx, el) {
                if ($ (el).val () === "") {
                    $ (el).addClass ("bg_error");
                    test = true;
                }
            });

            if (test) {

                swal ({
                    title: "<spring:message code="label.Avertissement"/>",
                    text: "ajouter un commentaire",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#b3ff99",
                    confirmButtonText: "Ok",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
                return flase;
            }
        }

        $.ajax({
                type: "POST",
                url :"/api/changerStatut1/"+id+"/"+statut,
                data : {},
                success : function(response) {
                    if(type1=="AE" && statut==59){
                        $("#zone_document_complementaire").removeClass("d-none");
                        $(".z_ae").addClass("d-none");
                        return false;
                    }
                    else if(statut==58 && type1!='NT' && type1!='AE'){
                        window.location.href="/api/editdemande/"+response+"/all/"+type1;
                    }
                    else if(statut == 58 && type1 == 'NT'){
                        $(".souscat").show();
                        $(".myrow").hide();
                    }
                    else {
                        window.location.href="/api/getEie/"+type1+"/0/6/0";
                    }
                },
                error : function(response) {
                    alert('Erreur ajout non effectué');
                }
            });


    }


    function  retourNT(){
        $(".souscat").hide();
        $(".myrow").show();
    }

</script>
