
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />



<div class="row" style="margin-top: 140px">
<!-- <div class="btDecort " ><span class="fa fa-home"></span></div> -->
<div class="col-md-4 mdf " >
<form style="margin-left:12px;" id="loginForm" name="loginForm">
<div class="row">
  <div class="col">
    <label class="cls">Nom & prénom</label>
    <input type="text" class="form-control" id="nom"  placeholder="nom" value="${cpt.nom}">
    </div>
    <div class="col">
    <label class="cls">Email</label>
    <input type="text" onChange="checkCode(this.value)" class="form-control" id="email"  placeholder="email" value="${cpt.email}">
    </div>
    </div>
   
    
    
  <div class="row">
  <div class="col">
    <label class="cls">Mot de passe</label>
    <input type="password" class="form-control" id="password" placeholder="Mot de passe" value="${cpt.getcompteId!=0?'ABCDEFGHPOIYTREZDF':'' }">
  </div>
  <div class="col">
    <label class="cls">Confirmation</label>
    <input type="password" class="form-control" name="confirmpassword" id="confirmpassword" value="" placeholder="Mot de passe">
  </div>
  </div>
  <div class="row">
   <div class="col">
    <label class="cls">Tél</label>
    <input type="text" class="form-control" id="tel"  placeholder="Tél" value="${cpt.tel}">
    </div>
  <div class="col">
     <label for="exampleInputPassword1">Profil</label>
    <select class="form-control" id="profil">
      <c:forEach items="${profil}" var="a">
      <option ${cpt.profil.profilId==a.profilId?"selected":"" } value="${a.profilId}">${a.nom}</option>
      </c:forEach>
    </select> </div></div>
  <input type="hidden" class="form-control" id="compteId" placeholder="commission" value="${cpt.compteId}">
  
  
  
  
  
  
  <a id="codeLabel" class="btn btn-primary" onclick="addCompte()" style="color:white;">Valider</a>
</form></div>

<div class="col-md-8">

<jsp:include page="listCompte.jsp" />

</div></div>





<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>



<script type="text/javascript">
function addProfil(){
	$(".colhere").html(" ");
	var nom=$("#nom").val();
var profil={
			
			
			"nom":nom
			
			
			
	}
	
	$.ajax({
		 type : "POST",
		 contentType :'application/json; charset=utf-8',
		 url :"/addProfil",
		 data:JSON.stringify(profil),
		 
		 success : function(data) {
			 
			 $(".colhere").html(data);
		 },
		 error : function(response) {
				alert("error")
			}
	 });
}

function checkCode(val){
	$('#codeLabel').css("display","none");
	$.ajax({
		 type : "GET",
		 url :"/checkEmail",
		 data:{
			 'val':val
		 },
		 success : function(data) {
			
			 if(data=="non"){
				$('#codeLabel').css("display","block");
				

			 }
			 else{
				 $(".btnTo").removeClass("hidden");
			 }
			 
			
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}

function addCompte(){
	var validator = $("#loginForm").validate({
        rules: {
            password: "required",
            confirmpassword: {
                equalTo: "#password"
            }
        },
        messages: {
            password: " Entrer le mot de passe",
            confirmpassword: " les deux mot de passes doit etre identique"
        }
    });
   
	var nom=$("#nom").val();
	var email=$("#email").val();
	var tel=$("#tel").val();
	var password=$("#password").val();
	
	var profil=$("#profil").val();
	
	
	var compteId=$("#compteId").val();
	
	var cmt={
			
			"nom":nom,
			
			"email":email,
			
			"tel":tel,
			"password":password,
			"compteId":compteId,
			"profil":{"profilId":profil}
			
	};
	 if (validator.form()) {
	       
	   
	$.ajax({
		type: "POST",
        
        url :"/addCompte",
        contentType : 'application/json; charset=utf-8',
        
        data : JSON.stringify(cmt),
        
		success : function(response) {
			
			$(".content-wrapper").html(response);
		},
		error : function(response) {

			alert('Erreur ajout non effectué');

		}
	 });
	
} }




function deleteCompte(id){
	
	$.ajax({
		 type : "POST",
		 url :"/deleteCompte",
		data:{
			"id":id
		},
		 success : function(data) {
			 
			 $("#tr-"+id).css("display","none");
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}

function updateCompte(id){
	
	$.ajax({
		 type : "GET",
		 url :"/api/getOneCompteId",
		data:{
			"id":id
		},
		 success : function(data) {
			 
			 
			 $(".content-wrapper").html(data);
			 $("#tr-"+id).addClass("updated");
		 },
		 error : function(response) {
				alert("error")
			}
	 });
	
}


function validatePassword() {
    var validator = $("#loginForm").validate({
        rules: {
            password: "required",
            confirmpassword: {
                equalTo: "#password"
            }
        },
        messages: {
            password: " Enter Password",
            confirmpassword: " Enter Confirm Password Same as Password"
        }
    });
    if (validator.form()) {
        alert('Sucess');
    }
}
</script>






















<jsp:include page="../../includes/footer.jsp" />



