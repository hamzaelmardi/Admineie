<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../includes/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
        margin-left:${pageContext.response.locale=='ar'?'20px;':''};
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
        margin-left:${pageContext.response.locale=='ar'?'20px;':''};
    }
    .toggle-password {
         float: right;
         margin-left: -25px;
         margin-top: -38px;
         position: relative;
         z-index: 2;
         color: #336c4e !important;
         cursor: pointer;
     }
    .toggle-password1 {
        float: right;
        margin-left: -25px;
        margin-top: -38px;
        position: relative;
        z-index: 2;
        color: #336c4e !important;
        cursor: pointer;
    }
    .modal-dialog{
        height:80%
    }
    .modal-content{
        min-height:80%
    }

    .btss{
        background-color: #5f7a85;
        color: white;
        width: 200px;
        border-color:#5f7a85 !important;
        font-weight: bold;
        font-size: 14px;
        height: 40px;
    }
    /*.ip{
        border: none !important;
        border-bottom: 1px solid #020005 !important;
        border-radius: 0px !important;
    }*/
    .btss:hover{
        background: white !important;
        color:#5f7a85 !important;
        width: 200px;
        font-weight: bold;
        font-size: 14px;
        height: 40px;
    }
    .btss1{
        background-color: #0c2646;
        color: white;
        width: 200px;
        border-color:#0c2646 !important;
        font-weight: bold;
        font-size: 14px;
        height: 40px;
    }
    .btss1:hover{
        background: white !important;
        color:#0c2646 !important;
        width: 200px;
        font-weight: bold;
        font-size: 14px;
        height: 40px;
    }
</style>
<body class="bg_site">
<div class="row rw">
    <div class="col-12">
        <div class="modal" data-backdrop="static" id="modal_pass" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle">
            <div class="modal-dialog modal-dialog-centered modal-lg modal_700" role="document">
                <div class="modal-content bg-transparent border-0 pr-0 borderRadius" style="border-radius: 8px !important;">

                    <div class="modal-body bg-white border-0 p-0 rounded borderRadius" style="border-radius: 8px !important;">
                        <div class="p-0 m-0 row borderRadius" style="background-color: #ffffffc7;border-radius: 8px !important;">
                            <div class="col-lg-12 m_h" style="height: 400px; margin-top: 35px!important;">
                                <div class="row justify-content-center">
                                    <div class="img_cont">
                                        <div class="img_top_logo hvr-wobble-skew">
                                        </div>
                                    </div>
                                </div>
        <div class="container-fluid page-body-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="main-panel">
                        <div class="row">
                            <div class="pl-2 pr-2 col-md-12 mb-2"style=" max-width: 521px; margin: auto;">
                               <div class="border rounded p-2">
                                        <h3 class="text-center"><spring:message code="label.Creerunnouveaumotdepasse"/> </h3>
                                        <div>
                                            <div class="row justify-content-center" style="margin-top: 5%;">
                                                <input type="hidden" value="${id}" id="idUser">
                                                <input type="hidden" value="${passe}" id="idpasse">
                                                        <div class="form-group col-md-12">
                                                            <input type="password" placeholder="<spring:message code="label.Creerlenouveaumotdepasse"/>" class="form-control" id="password_user" name="password_user">
                                                            <i style="margin-right: ${pageContext.response.locale=='ar'?'94%;':''}" toggle="#password-field" class="fa fa-fw fa-eye toggle-password"></i>
                                                        </div>
                                                        <div class="form-group mt-2 col-md-12">
                                                            <input type="password"  class="form-control" placeholder="<spring:message code="label.Confirmerlenouveaumotdepasse"/>" id="password_confirm" name="password_confirm">
                                                            <i style="margin-right: ${pageContext.response.locale=='ar'?'94%;':''}" toggle="#password-field1" class="fa fa-fw fa-eye toggle-password1"></i>
                                                        </div>
                                            </div>
                                            <div class="row m-0 p-0" style="margin-top: 10px !important; text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                                <div id="message" class="col-md-12 col-sm-12 border justify-content-center">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <span style="font-size:8pt"><spring:message code="label.Motdepassdoitcontenirctects"/></span>
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
                                                            <p id="symbole" class="invalide"><spring:message code="label.symbole"/></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row p-0 m-0 justify-content-center" style="margin-top: 3%!important;">
                                                <button type="submit" class="btss col-5 p-1" onclick="document.location='?lang=ar'"><i class="fa fa-language" style="font-size: 20px; margin-left: ${pageContext.response.locale=='ar'?'5px;':''}"></i><spring:message code="label.ar" /> </button>
                                                <button type="submit" class="btss1 col-5 p1" onclick="document.location='?lang=fr'"><i class="fa fa-language" style="font-size: 20px; margin-left: ${pageContext.response.locale=='ar'?'5px;':''}"></i><spring:message code="label.fr" /></button>
                                            </div>
                                            <div class="text-center" style="margin-top: 3%;">
                                                <button type="button" onclick="updatePassword()" id=""  class="btn btn-success mb-2"> <i class="fa fa-unlock" style="margin-left: ${pageContext.response.locale=='ar'?'5px;':''}"></i><spring:message code="label.changerlemotdepasse"/> </button>
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
</div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../includes/footer.jsp" />
<script>
    function updatePassword(){
        var id = $("#idUser").val();
        var idpasse = $("#idpasse").val();
        var password = $("#password_user").val();
        var confirm = $("#password_confirm").val();

        if($.trim(confirm) =="" || $.trim(confirm) !=$.trim(password)){
            swal("<spring:message code="label.Avertissement"/> ", "<spring:message code="label.Vosmotsdepassedoiventcorrespondre"/>","error")
            return false;
        }
            $.ajax({
                type: "POST",
                url : "/UpdatePassword/"+id+"/"+idpasse,
                data: {
                    "password":password
                },
                success : function(response) {
                    if(response==="OK")
                    {
                        <c:if test="${pageContext.response.locale=='ar'}">
                            window.location.href="/index?lang=ar";
                        </c:if>
                        <c:if test="${pageContext.response.locale!='ar'}">
                        window.location.href="/index?lang=fr";
                        </c:if>
                    }
                    else
                    {
                        Swal.fire({
                                title: 'ÉCHEC !',
                                text: "<spring:message code="label.lelienestexpire"/>",
                                icon: 'error',
                                confirmButtonColor: '#3085d6',
                                confirmButtonText: '<spring:message code="label.Oui"/> !'
                            }
                        ).then((result) => {
                            if (result.isConfirmed) {
                                window.location.href="/index"
                            }
                        })
                    }

                },
                error : function() {

                }
            });
    }

    $(document).on('click', '.toggle-password', function() {

        $(this).toggleClass("fa-eye fa-eye-slash");

        var input = $("#password_user");
        input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
    });

    $(document).on('click', '.toggle-password1', function() {

        $(this).toggleClass("fa-eye fa-eye-slash");

        var input = $("#password_confirm");
        input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
    });

    $('#modal_pass').modal('show');

    var myInput = document.getElementById ("password_user");
    var letter = document.getElementById ("letter");
    var capital = document.getElementById ("capital");
    var number = document.getElementById ("number");
    var length = document.getElementById ("length");
    var symbole = document.getElementById ("symbole");

    // When the user starts to type something inside the password field
    myInput.onkeyup = function () {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if (myInput.value.match (lowerCaseLetters)) {
            letter.classList.remove ("invalide");
            letter.classList.add ("valide");
        } else {
            letter.classList.remove ("valide");
            letter.classList.add ("invalide");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if (myInput.value.match (upperCaseLetters)) {
            capital.classList.remove ("invalide");
            capital.classList.add ("valide");
        } else {
            capital.classList.remove ("valide");
            capital.classList.add ("invalide");
        }

        // Validate numbers
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

        // Validate length
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
