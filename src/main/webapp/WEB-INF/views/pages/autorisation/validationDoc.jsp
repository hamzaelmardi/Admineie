
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

  <div class="main-panel myPanel3" style="margin-top:120px">
  <div class="content-wrapper">

<div class="row" style="display:flex;">

<div class="col-md-12 col-sm-12 col-lg-12"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="p_page" value="التحقق من صحة الوثيقة"/>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="p_page" value="Validation des Documents"/>
</c:if>

    <c:choose>
        <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/validateDoc/')}">

        </c:when>

    </c:choose>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb ml-4">
            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
            <c:choose>
                <c:when test="${type=='ZF'}">
                    <spring:message code="label.ImpartationDechetsZoneFranche" var="pp_page"/>
                    <c:set var="url_mini" value="/api/getListeAutorisation/ZF/0/6/0"/>
                </c:when>

                <c:when test="${type=='ET'}">
                    <spring:message code="label.ImpartationDechetsNondangereuxDunPaysEtrange" var="pp_page"/>
                    <c:set value="/api/getListeAutorisation/ET/0/6/0" var="url_mini"/>
                </c:when>
                <c:when test="${type=='XD'}">
                    <spring:message code="label.ExportationDesDechetsDangereux" var="pp_page"/>
                    <c:set value="/api/getListeAutorisation/XD/0/6/0" var="url_mini"/>

                </c:when>
                <c:when test="${type=='TR'}">
                    <spring:message code="label.TransitDesDechets" var="pp_page"/>
                    <c:set value="/api/getListeAutorisation/TR/0/6/0" var="url_mini"/>
                </c:when>

                <c:otherwise>
                    <c:set var="pp_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    <c:set value="/api/getMenu" var="url_mini"/>

                </c:otherwise>
            </c:choose>
            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'margin-right:4rem !important':''}"><a href="${url_mini}">${pp_page}</a></li>
            <li class="breadcrumb-item active " aria-current="page">${p_page}</li>
        </ol>
    </nav>

    <div class="row myrow justify-content-center mt-4">

        <div class="col-md-10 col-sm-12 pt-4">
            <button class="btn btn-success mb-2" onclick="goToLienRecap('${type}/${notif.id_notification}')"
                    style="border-radius: 0% !important;width: 18%;padding: 8px;">
                <spring:message code="label.Afficherlerecapitulatif"/>
            </button>
                <form name="doc" id="doc_tmp">
                    <div class="row">
                        <div class="table-responsive col-12">
                            <table class="table table-striped table-hover table-bordered ">
                                <tr class="bg-vert">
                                    <td > <spring:message code='label.Piecejointe'/></td>
                                    <td style="width: 50%"> <spring:message code='label.Document'/> </td>
                                    <td> <spring:message code='label.Statut'/> </td>
                                    <td> <spring:message code='label.Commentaire'/></td>
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
                                                <div class="col">
                                                    <textarea  onchange="addComment('${dc.id_listDocNotif }')" rows="2" class="form-control mb-0" id="id${dc.id_listDocNotif }" >${dc.nom_fr }</textarea>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    </c:if>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </form>
                <div class="row justify-content-end">
                    <div class="col-lg-2 col-md-4 col-sm-6 mt-1 p-1">
                        <button class="btn btn-primary btn-block " id="valider" onclick="addEtat(${id},'39','${type }')" > <spring:message code='label.Valider'/></button>
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-6 mt-1 p-1">
                        <button class="btn btn-secondary btn-block" id="non_conforme" onclick="addEtat(${id},'37','${type }')" style="background: #f95f5f;"> <spring:message code='label.Incomplet'/></button>
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

<script type="text/javascript">

    function goToLienRecap(val){
        window.location.href='/api/recap_autorisation/'+val;
    }

    if(  $('input[name="transport"]').is(':checked') ) {
       // alert('checked');
       // alert($(this).attr('flexSwitchCheckDefault'));//To get ID of checkBox
        $("#dise").hide();
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

/*function showComment(id){
    event.preventDefault();
	$("#id"+id).prop('disabled', false);
}*/

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


function addEtat(id,etat,type){
    event.preventDefault();
    var test = false;
    var tr = $(".myrow").find("textarea").not(".hidden")
    $(tr).each(function (idx, el) {
        if ($(el).val()==="") {
            $(el).addClass("bg_error");
            test = true;
        }
    });

    if (test) {

        Swal.fire({
            title: "<spring:message code="label.Avertissement"/>",
            text: "<spring:message code="label.AjouterCommentaire"/> ",
            icon: "error",
            showCancelButton: false,
            confirmButtonColor: "#256144",
            confirmButtonText: "Ok",
            //closeOnConfirm: true,
            //showLoaderOnConfirm: true,
            html: false
        });
    }
else {
        $.ajax({
            type: "POST",
            url: "/api/addEtat/" + id,

            data: {
                "etat": etat

            },

            success: function (response) {

                window.location = "/api/getListeAutorisation/" + type + "/0/6/0";
            },
            error: function (response) {
                alert(' ajout non effectué');
            }
        });
    }
}
</script>
