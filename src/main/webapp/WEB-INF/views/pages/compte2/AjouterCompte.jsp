
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

<style>
    #message {
        display:none;
        color: #000;
        position: relative;
        padding: 10px;
    }

    #message p {
        font-family:"Open Sans", sans-serif;
        font-size: 14px;
        margin-left: 25px;
    }

    /* Add a green text color and a checkmark when the requirements are right */
    .valide {
        color: #50D2C2;
    }

    .valide:before {
        position: relative;
        left: -12px;
        font-family: "Font Awesome 5 Free";
        content: "\f058";
        margin-left:0;
    }

    /* Add a red text color and an "x" icon when the requirements are wrong */
    .invalide {
        color: #ee0000;
    }

    .invalide:before {
        position: relative;
        left: -12px;
        font-family: "Font Awesome 5 Free";
        content: "\f057";
        margin-left:0;
    }
    .form-container{
    background: #fff;
    padding: 30px;
    border-raduis: 10px;
    box-shadow:0px 0px 5px 0px #000;
   
    }
    .error{
        font-size: small !important;
        color: red !important;
    }
</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        label {
            float: right;
            direction: rtl;
        }
        input{
            direction: rtl;
        }
        select{
            direction: rtl;
        }
        .invalid-feedback{
            text-align: right;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        label {
            float: left;
        }
        input{
            direction: ltr;
        }
        select{
            direction: ltr;
        }
        .invalid-feedback{
            text-align: left;
        }
    </style>
</c:if>
<c:choose>
    <c:when test="${pageContext.response.locale=='ar'}">
        <c:set var="lng" value="nom_ar"/>
    </c:when>
    <c:otherwise>
        <c:set var="lng" value="nom_fr"/>
    </c:otherwise>
</c:choose>

<div class="col-12 from_add">
        <form class="col-12 from_add" id="frm_etatDoss" name="compteForm" style="margin-top: 160px;">
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-md-8 mt-5 col-sm-12 grid-margin">
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-account-multiple menu-icon"></i>
                    </div>
                    <div class="card" >
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                </div>
                            </div>

                            <div class="col-10 mt-4" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters"><spring:message code="label.Nouveaucompte"/></span></span>
                                                      </span>
                                </h3>
                                <div class="row p-0 m-0 mt-5">
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                         <div class="form-group">
                                              <input  type="hidden" id="compteId" value="${Compte.compteId}" class="form-control" >
                                             <input type="hidden" id="chequer" value="${Compte.chequer}" name="chequer" class="form-control">
                                          </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                         <div class="form-group">
                                          <label><spring:message code="label.NomUtilisateur"/></label>
                                          <input  required type="text" id="nom" name="nom"  value="${Compte.nom}" class="form-control" >
                                             <small style="color: #d32f2f; font-style: italic" id="spnom"></small>
                                         </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                         <div class="form-group">
                                              <label><spring:message code="label.Email"/></label>
                                              <input autocomplete="false" required type="email" id="email" name="email"  value="${Compte.email}" class="form-control" onchange="checkEmaill(this.value)">
                                             <small style="color: #d32f2f; font-style: italic" id="spemail"></small>
                                             <div class="invalid-feedback emailInvalid" style="display: none">
                                                 <spring:message code="label.existe"/>
                                             </div>
                                         </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                         <div class="form-group">
                                               <label><spring:message code="label.Telephone"/></label>
                                               <input  required type="text"  id="tel" name="tel" value="${Compte.tel}" class="form-control">
                                             <small style="color: #d32f2f; font-style: italic" id="sptel"></small>
                                         </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="profilid"><spring:message code="label.Profile"/></label>
                                            <select class="custom-select  bg-light" id="profilid" style="height: 40px">
                                                <c:forEach items="${profiless}" var="a">
                                                    <option ${Compte.profil.profilId==a.profilId?"selected":"" } value="${a.profilId}">${a.nom}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label><spring:message code="label.password2"/></label>
                                            <input  required type="password" autocomplete="new-password" name="password" id="password" value="${Compte.compteId!=null?'ABCDEFGHPOIYTREZDF':'' }" class="form-control">
                                            <small style="color: #d32f2f; font-style: italic" id="sppass"></small>
                                        </div>
                                    </div>
                                    <c:if test="${Compte.compteId==null}">
                                        <div class="col-md-6 col-sm-12">
                                            <div class="form-group text-left">
                                                <label><spring:message code="label.passwordConfirmation"/></label>
                                                <input  required type="password" id="passwordConfirm"  name="passwordConfirm" value="" class="form-control">
                                                <small style="color: #d32f2f; font-style: italic" id="spconfirm"></small>
                                                <div class="invalid-feedback">
                                                    <spring:message code="label.EntreVotrePasswordConfirm"/>
                                                </div>
                                            </div>
                                            <small id="passcom" class="text-danger"></small>
                                        </div>
                                    </c:if>

                                </div>
                                    <div class="row m-0 p-0" style="margin-top: 10px !important;">
                                        <div id="message" class="col-md-12 col-sm-12 border justify-content-center">
                                            <div class="row">
                                                <div class="col-12">
                                                    <span style="font-size:8pt">Mot de passe doit contenir 10 octects (majuscule,Miniscule,Symbole,Numéro)</span>
                                                </div>
                                            </div>
                                            <div class="row mt-2">
                                                <div class="col-lg-6 col-md-12">
                                                    <p id="letter" class="invalide"><spring:message code="label.lettreminuscule"/></p>
                                                </div>
                                                <div class="col-lg-6 col-md-12">
                                                    <p id="capital" class="invalide"><spring:message code="label.lettremajuscule"/></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-12">
                                                    <p id="number" class="invalide"><spring:message code="label.unnumber"/></p>
                                                </div>
                                                <div class="col-lg-6 col-md-12">
                                                    <p id="length" class="invalide"><spring:message code="label.huitcaractere"/></p>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <p id="symbole" class="invalide">Symbole</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group text-left">
                                            <label for="posteId">Poste</label>
                                            <select class="custom-select  bg-light" id="posteId" style="height: 40px">
                                                <c:forEach items="${postes}" var="p">
                                                    <option ${Compte.poste.id_Poste==p.id_Poste?"selected":"" } value="${p.id_Poste}">${p.nom_fr}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                        <div class="form-group text-left">
                                            <label for="auto_nv">Autorisation</label>
                                            <select class="custom-select bg-light" id="auto_nv"  style="height: 40px">
                                                <option value="tous" ${Compte.auto_nv=="tous"?"selected":"" }><spring:message code="label.Tous" /></option>
                                                <option value="auto" ${Compte.auto_nv=="auto"?"selected":"" }><spring:message code="label.Autorisationdesdechets" /></option>
                                                <option value="ev" ${Compte.auto_nv=="ev"?"selected":"" }><spring:message code="label.Evaluationenvironnementale" /></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-12">
                                      <div class="form-group text-left">
                                          <label><spring:message code="label.Type" /></label>
                                          <select  required id="typeregion"  class="custom-select" onchange="changeType(this.value)" style="height: 40px">
                                              <option selected value="1" ${Compte.typeregion=='1'?'selected':''}><spring:message code="label.Regionale" /></option>
                                              <option value="2" ${Compte.typeregion=='2'?'selected':''}><spring:message code="label.Centrale" /></option>
                                          </select>
                                      </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                          <div class="row region1 ${Compte.typeregion.equals('2')?'hidden':''}">
                                              <div class="col-12" dir="ltr">
                                                  <div class="form-group text-left" id="region_form_group">
                                                      <label><spring:message code="label.Region"/></label>

                                                      <select id="regionId" class="custom-select" style="height: 40px">
                                                          <option  selected value="0"><spring:message code="label.Choisir" /></option>
                                                          <c:forEach items="${regionss }" var="r">
                                                              <option ${Compte.region.regionId==r.regionId?"selected":"" } value="${r.regionId}">${r[lng]}</option>
                                                          </c:forEach>
                                                      </select>
                                                  </div>

                                              </div>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center mb-4" style="margin:14px;">
                            <div class="col-md-5">
                            <button type="button" class="btn btn-success col-md-5 m-1" id="btnTo" onclick="addCompte()"><spring:message code="label.Enregistrer"/></button>
                            <a type="button" class="btn btn-danger-2  col-md-5 m-1" href="/api/getAccount5/0/6"><span style="color: white"> <spring:message code="label.Annuler"/></span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</form>

 <script type="text/javascript">

     function validateEmail($email) {
         var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
         return emailReg.test( $email );
     }

     function changeType(id){

         if(id=="1"){
             $(".region1").removeClass('hidden');
         }
         else{
             $(".region1").addClass('hidden');
         }
     }

     function validateTel($tel) {
         var tel = /^([0-9]{10})?$/;
         return tel.test( $tel );
     }

     $(document).ready(function (){
         <c:if test="${modifier.equals('modifier')}">
         $('.confirmm').hide();
         </c:if>
     });

     function validationmotpasse() {
         var password = $("input[name=password]").val();
         var password11 = $("input[name=passwordConfirm]").val();
         if($.trim(password11) =="" || $.trim(password11) !=$.trim(password))
         {
             $("#passcom").text("<spring:message code="label.Vosmotsdepassedoiventcorrespondre"/>");
             return false;
         }
         else
         {
             $("#passcom").text("");
             return true;
         }
     }



     function addCompte (){

      var compteid=$("#compteId").val();
      var nom=$("#nom").val();
      var email=$("#email").val();
      var tel=$("#tel").val();
      var password=$("#password").val();
      var confirm=$("#confirmpassword").val();
      var profilid=$("#profilid").val();
      var typeregion=$("#typeregion").val();
      var regionId=$("#regionId").val();
      var commission=$("#commission").val();
      var id_Poste=$("#posteId").val();
      var chequer=$("#chequer").val();
      var auto_nv=$("#auto_nv").val();

         if(!validationmotpasse() && compteid==null){
             return false;
         }
         if(regionId==0 && typeregion==="1"){
             swal("<spring:message code="label.Avertissement" />","S'il vous plaît choisir une région","error");
             return false;
         }

             $("#passcom").text("");
             if ($("form[name='compteForm']").valid()) {
                 if (typeregion == "2") {
                     regionId = "";
                 }
                 if (regionId == 0) {
                     var Compte = {
                         "compteId": compteid,
                         "nom": nom,
                         "email": email,
                         "tel": tel,
                         "password": password,
                         "commission": commission,
                         "typeregion": typeregion,
                         "profil": {"profilId": profilid},
                         "poste": {"id_Poste": id_Poste},
                         "chequer": chequer,
                         "auto_nv":auto_nv
                     }
                 } else {
                     var Compte = {
                         "compteId": compteid,
                         "nom": nom,
                         "email": email,
                         "tel": tel,
                         "password": password,
                         "commission": commission,
                         "typeregion": typeregion,
                         "profil": {"profilId": profilid},
                         "region": {"regionId": regionId},
                         "poste": {"id_Poste": id_Poste},
                         "chequer": chequer,
                         "auto_nv":auto_nv
                     }
                 }

                 $.ajax({
                     type: "POST",

                     url: "/api/addCompteAdmin",
                     contentType: 'application/json; charset=utf-8',

                     data: JSON.stringify(Compte),

                     success: function (response) {
                         window.location.href = '/api/getAccount5/0/6'
                     },
                     error: function (response) {

                         alert('Erreur ajout non effectu�');

                     }
                 });
             } else {
                 return false;
             }
     }

     function checkEmaill(val){
		$('.emailInvalid').css("display","none");
		$.ajax({
			 type : "GET",
			 url :"/checkEmaill",
			 data:{
				 'val':val
			 },
			 success : function(data) {
				 /* alert()  */
                 if( !validateEmail(val)) {
                     swal("<spring:message code="label.Merciderespecterleformatdelemail"/>")
                 }
				 else if(data==="oui"){
					$('.emailInvalid').css("display","block");
                     $('.email').css("display","none");
					$("#btnTo").prop("disabled", true);
				 }
				 else{
					 $("#btnTo").prop("disabled", false);
                     document.getElementById('spemail').innerHTML="";
				 }
			 },
			 error : function(response) {
					alert("error")
				}
		 });
		
	}

     $(function() {
         $("form[name='compteForm']").validate({
             rules: {
                 email: {
                     required: true,
                 },
                 nom: {
                     required: true
                 },
                 tel : {
                     required: true,
                     number : true,
                     minlength:10
                 },
                 password : {
                     required: true,
                     minlength:10
                 },
                 passwordConfirm : {
                     required: true,
                     equalTo:"#password"
                 },
             },
             messages: {
                 nom: "<spring:message code="label.Silvousplaitremplirlenom"/> ",
                 email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
                 tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
                 password: "<spring:message code="label.Silvousplaitmettezunpasswordentreetcharactere"/>",
                 passwordConfirm: "<spring:message code="label.lesdeuxpasswordnonegaux"/> ",
             },
             submitHandler: function(form) {
                 form.submit();
             }
         });
     });

     var myInput = document.getElementById ("password");
     var letter = document.getElementById ("letter");
     var capital = document.getElementById ("capital");
     var number = document.getElementById ("number");
     var length = document.getElementById ("length");
     var symbole = document.getElementById ("symbole");

     // When the user starts to type something inside the password field
     myInput.onkeyup = function () {
         var lowerCaseLetters = /[a-z]/g;
         if (myInput.value.match (lowerCaseLetters)) {
             letter.classList.remove ("invalide");
             letter.classList.add ("valide");
         } else {
             letter.classList.remove ("valide");
             letter.classList.add ("invalide");
         }
         var upperCaseLetters = /[A-Z]/g;
         if (myInput.value.match (upperCaseLetters)) {
             capital.classList.remove ("invalide");
             capital.classList.add ("valide");
         } else {
             capital.classList.remove ("valide");
             capital.classList.add ("invalide");
         }
         var numbers = /[0-9]/g;
         if (myInput.value.match (numbers)) {
             number.classList.remove ("invalide");
             number.classList.add ("valide");
         } else {
             number.classList.remove ("valide");
             number.classList.add ("invalide");
         }
         var sym = /[!@#$%^&*+=._-]/g;
         if (myInput.value.match(sym)) {
             symbole.classList.remove ("invalide");
             symbole.classList.add ("valide");
         } else {
             symbole.classList.remove ("valide");
             symbole.classList.add ("invalide");
         }
         if (myInput.value.length >= 10) {
             length.classList.remove ("invalide");
             length.classList.add ("valide");
         } else {
             length.classList.remove ("valide");
             length.classList.add ("invalide");
         }
         if(myInput.value.match (lowerCaseLetters) && myInput.value.match (upperCaseLetters) && myInput.value.match (numbers) && myInput.value.match(sym) && myInput.value.length >= 10){
             document.getElementById ("message").style.display = "none";
         }
         else{
             document.getElementById ("message").style.display = "block";
         }
     }
</script>

<jsp:include page="../../includes/footer.jsp" />

 

