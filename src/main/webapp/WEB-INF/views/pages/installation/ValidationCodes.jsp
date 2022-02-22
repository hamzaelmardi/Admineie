
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
    .my_rows{
        height: 600px !important;
        overflow: auto;
    }

    @media (max-width: 1060px){
        .myH3{
            font-size: 13pt;
            margin-left: 9rem;
        }
    }
</style>

<div class="main-panel " style="margin-top:120px">
    <div class="content-wrapper">
<div class="row" style="display:flex;">

    <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >
        <div class="col-12 from_add" id="checkDoc" style="margin-top: 43px;">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 grid-margin stretch-card " >
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-trash-can menu-icon"></i>
                    </div>
                    <div class="card">
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">
                                </div>
                            </div>
                            <input type="hidden" value="${id}" id="id_installation">
                            <h3 class="mt-3 myH3" style="float:right;color:black"> <spring:message code="label.Validerlalistedesdechets"/></h3>
                            <div class="col-12 mt-4">
                                <div class="row mx-3 mt-4">
                                    <a type="button" href="/api/documentAttche/${id}" class="btn btn-primary btn-lg mx-2 col-lg-3 col-md-5 col-sm-6 mr-2"><i class="fa fa-arrow-alt-circle-left"></i> <spring:message code="label.Retour"/></a>
                                </div>
                             <%--   <div class="row justify-content-center mt-4">
                                        <div class="col-9">
                                            <div class="form-group"
                                                 style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                                <label> <spring:message code="label.Vouspouvezaussiselectionnezunecategorie"/> :</label>
                                                <select multiple id="cat" class="form-control select2" data-width="100%" ${dd}>
                                                    <option value=""><spring:message code="label.Choisir"/>...</option>
                                                    <c:forEach items="${categories}" var="c">
                                                            <option value="${c.id_categorie}">${c.nom_fr }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                </div>--%>
                                <c:if test="${inst.type.equals('3')}"><h3 class="text-center mt-4"> <spring:message code="label.Lepetitionnaireaselectionnetouslescodes"/></h3></c:if>
                                <c:if test="${inst.type.equals('1')  || inst.type.equals('3')}">
                                        <div class="row p-3" id="listCode"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                            <div class="col-lg-7 col-md-12 mt-5 mon_col">
                                                <table id="MonTable" class="table table-striped my_table table_datatable_youssef" data-page-length="15">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" style="min-width: 100px"><spring:message
                                                                code="label.Code"/></th>
                                                        <th scope="col"><spring:message code="label.Type"/></th>
                                                        <th scope="col"><spring:message code="label.Selectionner"/></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${code}" var="c">
                                                        <c:set var="checked" value=""/>
                                                        <c:forEach items="${inst.code}" var="code_colle">
                                                            <c:if test="${code_colle.id_code==c.id_code}">
                                                                <c:set var="checked" value="checked disabled"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <tr>
                                                            <td>${c.nom_fr }</td>
                                                            <td>${c.nom_ar }</td>
                                                            <td><input ${checked} class="h-15" type="checkbox"
                                                                                  id="id-${c.id_code }"
                                                                                  onchange="addCodeIT('id_installation','${c.id_code}','add')">
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="col-lg-5 col-md-12" style="margin-top:4rem" id="tfoot">
                                                    <h5 class="mx-2"> ${inst.type.equals('1')?'La liste des déchets exclus par le pétitionnaire':'La liste des déchets exclus par l\'admin'}</h5>
                                                    <div class="d-block h-100 my_rows">
                                                        <div class="row pb-2 m-0" id="my_rows">
                                                            <table class="table table-striped">
                                                                <thead>
                                                                    <tr>
                                                                        <th><spring:message code="label.Typededechet"/></th>
                                                                        <th><spring:message code="label.Action"/></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                 <c:forEach items="${inst.code}" var="code_colle" varStatus="loopp" >
                                                                    <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
                                                                         <td class="col-8">${code_colle.nom_ar}</td>
                                                                         <td class="col-4 p-2 text-center">
                                                                             <button class="btn btn-success rounded-circle"
                                                                                 disabled style="cursor: not-allowed">
                                                                             <span class="fa fa-times"></span></button>
                                                                         </td>
                                                                    </tr>
                                                                 </c:forEach>
                                                                </tbody>
                                                                <tfoot>
                                                                    <input type="hidden" value="${empty inst.codeTmp?'true':'false'}" id="is_empty">
                                                                    <c:forEach items="${inst.codeTmp}" var="code_colle" varStatus="loopp" >
                                                                        <tr style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" >
                                                                            <td class="col-8">${code_colle.nom_ar}</td>
                                                                            <td class="col-4 p-2 text-center">
                                                                                <button class="btn btn-success rounded-circle"
                                                                                        onclick="addCodeIT('id_installation','${code_colle.id_code}','delete')">
                                                                                    <span class="fa fa-times"></span></button>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="row  justify-content-center mb-4" style="margin:14px;">
                                            <button  class="btn btn-primary btn-lg mx-2 col-5" onclick="Changertype()" ><spring:message code="label.Enregistrer"/>  </button>
                                            <a class="btn btn-secondary btn-lg col-5"  href="/api/getListeInstallation/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Annuler"/></a>
                                        </div>
                                </c:if>
                                <c:if test="${inst.type.equals('2')}">
                                    <div class="row p-3 justify-content-center" id="listCode">
                                        <div class="col-sm-8">
                                                <h5 class="mx-2"><spring:message code="label.Lalistedesdechetsselectionnesparlepetitionnaire"/></h5>
                                                    <div class="row pb-2 m-0" id="my_rows">
                                                        <table class="table table-striped">
                                                            <tr>
                                                                <th><spring:message code="label.Typededechet"/></th>
                                                                <th><spring:message code="label.Action"/></th>
                                                            </tr>
                                                            <c:forEach items="${inst.code}" var="code_colle" varStatus="loopp" >
                                                                <tr <c:if test="${inst.type.equals('2')}">style="background-color:${loopp.index%2==0?'#ABEBC6':'#82E0AA'};color: white !important;font-weight:bold"</c:if>  <c:if test="${inst.type.equals('1')}"> style="background-color:${loopp.index%2==0?'#FA8072':'#F08080'};color: white !important;font-weight:bold" </c:if> >
                                                                    <td class="col-8">${code_colle.nom_ar}</td>
                                                                    <td class="col-4 p-2 text-center" id="td_${code_colle.id_code}">
                                                                        <button class="btn rounded-circle" data-toggle="tooltip" data-placement="top" title="Supprimer"
                                                                                onclick="DeleteCodeIns('id_installation','${code_colle.id_code}','delete')" style="background-color: orangered;color: white">
                                                                            <span class="fa fa-times"></span></button>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                        </table>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="row  justify-content-center mb-4" style="margin:14px;">
                                            <button  class="btn btn-primary btn-lg mx-2 col-5" onclick="Changertype()" ><spring:message code="label.Enregistrer"/>  </button>
                                            <a class="btn btn-secondary btn-lg col-5"  href="/api/getListeInstallation/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Annuler"/></a>
                                        </div>
                                    </div>
                                </c:if>
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


    function Changertype(){

       /* var id_ins = $("#id_installation").val();
        var categories=$("#cat").val();

        if (categories.length !== 0) {

            $.ajax({
                type: "POST",
                url: "/api/addCategoriesDechet/"+id_ins+"/"+categories,
                contentType: 'application/json; charset=utf-8',
                data: {},
                success: function (response) {
                    window.location.href="/api/getListeInstallation/0/6/0";
                },
                error: function (response) {
                }
            });
        }
        else{*/
            window.location.href="/api/getListeInstallation/0/6/0";
       // }

    }

    function DeleteCodeIns(id_installation, id_code,type) {
        event.preventDefault();
        var id_ins = $("#" + id_installation).val();
        $.ajax({
            type : "POST",
            url: '/api/removeCode_ins/' + id_ins + '/' + id_code + '/' + type,
            data:{},
            success : function() {
                if(type==="delete"){
                    $("#td_"+id_code).html('<button class="btn rounded-circle"onclick="DeleteCodeIns(\'' + id_installation + '\',\'' + id_code + '\',\'add\')" data-toggle="tooltip" data-placement="top" title="ajouter un code déja supprimé" style="background-color: deepskyblue;color: white"> <span class="fa fa-plus"></span></button>');
                }
                else{
                    $("#td_"+id_code).html('<button class="btn rounded-circle"onclick="DeleteCodeIns(\'' + id_installation + '\',\'' + id_code + '\',\'delete\')"  data-toggle="tooltip" data-placement="top" title="Supprimer" style="background-color: orangered;color: white"> <span class="fa fa-times"></span></button>');
                }
            },
            error : function(response) {
                alert("error")
            }
        });

    }

    function addCodeIT(id_installation, id_code, type) {
        event.preventDefault();
        var id_ins = $("#" + id_installation).val();
        if (id_ins == "") {
            return false;
        }
        $.ajax({
            url: '/api/setcodeInstallation/' + id_ins + '/' + id_code + '/' + type,
            type: 'POST',
            data: {},
        })
            .done(function (data) {
                $("#tfoot").html(data);
               /* $(data.codes).each(function (ind, el) {
                    console.log(el);
                    var cls=""
                    if(ind%2==0){
                        cls="#FA8072"
                    }
                    else {
                        cls="#F08080"
                    }
                    var row2= '<tr style="color: white !important;font-weight:bold;background-color:'+cls+'"><td class="col-8">' + el.nom_ar + '</td> <td class="col-4 p-2 text-center"> <button class="btn btn-success rounded-circle"onclick="addCodeIT(\'' + id_installation + '\',\'' + el.id_code + '\',\'delete\')"><span class="fa fa-times"></span></button> </td></tr>'
                    $("#my_rows").append(row2);

                });*/

            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                if (type == "add") {
                    $('#id-' + id_code).attr("disabled", "true");
                }
                if (type == "delete") {
                    var table1 = $("#MonTable").dataTable();
                    var checkbox = table1.$("input[type=checkbox]#id-" + id_code);
                    $(checkbox).removeAttr("disabled");
                    $(checkbox).prop("checked", false);
                }
                console.log("complete");
            });

    }$

    $('.table_datatable_youssef').DataTable({
        "autoWidth": false,
        "searching": true,
        "bLengthChange": false,
        "ordering": false,
        "paging": true,
        "responsive":true,
        fixedColumns:   {
            rightColumns: 1
        },
        language: {
            "sProcessing":     "Traitement en cours...",
            "sSearch":         "Rechercher&nbsp;:",
            "sLengthMenu":     "",
            "sInfo":           "",
            "sInfoEmpty":      "",
            "sInfoFiltered":   "",
            "sInfoPostFix":    "",
            "sLoadingRecords": "",
            "sZeroRecords":    "",
            "sEmptyTable":     "",
            "oPaginate": {
                "sFirst":      "Premier",
                "sPrevious":   "Pr&eacute;c&eacute;dent",
                "sNext":       "Suivant",
                "sLast":       "Dernier"
            },
            "oAria": {
                "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            },
            "select": {
                "rows": {
                    _: "%d lignes séléctionnées",
                    0: "Aucune ligne séléctionnée",
                    1: "1 ligne séléctionnée"
                }
            }
        }
    });


</script>
