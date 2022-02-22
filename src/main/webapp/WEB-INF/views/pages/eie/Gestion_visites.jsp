
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

                <div class="col-md-12 col-sm-12 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb ml-4">
                            <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                            <spring:message code="label.Auditenvirementale" var="pp_page"/>
                            <c:set var="url_mini" value="/api/getEie/${type}/0/6/0"/>
                            <li class="breadcrumb-item ${pageContext.response.locale!='ar'?'':'mr-5'}"><a href="${url_mini}">${pp_page}</a></li>
                            <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Visites"/></li>
                        </ol>
                    </nav>
                </div>

            </div>
            <div class="row mt-5">
                <div class="col-12 from_add" id="frm_etatDoss">
                            <div class="row p-0 m-0 justify-content-center">
                                <div class="col-md-8 mt-5 col-sm-12 grid-margin" >
                                    <div class="photo  hvr-buzz-out" >
                                        <i class="mdi icc mdi-eye-check-outline menu-icon"></i>
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
                                                        <div class="col-12">
                                                            <div class="form-group text-left">
                                                                <p > <spring:message code="label.NombredeVisitesdevisiteseffectue"/> : <span><b>${demande.visites.size()}</b></span><spring:message code="label.Visites"/> </p>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                                <div class="row justify-content-center">
                                                                    <div class="col-lg-6 col-md-12 mb-4">
                                                                        <div class="form-groupe mt-3">
                                                                            <label><spring:message code="label.Objetdevisite"/></label>
                                                                            <input type="text" class="form-control" name="visite_objet" id="visite_objet">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12 mb-4">
                                                                        <div class="form-groupe mt-3">
                                                                            <label><spring:message code="label.Datedelavisite"/></label>
                                                                            <input type="date" class="form-control" name="visite_date" id="visite_date">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-lg-6 col-md-12 mb-4">
                                                                        <div class="form-groupe mt-3">
                                                                            <label><spring:message code="label.Sitedelavisite"/></label>
                                                                            <input type="text" class="form-control" name="visite_site" id="visite_site">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row justify-content-center">
                                                                        <div class="form-groupe my-3">
                                                                            <button class="btn btn-primary" onclick="save_visite_AE('${demande.id_demande_information}')"><spring:message code="label.Programmerlavisite"/></button>
                                                                        </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12 table-responsive" id="tableau_visite">
                                                            <table class="my_table table table-striped table-bordered table-hover">
                                                                <thead class="bg-primary text-white">
                                                                <tr>
                                                                    <th><spring:message code="label.Datedevisite"/></th>
                                                                    <th><spring:message code="label.Site"/></th>
                                                                    <th><spring:message code="label.Objet"/></th>
                                                                    <th><spring:message code="label.PVdevisite"/></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach items="${demande.visites}" var="vis">
                                                                    <tr>
                                                                        <td>${vis.visite_date}</td>
                                                                        <td>${vis.visite_site}</td>
                                                                        <td>${vis.visite_objet}</td>
                                                                        <td>
                                                                            <c:if test="${not empty vis.visite_url}">
                                                                                <a href="${vis.visite_url}" class="btn btn-primary" target="_blank" download>
                                                                                    <span class="fa fa-download"></span>
                                                                                </a>
                                                                            </c:if>
                                                                            <c:if test="${empty vis.visite_url}">
                                                                                <button class="btn btn-primary" onclick="AttacherPV('${vis.id_visite_AE}')">
                                                                                    <spring:message code="label.AttacherlePV"/>
                                                                                </button>
                                                                            </c:if>
                                                                        </td>
                                                                        <div class="modal fade"
                                                                             id="AttachePV${vis.id_visite_AE}"
                                                                             tabindex="-1" role="dialog"
                                                                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                                                                            <div class="modal-dialog modal-dialog-centered"
                                                                                 role="document">
                                                                                <div class="modal-content">
                                                                                    <div class="modal-header">
                                                                                        <h5 class="modal-title"><spring:message code="label.AttacherPVdevisite"/></h5>
                                                                                        <button onclick="close_modal(this)" type="button"
                                                                                                class="close" data-dismiss="modal"
                                                                                                aria-label="Close">
                                                                                            <span aria-hidden="true">&times;</span>
                                                                                        </button>
                                                                                    </div>
                                                                                    <div class="modal-body">
                                                                                        <div class="row justify-content-center">
                                                                                            <div class="form-group">
                                                                                                <label><spring:message code="label.AttacherlePV"/></label>
                                                                                                <input data-id="${demande.id_demande_information}" class="form-control" type="file" onchange="set_file_vosite('${vis.id_visite_AE}',this)">
                                                                                            </div>
                                                                                        </div>


                                                                                    </div>
                                                                                    <div class="modal-footer">
                                                                                        <button onclick="close_modal(this)" type="button"
                                                                                                class="btn btn-secondary"
                                                                                                data-dismiss="modal"><spring:message
                                                                                                code="button.Fermer"/></button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
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

