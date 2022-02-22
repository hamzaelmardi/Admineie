
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

</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>

<div class="container-fluid page-body-wrapper">
    <div class="main-panel" style="margin-top:175px">
        <div class="content-wrapper">
            <div class="row ">

                <div class="col-md-12 col-sm-12 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <spring:message code="label.AttachementduRapportEP" var="p_page"/>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4">
                            <li class="breadcrumb-item"  style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'};top: -8px !important;"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <c:if test="${typeS=='EE'}">
                                <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                            </c:if>
                            <c:if test="${typeS=='NT'}">
                                <spring:message code="label.Noticedimpact" var="pp_page"/>
                            </c:if>
                            <c:if test="${typeS=='AE'}">
                                <spring:message code="label.Auditenvirementale" var="pp_page"/>
                            </c:if>
                            <c:set var="url_mini" value="/api/getEie/${typeS}/0/6/0"/>
                            <li class="breadcrumb-item ${pageContext.response.locale!='ar'?'':'mr-5'}"><a href="${url_mini}">${pp_page}</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                        </ol>
                    </nav>
                </div>

            </div>
            <section class="services-section mt-5" style="background-color: white">
                <div class="row grid-margin stretch-card cardstatistic" id="pagereload">
                    <div class="tab col-lg-4 col-md-12 col-sm-12">
                    <button style="background-color: #206c45!important;" class="tablinks btn" onclick="opendemande(event, '1')" id="defaultOpen">
                        1. <spring:message code="label.AttachementduRapportEP"/>
                    </button>
                    <button style="background-color: #206c45!important;"  class="tablinks btn mt-2 " ${disabledBtnTab} id="Btn2" onclick="opendemande(event, '2')">
                        2.  <spring:message code="label.PLANIFICATIONrEUNION"/>
                    </button>
                </div>
<%--********************Tab1***************************--%>
<!--<h3>Attachement Enqutte Public</h3>-->
                    <div ${hidden} dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" id="1" class="tabcontent col-lg-8 col-md-12 col-sm-12 mt-3" style="border: 1px solid #d7d7d7;">
                        <h4 class="titre_abs" style="background-color: gray"><spring:message code="label.AttachementduRapportEP"/></h4>
                        <form enctype="multipart/form-data"  class="form-horizontal mt-5" id="formdmnd" name="formdmnd">

                                <input hidden  class="form-control" name="id_demande_information" id="id_demande_information"
                                       value="${demande.id_demande_information}">

                            <div class="row mt-5">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Numrodedemande"/> </label>
                                        <input disabled class="form-control" name="num_demande" id="num_demande"
                                               value="${demande.num_demande}">
                                    </div>


                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label> <spring:message code="label.Raisonsocial"/> </label>
                                        <input disabled class="form-control" id="raison_social"
                                               value="${demande.raison_social}">
                                    </div>

                                </div>
                                <div class="col-12">
                                    <c:if test="${demande.interregion=='oui' || demande.interregion=='نعم'}">
                                        <div class="row" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                <label><spring:message code="label.Region"/></label>
                                                <select disabled class="custom-select select2" multiple ${dd}>
                                                    <c:forEach items="${demande.detailRegion.region}" var="r">
                                                        <option selected> ${pageContext.response.locale=='ar'?r.nom_ar:r.nom_fr}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                <label><spring:message code="label.Prefecture"/></label>
                                                <select disabled class="form-control select2" multiple ${dd}>
                                                    <c:forEach items="${demande.detailRegion.prefectures}" var="r">
                                                        <option selected> ${pageContext.response.locale=='ar'?r.nom_ar:r.nom_fr}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group">
                                                <label><spring:message code="label.Commune"/></label>
                                                <select disabled class="form-control select2" multiple ${dd}>
                                                    <c:forEach items="${demande.detailRegion.communes}" var="r">
                                                        <option selected> ${pageContext.response.locale=='ar'?r.nom_ar:r.nom_fr}</option>
                                                    </c:forEach>
                                                </select>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="row mt-3">
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

                                    <c:if test="${demande.interregion=='non' || demande.interregion=='لا'}">
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group text-left">
                                                    <label><spring:message code="label.Consultationpublic"/> </label>
                                                    <input class="form-control" type="text" value="${demande.consultationPublic}" id="consultationPublic">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <%--<div class="form-group">--%>
                                        <%--<label> <spring:message code="label.Region"/>  </label>--%>
                                        <%--<select  DISABLED name=""  id="id_region" required class="form-control select2" data-width="100%" multiple>--%>

                                            <%--<c:forEach items="${demande.regions}"  var="region">--%>

                                                <%--<option selected  value="${region.regionId}" >${region.nom_fr} || ${region.nom_ar} </option>--%>
                                            <%--</c:forEach>--%>
                                        <%--</select>--%>

                                    <%--</div>--%>
                                    <div class="row">
                                        <c:forEach items="${demande.detailRegion.region}" var='reg' >
                                            <div class="col-md-6 mt-3 col-sm-12" >

                                                <div class="form-group text-left">
                                                    <label> <spring:message code="label.Lerapportdelenquetepubliquede"/> ${pageContext.response.locale=='ar'?reg.nom_ar:reg.nom_fr} </label>
                                                    <input  onchange="addDoc2(${demande.id_demande_information},'${reg.regionId}','doc${reg.regionId}')"  required accept=".doc,.docx,.pdf" type="file" class="form-control" name="doc${reg.regionId}" id="doc${reg.regionId}">
                                                </div>

                                            </div>
                                        </c:forEach>
                                    </div>
                                    <div class="row">
                                            <div class="col-md-5 col-sm-10 mt-3">
                                                <div class="form-group text-left">
                                                    <label> <spring:message code="label.Leregistre"/> </label>
                                                    <input required onchange="addDoc(${demande.id_demande_information},'67','doc67')"   accept=".pdf"  type="file"  id="doc67" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-1 col-sm-2 mt-5">
                                                    <c:if test="${not empty demande.url_registre}">
                                                        <a href="${url_Admin}${fn:replace(demande.url_registre, "/assets/myFile/", "/dowload_uploaded/")}"
                                                           class="btn btn-success rounded"><span
                                                                class="fa fa-download"></span></a>
                                                    </c:if>
                                                </div>
                                    </div>
                                    <div class="row justify-content-center">
                                        <div class="col-md-4 col-sm-12" style="text-align: center">
                                            <c:choose>
                                                <c:when test="${demande.interregion=='non'}">
                                                    <button style="margin-top: 10px;margin-bottom: 10px;width: 100% !important;" type="button"
                                                            onclick="savedemandeInformation()"
                                                        <%--onclick="opendemande(event, '2')" --%>
                                                            id="Suivant" class="btn btn-success">
                                                        <spring:message code="label.Suivant"/>
                                                    </button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button style="margin-top: 10px;margin-bottom: 10px;width: 100% !important;" type="button"
                                                            <%--onclick="savedemandeInformation()"--%>
                                                            onclick="opendemande(event, '2')"
                                                            id="Suivant" class="btn btn-success">
                                                        <spring:message code="label.Suivant"/>
                                                    </button>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </form>
                    </div>
                    <div id="2" class="tabcontent col-lg-8 col-md-12 col-sm-12 mt-3" style="display:${show};border: 1px solid #d7d7d7;" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <h4 class="titre_abs" style="background-color: gray;"><spring:message code="label.PLANIFICATIONrEUNION"/>
                        </h4>
                        <form   class="form-horizontal mt-3" action="/add_reunion" id="formreunion" name="formreunion" method="post">
                            <input type="hidden" class="form-control" value="${not empty reunion.id_reunion?reunion.id_reunion:0}">
                            <div class="row m-0 p-0 mt-5 text-left">
                                <div class="col-md-6 col-ms-12">
                                    <div class="form-group text-left">
                                        <label > <spring:message code="label.DateReunion"/></label>
                                        <input value="${reunion.date_reunion}" onchange="tcheckdatereunion()"  required type="date" name="date_reunion"  id="date_reunion" class="form-control">
                                        <input type="hidden" name="id_demande_information" id="iddemandereu"   value="${demande.id_demande_information}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6 col-ms-12">
                                    <div class="form-group text-left">
                                        <label> <spring:message code="label.NomReunion"/> </label>
                                        <select class="form-control" required name="examen" id="examen" ${dd}>
                                            <option ${reunion.examen.equals("reexamen")?"selected":""} value="reexamen"><spring:message code="label.Reexamen"/></option>
                                            <option ${reunion.examen.equals("examen")?"selected":""} value="examen"><spring:message code="label.Examen"/></option>
                                            <option ${reunion.examen.equals("deliberation")?"selected":""}  value="deliberation"><spring:message code="label.Deliberation"/></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row m-0 p-0">
                                <div class="col-md-6 col-ms-12">
                                    <div class="form-group text-left">
                                        <label> <spring:message code="label.MembresavoixdeliberativeCentrale"/></label>
                                        <select class="form-control select2 p-0" multiple data-width="100%" id="comiteOui" name="comiteOui" ${dd}>
                                            <c:forEach items="${oui}" var="o">
                                                <option
                                                        <c:forEach items="${reunion.comite}" var="oo">
                                                            ${oo.comiteId==o.comiteId?"selected":""}
                                                        </c:forEach>
                                                        value="${o.comiteId}">${pageContext.response.locale=='ar'?o.nomComite_ar:o.nomComite_fr}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-ms-12">
                                    <div class="form-group text-left">
                                        <label><spring:message code="label.MembresavoixdalibarativeRegional"/></label>
                                        <select class="form-control select2" multiple style="width: 100%" id="comiteNon" name="comiteNon" ${dd}>
                                            <c:forEach items="${non}" var="n">
                                                <option
                                                        <c:forEach items="${reunion.comite}" var="oo">
                                                            ${oo.comiteId==n.comiteId?"selected":""}
                                                        </c:forEach>
                                                        value="${n.comiteId}">${pageContext.response.locale=='ar'?n.nomComite_ar:n.nomComite_fr}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row m-0 p-0">
                                <div class="col-4" style="text-align: center">
                                </div>
                                <div class="col-4" style="text-align: center">
                                    <button style="margin-top: 10px;margin-bottom: 10px;width: 100% !important;" type="submit" id="suivantreunion" class="btn btn-success">
                                        <spring:message code="label.Suivant"/>
                                    </button>
                                </div>
                                <div class="col-4" style="text-align: center">
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </section>
        </div>
    </div>
    </div>

<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />

<script>
    function opendemande(evt, cityName) {
        var files = $("#doc67")[0].files.length;
        if(files==0 && ${empty demande.url_registre}){
            swal("Avertissement !","Le fichier de registre est obligatoire","error");
            return false;
        }else {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }

    }

    function addDoc(id,type,idInput){
        var data = new FormData();

        var ins = document.getElementById(idInput).files.length;
        for (var x = 0; x < ins; x++) {
            data.append("fileToUpload", document.getElementById(idInput).files[x]);
        }
        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url : "/api/addDoc/"+id+"/"+type,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success : function(response) {
            },
            error : function() {
            }
        });
    }

    function addDoc2(id,regionId,idInput){
        var data = new FormData();

        var ins = document.getElementById(idInput).files.length;

        for (var x = 0; x < ins; x++) {
            data.append("fileToUpload", document.getElementById(idInput).files[x]);
        }


        $.ajax({

            type: "POST",
            enctype: 'multipart/form-data',
            url : "/api/addDocRegion/"+id+"/"+regionId,
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            success : function(response) {





            },
            error : function() {



            }
        });
    }

    function savedemandeInformation(){
        var id=$("#id_demande_information").val();
        var consultation = $("#consultationPublic").val();

        var files = $("#doc67")[0].files.length;
        if(files==0 && ${empty demande.url_registre}){
            swal("<spring:message code="label.Avertissement"/>  !","<spring:message code="label.Lefichierderegistreestobligatoire"/>","error");
            return false;
        }


        $.ajax({
            url: '/api/addconsultationPublic/'+id,
            type:'POST',
            data:{"consulattion":consultation},
        })
            .done(function() {
                opendemande(event, '2');
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            })
    }


</script>

