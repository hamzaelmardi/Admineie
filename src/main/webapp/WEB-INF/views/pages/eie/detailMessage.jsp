<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../menu/menu.jsp" />
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<style>
	.pr{border-right:8px solid #a5d6a7}
	</style>
</c:when>
<c:otherwise>
<style>
	.pr{border-left:8px solid #a5d6a7}
	</style>
</c:otherwise>
</c:choose>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid mt_def card" style="margin: 30px 10px 30px 10px">
    <div class="row">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-8">
            <div class="container-fluid page-body-wrapper">
                <div class="main-panel " style="margin-top:120px">
                    <div class="content-wrapper">
                        <div class="container">
                            <div class="row" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <div class="pl-2 pr-2 col-md-2 mb-2 text-center" style="background-color: #a5d6a7">
                                    <img src="${pageContext.request.contextPath}/assets/images/contact.png" width="100" height="100" style="border-radius: 30%; box-shadow: 8px 8px 0px #aaa; margin-top: 20px">
                                    <div class="col-sm-12 col-md-12 text-center" style="margin-top: 20px">
                                        <p style="font-weight: bold">${message.compte.nom}</p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 text-center" style="margin-top: 20px">
                                        <p style="font-weight: normal; color: mediumblue; font-size: 13px; text-decoration: underline; cursor:pointer;">${message.compte.email}</p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 text-center" style="margin-top: 20px">
                                        <p style="font-weight: bold">${message.compte.st.secteur.nom_fr}</p>
                                    </div>
                                    <div class="col-sm-12 col-md-12 text-center" style="margin-top: 20px">
                                        <p style="font-weight: bold"><i style="font-size: 16px" class="fa fa-calendar"></i><spring:message code="label.le"/> ${message.date}</p>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-12 pl-2 pr-2 mb-2" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}" >

                    <div class="form-group" >
                        <p class="pr" style=" background-color: lightgrey;"><spring:message code="label.Typededemande"/></p>
                        <p style="font-weight: bold">${message.typemsg.equals("1")?'Autorisation des déchets':'Evaluation Environnementale'}</p>
                    </div>


                    <div class="form-group">
                        <p class="pr" style=" background-color: lightgrey;"><spring:message code="label.Object"/> </p>
                        <p style="font-weight: bold">${message.sujet}</p>
                        </div>
                    <div class="form-group">
                        <p class="pr" style=" background-color: lightgrey;"><spring:message code="label.Message"/> </p>
                        <p style="font-weight: bold">${message.message}</p>
                    </div>
                    <form action="/api/addReponse/${message.id_message}" method="post">
                    <div class="form-group">
                        <p class="pr" style="background-color: lightgrey;"> <spring:message code="label.Reponse"/></p>
                        <input type="hidden" id="id_message" class="form-control" value="${message.id_message}">
                        <textarea rows="3" class="form-control" id="reponse" name="reponse">${message.reponse}</textarea>
                    </div>

                    <div class="col-sm-12 col-md-12 text-right pr-0">
                        <a class="btn btn-outline-success" href="/api/listMessage/1"><span style="color: green"><spring:message code="label.Retour"/></span></a>
                        <button class="btn btn-success" type="submit"><spring:message code="label.Envoyer"/></button>
                    </div>
                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
        <div class="col-lg-2">
        </div>
    </div>
</div>
<jsp:include page="../../includes/footer.jsp" />