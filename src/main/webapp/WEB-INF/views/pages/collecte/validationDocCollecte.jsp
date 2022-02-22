

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link href="/assets/css/custom.css" >
<style>
    .breadcrumb {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-wrap: wrap;
        flex-wrap: wrap;
        padding: 0.75rem 1rem;
        margin-bottom: 1rem;
        list-style: none;
        background-color: #e9ecef;
        border-radius: 0.25rem;
    }
</style>

<div class="main-panel " style="margin-top:120px">
    <div class="content-wrapper">


        <div class="row mt-5 pt-5">
            <c:choose>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/validateDocCollecte/')}">
                    <c:set var="p_page" value="Validation des Documents"/>
                </c:when>


                <c:otherwise>
                    <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                </c:otherwise>
            </c:choose>

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb ml-4">
                    <li class="breadcrumb-item"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                    <li class="breadcrumb-item"><a href="/api/getListeCollecte/0/6/0"><spring:message code="label.CollecteETTransportDesDEchets"/></a></li>
                    <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                </ol>
            </nav>
            <div class="col-md-12 col-sm-12 col-lg-12 mt-4" >

                <div class="row justify-content-center">

                    <div class="col-10 table-responsive pt-4">
                        <form name="doc" id="doc_tmp">
                            <table class="table table-striped table-hover table-bordered tw_tab">
                                <tr class="bg-vert">
                                    <td > <spring:message code="label.Piecejointe"/> </td>
                                    <td style="width: 50%">  <spring:message code="label.Document"/> </td>
                                    <td> <spring:message code="label.Statut"/> </td>
                                    <td>  <spring:message code="label.Commentaire"/> </td>
                                </tr>
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
                                                <div class="row">
                                                    <div class="col" >
                                                            <%-- <textarea rows="2"class="form-control mb-0" id="id${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>--%>
                                                        <textarea  onchange="addComment('${dc.id_listDocNotif }')" rows="2"class="form-control mb-0" id="id${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>
                                                    </div>
                                                        <%--<div class="col-auto">
                                                            <button class="btn btn-success btn-block" onclick="addComment('${dc.id_listDocNotif }')" ><spring:message code="label.Enregistrer"/></button>
                                                        </div>
                                                    </div>--%>



                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                    </table>
                    <div class="row justify-content-end">
                           <div class="col-2 p-1">
                                <button disabled class="btn btn-primary btn-block" id="valider" onclick="addEtat(${id},'28')" ><spring:message code="label.Valider"/> </button>
                            </div>
                                <div class="col-2 p-1">
                                    <button class="btn btn-secondary btn-block" id="non_conforme" onclick="addEtat(${id},'41')" style="background: #f95f5f;"> <spring:message code="label.Incomplet"/></button>
                                </div>
                            </div>
                        </form>
                    </div
                    >
                </div>




                <!-- debut from etat dossier -->
               <%-- <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                        </div>
                        <form name="doc" id="doc">
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>

                                    <div class="col-10 mt-4">

                                        <h5 style="float:right;color:black">Validation du documents</h5>
                                        <div class="row p-0 m-0 mt-5">

                                        </div>
                                        <c:forEach items="${doc}" var="dc">
                                            <div class="row">

                                                <div class="col-12" >
                                                    <div class="form-group" >
                                                        <span id="idd${dc.id_listDocNotif }" onclick="showComment('${dc.id_listDocNotif }')"  class="fa fa fa-edit" style="font-size:21px;" title="Ajouter un commentaire"></span>
                                                        <span id="ids${dc.id_listDocNotif }" onclick="addComment('${dc.id_listDocNotif }')" class="fa fa fa-edit hidden" style="font-size:21px;color: #33994c;" title="Ajouter un commentaire"></span>
                                                        <a class="removeStyle" download href="${fn:replace(dc.url, "/assets/myFile/", "/api/dowload_uploaded/")}" >
                                                 <span class="fa fa-file-word-o" style="font-size:21px;color: #33994c;" >

                                                 </span> </a>
                                                        <label class=""> ${dc.docImport.nom_fr }</label>
                                                        <input ${dc.nom_ar.equals('oui')?'checked':'' }  data-choose="${dc.id_listDocNotif }" id="check${dc.id_listDocNotif }" type="checkbox" onchange="validate(${dc.id_listDocNotif })"> <br>
                                                        <textarea disabled id="id${dc.id_listDocNotif }" class="${dc.nom_fr==null?'hidden':'' }"   cols="10" style="width: 100%;"> ${dc.nom_fr } </textarea>

                                                    </div>

                                                </div></div>
                                        </c:forEach>

                                    </div>
                                </div>
                                <div class="row  mb-4" style="margin:14px;">
                                    <a  class="btn btn-primary btn-block " onclick="addEtat(${id},'3')" > Valider</a>
                                    <a class="btn btn-secondary btn-block" onclick="addEtat(${id},'2')" style="background: #f95f5f;"> Non conforme</a>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>--%>

        </div>

    </div>

</div> </div>
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
                swal("<spring:message code="label.Commentaireenregistre"/>","<spring:message code="label.Votrecommentaireaeteenregistreavecsuccess"/>","success");
            },
            error : function(response) {
                alert('ajout non effectué');
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
                alert('ajout non effectué');
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
                alert('ajout non effectué');
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
                alert('ajout non effectué');
            }
        });

    }
</script>
