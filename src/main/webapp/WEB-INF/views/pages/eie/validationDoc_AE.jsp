
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
<style>
    .bg_error{
        box-shadow: 0px 0px 20px #ff5363;
        border-color: #ff5363 !important;
    }
</style>
<div class="main-panel " style="margin-top:80px">
    <div class="content-wrapper mt-4">

        <div class="row justify-content-center mt-4">
            <div class="col-md-12 col-sm-12 col-lg-11" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <c:set var="p_page" value="${pageContext.response.locale=='ar'?'التحقق من صحة الوثيقة':'Validation des Documents'}"/>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb ml-4">
                        <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'margin-right:-4%':'margin-left:-4%'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
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
                        <li class="breadcrumb-item"><a href="${url_mini}">${pp_page}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                    </ol>
                </nav>

                <div class="row justify-content-center mt-3 myrow">
                    <div class="col-md-10 col-sm-12 table-responsive pt-4">
                        <form name="doc" id="doc_tmp">
                            <div class="table-responsive">
                                <table class="table responsive table-striped table-hover table-bordered tw_tab">
                                    <tr class="bg-vert">
                                        <td > <spring:message code="label.Piecejointe"/> </td>
                                        <td style="width: 50%"> <spring:message code="label.Document"/>  </td>
                                        <td id="statu"> <spring:message code="label.Statut"/>  </td>
                                        <td> <spring:message code="label.Commentaire"/>  </td>
                                    </tr>
                                    <c:forEach items="${doc}" var="dc" varStatus="loop">
                                        <c:if test="${dc.nom_ar!='oui'}">
                                            <tr>
                                                <td> <a target="_blank" download href="${dc.url}" class="btn btn-success f-18 rounded-circle btn_icon"> <span class="fa fa-download"></span></a> </td>
                                                <td> ${pageContext.response.locale=='ar'?dc.docImport.nom_ar:dc.docImport.nom_fr } </td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input id="check${dc.id_listDocNotif }" onchange="validate_list('${dc.id_listDocNotif }',this)" ${dc.nom_ar.equals('oui')?'checked':'' }  data-choose="#idlist${dc.id_listDocNotif }" class="form-check-input my_check check_ae" type="checkbox" id="flexSwitchCheckDefault" name="transport">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="row">
                                                        <div class="col" >
                                                            <textarea  onchange="addComment_list('${dc.id_listDocNotif }',this)" rows="2"class="form-control mb-0" id="idlist${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                    <c:forEach items="${demande.documents_AE}" var="docv">
                                        <c:if test="${docv.statut!='oui'}">
                                            <tr>
                                                <td> <a target="_blank" download href="${docv.url_file}" class="btn btn-success f-18 rounded-circle btn_icon"> <span class="fa fa-download"></span></a> </td>
                                                <td> ${docv.nom_fr} </td>
                                                <td>
                                                    <div class="form-check form-switch">
                                                        <input id="ae_check${docv.id_documents_ae}" onchange="validate_doc_AE(${docv.id_documents_ae},this)" ${dc.nom_ar.equals('oui')?'checked':'' }  data-choose="#idcom${docv.id_documents_ae }" class="form-check-input my_check check_ae" type="checkbox" id="flexSwitchCheckDefault" name="transport">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="row">
                                                        <div class="col" >
                                                            <textarea  onchange="addComment_doc('${docv.id_documents_ae }',this)" rows="2" class="form-control mb-0" id="idcom${docv.id_documents_ae }" >${docv.commentaire }</textarea>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:if>

                                    </c:forEach>
                                </table>
                            </div>
                        </form>

                        <div class="row justify-content-end">
                            <c:if test="${demande.statut.id_statut_projet!=89}">
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 p-1">
                                    <button class="btn btn-primary btn-block " id="valider" onclick="changer_statu('${demande.id_demande_information}','58','${type}')" ><spring:message code="label.Valider"/> </button>
                                </div>
                            </c:if>
                            <c:if test="${demande.statut.id_statut_projet==89}">
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 p-1">
                                    <button class="btn btn-primary btn-block "  onclick="changer_statu('${demande.id_demande_information}','73','${type}')" ><spring:message code="label.Valider"/> </button>
                                </div>
                            </c:if>
                            <c:if test="${demande.statut.id_statut_projet!=72}">
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 p-1">
                                    <button class="btn btn-secondary btn-block" id="non_conforme" onclick="changer_statu('${demande.id_demande_information}','59','${type}')" style="background: #f95f5f;"><spring:message code="label.Incomplet"/> </button>
                                </div>
                            </c:if>
                            <c:if test="${demande.statut.id_statut_projet==72}">
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 p-1">
                                    <button class="btn btn-secondary btn-block" id="non_conforme" onclick="changer_statu('${demande.id_demande_information}','90','${type}')" style="background: #f95f5f;"><spring:message code="label.Incomplet"/> </button>
                                </div>
                            </c:if>
                            <c:if test="${demande.type=='NT'}">
                                <div class="col-xl-2 col-lg-4 col-md-4 col-sm-6 p-1">
                                    <button class="btn btn-success btn-block" onclick="go_link('/api/planifier_visite/${demande.id_demande_information}')" style="background: #f95f5f;"><spring:message code="label.Planifierunevisite"/> </button>
                                </div>
                            </c:if>
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

    $("input:checkbox:not(.check_ae)").change(function() {
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

        if(statut==="59" || statut==="90") {
            var test = false;
            var tr = $ (".myrow").find ("textarea").not (".d-none")
            $ (tr).each (function (idx, el) {
                if ($(el).val() === "") {
                    $(el).addClass("bg_error");
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
                return false;
            }
        }

        $.ajax ({
                type: "POST",
                url: "/api/changerStatut1/" + id + "/" + statut,
                data: {},
                success: function (response) {
                    //verifie si #statut existe
                    if (type1 == "AE" && statut == 59 && $ ("#statu").length == 0) {
                        $ ("#zone_document_complementaire").removeClass ("d-none");
                        $ (".z_ae").addClass ("d-none");
                        return false;
                    } else if (statut == 58 && type1 != 'NT' && type1 != 'AE')
                        window.location.href = "/api/editdemande/" + response + "/all/" + type1;
                    else
                        window.location.href = "/api/getEie/" + type1 + "/0/6/0";
                },
                error: function (response) {
                    alert ('Erreur ajout non effectué');
                }
            });


    }

</script>
