
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
    .titre_abs {
        background: #206c45!important;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
    }

</style>
<div class="mt-5">
    <section class="mt-2 bg-white container-fluid mt-3 pt-5" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row">
            <div class="col-12">

                <c:choose>
                    <c:when test="${type=='NT'}">
                        <spring:message code="label.Noticedimpact" var="p_page" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
                    </c:otherwise>
                </c:choose>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb ml-4">
                        <li class="breadcrumb-item"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                        <li class="breadcrumb-item"><a href="/api/getEie/NT/0/6/0">${p_page} </a></li>
                        <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.Planifierunevisite"/>  </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row mt-3" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-3 col-sm-12">
                <button class="btn btn-success btn-block active text-left pl-3"  >1. <spring:message code="label.Planifierunevisite"/> </button>
            </div>
            <div class="col-lg-6 col-sm-8 col-md-8 mx-4">
                <div class="row pb-2">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center"><spring:message code="label.Planifierunevisite"/> </h4>
                    </div>
                    <div id="step1" class="col-12 z_collecteur"  >
                        <form class="mt-3"  action="/api/demande_visite" method="post">
                            <input type="hidden" value="${(not empty demande)?demande.id_demande_information:'0'}" name="id_demande_information" id="id_demande_information">


                            <div class="row">

                                <div class="col-12">
                                    <div class="form-group text-left">
                                        <label ><spring:message code="label.Objetdevisite"/></label>
                                        <input value="${demande.visite_object }" type="text" name="visite_object" class="form-control">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group text-left">
                                        <label ><spring:message code="label.Datedevisite"/> </label>
                                        <input  value="${demande.visite_date}" required type="date" name="visite_date" class="form-control">
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group text-left">
                                        <label><spring:message code="label.Adresse"/></label>
                                        <input type="text" required value="${demande.visite_adresse}" name="visite_adresse" class="form-control" >
                                    </div>
                                </div>
                            </div>

                            <%--information Projet--%>

                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <spring:message code="label.Enregistrer" var="enrg"/>
                                    <input class="btn btn-success btn_suiv btn-block" type="submit" value="${enrg}" />
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>
<jsp:include page="../../includes/footer.jsp" />

