

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
      integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
      crossorigin="anonymous" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<jsp:useBean id="now" class="java.util.Date" />
<style>
    .even a,.odd a{
        color: white !important;
    }
</style>
<div class="container-fluid page-body-wrapper"
     style="margin: 20px 0px 20px 0px;">

    <c:choose>

        <c:when test="${type=='ZF'}">
            <spring:message code="label.ImpartationDechetsZoneFranche" var="p_page"/>
        </c:when>
        <c:when test="${type=='ET'}">
            <spring:message code="label.ImpartationDechetsNondangereuxDunPaysEtrange" var="p_page"/>
        </c:when>
        <c:when test="${type=='RS'}">
            <spring:message code="label.Renseignementsprealables" var="p_page"/>
        </c:when>
        <c:when test="${type=='XD'}">
            <spring:message code="label.ExportationDesDechetsDangereux" var="p_page"/>
        </c:when>
        <c:when test="${type=='TR'}">
            <spring:message code="label.TransitDesDechets" var="p_page"/>
        </c:when>
        <c:when test="${type=='EE'}">
            <spring:message code="label.EtudeImpactEnvironnemental" var="p_page"/>
        </c:when>
        <c:when test="${type=='NT'}">
            <spring:message code="label.NoticeImpact" var="p_page"/>
        </c:when>
        <c:when test="${type=='AE'}">
            <spring:message code="label.Auditenvirementale" var="p_page"/>
        </c:when>
        <c:when test="${type=='CT'}">
            <spring:message code="label.CollecteTransportDesDechets" var="p_page"/>
        </c:when>
        <c:when test="${type=='IT'}">
            <spring:message code="label.installationdetraitementdesdechets" var="p_page"/>
        </c:when>
        <c:otherwise>
            <c:set var="p_page" value="${requestScope['javax.servlet.forward.request_uri']}"/>
        </c:otherwise>
    </c:choose>

    <div class="main-panel"  style="background: white !important;margin-top:145px">
        <div class="col-12 p-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb ml-4">
                    <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important;':'left:-10px !important;'}top: 14px !important;"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                    <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page">${p_page}</li>
                </ol>
            </nav>
            <div class="row mt-3" style="display: flex; padding: 30px;" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="row p-3" style="border: 2px solid #eaeaea; border-radius: 4px;" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                        <div class="col-md-8 col-sm-12">
                            <div class="form-group">
                                <label><spring:message code='label.Numerodedemande'/></label>
                                <input class="form-control" id="numDemande" name="numDemande" />
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-12 mt-4">
                            <a class="btn btn-success" type="button" onclick='showModal($("#numDemande").val())'><spring:message code='label.rechercher'/></a>
                        </div>
                </div>


            </div>
            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12">
                <hr>


                <table
                        class="table table-striped hover compact table-bordered text-md-nowrap" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <thead class="text-white" style="background-color: #206c45  !important">

                    <tr>
                        <th class="text-center"><spring:message code='label.Numerodedemande'/></th>
                        <th class="text-center"><spring:message code='label.Acteur'/></th>
                        <th class="text-center"><spring:message code='label.Date'/></th>
                        <th class="text-center"><spring:message code='label.StatutduProjet'/></th>
                        <th class="text-center"><spring:message code='label.Action'/></th>
                        <th class="text-center"><spring:message code='label.AdresseIP'/></th>
                        <th class="text-center"><spring:message code='label.Localisation'/></th>
                        <th class="text-center"><spring:message code='label.Valeur'/></th>

                    </tr>

                    </thead>
                    <tbody>
                    <c:forEach items="${notif}" var="aud">
                        <tr>
                            <td class="font-weight-semibold">${aud.num_aut}</td>
                            <td class="font-weight-semibold">${aud.compte.nom}</td>
                            <fmt:formatDate   dateStyle="long" value="${aud.dateAction}" pattern="dd-MM-yyyy HH:mm:ss" var="dateAction" />
                            <td>${dateAction}</td>
                            <td>${aud.statut.nom_fr}</td>
                            <td>${aud.action}</td>
                            <td>${aud.adresseIp}</td>
                            <td>${aud.localisation}</td>
                            <td class="justify-content-center">
                                <a type="button" class="btn btn-primary text-white" href="/api/AuditAutorisation/${aud.num_aut}">
                                    <spring:message code='label.Details'/>
                                </a>
                                <div id="audit"></div>
                            </td>

                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${notif!='[]'}">
                        <div class="text-center" dir="ltr">
                            <c:if test="${(page)>0}">
                                <c:set value="${page-1}" var="page_db" />
                                <c:set value="${totalPage-1}" var="page_LAST" />
                            </c:if>
                            <c:if test="${(page)<=0}">
                                <c:set value="0" var="page_db" />
                                <c:set value="0" var="page_LAST" />
                            </c:if>
                            <c:set var="salary" value="${totalPage-page-1}" />
                            <c:choose>
                                <c:when test="${salary>5 }">
                                    <c:set var="toAdd" value="3" />
                                </c:when>
                                <c:otherwise>
                                    <c:set var="toAdd" value="${totalPage-page-1}" />
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${totalPage>0}">
                                <select class="custom-select" id="optionselected" onchange="getParamf(this.value,'${type}')" style="margin: auto; width: 100px" >
                                    <c:forEach begin="${page}" end="${totalPage-1}" var="c">
                                        <option  value="${c}"   ${c==number ? 'selected' : ''} >
                                                ${c+1}
                                        </option>
                                    </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${(page)>=(totalPage-1)}">
                                <c:set value="${totalPage-1}" var="page_end" />
                            </c:if>

                            <c:if test="${(page)<(totalPage-1)}">
                                <c:set value="${page+1}" var="page_end" />
                            </c:if>

                        </div>
                    </c:when>
                    <c:otherwise>

                        <h4 style="color:black;text-align: center"><spring:message code='label.Ilnyaaucuneenregistrement'/> </h4>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</div>

<script>
    function showModal(numero){
        if(numero !==""){
            $.ajax({
                url: "/api/AuditAutorisationNum/" + numero,
                type: "GET",
                data: {},
                success: function (response) {
                    window.location.href="/api/AuditAutorisation/" + response;
                },
                error: function (response) {
                    alert('Erreur ajout non effectué');
                }
            });
        }
    }

    function getParamf(vals,type){
        window.location.href='/api/AuditAutorisation/'+vals+'/6'+'/'+type;
    }
    function listAlimentation(page, size) {
        window.location.href='/api/AuditAutorisation/'+page+'/6';
    }
</script>

<jsp:include page="../../includes/footer.jsp" />



