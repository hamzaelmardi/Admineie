<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<div class="col-12">
    <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
        <div class="col-lg-6 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 style="text-align:center"><spring:message code="label.NombredeDecisionsdAcceptabilitesEnvironnementales"/></h5>
                    <hr>
                    <form>
                        <div class="form-group">
                            <label><spring:message code='label.DateDebut'/></label>
                            <div class="input-group">
                                <input type="date" value="" placeholder="Date Début" class="form-control mydatepicker dateDebut" id="date1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label><spring:message code='label.DateFin'/></label>
                            <div class="input-group">
                                <input type="date" value="" placeholder="Date Fin" class="form-control mydatepicker" id="date2">
                            </div>
                        </div>
                        <div class="form-group">
                            <button  onclick="getStat111()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                    <hr>
                    <div class="row " style="margin-top: 10%">
                        <div class="col-md-4" style="display: none">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_change(1,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart2.png" class="w-100 img_chart" width="70%" onclick="fun_change(2,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart3_gris.png" class="w-100 img_chart" width="70%" onclick="fun_change(3,this)"></label>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" value="2" id="affiche_shart">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div id="resultat" style="height: auto!important; min-height:50vh">
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/sweet.js"></script>
<script src="/assets/js/Acces.js"></script>
