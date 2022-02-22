

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet"
	  href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	  integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	  crossorigin="anonymous" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container-fluid" style="margin-top:130px">
	<div class="content-wrapper p-0">
		<div class="row" >
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<div class="row mt-4 ml-2 col-12">
						<div class="col-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
							<c:choose>
								<c:when test="${fn:startsWith(requestScope['javax.servlet.forward.request_uri'], '/api/listRensignement/11/0/6')}">
								</c:when>
								<c:otherwise>
									<c:set var="p_page" value="Renseignement préalable"/>
								</c:otherwise>
							</c:choose>
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb ml-4">
									<li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
									<li class="breadcrumb-item ${pageContext.response.locale!='ar'?'':'mr-5'}">><a href="/api/getDre/0/6"><spring:message code="label.Etudedimpactenvirementalee" /></a></li>
								</ol>
							</nav>
           				 </div>
						<div class="row col-12 mt-3">
							<div class="col-md-12">
								<div class="card-body"></div>
								<div class="row p-4">
									<div class="col-sm-2 col-md-2">
									</div>
									<div class="col-sm-8 col-md-8 text-center">
										<h3><spring:message code="label.InformationsRenseignerDRE"/></h3>
									</div>
									<div class="col-md-2 col-sm-2">
										<a href="/api/addDre" class="btn btn-success btn-block" style="margin-left: 5%"><spring:message code="label.NouveauDRE"/> </a>
									</div>
								</div>
								<div class="row p-4">
									<div class="col-sm-12 col-md-12 p-0 table-responsive">
										<table class="table table-striped table-bordered">
											<thead>
											<tr style="background-color: #206c45; color: white">
												<th>  <spring:message code="label.Intitule"/> </th>
												<th>  <spring:message code="label.Petitionnaire"/> </th>
												<th>  <spring:message code="label.Region"/> </th>

												<th> <spring:message code="label.Provinces"/></th>
												<th> <spring:message code="label.Commune"/></th>
												<th> <spring:message code="label.DateReunion"/></th>
												<th>  <spring:message code="label.ObjetReunion"/></th>
												<th>  <spring:message code="label.Decision"/></th>
												<th>  <spring:message code="label.Montantdinvestissement"/></th>
												<th>  <spring:message code="label.Consistance"/> </th>
												<th> <spring:message code="label.Etatdavancement"/></th>
											</tr>
											</thead>
											<tbody>
											<c:forEach items="${notif}" var="dre">
												<tr>
													<td> ${dre.nom_fr} </td>
													<td> ${dre.petitionaire}  </td>
													<td> ${dre.region.nom_fr} </td>
													<td> ${dre.province.nom_fr} </td>
													<td> ${dre.commune.nom_fr} </td>
													<td> ${dre.date} </td>
													<td> ${dre.objet} </td>
													<td> ${dre.decision.equals("0")?"favorable":"Non Favorable"} </td>
													<td> ${dre.montant} </td>
													<td> ${dre.consistance} </td>
													<td style="width: 200px"> <a href="/api/updateEieDre/${dre.id_eiedre}" class="btn btn-success btn-sm" style="color: white !important;"> <spring:message code="label.Modifier"/></a>
														<a href="/api/deleteEieDre/${dre.id_eiedre}" class="btn btn-sm" style="background-color:#d53232 ; color: white !important;"> <spring:message code="label.Supprimer"/></a></td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
										<c:choose>
											<c:when test="${notif!='[]'}"> <div class="text-center" dir="ltr">
												<c:if test="${(page)>0}">
													<c:set value="${page-1}" var="page_db"/>
													<c:set value="${totalPage-1}" var="page_LAST"/>
												</c:if>
												<c:if test="${(page)<=0}">
													<c:set value="0" var="page_db"/>
													<c:set value="0" var="page_LAST"/>
												</c:if>

												<a class="fa fa-arrow-circle-left" style="font-size: 20;"aria-hidden="true"   onclick="listAlimentation(${page_end},6)" ></a>


												<c:set var = "salary"  value = "${totalPage-page-1}"/>
												<c:choose>
													<c:when test="${salary>5 }">
														<c:set var = "toAdd"  value = "5"/>
													</c:when>
													<c:otherwise>
														<c:set var = "toAdd"  value = "${totalPage-page-1}"/>
													</c:otherwise>
												</c:choose>

												<c:if test="${totalPage>0}">
													<c:forEach begin="${page}" end="${page+toAdd}" var="c">
														<a style="font-size: 26px; style="border-radius: 50%;"  onclick="listAlimentation(${c},6)"  ${c==number ? 'class=" btnss pageStyle"' : 'class="btnss"'}>${c+1}</a>
													</c:forEach>
												</c:if>
												<c:if test="${(page)>=(totalPage-1)}">
													<c:set value="${totalPage-1}" var="page_end"/>
												</c:if>

												<c:if test="${(page)<(totalPage-1)}">
													<c:set value="${page+1}" var="page_end"/>
												</c:if>


												<a class="fa fa-arrow-circle-right" style="font-size: 20;"aria-hidden="true"   onclick="listAlimentation(${page_end},6)" ></a>


											</div></c:when>
											<c:otherwise>

												<h4 style="color:black;text-align: center"><spring:message code="label.AucuneEnregistrement"/> </h4>
											</c:otherwise>
										</c:choose>
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




<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />
<script type="text/javascript">
function listAlimentation(page, size) {
    
	   
    
    
	   window.location.href='/api/getDre/'+page+'/6';
	   
	}
</script>

