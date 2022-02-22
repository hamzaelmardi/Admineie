<jsp:include page="../../includes/tag.jsp"/>
<jsp:include page="../../includes/header.jsp"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!-- CSS only -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
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
    <c:set var="lng" value="nom_${pageContext.response.locale}"/>
    <c:choose>
        <c:when test="${pageContext.response.locale=='ar'}">
            <c:set var="lng" value="nom_ar"/>
        </c:when>
        <c:otherwise>
            <c:set var="lng" value="nom_fr"/>
        </c:otherwise>
    </c:choose>


    <div class="col-12 from_add" id="frm_etatDoss"
         style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
        <div class="row p-0 m-0 justify-content-center">
            <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5 grid-margin">
                <div class="photo  hvr-buzz-out">
                    <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                </div>
                <form enctype="multipart/form-data" method="post">
                    <div class="card">
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar"
                                     style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0"
                                     aria-valuemax="100">

                                </div>
                            </div>

                            <div class="col-10 mt-4">

                                <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters"><spring:message
                                                                code="label.Document"/></span></span>
                                                      </span>
                                </h3>
                                <div class="row p-0 m-0 mt-5">
                                </div>
                                <div class="row" >
                                    <div class="col-12 mt-4" >
                                        <div class="form-group text-left">
                                            <label><spring:message code="label.Amal"/></label>
                                            <select onchange="param_EIE_hide_Class(this)" id="typeaut" name="typeaut" class="form-select bg-light"
                                                    style="height: 40px">
                                                <option ${doc.typeaut.equals('ZF')?"selected":"" } value="ZF">
                                                    <spring:message
                                                            code="label.Importationdesdechetsdunezonnefranche"/></option>
                                                <option ${doc.typeaut.equals('ET')?"selected":"" } value="ET">
                                                    <spring:message
                                                            code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></option>
                                                <option ${doc.typeaut.equals('IT')?"selected":"" } value="IT">
                                                    <spring:message
                                                            code="label.Installationdetraitementdesdechets"/></option>
                                                <option ${doc.typeaut.equals('CT')? 'selected' :''} value="CT">
                                                    <spring:message code="label.CollecteetTransport"/></option>
                                                <option ${doc.typeaut.equals('TR')?"selected":"" } value="TR">
                                                    <spring:message
                                                            code="label.ExportationDesDechetsDangereux"/></option>
                                                <option ${doc.typeaut.equals('XD')?"selected":"" } value="XD">
                                                    <spring:message code="label.TransitDesDechets"/></option>
                                                <option ${doc.typeaut.equals('EE')?"selected":"" } value="EE">
                                                    <spring:message code="label.Etudedimpactenvirementale"/></option>
                                                <option ${doc.typeaut.equals('AE')?"selected":"" } value="AE">
                                                    <spring:message code="label.Auditenvironnemental"/></option>
                                                <option ${doc.typeaut.equals('NT')?"selected":"" } value="NT">
                                                    <spring:message code="label.NoticeImpact"/></option>
                                            </select>
                                        </div>

                                    </div>
                                </div>
                                <c:if test="${doc.typeaut=='ZF' || doc.typeaut=='XD' || doc.typeaut=='TR' || doc.typeaut=='CT' || doc.typeaut=='IT'}">
                                    <div class="row" id="DANG_group">
                                        <div class="col-12">
                                            <div class="form-group text-left">
                                                <label><spring:message code="label.Classification"/></label>
                                                <select id="classification" name="classification"
                                                        class="form-select bg-light" style="height: 40px">
                                                    <c:forEach items="${classfication }" var="cl">
                                                        <option ${doc.classification.id_classification==cl.id_classification?"selected":"" }
                                                                value="${cl.id_classification }">${cl[lng] }</option>
                                                    </c:forEach>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                                <div class="row">

                                    <div class="col-12">
                                        <div class="form-group text-left">
                                            <label>Nom de document</label>
                                            <input required type="text" id="nom_fr" name="nom_fr" value="${doc.nom_fr}"
                                                   class="form-control">
                                            <input type="hidden" name="id_docImport" id="id_docImport"
                                                   value="${doc.id_docImport}" class="form-control">

                                        </div>

                                    </div>
                                </div>

                                <div class="row" dir="rtl">
                                    <div class="col-12">
                                        <div class="form-group text-right">
                                            <label>اسم الوثيقة</label>
                                            <input required type="text" id="nom_ar" name="nom_ar" value="${doc.nom_ar}"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                    <c:if test="${empty doc.uri}">
                                        <div class="col-12">
                                            <div class="form-group text-left">
                                                <label><spring:message code='label.image'/></label>
                                                <input accept="image/*" id="doc" type="file" class="form-control"
                                                       name="doc">
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${not empty doc.uri}">
                                        <div class="col-10">
                                            <div class="form-group text-left">
                                                <label><spring:message code='label.image'/></label>
                                                <input accept="image/*" id="doc" type="file" class="form-control"
                                                       name="doc">
                                            </div>
                                        </div>
                                        <div class="col-2 mt-4">
                                            <a href="${fn:replace(doc.uri,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary rounded mt-2">
                                                <span class="fa fa-download"></span>
                                            </a>
                                        </div>
                                    </c:if>





                                    <div class="col-12"  >
                                        <div class="form-group text-left">
                                            <label><spring:message code='label.Description'/></label>
                                            <textarea dir="ltr" id="desc" rows="6" class="form-control" placeholder="Description du fichier" >${doc.description}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row  mb-4" style="margin:14px;">
                            <button class="btn btn-success btn-block " onclick="addDoc()"><spring:message
                                    code="label.Enregistrer"/></button>
                            <a class="btn btn btn-danger-2 text-white btn-block"
                               onclick="getFunctionParam('getParamDoc/0/6')"><spring:message code="label.Annuler"/></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- fin etat Dossier -->
        <div class="col-12 grid-margin z_tab" id="subtab_0">
            <div>
                <div class="row">

                    <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark" id="zone_search"
                         style="text-align:center;display:none;">

                        <img class="n3VNCb "
                             src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png"
                             data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;"
                             style="width: 100px; height: 100px; margin: 0px;">
                        <div class="row p-4 justify-content-center">
                            <div class="col-8">
                                <div class="row p-0">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>doc</label>
                                            <input type="text" name="desi" class="form-control">
                                        </div>
                                    </div>

                                </div>
                                <div class="row p-0 justify-content-end">
                                    <div class="col-12">
                                        <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')">
                                            <spring:message code="label.rechercher"/></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%/* --------------------------------------------------- */ %>


                    <div class="col-lg-3 float-left">
                        <select class="form-select bg-light" id="selectBox" onchange="getFunctionParam(value);"
                                style="cursor: pointer;height: 40px">
                            <option value="getParamDoc/0/6" class="nav-link navType rounded btn-success "
                                    id="v-pills-comite-tab" style="cursor: pointer;"><spring:message
                                    code="label.Touslescategories"/></option>
                            <option ${color.equals('ZF')?"selected":"" } value="getParam/ZF"
                                                                         class=" navType rounded  } "
                                                                         id="v-pills-comite-ta"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.ImportationdesdechetsdunezonefrancheZF"/></option>
                            <option ${color.equals('IT')?"selected":"" } value="getParam/IT"
                                                                         class="nav-link navType   rounded"
                                                                         id="v-pills-comite-tab"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.InstallationdetraitementdesdechetsIT"/></option>
                            <option ${color.equals('CT')?"selected":"" } value="getParam/CT"
                                                                         class="nav-link navType  rounded "
                                                                         id="v-pills-comite-tab"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.CollecteetTransportCT"/></option>
                            <option ${color.equals('TR')?"selected":"" } value="getParam/TR"
                                                                         class="nav-link navType   rounded "
                                                                         id="v-pills-comite-tab"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.ExportationDesDechetsDangereuxTR"/></option>
                            <option ${color.equals('XD')?"selected":"" } value="getParam/XD"
                                                                         class="nav-link navType   rounded"
                                                                         id="v-pills-comite-tab"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.TransitDesDechetsXD"/></option>
                            <option ${color.equals('ET')?"selected":"" } value="getParam/ET"
                                                                         class="nav-link navType   rounded"
                                                                         id="v-pills-comite-tab"
                                                                         style="cursor: pointer;"><spring:message
                                    code="label.ImportationdesdEchetsnondangereuxdunpaysEtrangerET"/></option>
                            <option ${color.equals('EE')?"selected":"" } value="getParam/EE"
                                                                          class="nav-link navType   rounded"
                                                                          id="v-pills-comite-tab"
                                                                          style="cursor: pointer;"><spring:message
                                    code="label.Etudedimpactenvirementale"/></option>
                            <option ${color.equals('NT')?"selected":"" } value="getParam/NT"
                                                                          class="nav-link navType   rounded"
                                                                          id="v-pills-comite-tab"
                                                                          style="cursor: pointer;"><spring:message
                                    code="label.NoticeImpact"/></option>
                            <option ${color.equals('AE')?"selected":"" } value="getParam/AE"
                                                                          class="nav-link navType   rounded"
                                                                          id="v-pills-comite-tab"
                                                                          style="cursor: pointer;"><spring:message
                                    code="label.AuditEnvironnemental"/></option>

                        </select>
                    </div>
                    <div class="col-lg-12 pr-0">

                        <div class="row m-0 pt-1">
                            <div class="col-6 pl-0">
                                <h5 class="ml6">
                                      <span class="text-wrapper">
                                        <span class="letters"><span class="letters"><spring:message
                                                code="label.Documentparautorisation"/></span></span>
                                      </span>
                                </h5>
                            </div>
                            <div class="col-6 text-right">
                                <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                    <span><spring:message code="label.NouveauDocument"/> </span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-12">
                        <table id="example2" class="table tablee table-hover">
                            <thead>
                            <tr>
                                <th class=""><spring:message code="label.Nomdedocument"/></th>
                                <th class=""><spring:message code="label.Classification"/></th>
                                <th class=""><spring:message code="label.Action"/></th>
                            </tr>
                            </thead>
                            <tbody class="tbodyy">

                            <c:forEach items="${listF}" var="f">
                                <tr id="tr-${f.id_docImport}">
                                        <%--  <td>${f.nom_fr}</td> --%>
                                    <td>${f[lng]}</td>
                                    <td>${f.classification[lng]}</td>

                                    <td class="">
                                        <ul class="list-inline m-0">
                                            <li class="list-inline-item">
                                                <button onclick="editDoc(${f.id_docImport})"
                                                        class="btn btn-outline-warning btn-sm rounded-circle tab_edit"
                                                        type="button"
                                                        title="Editer" style="background-color: white">
                                                    <div class="icon_trash_1">
                                                        <span class="fas fa-pencil-alt" style="color: orange"></span>
                                                    </div>

                                                </button>
                                            </li>
                                            <li class="list-inline-item">
                                                <button onclick="deleteDoc(${f.id_docImport})"
                                                        class="btn btn-outline-danger btn-sm rounded-circle tab_trash"
                                                        type="button"
                                                        title="Supprimer" style="background-color: white">
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
                            <c:when test="${listF!='[]'}">
                                <div class="text-center" dir="ltr">
                                    <c:if test="${(page)>0}">
                                        <c:set value="${page-1}" var="page_db"/>
                                        <c:set value="${totalPage-1}" var="page_LAST"/>
                                    </c:if>
                                    <c:if test="${(page)<=0}">
                                        <c:set value="0" var="page_db"/>
                                        <c:set value="0" var="page_LAST"/>
                                    </c:if>


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

                                        <select class="form-select bg-light" id="optionselected"
                                                onchange="getParamf(this.value)"
                                                style="margin: auto; width: 100px;height: 40px">

                                            <c:forEach begin="${page}" end="${totalPage-1}" var="c">
                                                <option value="${c}"   ${c==number ? 'selected' : ''} >
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


                                </div>
                            </c:when>
                            <c:otherwise>

                                <h4 style="color:black;text-align: center"><spring:message
                                        code="label.Ilnyaaucuneenregistrement"/></h4>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

</div>


<script type="text/javascript">
    function getParamf(vals) {
        getFunctionParam('getParamDoc/' + vals + '/6');
    }

    function addDoc() {
        if (event != null)
            event.preventDefault();
        var id = $("#id_docImport").val();
        if(id===""){
            id=0;
        }
        var formdata = new FormData();
        formdata.append("typeaut", $("#typeaut").val());
        formdata.append("classification", $.isNumeric($("#classification").val())?$("#classification").val():1);
        formdata.append("id_docImport", id);
        formdata.append("nom_fr", $("#nom_fr").val());
        formdata.append("nom_ar", $("#nom_ar").val());
        formdata.append("description", $("#desc").val());

        var inp_file = document.getElementById("doc").files.length;

        for (var i = 0;i<inp_file;i++){
            formdata.append("doc", document.getElementById("doc").files[i]);
        }

        $.ajax({
            type: "POST",
            url: "/api/postParamDoc",
            enctype: 'multipart/form-data',
            data: formdata,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,

            success: function () {
                getFunctionParam('getParamDoc/0/6');
            },
            error: function (response) {

                alert('Erreur ajout non effectué');

            }
        });


    }


    function editDoc(id) {
        $.ajax({
            type: "GET",
            url: "/api/updateParamDoc/" + id,
            data: {},
            success: function (data) {

                $(".mpParam").html(data);
                $("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");
            },
            error: function (response) {
                alert("error")
            }
        });

    }

    /*  delete famille  begin */

    function deleteDoc(id) {
        $.ajax({
            type: "POST",
            url: "/api/deleteParamDoc/" + id,
            data: {},
            success: function (data) {

                $("#tr-" + id).css("display", "none");
            },
            error: function (response) {

                alert("error")
            }
        });

    }


    /*  delete famille  end */

    function checkdoc(val) {
        $('#docLabel').css("display", "none");
        $.ajax({
            type: "GET",
            url: "/checkdoc",
            data: {
                'val': val
            },
            success: function (data) {
                /* alert()  */
                if (data == "oui") {
                    $('#codeLabel').css("display", "block");
                    $(".btnTo").prop("disabled", true);

                } else {
                    $(".btnTo").prop("disabled", false);
                }


            },
            error: function (response) {
                alert("error")
            }
        });

    }

</script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp"/>


 


 

