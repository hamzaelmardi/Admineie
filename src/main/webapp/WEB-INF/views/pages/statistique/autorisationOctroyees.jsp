<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/assets/statistique/amcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/serial.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/pie.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>

<div class="col-12">
    <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
        <div class="col-lg-6 grid-margin stretch-card mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                    <hr>
                    <form>
                        <div class="form-group">
                            <div class="col-auto">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="date_depot" checked="checked">
                                    <label class="form-check-label m_4p" for="inlineRadio1" id="dateD" onclick="date_depot()"><spring:message code='label.Datedepots'/></label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="date_validation">
                                    <label class="form-check-label m_4p" for="inlineRadio1" id="dateV" onclick="date_vaalidation()"><spring:message code='label.DateValidation'/></label>
                                </div>
                                <div id="autorisation" >
                                    <select  id="type"  class="form-control select2" multiple  style="width: 100%">
                                        <option value="ZF" selected="selected"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/> </option>
                                        <option value="ET"><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></option>
                                        <option value="IT"><spring:message code='label.Installationdetraitementdesdechets'/></option>
                                        <option value="CT"><spring:message code='label.CollecteTransport'/></option>
                                        <option value="XD"><spring:message code='label.ExportationDesDechetsDangereux'/></option>
                                        <option value="TR"><spring:message code='label.TransitDesDechets'/></option>
                                    </select>
                                </div>
                            </div>
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
                                <button  onclick="getStat1()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-6 grid-margin stretch-card mt-2">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                    <hr>
                    <div class="row " style="margin-top: 10%">

                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_change(1,this)"></label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <div class="custom-control">
                                    <label><img src="/assets/images/chart2_gris.png" class="w-100 img_chart" width="70%" onclick="fun_change(2,this)"></label>
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

<script src="${pageContext.request.contextPath}/assets/statistique/Chart.min.js"></script>


<script type="text/javascript" src="${pageContext.request.contextPath}/assets/css/chart.js/dist/Chart.js"></script>
<!-- amchart js -->
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/amcharts.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/serial.js"></script>
<script src="${pageContext.request.contextPath}/assets/statistique/widget/amchart/light.js"></script>

<script src="${pageContext.request.contextPath}/assets/statistique/chart/statisticfr.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $(".select2").select2();
    });

</script>
<script src="/assets/js/Loginstatistique.js"></script>
