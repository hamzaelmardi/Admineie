<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
    .input-container {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        width: 100%;
        margin-bottom: 15px;
    }
    .field_icon{
        padding: 7px;
        background: dodgerblue;
        color: white;
        min-width: 50px;
        text-align: center;
    }
    .tooltip_ {
        position: relative;
        display: inline-block;
        cursor: pointer;
    }

    .tooltip_ .tooltiptext {
        visibility: hidden;
        /*width: 120px;*/
        background-color: #bdc3c7;
        color: #fff;
        text-align: center;
        border-radius: 6px;
        padding: 5px 0;

        /* Position the tooltip */
        position: absolute;
        z-index: 1;
    }

    .tooltip_:hover .tooltiptext {
        visibility: visible;
    }

</style>


<div class="container-fluid" style="margin-top: 180px">
    <div class="content-wrapper p-0">
        <form action="/api/setAutorisationDocumentSigner/${id}/${type}" method="post" enctype="multipart/form-data">
        <div class="row" >
            <div class="col-12 grid-margin stretch-card" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="card">
                    <div class="card-body">
                        <div class="row justify-content-center">
                            <div class="col-lg-9 col-sm-12 mb-2 btn-gris h4 text-white text-center rounded p-2">
                                <div class="btn-gris"><spring:message code="label.TelechargerleCertificatdelimination"/></div>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="col-lg-9 col-md-9 col-sm-12 border mb-5 p-4">
                                <div class="form-group">
                                    <div class="row justify-content-center">
                                        <div class="col-md-10 col-sm-12">
                                                <a href="${fn:replace(notification.url_certicat_elimination, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success btn-block"><i class="fa fa-file-download"></i> <spring:message code="label.TelechargerleCertificatdelimination"/></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-4">
                                    <div class="row justify-content-center">
                                        <div class="col-10 text-left">
                                            <table class="table my_table table-bordered ">
                                                <thead class="text-center">
                                                    <th><spring:message code="label.Quantiteseliminee"/></th>
                                                    <th> <spring:message code="label.documentdemouvement"/></th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${notification.docMouvement}" var="nt">
                                                        <tr>
                                                            <td><input type="text" disabled class="form-control" value="${nt.quantite}"/></td>
                                                            <td class="text-center">
                                                                <a target="_blank" class="btn btn-info" href="${fn:replace(nt.url, "/assets/myFile/", "/dowload_uploaded/")}"> <span class="fa fa-file-download"></span></a>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                                 <div class="row">
                                                    <div class="col-lg-4 col-sm-12 text-left mt-2">
                                                        <label class=""> <spring:message code="label.Quantiteprevue"/></label>
                                                        <input id="qteReel" type="text" class="form-control" disabled value="${notification.quantite}">
                                                    </div>
                                                    <div class="col-lg-4 col-sm-12text-left mt-2">
                                                        <label class=""><spring:message code="label.Quantiteseliminee"/></label>
                                                        <input id="qteTotal" type="text" class="form-control" disabled value="${total}">
                                                    </div>
                                                     <div class="col-lg-4 col-sm-12 text-left mt-2">
                                                         <label class=""> <spring:message code="label.Ecartentrelesdeuxquantites"/></label>
                                                         <input type="text" class="form-control" disabled value="${ecarte}">
                                                     </div>
                                                </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-sm-12 text-left mt-2">
                                                    <label class=""> <spring:message code="label.NombreColis"/></label>
                                                    <input type="text" class="form-control" disabled value="${notification.nbr_colis}">
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                    <c:if test="${notification.quantite != total}">
                                        <div class="row justify-content-center">
                                            <div class="col-lg-10 mt-sm-2 input-container">
                                                <a href="${fn:replace(notification.url_quantite_justificatif, "/assets/myFile/", "/dowload_uploaded/")}" class="btn btn-success btn-block"><i class="fa fa-file-download"></i> <spring:message code="label.TelechargerleJustificatif"/></a>
                                                <div class="tooltip_ col-lg-2 mt-sm-2" >
                                                    <i  class="fas fa-info-circle field_icon" style="background-color: #7d90c7;margin-left:3px;border-radius:7px;"></i>
                                                    <div class="tooltiptext"><img src="${pageContext.request.contextPath}/assets/images/ecart.PNG" width="100%" style="width: 320px !important;max-width: unset;" /></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row justify-content-center">
                                                <div class="col-10 text-left">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-sm-12 mt-4" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                            <label><spring:message code="label.Statut"/></label>
                                                            <select class="custom-select" ${dd} name="validation" id="validation" onchange="show(this.value,${notification.id_notification},64,'${type}')" >
                                                                <option selected><spring:message code="label.Choisir"/>...</option>
                                                                <option value="valider"><spring:message code="label.Valide"/></option>
                                                                <option value="nonValide"><spring:message code="label.Nonvalide"/></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row justify-content-center">
                                               <%--<div class="col-md-4 col-sm-12 p-2 mt-3">
                                                   <button type="button" onclick="changer_etat(${notification.id_notification},64,'${type}')" class="btn btn-success btn-block">
                                                       <spring:message code="label.Valider"/>
                                                   </button>
                                               </div>
                                               <div class="col-md-4 col-sm-12 p-2 mt-3">
                                                   <button type="button" id="ivalid" onclick="show()" class="btn btn-success btn-block">
                                                       Invalid
                                                   </button>
                                               </div>--%>
                                            </div>
                                            <div id="commentDisplay" style="display: none">
                                                <div class="row justify-content-center">
                                                    <div class="col-md-10 col-sm-12 p-2 mt-3">
                                                        <textarea rows="3" id="comment" class="form-control"></textarea>
                                                    </div>
                                                </div>
                                                <div class="row justify-content-end">
                                                    <button type="button"  onclick="changer_etat(${notification.id_notification},65,'${type}')"  class="btn btn-success  p-2 mr-2">
                                                        <spring:message code="label.Enregistrer"/>
                                                    </button>
                                                    <button type="button"  onclick="annuler()"  class="btn  btn-danger-2 p-2">
                                                        <spring:message code="label.Annuler"/>
                                                    </button>
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
        </form>
    </div>
</div>



<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />
<script>

    function annuler(){
        $("#commentDisplay").hide();
        $("#validation").prop("selectedIndex", 0).val();
    }
    function show(val,id,statut,type) {
        if(val==="valider"){
            $("#commentDisplay").hide();
            changer_etat(id,statut,type);
        }
        else{
            $("#commentDisplay").show();
        }
    }
$(document).ready(function(){
        $(".fa-download").removeClass("fa-pencil-alt");
        $(".fa-file-download").removeClass("fa-pencil-alt");
    });

    function changer_etat(id,statut,type){
        var comment= $("#comment").val();
        if(comment===""){
            comment="-";
        }
        $.ajax({
            type: "POST",
            url :"/api/changerStatut2/"+id+"/"+statut+"/"+comment,
            data : {},
            success : function(response) {
                window.location="/api/getListeAutorisation/"+type+"/0/6/0";
            },
            error : function(response) {
                alert('Erreur ajout non effectué');
            }
        });

    }

</script>
