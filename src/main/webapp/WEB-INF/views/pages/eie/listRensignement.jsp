<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<jsp:include page="../../includes/header.jsp"/>
<jsp:include page="../../menu/menu.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<jsp:useBean id="now" class="java.util.Date"/>

<style>
    .mt_def {
        margin-top: 10rem;
        margin-left: 10px;
        margin-right: 10px;
        width: auto;
    }
</style>


<div class="container-fluid mt_def card" >
    <div class="row mt-5">
        <div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <c:choose>
                <c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/listRensignement/11/0/6')}">

                </c:when>
                <c:otherwise>
                    <c:set var="p_page" value="Renseignement préalable"/>
                </c:otherwise>
            </c:choose>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb ml-4">
                    <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                    <li class="breadcrumb-item ${pageContext.response.locale=='ar'?'mr-5':''}"><a href="/api/listRensignement/11/0/6"><spring:message code="label.Renseignementprealables"/> </a></li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="col-12 mt-3">

        <div class="row m-6">
            <div class="col-md-4 col-sm-4 mt-1">
                <a href="/api/listRensignement/11/0/6" class="btn btn-primary btn-block"><spring:message code="label.Projetsnonassujettis"/>
                </a>
            </div>
            <div class="col-md-4 col-sm-4 mt-1">
                <a href="/api/listRensignement/12/0/6" class="btn btn-primary btn-block"><spring:message code="label.EIEaexaminerparCNEE"/></a>
            </div>
            <div class="col-md-4 col-sm-4 mt-1">
                <a href="/api/listRensignement/13/0/6" class="btn btn-primary btn-block"><spring:message code="label.EIEaexaminerparCRUI"/></a>
            </div>
        </div>

        <div class="row m-4">
            <div class="table-responsive">
                <table class="table table-bordered table-striped mb-5">
                    <thead>
                    <tr>
                        <th class="text-center"><spring:message code="label.Numerodedemande"/></th>
                        <th class="text-center"><spring:message code="label.Datedepot"/>
                        <th class="text-center"><spring:message code="label.RaisonSocial"/></th>
                        <th class="text-center"><spring:message code="label.Statut"/></th>
                        <th class="text-center"><spring:message code="label.Email"/></th>
                        <th class="text-center"><spring:message code="label.Representant"/></th>
                        <th class="text-center"><spring:message code="label.Tel"/></th>
                        <th class="text-center"><spring:message code="label.Fax"/></th>
                        <th class="text-center"><spring:message code="label.IntituleProjet"/></th>
                        <th class="text-center"><spring:message code="label.Categorie"/></th>
                        <th class="text-center"><spring:message code="label.Tronsfrontalier"/></th>
                        <th class="text-center"><spring:message code="label.Interregion"/></th>
                        <th class="text-center"><spring:message code="label.Region"/></th>
                        <th class="text-center"><spring:message code="label.Piecesjointes"/></th>
                       <%-- <th class="text-center"><spring:message code="label.AvisProjet"/></th>--%>

                        <c:if test="${notif[0].statut.id_statut_projet ==11 }">
                            <th><spring:message code="label.Action"/></th>
                        </c:if>


                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${notif}" var="dmd">
                        <tr>
                            <td> ${dmd.num_demande} </td>
                            <td>
                                <fmt:formatDate var="date_dp" pattern="dd-MM-yyyy" value = "${dmd.dateDepot}" />
                                    ${date_dp}
                            </td>
                            <td> ${dmd.raison_social} </td>
                            <td>${dmd.statut.id_statut_projet == 11?'Projets non assujettis':'-'}</td>
                            <td> ${dmd.email} </td>
                            <td> ${dmd.contact} </td>
                            <td> ${dmd.tel} </td>
                            <td> ${dmd.fax} </td>
                            <td> ${dmd.intitule_projet} </td>
                            <td> <!-- Button trigger modal -->
                                <c:if test="${not empty dmd.categories}">
                                <button class="btn btn-primary btn-sm"
                                        onclick="fun_affiche_modal('#modal_categorie','${dmd.id_demande_information}')">
                                    <spring:message code="label.AfficherlesCategorie"/>
                                </button>
                                </c:if>
                                <c:if test="${empty dmd.categories}"> - </c:if>
                            </td>
                            <td> ${dmd.tronsfrontalier=='no'?"Non":dmd.tronsfrontalier} </td>
                            <td> ${dmd.interregion} </td>
                            <td>
                                <button class="btn btn-primary  btn-sm"
                                        onclick="fun_affiche_modal('#modal_DetailRegion','${dmd.id_demande_information}')">
                                   <spring:message code="label.DetailRegion"/> 
                                </button>
                            </td>
                            <td>
                                <c:if test="${not empty dmd.url_avis}">
                                    <a class="btn btn-primary btn-sm" href="${fn:replace(dmd.url_avis, "/assets/myFile/", "/dowload_uploaded/")}"> <spring:message code="label.AvisdeProjet"/> </a>
                                </c:if>
                                <c:if test="${empty dmd.url_avis}">
                                    -
                                </c:if>
                            </td>


                            <c:if test="${dmd.statut.id_statut_projet == 11}">
                                <td><a class="btn btn-success  btn-sm" onclick="showModal('${dmd.id_demande_information}')"
                                       data-id="${dmd.id_demande_information}"><spring:message
                                        code="label.donnerAvis"/></a>
                                </td>
                            </c:if>
                        </tr>

                        <!-- Modal -->
                        <div class="modal fade" id="modal_categorie_${dmd.id_demande_information}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.Categories"/> </h5>
                                        <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10">
                                                <div class="row " style="background: gray;color: white;border-color: #737373;" >
                                                    <div class="col-2 border p-2 font_bold  btn-gris">
                                                        #
                                                    </div>
                                                    <div class="col-10 border p-2 font_bold  btn-gris">
                                                       <spring:message code="label.Nom"/> 
                                                    </div>
                                                </div>
                                                <c:if test="${not empty dmd.categories}">
                                                    <c:forEach items="${dmd.categories}" var="cat" varStatus="loopp">
                                                    <div class="row">
                                                        <div class="col-2 border p-2">
                                                                ${loopp.index+1}
                                                        </div>
                                                        <div class="col-10 border p-2">
                                                                ${cat.nom_fr}
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal -->
                        <div class="modal fade" id="modal_DetailRegion_${dmd.id_demande_information}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id=""><spring:message code="label.DetailRegion"/> </h5>
                                        <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div class="col-10">
                                                <div class="row " style="background: gray;color: white;border-color: #737373;" >
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                      <spring:message code="label.Region"/>  
                                                    </div>
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                         <spring:message code="label.Prefecture"/>
                                                    </div>
                                                    <div class="col-4 border p-2 font_bold  btn-gris">
                                                       <spring:message code="label.Commune"/>  
                                                    </div>
                                                </div>

                                                    <div class="row">

                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty dmd.detailRegion.region}">
                                                            <ul>
                                                                <c:forEach items="${dmd.detailRegion.region}" var="reg">
                                                                    <li> - ${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr}</li>
                                                                </c:forEach>
                                                            </ul>
                                                            </c:if>
                                                            <c:if test="${empty dmd.detailRegion.region}"> - </c:if>

                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty dmd.detailRegion.prefectures}">
                                                                <ul>
                                                                    <c:forEach items="${dmd.detailRegion.prefectures}" var="reg">
                                                                        <li> - ${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty dmd.detailRegion.prefectures}"> - </c:if>
                                                        </div>
                                                        <div class="col-4 border p-2">
                                                            <c:if test="${not empty dmd.detailRegion.communes}">
                                                                <ul>
                                                                    <c:forEach items="${dmd.detailRegion.communes}" var="reg">
                                                                        <li> - ${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr}</li>
                                                                    </c:forEach>
                                                                </ul>
                                                            </c:if>
                                                            <c:if test="${empty dmd.detailRegion.communes}"> - </c:if>
                                                        </div>

                                                    </div>

                                            </div>
                                        </div>


                                    </div>
                                    <div class="modal-footer">
                                        <button onclick="close_modal(this)" type="button" class="btn btn-secondary" data-dismiss="modal"><spring:message code="button.Fermer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal-${dmd.id_demande_information}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel"><spring:message
                                                code="label.ModalTitle"/></h5>
                                        <button onclick="close_modal(this)" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-12">
                                        <input type="hidden" value="${dmd.id_demande_information}" id="id_modal-${dmd.id_demande_information}">
                                        <label for="add_com"><spring:message code="label.AjouterCommentaire"/></label>
                                        <textarea rows="3" class="form-control" name="add_com" id="add_com"></textarea>
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12">
                                            <label><spring:message code="label.assujettissement"/></label>
                                            <select class="custom-select" name="assujetti" id="id_select">
                                                <option value="1"><spring:message code="label.NonassujettisalEIE"/></option>
                                                <option value="2"><spring:message code="label.AssujettisalEIE"/></option>
                                            </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                        <div class="col-12 mt-3" id="msg_comment" style="display: none">
                                            <label><spring:message code="label.Niveaudexamen"/></label>
                                            <select class="custom-select" name="cnee" id="cnee">
                                                <option value="1"><spring:message code="label.CNEE"/></option>
                                                <option value="2"><spring:message code="label.CRUI"/></option>
                                            </select>
                                        </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button  onclick="Modalclose_modal('exampleModal')" type="button" class="btn btn-danger-2" data-dismiss="modal"><spring:message code="label.Annuler"/></button>
                                        <button type="button" class="btn btn-primary" onclick="saveAssujettissement('${dmd.id_demande_information}')"><spring:message code="label.Enregistrer"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    </tbody>
                </table>

                <c:choose>
                    <c:when test="${notif!='[]'}">
                        <div class="text-center" dir="ltr">
                            <c:if test="${(page)>0}">
                                <c:set value="${page-1}" var="page_db"/>
                                <c:set value="${totalPage-1}" var="page_LAST"/>
                            </c:if>
                            <c:if test="${(page)<=0}">
                                <c:set value="0" var="page_db"/>
                                <c:set value="0" var="page_LAST"/>
                            </c:if>

                            <a class="fa fa-arrow-circle-left" style="font-size:20px;" aria-hidden="true"
                               onclick="listAlimentation(${page_end},6,'${statut}')"></a>


                            <c:set var="salary" value="${totalPage-page-1}"/>
                            <c:choose>
                                <c:when test="${salary>5 }">
                                    <c:set var="toAdd" value="3"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="toAdd" value="${totalPage-page-1}"/>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${totalPage>0}">
                                <c:forEach begin="${page}" end="${page+toAdd}" var="c">
                                    <a style="font-size: 26px;border-radius: 50%;"
                                       onclick="listAlimentation(${c},6,'${statut}')"  ${c==number ? 'class=" btnss pageStyle"' : 'class="btnss"'}>${c+1}</a>
                                </c:forEach>
                            </c:if>
                            <c:if test="${(page)>=(totalPage-1)}">
                                <c:set value="${totalPage-1}" var="page_end"/>
                            </c:if>

                            <c:if test="${(page)<(totalPage-1)}">
                                <c:set value="${page+1}" var="page_end"/>
                            </c:if>


                            <a class="fa fa-arrow-circle-right" style="font-size: 20px;" aria-hidden="true"
                               onclick="listAlimentation(${page_end},6,'${statut}')"></a>


                        </div>
                    </c:when>
                    <c:otherwise>

                        <h4 style="color:black;text-align: center"><spring:message
                                code="label.AucuneEnregistrement"/></h4>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>


<script>

    document.getElementById('id_select').onchange = function(){
        if(this.value == 2){
            document.getElementById('msg_comment').style.display = 'block';
        } else {
            document.getElementById('msg_comment').style.display = 'none';
        }
    };

    function Modalclose_modal(id){
        $("#"+id).modal("hide");
    }

    function saveAssujettissement(id_decl){
        var id_valid = $("#id_select").val();
        var message = $("#id_select").val();
        var id_cnee = $("#cnee").val();
        var com = $("#add_com").val();
        if($.trim(com)=="" || com==null){
            com="-";
        }
        if($.trim(id_valid)==="" || id_valid==null ){
            swal("<spring:message code='label.Avertissement'/> ! ","<spring:message code='label.Mercideselectionnerunassujettissementvalide'/>","error");
            return false;
        }

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url : "/api/ConfirmeRensignement/"+id_decl+'/'+com+"/"+id_valid+"/"+id_cnee,
            data: {"msg":message},

            success : function(response) {
                $("#exampleModal").modal("hide");
                window.location.href="/api/listRensignement/11/0/6";
            },
            error : function() {
            }
        });
    }

    function listAlimentation(page, size, statut) {
        window.location.href = '/api/listRensignement/' + statut + '/' + page + '/6';
    }

    $(document).ready(function () {
        $('#exampleModal').on('shown.bs.modal', function (e) {
            $("#id_modal").val($(e.relatedTarget).attr('data-id'));
        })
    })

    function conforme(id) {

        var com = $("#add_com").val();
        if($.trim(com)=="" || com==null){
            com="-";
        }
        window.location = '/api/ConfirmeRensignement/' + id + '/' + com;
    }

    function CNEE_CRUI(id, niveau) {

        var com = $("#add_com").val();
        if($.trim(com)=="" || com==null){
            com="-";
        }
        window.location = '/api/addCNEE/' + id + '/' + com + '/' + niveau;
    }


    function Nconforme(id) {

        var com = $("#add_com").val();
        if($.trim(com)=="" || com==null){
            swal("<spring:message code='label.Avertissement'/> !", "<spring:message code='label.LecommentaireestObligatoiremercidesaisiruncommentaire'/>", "error");
            return false;
        }
        window.location = '/api/AvisProjRensignement/' + id + '/' + com;

    }

    function showModal(id) {
        $("#exampleModal-" + id).modal('show');
    }

    function fun_affiche_modal(id_modal, id_dmd) {
        $(id_modal + "_" + id_dmd).modal("toggle");
    }

    function close_modal(val){
        $(val).closest(".modal").modal('hide');
    }

</script>
<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp"/>
