

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


    <!-- partial -->
<style>
    .dataTable{
        width: 1000px;
    }
    .pr-0{
    background: #336c4e !important;
    color:white !important;
    }
    .container-fluid{
        padding: 0;
    }
    .rou{
	box-shadow: 1px 7px 4px #F5F5F5 !important;
    border: 1px solid #ccc !important;
    background:white !important;
}

    .close1{
        background: #ce2828 !important;
        opacity: 1 !important;
        color: white !important;
        border-bottom-right-radius: 47px;
        font-size: 1.5rem;
        font-weight: 700;
        line-height: 1;
        text-shadow: 0 1px 0 #fff;
        border-color: #ce2828;
    }

    .modal-header .close1 {
        padding: 1rem 1rem;
        margin: -1rem auto -1rem -1rem;
    }
</style>

<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
    <div class="main-panel myPanel" style="margin-top:100px">
        <div class="content-wrapper">
            <div class="row pl-3 pr-3 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">

                <c:if test="${auto.equals('auto')}">
                    <%-- col 1 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1 ">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_ZF}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/></p>

                            <div class="col-12  p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a href="/api/getListeAutorisation/ZF/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 2 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_ET}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ImportationDesDechetsNonDangereuxDunpaysEtranger'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/ET/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 3 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_CT}</h3>
                            </div>
                            <div class="col-4 pb-3 mt-n4 text-info">
                                <span class="f-50 mdi mdi-dump-truck" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"> <spring:message code='label.CollecteTransportDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeCollecte/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 4 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_INST}</h3>
                            </div>
                            <div class="col-4 pb-3 mt-n3 text-info">
                                <span class="f-40 mdi mdi-trash-can-outline" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.InstalationDeTraitementDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeInstallation/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 5 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_XD}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;
opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ExportationDesDechetsDangereux'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/XD/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 6 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_TR}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.TransitDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/TR/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${auto.equals('ev')}">
                    <%-- col 1 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1 ">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_EE}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.EtudeImpactEnvironnemental'/></p>

                            <div class="col-12  p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a href="/api/getEie/EE/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 3 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_NT}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"> <spring:message code='label.NoticeImpact'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getEie/NT/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 4 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_AE}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.Auditenvirementale'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getEie/AE/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${auto.equals('tous')}">
                    <%-- col 1 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1 ">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_ZF}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/></p>

                            <div class="col-12  p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a href="/api/getListeAutorisation/ZF/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 2 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_ET}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ImportationDesDechetsNonDangereuxDunpaysEtranger'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/ET/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 3 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_CT}</h3>
                            </div>
                            <div class="col-4 pb-3 mt-n4 text-info">
                                <span class="f-50 mdi mdi-dump-truck" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"> <spring:message code='label.CollecteTransportDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeCollecte/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 4 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_INST}</h3>
                            </div>
                            <div class="col-4 pb-3 mt-n3 text-info">
                                <span class="f-40 mdi mdi-trash-can-outline" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.InstalationDeTraitementDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeInstallation/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 5 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_XD}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;
opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.ExportationDesDechetsDangereux'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/XD/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 6 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_TR}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-recycle" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.TransitDesDechets'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getListeAutorisation/TR/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 1 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1 ">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_EE}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.EtudeImpactEnvironnemental'/></p>

                            <div class="col-12  p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a href="/api/getEie/EE/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_NT}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"> <spring:message code='label.NoticeImpact'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getEie/NT/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%-- col 4 --%>
                    <div class="col-xl-2 col-lg-4 col-md-6 col-ms-12 pl-1 pr-1">
                        <div class="row border-secondary border rounded rou  p-2 pl-4 pr-4 m-1">

                            <div class="col-8 pb-3 text-info">
                                <h3 class="">${nbr_AE}</h3>
                            </div>
                            <div class="col-4 pb-3 text-info">
                                <span class="f-40 fa fa-tree" style="color:#d59d32;opacity: .4;"></span>
                            </div>

                            <p class="  min_h"><spring:message code='label.Auditenvirementale'/></p>


                            <div class="col-12 p-0 m-0">
                                <div class="row justify-content-center border-top border-secondary">
                                    <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                        <a  href="/api/getEie/AE/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

            </div>
            <div class="row rou" style="border-radius:3px;
    margin: 12px;">
                <div class="col-md-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                    <div class="">
                        <div class="">
                            <div class="row">
                                <div class="col-lg-2 border-right pr-0 col-md-4" >
                                    <div class="card-body border-bottom">
                                        <h4 class="card-title mt-2" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                          <spring:message code='label.Evenement'/>
                                        </h4>
                                    </div>
                                    <div class="card-body" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div id="calendar-events" class="">
                                                    <c:if test="${auto.equals('ev')}">
                                                        <div class="calendar-events mb-3" data-class="bg-success_1"><i class="event-1 bg-success_1"></i><spring:message code='label.Reuniondecommision'/></div>
                                                    </c:if>
                                                    <c:if test="${auto.equals('auto')}">
                                                        <div class="calendar-events mb-3" data-class="bg-info"><i class="event-1 bg-info"></i><spring:message code='label.Visitedesite'/></div>
                                                        <div class="calendar-events mb-3" data-class="bg-info"><i class="event-1 bg-info"></i><spring:message code='label.Reunion'/></div>
                                                        <div class="calendar-events mb-3" data-class="bg-warning"><i class="event-1 bg-warning"></i><spring:message code='label.Autorisation'/></div>
                                                    </c:if>
                                                    <c:if test="${auto.equals('tous')}">
                                                        <div class="calendar-events mb-3" data-class="bg-success_1"><i class="event-1 bg-success_1"></i><spring:message code='label.Reuniondecommision'/></div>
                                                        <div class="calendar-events mb-3" data-class="bg-info"><i class="event-1 bg-info"></i><spring:message code='label.Visitedesite'/></div>
                                                        <div class="calendar-events mb-3" data-class="bg-info"><i class="event-1 bg-info"></i><spring:message code='label.Reunion'/></div>
                                                        <div class="calendar-events mb-3" data-class="bg-warning"><i class="event-1 bg-warning"></i><spring:message code='label.Autorisation'/></div>
                                                    </c:if>
                                                </div>
                                                                       </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-10 col-md-8 col-sm-12">
                                    <div class="card-body b-l calender-sidebar">
                                        <div id="calendar"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- BEGIN MODAL -->
            <div class="modal none-border" id="my-event">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><strong><spring:message code='label.Modifierunevenement'/></strong></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn  waves-effect" data-dismiss="modal"><spring:message code='label.Fermer'/></button>
                            <button type="button" class="btn  save-event waves-effect waves-light"><spring:message code='label.Creer'/></button>
                            <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal"><spring:message code='label.Supprimer'/></button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Add Category -->
            <div class="modal fade none-border" id="add-new-event">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><strong><spring:message code='label.Ajouterunevenement'/></strong></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Nom</label>
                                        <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Choisir la Couleur</label>
                                        <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                            <option value="success">Rouge</option>
                                            <option value="danger">Danger</option>
                                            <option value="info">Info</option>
                                            <option value="primary">Bleu</option>
                                            <option value="warning">Warning</option>
                                            <option value="inverse">Inverse</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn_add_event waves-effect waves-light save-category" data-dismiss="modal">Enregistrer</button>
                            <button type="button" class="btn  waves-effect" data-dismiss="modal">Fermer</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MODAL -->

            <div class="modal none-border" id="my-event">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><strong>Modifier un évenement</strong></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn  waves-effect" data-dismiss="modal">Fermer</button>
                            <button type="button" class="btn  save-event waves-effect waves-light">Créer</button>
                            <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Supprimer</button>
                        </div>
                    </div>
                </div>
            </div>

            <div id="event_click" class="modal fade" id="exampleModalCenterexampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <c:if test="${pageContext.response.locale=='ar'}">
                            <div class="modal-header">
                                <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                        onclick="Modalclose_modal('event_click')">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Informationdetaille"/> </h5>

                            </div>
                        </c:if>
                        <c:if test="${pageContext.response.locale!='ar'}">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle"><spring:message code="label.Informationdetaille"/> </h5>
                                <button type="button" class="${pageContext.response.locale=='ar'?'close1':'close'}" data-dismiss="modal" aria-label="Close"
                                        onclick="Modalclose_modal('event_click')">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                            </div>
                        </c:if>
                        <div class="modal-body" id="table_modal_result_event">
                            <table class="my_table border border-dark" id="tabinfo" style="width: 100%;text-align:center;border: 1px solid black;border-collapse: collapse;">
                                <thead class="th_vert">
                                <tr>
                                    <th>Titulé projet</th>
                                    <th>pétitionnaire</th>
                                    <th >Réunion</th>
                                </tr>
                                </thead>
                                <tbody >
                                <td colspan='3' class='text-center bg-light'>Aucun Resultat</td>
                                </tbody>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn_vert" data-dismiss="modal" onclick="Modalclose_modal('event_click')" ><spring:message code="button.Fermer"/> </button>
                        </div>
                    </div>
                </div>
            </div>

<div class="modal modalinfo fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="width: 400px;">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Informations</h5>
            </div>
            <div class="modal-body" >

                <div id="bodymodal">
                 <table id="tabinfo" style="width: 100%;text-align:center;border: 1px solid black;border-collapse: collapse;">
                    <thead>
                        <th style="background-color: #95c74d;border: 1px solid black;border-collapse: collapse;">Titulé projet</th>
                        <th style="background-color: #95c74d;border: 1px solid black;border-collapse: collapse;">pétitionnaire</th>
                        <th style="background-color: #95c74d;border: 1px solid black;border-collapse: collapse;">Réunion</th>
                    </thead>
                    <tbody>
                        <td style="padding: 5%;border: 1px solid black;border-collapse: collapse" id="ttp"></td>
                        <td style="padding: 5%;border: 1px solid black;border-collapse: collapse" id="ptt"></td>
                        <td style="padding: 5%;border: 1px solid black;border-collapse: collapse" id="rn"></td>
                    </tbody>

                </table>
                </div>
                <div id="repotreunion">

                    <form   class="form-horizontal mt-3" action="/add_reunion_report" id="formreunion" name="formreunion" method="post">
                         <input onchange="tcheckdatereunion()"  required type="date" name="date_reunion"  id="date_reunion" class="form-control">
                        <input type="hidden" name="id_demande_information" id="iddemanderepp"  class="form-control">
                        <input type="hidden" name="id_reunion" id="idreuniond"  class="form-control">


                        <button type="submit" class="btn btn-primary suivantreunion"> Valider </button>

                    </form>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn " onclick="changedt()" >Reporter</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>


<script>
    function changedt(){
        $("#bodymodal").hide();
        $("#repotreunion").show();
    }
    $(document).ready(function() {
        $('#DataTables_Table_1').DataTable().clear().destroy();
    });
    $(document).ready(function() {
        $('#DataTables_Table_0').css("width","100%");
    });
    $(document).ready(function() {
        $('#DataTables_Table_0_filter').css("display","none");
    });

</script>
<script src="${pageContext.request.contextPath}/assets/js/custom_hatim.js"></script>

<jsp:include page="../../includes/footer.jsp" />
