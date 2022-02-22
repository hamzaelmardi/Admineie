<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<c:if test="${type.equals('nbrPays')}">
    <div class="col-12">
        <div class="row justify-content-center">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">

                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.pay"/> </label>
                                    <select id="pays" class="form-control" style="width: 100%">
                                        <option value="0" selected="selected">Choisir</option>
                                        <c:forEach items="${pays}" var="p">
                                            <option value="${p.paysId}">${p.nom_fr}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <button onclick="getNombrePaysET()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
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
                            <div class="col-md-4 pie1">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changesET1(3,this)"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart2.png"  class="w-100 img_chart" width="70%" onclick="fun_changesET1(1,this)"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesET1(2,this)"></label>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="1" id="affiche_shart">
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
</c:if>