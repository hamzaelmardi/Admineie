
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
                        <li class="breadcrumb-item active" aria-current="page"><spring:message code="label.AttacherPVdevisite"/>  </li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row mt-4" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
            <div class="col-md-3 col-sm-12">
                <button class="btn btn-success btn-block active text-left pl-3"  >1.<spring:message code="label.AttacherPVdevisite"/>   </button>
            </div>
            <div class="col-lg-6 col-sm-8 col-md-8 mx-4">
                <div class="row pb-2">
                    <div class="col-12 pl-0 pr-0">
                        <h4 class="titre_abs " style="text-align:center"><spring:message code="label.AttacherPVdevisite"/> </h4>
                    </div>
                    <div id="step1" class="col-12 z_collecteur"  >
                        <div class="col-12 p-0 mt-3">
                            <div class="form-group text-left">
                                <label ><spring:message code="label.PVdevisite"/></label>
                                <input id="pv_file" type="file" class="form-control">
                            </div>
                        </div>
                        <form class="mt-2" >
                            <div class="row">

                                <div class="col-12">
                                    <div class="form-group text-left">
                                        <label >Status </label>
                                        <select id="id_stat" class="form-control select2" onchange="show_comment(this,'3','zone_comment')">
                                            <option value="58"><spring:message code="label.Conforme"/>Conforme</option>
                                            <option value="3"><spring:message code="label.Nonconforme"/></option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-12 d-none" id="zone_comment">
                                    <div class="form-group text-left">
                                        <label><spring:message code="label.Commentaire"/></label>
                                        <textarea rows="3" class="form-control" id="comment"></textarea>
                                    </div>
                                </div>
                            </div>

                            <%--information Projet--%>

                            <div class="row justify-content-center p-0 mb-3">
                                <div class="col-md-3 col-sm-12">
                                    <button class="btn btn-success btn_suiv btn-block" onclick="save_pv_visite('${demande.id_demande_information}')"><spring:message code="label.Enregistrer"/></button>
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

