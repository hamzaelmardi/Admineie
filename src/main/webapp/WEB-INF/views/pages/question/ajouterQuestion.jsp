
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    .not-button:hover{
        cursor: unset !important;
        background:  #d59d32 !important;
    }
</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <style>
       .select2-results__option  {
            direction:rtl;
			text-align:right !important;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .select2-results__option {
            direction:ltr;
            text-align:left !important;
        }
    </style>
</c:if>
<div class="row justify-content-center">
    <div class="col-lg-8 grid-margin grid-margin-md-0 justify-content-center" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: 173px;">

        <div class="card crdt" >
            <div class="col-12 from_add" id="frm_etatDoss"  style="margin-top: 3%;">
                <div class="row justify-content-center">
                    <div class=" col-md-5 col-sm-12 mt-0 ml-5 mr-5 mb-5">
                        <div class="btn btn-primary btn-block not-button"><spring:message code="label.AjouteruneQuestion"/></div>
                    </div>
                </div>
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-md-8 col-sm-12 grid-margin stretch-card " >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-comment-question menu-icon"></i>
                        </div>
                        <form method="post" action="/api/savequestion">
                            <div class="card">
                                <div class="row justify-content-center">
                                    <div class="progress">
                                        <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                        </div>
                                    </div>

                                    <div class="col-10 mt-4"  >

                                        <h4 style="float:right;color:black"><spring:message code="label.AjouteruneQuestionreponse"/></h4>
                                        <div class="row p-0 m-0 mt-5">

                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.Typededemande"/></label>
                                                    <select name="type" class="form-control select2" onchange="Sautoris(this.value)" data-width="100%">
                                                        <option value="1" ${(!question.type.equals("1") && !question.type.equals("2"))?"selected":""} ><spring:message code="label.Choisir"/></option>
                                                        <option value="1" ${question.type.equals("1")?"selected":""} ><spring:message code="label.Autorisationsdesdechets"/></option>
                                                        <option value="2" ${question.type.equals("2")?"selected":""}><spring:message code="label.Evaluationenvironnementale"/></option>
                                                        <option value="2" ${question.type.equals("3")?"selected":""}><spring:message code="label.QuestionsGenerales"/></option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.OrderNumero"/> :</label>
                                                    <input class="form-control" type="number" name="nbr" value="${question.nbr}" min="0"/>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row ${question.type.equals("1")?"":"d-none"}" id="autorisation">
                                            <div class="col-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.Autorisation"/></label>
                                                    <select class="form-control select2" name="aut" data-width="100%">
                                                        <option value=""><spring:message code="label.Choisir"/></option>
                                                        <c:forEach items="${autoris}" var="a">
                                                            <c:choose>
                                                                <c:when test="${pageContext.response.locale=='ar'}">
                                                                    <option value="${a.id_autorisation}" ${a.id_autorisation==question.autorisation.id_autorisation?"Selected":""} >${a.nom_ar}</option>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <option value="${a.id_autorisation}" ${a.id_autorisation==question.autorisation.id_autorisation?"Selected":""} >${a.nom_fr}</option>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row  ${question.type.equals("2")?"":"d-none"}" id="evaluation">
                                            <div class="col-12">
                                                <div class="form-group" >
                                                    <label><spring:message code="label.Evaluation"/></label>
                                                    <select class="form-control select2" data-width="100%" name="eva">
                                                        <option value=""><spring:message code="label.Choisir"/></option>
                                                        <c:forEach items="${eval}" var="ev">
                                                            <option value="${ev.id_evaluation}" ${ev.id_evaluation==question.eveluation.id_evaluation?"Selected":""}> ${ev.nom_fr} </option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <div class="form-group" style="text-align:left">
                                                    <label>Question</label>
                                                    <input class="form-control" type="text" name="question" value="${question.description}">
                                                </div>

                                                <div class="form-group " dir="rtl">
                                                    <label class="float-right">السؤال</label>
                                                    <input class="form-control" type="text" name="quest_ar" value="${question.description_ar}">
                                                </div>

                                                <div class="form-group" >
                                                    <label><spring:message code="label.reponse"/></label>
                                                    <textarea class="form-control" rows="4" name="reponse">${question.reponses.size()>0?question.reponses.get(0).description:""}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row  mb-4" style="margin:14px;">
                                            <input type="hidden" name="idq" value="${question.id_question}" >
                                            <div class="col-sm-6 mt-1">
                                                <a href="/api/listQuestions" class="btn btn-block btn-danger"><spring:message code="label.Annuler"/></a>
                                            </div>
                                            <div class="col-sm-6 mt-1">
                                                <input value="<spring:message code="label.Enregistrer"/>" type="submit" class="btn btn-primary btn-block">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    function Sautoris(val){
        if(val==1){
            $("#autorisation").removeClass("d-none");
            $("#evaluation").addClass("d-none");
            $("#evaluation select").val("");
            $("#evaluation select").trigger("change");
        }else if(val==2){
            $("#evaluation").removeClass("d-none");
            $("#autorisation").addClass("d-none");
            $("#autorisation select").val("");
            $("#autorisation select").trigger("change");
        }
    }
</script>

<jsp:include page="../../includes/footer.jsp" />




