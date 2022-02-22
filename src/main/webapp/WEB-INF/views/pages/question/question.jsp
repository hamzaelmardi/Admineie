
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<style>
    .style_square{
        list-style: square;
    }
</style>
<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nomComite_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nomComite_fr"/>
</c:otherwise>
</c:choose>



<div class="container-fluid mt-5 pt-3">
    <div class="row mt-5 pt-5 ">
        <div class=" col-md-12 col-sm-12 mt-5" >
           <div class="m-0 p-0 row justify-content-center">
               <div class="col-md-8 text-left">
                   <h3 class="ml6 text-left mb-1">
                         <span class="text-wrapper">
                               <span class="letters"><span class="letters text-c-green"><spring:message code="label.Questionsetreponses"/></span></span>
                         </span>
                   </h3>
               </div>
               <div class="col-md-2"></div>
               <div class="col-md-2" ><a href="/api/addquestion" class="btn btn-success btn-block" ><spring:message code="label.NouvelleQuestion"/></a></div>

               <div class="col-12 table-responsive"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                   <table style="width:100% !important" id="tbody" class="table table-bordered display nowrap">
                       <thead style="background: gray;color: white;border-color: #737373;">
                       <tr style="background-color: #206c45 !important;">
                           <th class="text-center"><spring:message code="label.Demande"/></th>
                           <th class="text-center"><spring:message code="label.Object"/></th>
                <c:choose>
                     <c:when test="${pageContext.response.locale=='ar'}">
	                             <th class="text-center">السؤال</th>
                     </c:when>
                          <c:otherwise>
                                <th class="text-center">Question</th>
                          </c:otherwise>
                </c:choose>
                           
                          
                           <th class="text-center"><spring:message code="label.Reponse"/></th>
                           <th class="text-center"><spring:message code="label.Action"/></th>
                       </tr>
                       </thead>
                       <tbody>
                       <c:forEach items="${question}" var="q">
                           <tr id="tr-${q.id_question}">
                               <td class="text-center">${q.type.equals("1")?"Autorisations des déchets":(q.type.equals("2")?"Evaluation environnementale":(q.type.equals("3")?"Questions Générales":q.type))}</td>
                               <td class="text-center">${q.autorisation.nom_fr}${q.eveluation.nom_fr}</td>
                              <c:choose>
                     <c:when test="${pageContext.response.locale=='ar'}">
	                              <td class="text-center text-right" dir="rtl">${q.description_ar}</td>
                     </c:when>
                          <c:otherwise>
                                 <td class="text-center">${q.description}</td>
                          </c:otherwise>
                </c:choose>
                              
                               <td class="text-center">${(not empty q.reponses )?q.reponses.get(0).description:""}</td>
                               <td class="text-center">
                                   <a type="button" style="background-color: #d59d32;text-align: center;background-size: 100% 100%;border-radius: 50%;" href="/api/updateQuestion/${q.id_question}" class="btn btn-sm mt-1" ><i class="fas fa-pencil-alt m-0"></i></a>
                                   <a   type="button" style="background-color: #fa92a5;text-align: center;background-size: 100% 100%;border-radius: 50%;" href="/api/deleteQuestion/${q.id_question}" class="btn  btn-sm mt-1"><i class="fas fa-trash m-0"></i></a>
                               </td>
                           </tr>
                       </c:forEach>

                       </tbody>
                   </table>
               </div>


           </div>
        </div>
    </div>
</div>


<!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />




