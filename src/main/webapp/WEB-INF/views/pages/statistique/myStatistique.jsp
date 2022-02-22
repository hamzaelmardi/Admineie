
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
<style>
    .demo{ background-color: #C0CBCF; }
    .counter{
        color: #666;
        background-color: #fff;
        font-family: 'Amaranth', sans-serif;
        text-align: center;
        width: 340px;
        margin: 12px auto 15px;
        border: 1px solid #fff;
        box-shadow: 10px 10px 6px -6px rgba(0, 0, 0, 0.2);
    }
    .counter h3{
        color: #fff;
        background: linear-gradient(to left,#FC4D7E,#FA214B);
        font-size: 20px;
        font-weight: 600;
        letter-spacing: 1px;
        text-transform: capitalize;
        width: 90%;
        padding: 15px 17px;
        margin: -12px 0 17px -12px;
        border-radius: 0 0 30px 0;
        box-shadow: 4px 4px 4px rgba(0,0,0,0.2);
        position: relative;
        z-index: 1;
    }
    .counter h3:before,
    .counter h3:after{
        content: "";
        background: linear-gradient(to left bottom, #666 49%, transparent 50%);
        width: 11px;
        height: 11px;
        position: absolute;
        bottom: -11px;
        left: 0;
        z-index: -1;
        transition: all 0.3s ease 0s;
    }
    .counter h3:after{
        transform: rotate(180deg);
        left: auto;
        right: -11px;
        bottom: auto;
        top: 0;
    }
    .counter .counter-value{
        font-size: 32px;
        font-weight: 600;
        margin: 0 0 15px;
        display: block;
    }
    .counter .counter-icon{
        color: #fff;
        background: linear-gradient(to left,#FC4D7E,#FA214B);
        font-size: 35px;
        line-height: 70px;
        width: 75px;
        height: 70px;
        margin: 0 auto -15px;
        border-radius: 20px 20px 0 0;
        position: relative;
        z-index: 1;
        padding: 18px 0px 0px 11px;
        transition: all 0.3s ease 0s;
    }
    .counter .counter-icon i{ transition: all 0.3s ease 0s; }
    .counter:hover .counter-icon i{
        text-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
        transform: rotateY(360deg);
    }
    .counter .counter-icon:before,
    .counter .counter-icon:after{
        content: "";
        background: linear-gradient(to left bottom, #666 49%,transparent 50%);
        width: 14px;
        height: 14px;
        position: absolute;
        bottom: 0px;
        left: -14px;
        z-index: -1;
        transition: all 0.3s ease 0s;
    }
    .counter .counter-icon:after{
        transform: rotateY(180deg);
        left: auto;
        right: -14px;
    }
    .counter.blue h3,
    .counter.blue .counter-icon{
        background: linear-gradient(to left,#01C3FE,#0A8CE4);
    }
    .counter.purple h3,
    .counter.purple .counter-icon{
        background: linear-gradient(to left,#CA7EDA,#923CC3);
    }
    .counter.yellow h3,
    .counter.yellow .counter-icon{
        background: linear-gradient(to left,#206c45, #47e793);
    }
    @media screen and (max-width:990px){
        .counter{ margin-bottom: 60px; }
    }
</style>
<div class="container-fluid" style="margin-top: 14rem;">
    <div class="row">
        <div class="col-md-3 col-sm-6">
            <div class="counter">
                <h3><spring:message code='label.Autorisationsdesdechets'/></h3>
                <span class="counter-value">${nbr_notif}</span>
                <div class="counter-icon">
                    <i class="fa fa-recycle"></i>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="counter blue">
                <h3><spring:message code='label.CollecteETTransportDesDEchets'/></h3>
                <span class="counter-value">${nbr_CT}</span>
                <div class="counter-icon">
                    <img src="${pageContext.request.contextPath}/assets/images/truck.png" width="30" />
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="counter yellow">
                <h3><spring:message code='label.Installationdetraitementdesdechets'/></h3>
                <span class="counter-value">${nbr_INST}</span>
                <div class="counter-icon">
                    <i class="fa fa-trash-restore"></i>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-6">
            <div class="counter purple">
                <h3><spring:message code='label.Evaluationenvironnementale'/></h3>
                <span class="counter-value">${nbr_EE}</span>
                <div class="counter-icon">
                    <i class="fa fa-tree"></i>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../../includes/footer.jsp" />
<script>
    $(document).ready(function(){
        $('.counter-value').each(function(){
            $(this).prop('Counter',0).animate({
                Counter: $(this).text()
            },{
                duration: 3500,
                easing: 'swing',
                step: function (now){
                    $(this).text(Math.ceil(now));
                }
            });
        });
    });
</script>