
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />


<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getListe')">Liste des profiles</h2>
<h2 class='mb-3 btn btn-primary' onclick="getFunctionPage('getDroit')">Nouveau  profile</h2>
<table id="dtBasicExample" class="table" width="100%" style="margin-top: 120px">
  <thead>
    <tr>
      <th class="th-sm">Droit
      </th>
      <th class="th-sm">Consulter
      </th>
      
     
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${roles}" var="a">
    <tr>
      <td>${a.nom}</td>
      <td><a class="btn btn-primary" onclick="showRole(${a.profilId})">+</a></td>
      
      
    </tr>
    
   </c:forEach>
  
</table>






<script type="text/javascript">
function showRole(val){
	$.ajax({
		 type : "GET",
		 url :"/getProfilDetails",
		 data:{
			 'val':val
		 },
		 success : function(data) {
			 
			 $(".content-wrapper").html(data);
			 
			
		 },
		 error : function(response) {
				alert("erreur")
			}
	 });
	
}
</script>





















<jsp:include page="../../includes/footer.jsp" />



