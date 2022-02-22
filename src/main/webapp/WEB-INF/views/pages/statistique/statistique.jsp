
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />

<style type="text/css">

    figure {
        height: 275px !important;
    }
    .statistique-flip-card {
        background-color: transparent;
        height: 275px;
        perspective: 1000px;
    }

    .statistique-flip-card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.6s;
        transform-style: preserve-3d;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    }

    .statistique-flip-card:hover .flip-card-inner {
        transform: rotateY(180deg);
    }

    .statistique-flip-card-front, .flip-card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }

    .statistique-flip-card-front {
        background-color: #bbb;
        color: black;
    }

    .statistique-flip-card-back {
        background-color: #0c5460;
        color: white;
        transform: rotateY(180deg);
        //padding-top: 20%;
    }
    h1{
        color: whitesmoke!important;
        font-size: 30px;
    }
    h4{
        color: whitesmoke!important;
        padding: 20px;
    }

</style>

<div class="container-fluid">

    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper mt-2">

                                            <div class="container-fluid page-body-wrapper">
                                                <div class="main-panel " style="margin-top:120px">
                                                    <div class="content-wrapper p-0">
                                                        <div class="row">
                                                            <div class="col-lg-12 grid-margin grid-margin-md-0">
                                                                <div class="card " style="min-height: 700px">
                                                                    <div class="card-body p-4">
                                                                        <c:if test="${type=='autorisation'}">
                                                                        <div class="row justify-content-center" style="margin-top: 5%">
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/images/stat_dmd.jpg" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombre}</h1>
                                                                                            <h4><spring:message code='label.Nombretotaledesautorisationsdesdechetspartype'/></h4>
                                                                                            <a href="/api/statistique/autorisation_octroyees/autorisation" class="btn" style="background-color: #0aab90"><spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/stat_type.jpg" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombre}</h1>
                                                                                            <h4><spring:message code='label.Nombretotaledesautorisationsdesdechetsparstatut'/> </h4>
                                                                                            <a href="/api/statistique/environnement/autorisation" class="btn" style="background-color: #0aab90"><spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                        </c:if>
                                                                        <c:if test="${type=='evaluation'}">
                                                                        <div class="row justify-content-start" style="margin-top: 5%">
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/stat_redev.png" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombreRegion}</h1>
                                                                                            <h4><spring:message code="label.NombredeprojetsexaminesparleCNEEparregionsetparsecteursdactivite"/></h4>
                                                                                            <a href="/api/statistique/Environnementaleparregion/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/images/stst_type.jpg" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombrereunion}</h1>
                                                                                            <h4>Nombre de réunions et de projets examinés par mois</h4>
                                                                                            <a href="/api/statistique/reunion-statistique/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/images/image2.png" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombreRegion}</h1>
                                                                                            <h4><spring:message code='label.NombreEIEexamineeparcategorie'/></h4>
                                                                                            <a href="/api/statistique/NombreEIE/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/images/image1.png" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombreRegion}</h1>
                                                                                            <h4><spring:message code="label.NombredeDecisionsdAcceptabilitesEnvironnementales"/>  </h4>
                                                                                            <a href="/api/statistique/Acceptabilites/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/images/stata.jpg" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${nombreRegion}</h1>
                                                                                            <h4><spring:message code='label.QuantiteestimeevcQuantitereelparmois'/>  </h4>
                                                                                            <a href="/api/statistique/Quantite/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4 col-sm-8">
                                                                                <div class="statistique-flip-card">
                                                                                    <div class="statistique-flip-card-inner">
                                                                                        <div class="statistique-flip-card-front">
                                                                                            <img src="${pageContext.request.contextPath}/assets/stat_redev.png" alt="Avatar" style="width:100%;height:275px;">
                                                                                        </div>
                                                                                        <div class="statistique-flip-card-back">
                                                                                            <h1>${projetexamine}</h1>
                                                                                            <h4><spring:message code="label.Montantdinvestissementdesprojetsexamines"/></h4>
                                                                                            <a href="/api/statistique/getMontantInvestis/evaluation" class="btn" style="background-color: #0aab90"> <spring:message code='label.VoirPlus'/></a>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        </c:if>
                                                                        <c:if test="${type=='new'}">
                                                                            <div class="row justify-content-center" style="margin-top: 5%">
                                                                                <div class="col-md-4 col-sm-8">
                                                                                    <div class="statistique-flip-card">
                                                                                        <div class="statistique-flip-card-inner">
                                                                                            <div class="statistique-flip-card-front">
                                                                                                <img src="${pageContext.request.contextPath}/assets/images/stat_dmd.jpg" alt="Avatar" style="width:100%;height:275px;">
                                                                                            </div>
                                                                                            <div class="statistique-flip-card-back">
                                                                                                <h1>${nombre}</h1>
                                                                                                <h4>Les types des déchets Dangereux autorisés pour importation de la zone franche</h4>
                                                                                                <a href="/api/statistique/typeDechetDangereux/new" class="btn" style="background-color: #0aab90"><spring:message code='label.VoirPlus'/></a>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                            </div>
                                                                        </c:if>
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


<script src="${pageContext.request.contextPath}/assets/js/vartical-layout.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/script.min.js"></script>


<script src="${pageContext.request.contextPath}/assets/css/d3/d3.js"></script>
<script src="${pageContext.request.contextPath}/assets/css/nvd3/build/nv.d3.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chart/nv-chart/js/stream_layers.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/chart/float/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chart/float/jquery.flot.categories.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/chart/float/jquery.flot.pie.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/chart/echarts/js/echarts-all.js" type="text/javascript"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart/nvd3/chart-nvd3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart/nvd3/float-chart-custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/css/chart.js/dist/Chart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/chart.js"></script>
<jsp:include page="../../includes/footer.jsp" />
