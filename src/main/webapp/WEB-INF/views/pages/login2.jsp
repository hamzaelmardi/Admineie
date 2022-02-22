<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../includes/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body class="bg_site">
<div class="row rw">
    <div class="col-12">
        <!-- Modal -->
        <div class="modal fade" data-backdrop="static" data-keyboard="false" id="modal_conx" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg modal_700" role="document">
                <div class="modal-content bg-transparent border-0 pr-0 borderRadius" style="border-radius: 8px !important;">

                    <div class="modal-body bg-white border-0 p-0 rounded borderRadius" style="border-radius: 8px !important;">
                        <div class="p-0 m-0 row borderRadius" style="background-color: #ffffffc7;border-radius: 8px !important;">
                            <div class="col-sm-5 m_h" style="height: 600px; margin-top: 35px!important;">
                                <div class="row justify-content-center">
                                    <div class="img_cont col-3">
                                        <div class="img_top_logo hvr-wobble-skew">
                                        </div>
                                    </div>
                                </div>
                                <div id="frm3" class="row collapse zone_frm d-block" >
                                    <form class="testForm" name="myForm" action="/login?lang=fr"  method="GET">
                                    <div class="row p-0 m-0 justify-content-center"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                        <div class="col-md-12 form-group text-left" >
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code='label.login' /></label>
                                            <div class="input-group" >
                                                                <span class="input-group-text" style="height: 38px !important">
                                                                    <i class="fa fa-user  justify-content-center"></i>
                                                                </span>
                                                <input type="text" class="form-control line-animation" name="j_name" placeholder="<spring:message code='label.login' />">
                                                <div class="line"></div>
                                            </div>

                                        </div>
                                        <div class="col-md-12 form-group text-left" style="margin-top: -2rem;">
                                            <label style="float: ${pageContext.response.locale=='ar'?'right':'left'}"><spring:message code='label.password' /></label>
                                            <div class="input-group" >
                                                                <span class="input-group-text" style="height: 38px !important">
                                                                    <i class="fa fa-key " id="basic-addon2"></i>
                                                                </span>
                                                <input type="password" class="form-control line-animation" name="j_pass" placeholder="<spring:message code='label.password' />">
                                                <div class="line"></div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row p-0 m-0 justify-content-center">
                                        <div class="col-6">
                                            <button type="submit" class="btn-block  btn btn-primary btn-primary" ><spring:message code="label.submit" /></button>
                                        </div>
                                    </div>
                                        <div class="row p-0 m-0 pt-4 text-center">
                                            <a class="pwd-forget" style="color: #0ba1b5" href="/NewPassword"><spring:message code="label.ForgotPassword"/> </a>
                                        </div>
                                        <div class="row p-0 m-0 pt-2 justify-content-center">
                                            <div class="col-8">
                                                <hr style="height:2px;border-width:0;color:#b3d7ff;background-color:gray">
                                            </div>
                                        </div>
                                    </form>
                                    <div class="row p-0 m-0 justify-content-center">
                                          <button type="submit" class="bts col-5 p-1" onclick="document.location='?lang=ar'"><i class="fa fa-language" style="font-size: 20px"></i><spring:message code="label.ar" /> </button>
                                          <button type="submit" class="bts1 col-5 p1" onclick="document.location='?lang=fr'"><i class="fa fa-language" style="font-size: 20px"></i><spring:message code="label.fr" /></button>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-7 img_cover pr-0 mr-0 m_h"></div>
                            <div class="col-sm-7 img_cover2 pr-0 mr-0 m_h" style="display: none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<jsp:include page="../includes/footer.jsp" />
