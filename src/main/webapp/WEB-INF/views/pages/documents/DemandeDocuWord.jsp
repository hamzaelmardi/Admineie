
<%@  taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>decision 2020</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="../../assets/js/jquery.js"></script>
</head>
<body
<%--        onload="window.print()"--%>
        style="direction: rtl;
             text-align: right;
             font-size: 25px;">

    <div class="container p-0 mt-5 border border-dark" style="width: 1000px; border-style: dashed !important;">

        <div class="container" style="width: 100%">
            <img src="https://labo.environnement.gov.ma/img/entete-lnesp-2.png" width="100%">
        </div>

        <br>

        <div class="d-flex justify-content-center">
            <p class="col-10">
                <b>قرار رقم : </b>
                <span><b>${demande.num_demande}</b></span>
            </p>
        </div>

        <div class="text-center">
            <h2>قرار الموافقة البيئية</h2>
            <h3>قطاع البيئة</h3>
            <br>
        </div>

        <div class="d-flex justify-content-center">
            <p class="col-10">
                بناء على القانون رقم 12.03 المتعلق بدراسات التأثير
                على البيئة الصادر بتنفيذه الظهير الشريف رقم 1.03.60
                الصادر في 10 ربيع الأول 1424 (12 ماي 2003) لاسيما المواد 1 و2 و7 و19 منه؛
            </p>
        </div>
        <br>
        <div class="d-flex justify-content-center">
            <p class="col-10">
                وعلى المرسوم رقم 2.04.563 الصادر بتاريخ
                5 ذو القعدة 1429 (4 نونبر 2008) المتعلق باختصاصات
                وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير على البيئة؛
            </p>
        </div>

        <br>
        <div class="d-flex justify-content-center">
            <p class="col-10">
                وعلى المرسـوم رقم 2.14.758 الصادر في 30 صفر 1436
                (23 دجنبر 2014) في شأن تحديد اختصاصات
                وتنظيم الوزارة المنتدبة المكلفة بالبيئة؛
            </p>
        </div>

        <br>
        <div class="d-flex justify-content-center">
            <div class="col-10">
                <p>
                وعلى رأي اللجنة الوطنية لدراسات التأثير على
                    البيئة خلال الاجتماع المنعقد بتاريخ
                </p>
                <p><b>${reunion.date_reunion }</b> ؛</p>
            </div>
        </div>

        <h3 class="text-center">قرر ما يلي :</h3>
        <br>

        <div class="d-flex justify-content-center">
            <div class="col-10">
                <p>
                    <b><u>المادة 1 :</u></b>
                    تمنح الموافقة البيئية لمشروع
                    <span>${demande.num_demande}</span>
                </p>
            </div>

        </div>

        <div class="d-flex justify-content-center">
            <p class="col-10">
                <b><u>المادة 2 :</u></b>
                يلتزم صاحب المشروع باحترام خلاصات دراسة
                التأثير على البيئة وبنود كناش التحملات المرفق بهذا القرار.
            </p>
        </div>

        <div class="d-flex justify-content-center">
            <p class="col-10">
                <b><u>المادة 3 :</u></b>
                تعتبر هذه الموافقة البيئية لاغية إذا لم يتم إنجاز المشروع خلال
                أجل خمس سنوات ابتداء من تاريخ الحصول عليها.
            </p>
        </div>


        <br><br><br><br><br><br><br>
    </div>

</body>
</html>

