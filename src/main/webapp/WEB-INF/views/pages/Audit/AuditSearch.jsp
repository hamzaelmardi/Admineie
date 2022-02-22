

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<div class="container-fluid page-body-wrapper" style="margin: 20px 0px 20px 0px;">
<div class="main-panel " style="margin-top:100px">
<div class="row"  style="display:flex;padding: 26px;">
    <div class="col-12 p-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb ml-4">
                <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'right:3px !important':'left:-10px !important'};top: 14px !important;"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                <li class="breadcrumb-item active" style="${pageContext.response.locale!='ar'?'':'margin-right:4rem !important'}" aria-current="page"><spring:message code="label.Auditsysteme"/> </li>
            </ol>
        </nav>
        <div class="row" style="display: flex; padding: 26px;">






                             
                                 <form action="/api/AuditSearch/0/6" method="get">  <div style="border: 2px solid #eaeaea;
border-radius: 4px; " dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                     
                                       
                                            <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12"  style="display:flex;">
                                               
                                                   <div class="col-3">
                                                       <div class="form-group">
                                                           <label><spring:message code='label.Utilisateur'/></label>
                                                            <select class="form-control" name="id_user">
                                                               <option selected="" value="0"><spring:message code='label.Choisir'/></option>
                                                               <c:forEach items="${compte}" var="com">
                                                                <option  value="${com.compteId }">${com.nom}</option>
                                                               </c:forEach>
                                                                                                       
                                                                                                  
                                                                                               </select>
                                                                                                        </div> </div>
                                                                                                        <div class="col-3">
                                                                                           <div class="form-group">
                                                                                               <label><spring:message code='label.Date'/></label>
                                                                                               <input type="date" name="date" class="form-control">
                                                                                           </div>
                                                                                       </div>
                                                                                       <div class="col-4">
                                                                                           <div class="form-group">
                                                                                               <label><spring:message code='label.Operation'/></label>
                                                                                               <select class="form-control" name="action">
                                                                                                   <option selected value="0"><spring:message code='label.Choisir'/></option>
                                                                                                   <option value="ajouter"><spring:message code='label.Ajouter'/></option>
                                                                                                   <option value="modifier"><spring:message code='label.Modifier'/></option>
                                                                                                   <option value="supprimer"><spring:message code='label.Supprimer'/></option>
                                                                                               </select>
                                                                                           </div>
                                                                                       </div>
                                                                                   <div class="col-2 mt-4">
                                                                                       
                                                                                           <button class="btn btn-success" type="submit"><spring:message code='label.rechercher'/></button>
                                                                                       
                                                                                   </div>
                                                                               </div> </div>
                                                                           
                                                                                      
                                                                                   
                                                             </form>
                                                                             
                                                                          
   
</div>    
   
   <div class="col-md-12 col-lg-12 col-xs-12 col-sm-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                            <hr>             
                                                                          
                                                                      
                                                                    <table class="table table-striped hover compact table-bordered text-md-nowrap">
                                                                               <thead class="bg-vert">
                                                                               
                                                                               <tr>
                                                                                   <th class="text-center text-white"><spring:message code='label.Utilisateur'/></th>
                                                                                   <th class="text-center text-white"><spring:message code='label.Operation'/></th>
                                                                               <th class="text-center text-white"><spring:message code='label.Table'/></th> 
                                               <th class="text-center text-white"><spring:message code='label.Date'/></th>
                                               <th class="text-center text-white"><spring:message code='label.Valeur'/></th>
                                               
                                           </tr>
                                            
                                           </thead>
                                           <tbody>
<c:forEach items="${notif}" var="aud">
<tr>

	<c:choose>
<c:when test="${aud.action_fr.equals('ajouter')}">
<c:set value="badge badge-success" var="badge" />
</c:when>
<c:when test="${aud.action_fr.equals('modifier')}">
<c:set value="badge badge-danger" var="badge" />
</c:when>
<c:when test="${aud.action_fr.equals('supprimer')}">
<c:set value="badge badge-primary" var="badge" />
</c:when>
</c:choose>


<td class="font-weight-semibold">${aud.compte.nom}</td>


<td><span class="${badge}" style="color: white">${aud.action_fr}</span></td>
<td><span class="${badge}" style="color: white">${aud.tables}</span></td>



<td>${aud.dateTime}</td>
<td style="display:flex;">

<!-- Modal -->
<div style="margin-top: 123px;" class="modal fade" id="idModal${aud.auditId }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><spring:message code='label.DetailsOperation'/></h5>
        <button type="button" class="close" onclick="hideModal(${aud.auditId })" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="display:flex;text-align: center;
    margin-left: auto;
    margin-right: auto;">
       <table id="oldData-${aud.auditId }">

</table> 
<table id="newData-${aud.auditId }">

</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="hideModal(${aud.auditId })" ><spring:message code='label.Fermer'/></button>
        
      </div>
    </div>
  </div>
</div>
<button type="button" class="btn btn-primary" onclick="showModal(${aud.auditId })">
  <spring:message code='label.Details'/>
</button>

<script
	type="text/javascript">
                                                
    $(document).ready(function() {
      var val=${aud.oldData};
      var vals=${aud.newData};
     if(val!=null){
    	 var keys = Object.values(val);
    	    var champs = Object.keys(val);
    	    
    	    $("#oldData-"+${aud.auditId }).append('<tr><td></td><td> Avant</td></tr>');
    	                               champs.forEach(function(key,index) {
    	                        	 $("#oldData-"+${aud.auditId }).append('<tr><td class="">' + key + '</td><td class="bg-dangers">' + keys[index] + '</td></tr>');
    	                                              		
    	                                 });
    	       
     } 
     else{
    	 var keys = Object.values(vals);
    	    var champs = Object.keys(vals);
    	    
    	    $("#oldData-"+${aud.auditId }).append('<tr><td></td><td> Avant</td></tr>');
    	                               champs.forEach(function(key,index) {
    	                        	 $("#oldData-"+${aud.auditId }).append('<tr><td class="">' + key + '</td><td class="bg-dangers"></td></tr>');
    	                                              		
    	                                 });
    	       
     }
                            
                               var keyss = Object.values(vals);
                               $("#newData-"+${aud.auditId }).append('<tr><td> Aprés</td></tr>');
                               keyss.forEach(function(key) {
                               	$("#newData-"+${aud.auditId }).append('<tr><td> ' + key + '</td></tr>');
                                   
                                              		
                                 });
                                              
                                              
                                           
                                              	});
                                               </script>

	</td>
	
</tr>
</c:forEach>

</tbody>
                                                                      </table>
                                                                      <c:choose>
                           <c:when test="${notif!='[]'}">   <div class="text-center" dir="ltr">
<c:if test="${(page)>0}">
<c:set value="${page-1}" var="page_db"/>
<c:set value="${totalPage-1}" var="page_LAST"/>
</c:if>
<c:if test="${(page)<=0}">
<c:set value="0" var="page_db"/>
<c:set value="0" var="page_LAST"/>
</c:if>

 

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
<select class="custom-select" id="optionselected" onchange="getParamf(this.value,6,'${action}','${ct}','${date}')" style="margin: auto; width: 100px" >
<c:forEach begin="${page}" end="${totalPage-1}" var="c">
<option  value="${c}"   ${c==number ? 'selected' : ''} >
                                   ${c+1} 
</option> 
</c:forEach>
</select>
</c:if>
<c:if test="${(page)>=(totalPage-1)}">
<c:set value="${totalPage-1}" var="page_end"/>
</c:if>

<c:if test="${(page)<(totalPage-1)}">
<c:set value="${page+1}" var="page_end"/>
</c:if>
        
        
         

</div></c:when>
<c:otherwise>

<h4 style="color:black;text-align: center"><spring:message code='label.Ilnyaaucuneenregistrement'/> </h4>
</c:otherwise>
</c:choose>
</div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </div></div>

      <!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">
function getParamf(vals,size,action,user,date){
	 window.location.href='/api/AuditSearchPage/'+vals+'/6/'+action+"/"+user+"/"+date;
}

function showModal(id){
	
	$("#idModal"+id).modal("show");
}
function hideModal(id){
	
	$("#idModal"+id).modal("hide");
}
<!--

//-->
</script>

