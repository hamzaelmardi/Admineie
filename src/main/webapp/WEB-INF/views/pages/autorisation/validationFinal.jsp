

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
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>
<%-- <c:if test="${pageContext.response.locale=='ar' }">
    <style>
    .option_select1{
    dir:left;
    }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
    .option_select1{
    dir:right;
    }
    </style>
</c:if> --%>
  <div class="main-panel " style="margin-top:120px">
      <div class="content-wrapper">
        <div class="row" style="display:flex;">
            <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >
                <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
                    <div class="row p-0 m-0 justify-content-center">
                        <div class="col-lg-6 col-md-8 col-sm-12 grid-margin stretch-card " >
                            <div class="photo  hvr-buzz-out" >
                                <i class="mdi icc mdi-check menu-icon"></i>
                            </div>
                            <form name="doc" id="doc">
                                <div class="card">
                                    <div class="row justify-content-center">
                                        <div class="progress">
                                            <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">
                                            </div>
                                        </div>
                                        <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <h5 style="float:right;color:black"><spring:message code='label.Validation'/></h5>
                                            <div class="row p-0 m-0 mt-5">
                                            <div class="col-10 m-auto pt-4">
                                                <div class="form-group">
                                                    <select class="custom-select mt-3 mb-3" id="selectEtat" onchange="addStatut(this.value)" ${dd}>
                                                        <option value="38"><spring:message code='label.Favorable'/></option>
                                                        <option value="40"><spring:message code='label.Defavorable'/></option>
                                                    </select>
                                                    <label><spring:message code="label.atacherlavisdedepartementconcerne"/> </label>
                                                    <input type="file" class="form-control" id="fichier_validation">
                                                    <div class="form-group hidden st">
                                                        <c:if test="${type.equals('ET')}">
                                                            <label ><spring:message code='label.Motifderefus'/></label>
                                                        </c:if>
                                                        <c:if test="${!type.equals('ET')}">
                                                            <label ><spring:message code='label.commentaire'/></label>
                                                        </c:if>
                                                        <textarea  class="form-control st "  id="commentaire" rows="3"></textarea>
                                                    </div>
                                                </div>
                                           </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row  mb-4" style="margin:14px;">
                                        <a  class="btn btn-primary btn-block " onclick="addEtat(${id},'38','${type}')" > <spring:message code='label.Enregistrer'/></a>
                                        <a class="btn btn-secondary btn-block"  href="/api/getListeAutorisation/${type }/0/6/0" style="background: #f95f5f;"><spring:message code='label.Annuler'/> </a>
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
<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">
function addStatut(etat){

	if(etat=="38"){
		$(".st").addClass("hidden");
		$(".dt").removeClass("hidden");
	}
	else if(etat=="40"){
		$(".dt").addClass("hidden");
		$(".st").removeClass("hidden");
	}

}

function addEtat(id,etat2,type){
    var data = new FormData();
	var etat=$("#selectEtat").val();
	var commentaire=$("#commentaire").val();
    var ins = document.getElementById("fichier_validation").files.length;
    if (ins == 0 ) {
        Swal.fire({
            title: "<spring:message code="label.Avertissement"/>",
            text: "<spring:message code="label.Lefichierestobligatoire"/> ",
            icon: "error",
            showCancelButton: false,
            confirmButtonColor: "#256144",
            confirmButtonText: "Ok",
            html: false
        });
        return false;
    }
    data.append("etat",etat);
    data.append("commentaire",commentaire);
    for (var x = 0; x < ins; x++) {
        var file = document.getElementById("fichier_validation").files[x];
        data.append("fileToUpload", file);
    }

	$.ajax({
		 type: "POST",
        url :"/api/addEtatFinalWithDoc/"+id,
        processData: false,
        contentType: false,
        cache: false,
        data: data,
		success : function(response) {
			window.location="/api/getListeAutorisation/"+type+"/0/6/0";
		},
		error : function(response) {
			alert(' ajout non effectué');
		}
	});

}
</script>
