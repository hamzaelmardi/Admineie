<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<script>
    $(function() {
        $( "#accordion" ).accordion({active: 0);
    });
</script>
<style>
    .contenedor {
        height: 100%;
        padding: 5% 0;
    }

    h1 {
        color: #FCFBFA;
    }

    .container_foto {
        background-color: rgba(60, 74, 160, 0.7);
        padding: 0;
        overflow: hidden;
        max-width: 350px;
        margin: 5px;
    }

    .container_foto article {
        padding: 10%;
        position: absolute;
        bottom: 0;
        z-index: 1;
        -webkit-transition: all 0.5s ease;
        -moz-transition: all 0.5s ease;
        -o-transition: all 0.5s ease;
        -ms-transition: all 0.5s ease;
        transition: all 0.5s ease;
    }

    .container_foto h2 {
        color: #fff;
        font-weight: 800;
        font-size: 25px;
        border-bottom: #fff solid 1px;
    }

    .container_foto h4 {
        font-weight: 300;
        color: #fff;
        font-size: 16px;
    }

    .container_foto img {
        width: 100%;
        opacity: 0.4;
        -webkit-transition: all 4s ease;
        -moz-transition: all 4s ease;
        -o-transition: all 4s ease;
        -ms-transition: all 4s ease;
        transition: all 4s ease;
    }

    .ver_mas {
        background-color: #FEB66C;
        position: absolute;
        width: 100%;
        height: 70px;
        bottom: 0;
        z-index: 1;
        opacity: 0;
        transform: translate(0px, 70px);
        -webkit-transform: translate(0px, 70px);
        -moz-transform: translate(0px, 70px);
        -o-transform: translate(0px, 70px);
        -ms-transform: translate(0px, 70px);
        -webkit-transition: all 0.2s ease-in-out;
        -moz-transition: all 0.2s ease-in-out;
        -o-transition: all 0.2s ease-in-out;
        -ms-transition: all 0.2s ease-in-out;
        transition: all 0.2s ease-in-out;
    }

    .ver_mas span {
        font-size: 40px;
        color: #fff;
        position: relative;
        margin: 0 auto;
        width: 100%;
        top: 13px;
    }


    /*hovers*/

    .container_foto:hover {
        cursor: pointer;
    }

    .container_foto:hover img {
        opacity: 0.1;
        transform: scale(1.5);
    }

    .container_foto:hover article {
        transform: translate(2px, -69px);
        -webkit-transform: translate(2px, -69px);
        -moz-transform: translate(2px, -69px);
        -o-transform: translate(2px, -69px);
        -ms-transform: translate(2px, -69px);
    }

    .container_foto:hover .ver_mas {
        transform: translate(0px, 0px);
        -webkit-transform: translate(0px, 0px);
        -moz-transform: translate(0px, 0px);
        -o-transform: translate(0px, 0px);
        -ms-transform: translate(0px, 0px);
        opacity: 1;
    }
    .box {
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px
    }

    .our-services {
        margin-top: 75px;
        padding-bottom: 30px;
        padding: 0 60px;
        min-height: 198px;
        text-align: center;
        border-radius: 10px;
        background-color: #fff;
        transition: all .4s ease-in-out;
        box-shadow: 0 0 25px 0 rgba(20, 27, 202, .17)
    }

    .our-services .icon {
        margin-bottom: -21px;
        transform: translateY(-50%);
        text-align: center
    }

    .our-services:hover h4,
    .our-services:hover p {
        color: #fff
    }

    .speedup:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #fb0054 0%, #f55b2a 100%)
    }

    .settings:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #34b5bf 0%, #210c59 100%)
    }

    .privacy:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #3615e7 0%, #44a2f6 100%)
    }

    .backups:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #fc6a0e 0%, #fdb642 100%)
    }

    .ssl:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #8d40fb 0%, #5a57fb 100%)
    }

    .database:hover {
        box-shadow: 0 0 25px 0 rgba(20, 27, 201, .05);
        cursor: pointer;
        background-image: linear-gradient(-45deg, #27b88d 0%, #22dd73 100%)
    }

    a:hover,a:focus{
        text-decoration: none;
        outline: none;
    }
    #accordion .panel{
        border: none;
        border-radius: 0;
        box-shadow: none;
        margin: 0 30px 5px;
        position: relative;
    }
    #accordion .panel:before,
    #accordion .panel:after{
        content: "";
        border-left: 25px solid #fff;
        border-top: 25px solid transparent;
        border-bottom: 25px solid transparent;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;
    }
    #accordion .panel:after{
        border-left: none;
        border-right: 25px solid #fff;
        left: auto;
        right: 0;
    }
    #accordion .panel-heading{
        padding: 0;
        position: relative;
    }
    #accordion .panel-title a{
        display: block;
        padding: 15px 60px 15px 40px;
        background: #137a91;
        font-size: 18px;
        font-weight: 700;
        letter-spacing: 1px;
        color: #fff;
        position: relative;
    }
    #accordion .panel-title a:before,
    #accordion .panel-title a.collapsed:before{
        content: "\f107";
        font-family: "Font Awesome 5 Free";
        font-weight: 900;
        font-size: 20px;
        color: #fff;
        position: absolute;
        top: 15px;
        right: 40px;
        transition: all 0.3s ease 0s;
    }
    #accordion .panel-title a.collapsed:before{
        content: "\f106";
        top: 12px;
    }
    #accordion .panel-body{
        padding: 10px 30px 0;
        border-top: none;
        font-size: 15px;
        color: #5c4f4f;
        line-height: 28px;
        letter-spacing: 0.5px;
    }
    .modal-dialog {
        max-width: 800px;
        margin: 30px auto;
    }



    .modal-body {
        position:relative;
        padding:0px;
    }
    .close {
        position:absolute;
        right:-30px;
        top:0;
        z-index:999;
        font-size:2rem;
        font-weight: normal;
        color:#fff;
        opacity:1;
    }
    .serviceBox{
        color: #fff;
        font-family: 'Poppins', sans-serif;
        text-align: center;
        padding: 25px 25px 55px;
        position: relative;
        z-index: 1;
        height:268px;
    }
    .serviceBox:before,
    .serviceBox:after{
        content: '';
        background: linear-gradient(#a64cef, #882FD5);
        border-radius: 20px;
        position: absolute;
        left: 10px;
        right: 0;
        top: 15px;
        bottom: 0;
        z-index: -1;
    }
    .serviceBox:after{
        background: #fff;
        left: 0;
        right: 10px;
        top: 0;
        bottom: 15px;
        clip-path: polygon(30% 0, 100% 0, 100% 85%, 75% 100%, 0 100%, 0 20%);
    }
    .serviceBox .service-icon{
        color: #882FD5;
        font-size: 35px;
        text-shadow: 4px 4px rgba(0,0,0,0.1);
        margin: 0 0 10px;
    }
    .serviceBox .title{
        color: #882FD5;
        font-size: 14px;
        font-weight: 400;
        text-transform: uppercase;
        margin: 0 0 10px;
    }
    .serviceBox .title span{ font-weight: 700; }
    .serviceBox .description{
        color: #888;
        font-size: 13px;
        line-height: 20px;
        letter-spacing: 0.5px;
        margin: 0;
        height:150px;
        overflow:auto;
    }
    .serviceBox .read-more{
        color: #fff;
        font-size: 22px;
        line-height: 22px;
        position: absolute;
        right: 15px;
        bottom: 9px;
        transition: all 0.3s ease 0s;
    }
    .serviceBox .read-more:hover{
        color: rgba(255,255,255,0.7);
        text-shadow: 3px 3px rgba(255,255,255,0.1);
    }
    .serviceBox.darkgreen:before{ background: linear-gradient(#00A28D, #007385); }
    .serviceBox.darkgreen .service-icon,
    .serviceBox.darkgreen .title{
        color: #007385;
    }
    .serviceBox.blue:before{ background: linear-gradient(#00BFE9, #0170DC); }
    .serviceBox.blue .service-icon,
    .serviceBox.blue .title{
        color: #0170DC;
    }
    .serviceBox.green:before{ background: linear-gradient(#93c916, #3AB447); }
    .serviceBox.green .service-icon,
    .serviceBox.green .title {
        color: #3AB447;
    }
    @media only screen and (max-width:990px){
        .serviceBox{ margin: 0 0 30px; }
    }
</style>
<div class="container-fluid contenedor text-center" style="margin-top: 10rem" id="lescard">
    <h1 class="text-center"></h1>
    <div class="row text-center justify-content-center">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto ">
                    <div class="ver_mas text-center">
                        <span  class="fa fa-eye" onclick="OpenAuto('lescard','autorisation')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='label.Autorisationdesdechets'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/Arb1.png">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                    <div class="ver_mas text-center">
                        <span id="click" class="fa fa-eye" onclick="OpenAuto('lescard','evaluation')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='label.Evaluationenvirementale'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/arbre2.png">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                    <div class="ver_mas text-center">
                        <span class="fa fa-eye" onclick="OpenAuto('lescard','generalite')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='label.Generalite'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/video.png" alt="">
                </div>
    </div>
    <div class="row text-center justify-content-center">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                    <div class="ver_mas text-center">
                        <span id="click" class="fa fa-eye" onclick="OpenAuto('lescard','Parametres')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='Button.Parametre'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/cogs.png"  >
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                    <div class="ver_mas text-center">
                        <span class="fa fa-eye" onclick="OpenAuto('lescard','Statistiques')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='Button.Statistique'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/statistics.png" >
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 container_foto">
                    <div class="ver_mas text-center">
                        <span class="fa fa-eye" onclick="OpenAuto('lescard','Audit')"></span>
                    </div>
                    <article class="text-left">
                        <h2><spring:message code='Button.Audit'/></h2>
                        <h4>Descripción corta de la imagen en cuestión</h4>
                    </article>
                    <img src="/assets/images/audit.png"   alt="">
                </div>

    </div>
</div>
<div class="container-fluid mb-5" style="display: none;margin-top: 13rem" id="autorisation">
    <div class="row justify-content-center mt-5">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('autorisation','lescard')"><i class="fa fa-arrow-left"></i><spring:message code='label.Retour'/> </button>
        </div>
        <div class="col-md-8 text-left">
            <h1 class="text-dark"><spring:message code='label.Autorisationdesdechets'/></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','ZF')">
                <div class="our-services settings">
                    <div class="icon"> <img src="https://i.imgur.com/6NKPrhO.png"> </div>
                    <h4>ZF</h4>
                    <p><spring:message code='label.Importationdesdechetsdunezonnefranche'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','ET')">
                <div class="our-services speedup">
                    <div class="icon"> <img src="https://i.imgur.com/KMbnpFF.png"> </div>
                    <h4>ET</h4>
                    <p><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','CT')">
                <div class="our-services privacy">
                    <div class="icon"> <img src="https://i.imgur.com/AgyneKA.png"> </div>
                    <h4>CT</h4>
                    <p><spring:message code='label.CollecteetTransport'/></p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','IT')">
                <div class="our-services backups">
                    <div class="icon"> <img src="https://i.imgur.com/vdH9LKi.png"> </div>
                    <h4>IT</h4>
                    <p><spring:message code='label.Installationdetraitementdesdechets'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','TR')">
                <div class="our-services ssl">
                    <div class="icon"> <img src="https://i.imgur.com/v6OnUqu.png"> </div>
                    <h4>TR</h4>
                    <p><spring:message code='label.TransitDesDechets'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('autorisation','XD')">
                <div class="our-services database">
                    <div class="icon"> <img src="https://i.imgur.com/VzjZw9M.png"> </div>
                    <h4>XD</h4>
                    <p><spring:message code='label.ExportationDesDechetsDangereux'/></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid mb-5" style="display: none;margin-top: 14rem" id="evaluation">
    <div class="row justify-content-center mt-5">
        <div class="col-md-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('evaluation','lescard')"><i class="fa fa-arrow-left"></i> <spring:message code='label.Retour'/></button>
        </div>
        <div class="col-md-8 text-left">
            <h1 class="text-dark"><spring:message code='label.Evaluationenvironnementale'/></h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('evaluation','EE')">
                <div class="our-services settings">
                    <div class="icon"> <img src="https://i.imgur.com/6NKPrhO.png"> </div>
                    <h4>EE</h4>
                    <p><spring:message code='label.Etudedimpactenviromentale'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('evaluation','NT')">
                <div class="our-services speedup">
                    <div class="icon"> <img src="https://i.imgur.com/KMbnpFF.png"> </div>
                    <h4>NT</h4>
                    <p><spring:message code='label.Noticedimpact'/></p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="box" onclick="OpenRetour('evaluation','AE')">
                <div class="our-services privacy">
                    <div class="icon"> <img src="https://i.imgur.com/AgyneKA.png"> </div>
                    <h4>AE</h4>
                    <p><spring:message code='label.AuditEnvironnemental'/></p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container mb-5" style="display: none;margin-top: 16rem" id="generalite">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('generalite','lescard')"><i class="fa fa-arrow-left"></i> Retour</button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-user-plus"></i></span>
                </div>
                <h3 class="title">Création de <span>Compte</span></h3>
                <p class="description"> Pour déposer vos demandes d'autorisation, il vous faut au préalable créer un compte pour plus detail vois le video suivant </p>
                <a type="button" data-toggle="modal" data-src="/assets/video/compte1.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox darkgreen">
                <div class="service-icon">
                    <span><i class="fa fa-key"></i></span>
                </div>
                <h3 class="title">droit  <span>d'accès</span></h3>
                <p class="description">Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Qui quaerat fugit quas vLorem ipsum dolor sit amet conse ctetur adipisicing elit.</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/doitdacces1.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox blue">
                <div class="service-icon">
                    <span><i class="fa fa-phone"></i></span>
                </div>
                <h3 class="title">Contacter  <span> le pétitionnaire</span></h3>
                <p class="description">Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Qui quaerat fugit quas veniam perferendis repudiandae sequi, dolore quisquam illum.</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/contacti.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox green">
                <div class="service-icon">
                    <span><i class="fa fa-question"></i></span>
                </div>
                <h3 class="title">Questions  <span>et réponses</span></h3>
                <p class="description">Lorem ipsum dolor sit amet conse ctetur adipisicing elit. Qui quaerat fugit quas veniam perferendis repudiandae sequi, dolore quisquam illum.</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/FAQ.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
</div>
<div class="container mb-5" style="display: none;margin-top: 16rem" id="Parametres">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('Parametres','lescard')"><i class="fa fa-arrow-left"></i><spring:message code='label.Retour'/> </button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Region'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">

                            <a type="button" data-toggle="modal"  data-src="/assets/video/region.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Membresdecomite'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">

                            <a type="button" data-toggle="modal"  data-src="/assets/video/membre.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.code'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/code.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Secteur'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/secteur.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Prefecture'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/Prefecture.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Commune'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/commune.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Categorie'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/categorie.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Documentparautorisation'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/documentparauto.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.ZonneFranche'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/ZoneFranche1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Pays'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Pays1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Transporteur'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/transporteur.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.MoyendeTransport'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/moyendetransport.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Lieudelimination'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/lieu1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.NatureActivite'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/nature1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Statutduprojet'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/region.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.renouvellement'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/Renouvellement.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Document'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/images/docu.webm" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-cogs" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Poste'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/poste1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-3 col-sm-6">

        </div>
        <div class="col-md-3 col-sm-6">

        </div>
    </div>

</div>
<div class="container mb-5" style="display: none;margin-top: 16rem" id="Statistiques">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('Statistiques','lescard')"><i class="fa fa-arrow-left"></i> Retour</button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Autorisation <span> des déchets</span></h3>
                <p class="description"> Nombre total des autorisations déchets par type </p>
                <a type="button" data-toggle="modal" data-src="/assets/video/autopartype.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox darkgreen">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Autorisation <span> des déchets</span></h3>
                <p class="description">Nombre totale des autorisations des déchets par statut</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/autoparstatut.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox blue">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description">Nombre de projets examinés par le CNEE par régions et par secteurs d'activités</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/aucun1.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox green">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description">Nombre de réunions et de projets examinés par mois</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/CNEI.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description"> Nombre d'études d'impact environnemental examinées par catégorie </p>
                <a type="button" data-toggle="modal" data-src="/assets/video/etude.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox darkgreen">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description">Nombre de Décisions d'Acceptabilités Environnementales</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/aucun2.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox blue">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description">Quantité estimée avec quantité réelle par mois</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/quantite.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="serviceBox green">
                <div class="service-icon">
                    <span><i class="fa fa-bar-chart"></i></span>
                </div>
                <h3 class="title">Evaluation <span> environnementale</span></h3>
                <p class="description">Montant d'investissement des projets examinés</p>
                <a type="button" data-toggle="modal" data-src="/assets/video/montant.mp4" data-target="#videoModal" class="read-more video-btn"><i class="far fa-arrow-alt-circle-right"></i></a>
            </div>
        </div>
    </div>

</div>
<div class="container mb-5" style="display: none;margin-top: 16rem" id="Audit">
    <div class="row">
        <div class="col-md-12">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('Audit','lescard')"><i class="fa fa-arrow-left"></i> Retour</button>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.Auditsysteme'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">

                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit1.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditImportationDesdechetsEnZoneFranche'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">

                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit2.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditImportationDesDechetsNonDangereuxDunpaysEtranger'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit3.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditExportationDesDechetsDangereux'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit4.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditTransitDesDechets'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit5.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditInstallationDeTraitementDesDechets'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit6.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditCollecteTransportDesDechets'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit7.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditRenseignementprealable'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit8.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditEtudedImpactsurlEnvironnement'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit9.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditNoticedImpactsurlEnvironnement'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"     data-src="/assets/video/Audit10.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                <div class="col-8 pb-3 text-info">
                    <h3    >${nbr_ZF}</h3>
                </div>
                <div class="col-4 pb-3 text-info">
                    <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                </div>

                <p class="  min_h"><spring:message code='label.AuditEnvironnemental'/></p>

                <div class="col-12  p-0 m-0">
                    <div class="row justify-content-end border-top border-success">
                        <div class="col-md-5 btn-sm-12 mt-3 p-0">
                            <a type="button" data-toggle="modal"  data-src="/assets/video/Audit11.mp4" data-target="#videoModal" class="read-more video-btn">Voir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">

        </div>
    </div>
</div>
<div class="container-fluid mb-5" style="display: none;margin-top: 14rem" id="auto">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-3 m-3">
            <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto('auto','lescard')"><i class="fa fa-arrow-left"></i> Retour</button>
        </div>
    </div>
    <div class="row justify-content-center mt-5">
            <div class="col-md-10">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                    </div>
                    <div class="panel panel-default">
                    </div>
                    <div class="panel panel-default">
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                            <h4 class="panel-title">
                                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    Comment traiter la commande
                                </a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                            <div class="panel-body" id="mesvideo">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<div class="container mb-5 mt-5" style="display: none;margin-top: 14rem" id="auto1">


        <div class="row mt-5">
            <div class="col-md-12">
                <button type="button" class="btn btn-sm btn-primary" onclick="OpenAuto1('auto1','lescard')"><i class="fa fa-arrow-left"></i> Retour</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 ">
                <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                    <div class="col-8 pb-3 text-info">
                        <h3    >${nbr_ZF}</h3>
                    </div>
                    <div class="col-4 pb-3 text-info">
                        <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                    </div>

                    <p class="  min_h"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/></p>

                    <div class="col-12  p-0 m-0">
                        <div class="row justify-content-end border-top border-success">
                            <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                <a href="/api/getListeAutorisation/ZF/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-md-6">
                <div class="row border-success border rounded rou  p-2 pl-4 pr-4 m-1">

                    <div class="col-8 pb-3 text-info">
                        <h3    >${nbr_ET}</h3>
                    </div>
                    <div class="col-4 pb-3 text-info">
                        <span class="f-40 fa fa-search" style="color:#1bc227;opacity: .4;"></span>
                    </div>

                    <p class="  min_h"><spring:message code='label.ImportationDesDechetsNonDangereuxDunpaysEtranger'/></p>


                    <div class="col-12 p-0 m-0">
                        <div class="row justify-content-end border-top border-success">
                            <div class="col-md-5 btn-sm-12 mt-3 p-0">
                                <a  href="/api/getListeAutorisation/ET/0/6/0" class="btn  btn-sms4"> <span class="fa fa-plus-circle"></span> <spring:message code='label.Detail'/> </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
<div class="modal fade mt-5" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content mt-5">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <!-- 16:9 aspect ratio -->
                <div class="embed-responsive embed-responsive-16by9">
                    <video autoplay loop class="embed-responsive-item" src="" id="video">
                        <source src="" type="video">
                    </video>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../includes/footer.jsp"/>
<script>
    function OpenRetour(card1,card2){
        $("#auto").removeClass().addClass("container-fluid mb-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getDocument(card2);
        getImage(card2);
        getVideo(card2);
    }
    function OpenRetour1(card1,card2){
        $("#auto1").removeClass().addClass("row mt-5 "+card2);
        $("#"+card1).hide();
        $("."+card2).show();
        getDocument(card2);
        getImage(card2);
        getVideo(card2);
    }
    function OpenAuto(card1,card2){
        $("#"+card1).hide();
        $("#"+card2).show();
    }
    function OpenAuto1(card1,card2){
        $("#"+card1).hide();
        $("#"+card2).show();
    }
    function getDocument(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionDocument/" + type,
            data: {},
            success: function (response) {
                $("#doc").html(response);
            },
            error: function () {

            }
        });
    }
    function getImage(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionImage/" + type,
            data: {},
            success: function (response) {
                $("#img").html(response);
            },
            error: function () {

            }
        });
    }
    function getVideo(type){
        $.ajax({

            type: "GET",
            enctype: 'multipart/form-data',
            url: "/getAccordionVideo/" + type,
            data: {},
            success: function (response) {
                $("#mesvideo").html(response);
            },
            error: function () {

            }
        });
    }



    $(document).ready(function() {

// Gets the video src from the data-src on each button

        var $videoSrc;
        $('.video-btn').click(function() {
            $videoSrc = $(this).data( "src" );
        });
        console.log($videoSrc);



// when the modal is opened autoplay it
        $('#videoModal').on('shown.bs.modal', function (e) {

// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
            $("#video").attr('src',$videoSrc + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0" );
        })



// stop playing the youtube video when I close the modal
        $('#videoModal').on('hide.bs.modal', function (e) {
            // a poor man's stop video
            $("#video").attr('src',$videoSrc);
        })






// document ready
    });

</script>
