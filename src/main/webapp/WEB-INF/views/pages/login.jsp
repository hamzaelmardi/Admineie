

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../includes/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row rw">
<div class="col-md-6 col-sm-6 col-lg-6"></div>
<div class="col-md-4 col-sm-4 col-lg-4 mydiv">
<form class="testForm" name="myForm" action="/login?lang=fr"  method="GET">

  <div class="form-group">
 
    <img class="imgCenter hvr-wobble-skew" src="assets/images/logo_1.png">
  </div>
  <div class="form-group">
    <input type="text" name="j_name"  class="form-control line-animation"  placeholder="<spring:message code='label.login' />">
    <div class="line"></div>
  </div>

  <div class="form-group">
    <input type="password" name="j_pass" class="form-control line-animation"  placeholder="<spring:message code='label.password' />" >
    <div class="line"></div>
  </div>
<button type="submit" class="bts2"><spring:message code="label.submit" /></button>
</form>
<button type="submit" class="bts"><i class="fa fa-language" style="font-size: 20px"></i><spring:message code="label.ar" /> </button>

<button type="submit" class="bts1"><i class="fa fa-language" style="font-size: 20px"></i><spring:message code="label.fr" /></button>


</div>
<div class="col-md-2 col-sm-2 col-lg-2"></div>

</div>