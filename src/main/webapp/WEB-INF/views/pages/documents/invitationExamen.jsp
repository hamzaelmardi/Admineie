
<%@  taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>Invitation Examen</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="../../assets/js/jquery.js"></script>
</head>
<body style="direction: rtl;
             text-align: right;
             /*font-family: Arial;*/
             font-size: 25px;">

    <div class="container p-0 mt-5 border border-dark" style="width: 1000px; border-style: dashed !important;">

        <div class="container" style="width: 100%">
            <img src="https://labo.environnement.gov.ma/img/entete-lnesp-2.png" width="100%">
        </div>

        <br>

        <div class="d-flex justify-content-center">
            <h2 class="col-6 text-center">إلـــى</h2>
        </div>
        <div class="d-flex justify-content-center">
            <h2 class="col-6 text-center">
                ${destinataire}
            </h2>
        </div>

        <br><br>

        <div class="d-flex justify-content-center">
            <p class="col-10">
                <b><u>الموضوع:</u></b>
                انعقاد اجتماع اللجنة الوطنية لدراسات التأثير على البيئة.
            </p>
        </div>
        <div class="d-flex justify-content-center">
            <p class="col-10">
                <b><u>المرفقات:</u></b>
                دراسة التأثير على البيئة.
            </p>
        </div>

        <div class="d-flex justify-content-center">
            <p class="col-8 text-center">
                سلام تام بوجود مولانا الإمام، وبعد،
            </p>
        </div>
        <br>


        <div class="d-flex justify-content-center">
            <p class="col-10 d-flex justify-content-center">
                طبقا لمقتضيات القانون 12.03 المتعلق بدراسات التأثير على البيئة ومرسومه التطبيقي رقم
                2.04.563 المتعلق باختصاصات وسير اللجنة الوطنية واللجان الجهوية لدراسات التأثير
                على البيئة خاصة المادة 8، يشرفني أن أدعوكم لإرسال من يمثلــكم في أشغال
                 اللجنـــة الوطنية التــي ستعــقد اجتمــاعـــا يوم ${destinataire} بمقر هذه الوزارة.
            </p>
        </div>
        <br>

        <br>
        <div class="d-flex justify-content-center">
            <p class="col-10">
                     ${iddemande}  ويتضمن جدول أعمال هذا الاجتماع دراسة المشروع التالي:
            </p>
        </div>

        <br><br><br>
        <div class="d-flex justify-content-center">
            <p class="col-8">
                وتفضلوا بقبول خالص التحيات والسلام.
            </p>
        </div>

        <br><br><br><br><br>
    </div>

</body>
</html>

