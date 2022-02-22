
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

<div class="container-fluid page-body-wrapper">
    <div class="main-panel " style="margin-top:120px">
        <div class="content-wrapper">
            <div class="row ">

                <div class="col-md-12 col-sm-12 col-lg-12" >
                    <spring:message code="label.AttachementEnquettePublic" var="p_page"/>

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4">
                            <li class="breadcrumb-item"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                            <c:set var="url_mini" value="/api/getEie/0/6/0"/>
                            <li class="breadcrumb-item"><a href="${url_mini}">${pp_page}</a></li>
                            <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                        </ol>
                    </nav>
                </div>

            </div>
            <div class="row mt-3">
                <div class="col-md-3 col-sm-12">
                    <button disabled class="tablinks btn btn-block btn_btn_bleu" onclick="opendemande(event, '1')" id="defaultOpen">
                        1. <spring:message code="label.AttachementEnquettePublic"/>
                    </button>
                    <button  class="tablinks btn mt-2 btn-block btn_btn_bleu" ${disabledBtnTab} id="Btn2" onclick="opendemande(event, '2')">
                        2.  <spring:message code="label.PLANIFICATIONrEUNION"/>
                    </button>
                </div>
                <div class="col-md-9 col-sm-12 pr-4">
                    <div id="2" class="border-1 border rounded ">
                        <h4 class="titre_abs" style="background-color: gray;"><spring:message code="label.PLANIFICATIONrEUNION"/>
                        </h4>
                        <form   class="form-horizontal mt-3" id="formreunion" name="formreunion" method="post">
                            <input type="hidden" class="form-control" value="${not empty reunion.id_reunion?reunion.id_reunion:0}">
                            <div class="row m-0 p-0 mt-5 text-left">
                                <div class="col-6">
                                    <div class="form-group text-left">
                                        <label > <spring:message code="label.DateReunion"/>:</label>
                                        <input value="${reunion.date_reunion}" onchange="tcheckdatereunion()"  required type="date" name="date_reunion"  id="date_reunion" class="form-control">
                                        <input type="hidden" name="id_demande_information" id="iddemandereu"   value="${demande.id_demande_information}" class="form-control">
                                        <input type="hidden" name="id_reunion" id="id_reunion"   value="${reunion.id_reunion}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group text-left">
                                        <label> <spring:message code="label.NomReunion"/>: </label>
                                        <select class="form-control" required name="examen" id="examen">
                                            <option ${reunion.examen.equals("reexamen")?"selected":""} value="reexamen"><spring:message code="label.Reexamen"/></option>
                                            <option ${reunion.examen.equals("examen")?"selected":""} value="examen"><spring:message code="label.Examen"/></option>
                                            <option ${reunion.examen.equals("deliberation")?"selected":""}  value="deliberation"><spring:message code="label.Deliberation"/></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row m-0 p-0">
                                <div class="col-6">
                                    <div class="form-group text-left">
                                        <label><spring:message code="label.MembresPermanent"/></label>
                                        <select class="form-control select2 p-0" multiple data-width="100%" id="comiteOui" name="comiteOui">
                                            <c:forEach items="${oui}" var="o">
                                                <option
                                                        <c:forEach items="${reunion.comite}" var="oo">
                                                            ${oo.comiteId==o.comiteId?"selected":""}
                                                        </c:forEach>
                                                        value="${o.comiteId}">${o.nomComite_fr}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-6">
                                    <div class="form-group text-left">
                                        <label><spring:message code="label.MembresNonPermanent"/></label>
                                        <select class="form-control select2" multiple style="width: 100%" id="comiteNon" name="comiteNon">
                                            <c:forEach items="${non}" var="n">
                                                <option
                                                        <c:forEach items="${reunion.comite}" var="oo">
                                                            ${oo.comiteId==n.comiteId?"selected":""}
                                                        </c:forEach>
                                                        value="${n.comiteId}">${n.nomComite_fr}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <div class="row m-0 p-0 justify-content-center">
                                <div class="col-md-3 col-sm-12" style="text-align: center">
                                    <button onclick="reporterReunion('${demande.id_demande_information}','${reunion.id_reunion}')" class="btn btn-success mb-4 mt-3">
                                        <spring:message code="label.Suivant"/>
                                    </button>
                                </div>
                            </div>

                        </form>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />

<script>
    function opendemande(evt, cityName) {
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

</script>

