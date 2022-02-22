
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
                            <spring:message code="label.Auditenvirementale" var="pp_page"/>
                            <c:set var="url_mini" value="/api/getEie/${type}/0/6/0"/>
                            <li class="breadcrumb-item"><a href="${url_mini}">${pp_page}</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.RapportsReçus"/></li>
                        </ol>
                    </nav>
                </div>

            </div>
            <div class="row mt-5">
                        <h4 class="titre_abs" style="background-color: gray;"><spring:message code="label.LesRapportsReçus"/>
                        </h4>
                        <div class="col-12 from_add" id="frm_etatDoss">
                            <div class="row p-0 m-0 justify-content-center">
                                <div class="col-md-8 mt-5 col-sm-12 grid-margin" >
                                    <div class="photo  hvr-buzz-out" >
                                        <i class="mdi icc mdi-eye-check menu-icon"></i>
                                    </div>
                                    <div class="card">
                                        <div class="row justify-content-center">
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                                </div>
                                            </div>

                                            <div class="col-10 mt-4">
                                                <h3 class="ml6 float-right mb-1" style="color:#336c4e !important">
                                                      <span class="text-wrapper">
                                                                <span class="letters"><span class="letters"><spring:message code="label.Listesdesvisites"/></span></span>
                                                      </span>
                                                </h3>
                                                <div class="row p-0 m-0 mt-5">
                                                </div>
                                                <form  action="/add_reunion/${typeS}" class="form-horizontal mt-3" id="formreunion" name="formreunion" method="post">
                                                    <div class="row m-0 p-0 mt-5 text-left">

                                                        <div class="col-6">
                                                            <div class="form-group text-left">
                                                                <label > <spring:message code="label.NombredeRapportsReçus"/></label>
                                                                <input value="${demande.rapports_AE.size()}" disabled  type="text" class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <div class="form-group text-left">
                                                                <label ><spring:message code="label.Periode"/>  </label>
                                                                <select class="form-control select2" disabled>
                                                                    <option value="1" ${demande.reunions.get(demande.reunions.size()-1).periode_send_rapport=="1"?"selected":""}><spring:message code="label.Mensuel"/> </option>
                                                                    <option value="2" ${demande.reunions.get(demande.reunions.size()-1).periode_send_rapport=="2"?"selected":""}><spring:message code="label.Bimestrielmois"/></option>
                                                                    <option value="3" ${demande.reunions.get(demande.reunions.size()-1).periode_send_rapport=="3"?"selected":""}><spring:message code="label.Trimestrielmois"/></option>
                                                                    <option value="6" ${demande.reunions.get(demande.reunions.size()-1).periode_send_rapport=="6"?"selected":""}><spring:message code="label.Semestrielmois"/></option>
                                                                    <option value="12" ${demande.reunions.get(demande.reunions.size()-1).periode_send_rapport=="12"?"selected":""}><spring:message code="label.Annuellemois"/></option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-12 table-responsive">

                                                            <table class="my_table table table-striped table-bordered table-hover">
                                                                <thead class="bg-primary text-white">
                                                                <tr>
                                                                    <th><spring:message code="label.Datedereception"/></th>
                                                                    <th><spring:message code="label.Fichier"/></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${demande.rapports_AE}" var="rap">
                                                                    <tr>
                                                                        <td>${rap.date}</td>
                                                                        <td>
                                                                            <c:if test="${not empty rap.url_file}">
                                                                                <a href="${rap.url_file}" class="btn btn-primary" target="_blank" download>
                                                                                    <span class="fa fa-download"></span>
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${empty rap.url_file}">
                                                                                <spring:message code="label.AucunFichier"/>
                                                                            </c:if>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>

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
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />

