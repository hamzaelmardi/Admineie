
<%@  taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>





<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="../../assets/js/jquery.js"></script>




</head>
<body style="direction: rtl;">
<%-- <div >
 <a href="javascript:void(0)" class="btn btn-download">Generate PDF</a>
</div>--%>
<div id="demo">
<div class="container p-0" id="block1" style="width: 1500px">
    <img src="../../assets/images/entete-lnesp-2.png" width="100%">
</div>
<div class="container p-0 mt-5 border border-dark" id="block2" style="width: 1500px;">
    <div class="text-center border border-dark">
        الترخيص باستيراد النفايات الخطرة الناتجة عن أنشطة مناطق التصدير الحرة
    </div>
    <div class="text-center border border-dark">
        المعلومات المتعلقة بالشركة
    </div>
    <div class="p-2">
        <div class=" row">
            <div class="col-3 text-right">اسم الشركة</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${userNotif.site_web}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">العنوان</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${userNotif.adresse}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">الهاتف / الفاكس</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${userNotif.fax}/${userNotif.fax}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">البريد الإلكتروني</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${userNotif.email}</div>
        </div>
    </div>


    <div class="text-center border border-dark">
        المعلومات الخاصة بالنفايات المستوردة
    </div>
    <div class="p-2">
        <div class=" row">
            <div class="col-3 text-right">اخطار رقم</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${notification.num_notification}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">النوع</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">
                <c:if test="${notification.type== 1}"> Type 1</c:if>
                <c:if test="${notification.type== 2}"> Type 2</c:if>
                <c:if test="${notification.type== 3}"> Type 3</c:if>
                <c:if test="${notification.type== 4}"> Type 4</c:if>
            </div>
        </div>
        <div class=" row">
            <div class="col-3 text-right" dir="rtl" >المصدر</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">
                <c:if test="${notification.source== 1}"> source 1  </c:if>
                <c:if test="${notification.source== 2}"> source 2  </c:if>
                <c:if test="${notification.source== 3}"> source 3 </c:if>
                <c:if test="${notification.source== 4}"> source 4  </c:if>
            </div>
        </div>
        <div class=" row">
            <div class="col-5 text-right">الرمز المصنف المغربي للنفايات</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">
                <c:if test="${notification.code== 1}"> code 1  </c:if>
                <c:if test="${notification.code== 2}"> code 2  </c:if>
                <c:if test="${notification.code== 3}"> code 3 </c:if>
                <c:if test="${notification.code== 4}"> code 4  </c:if>
            </div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">الكمية</div>
            <div class="col-1 text-right">:</div>
            <div class="col-7 text-right">${notification.quantite} ${notification.unite}</div>
        </div>
    </div>


    <div class="text-center border border-dark">
        المعلومات الخاصة بنقل النفايات
    </div>
    <div class="p-2">
        <div class=" row">
            <div class="col-4 text-right">اسم الشركة المكلفة بالنقل</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">
                <c:if test="${notification.entreprisetransport_id== 1}"> transport 1  </c:if>
                <c:if test="${notification.entreprisetransport_id== 2}"> transport 2  </c:if>
                <c:if test="${notification.entreprisetransport_id== 3}"> transport 3 </c:if>
                <c:if test="${notification.entreprisetransport_id== 4}"> transport 4  </c:if>
            </div>
        </div>
        <div class=" row">
            <div class="col-4 text-right">رقم الرخصة</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">
                <c:if test="${notification.entreprisetransport_id== 1}">Patente de transport 1</c:if>
                <c:if test="${notification.entreprisetransport_id== 2}">Patente de transport 2</c:if>
                <c:if test="${notification.entreprisetransport_id== 3}">Patente de transport 3</c:if>
                <c:if test="${notification.entreprisetransport_id== 4}">Patente de transport 4</c:if>
            </div>
        </div>
    </div>

    <div class="text-center border border-dark">
        المعلومات الخاصة بمنشأة  تثمين او معالجة النفايات
    </div>
    <div class="p-2">
        <div class=" row">
            <div class="col-3 text-right">اسم المنشاة</div>
            <div class="col-1 text-right">:</div>
            <div class="col-7 text-right">${entrepriseValOuTrait.nom_installation}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">العنوان</div>
            <div class="col-1 text-right">:</div>
            <div class="col-7 text-right">${entrepriseValOuTrait.adresse}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">الهاتف</div>
            <div class="col-1 text-right">:</div>
            <div class="col-7 text-right">${entrepriseValOuTrait.telephone}</div>
        </div>
        <div class=" row">
            <div class="col-3 text-right">رقم رخصة المنشاة</div>
            <div class="col-1 text-right">:</div>
            <div class="col-7 text-right">${entrepriseValOuTrait.num_patente}</div>
        </div>
        <div class=" row">
            <div class="col-2 text-right">تثمين</div>
            <div class="border border-dark" style="width: 25px;height: 25px">
                <c:if test="${notification.val_ou_trait=='valorisation'}">
                    <b style="padding: 5px !important;">X</b>
                </c:if>
            </div>
            <div class="col-2"></div>
            <div class="col-1 text-right">معالجة</div>
            <div class="border border-dark" style="width: 25px;height: 25px">
                <c:if test="${notification.val_ou_trait=='traitement'}">
                    <b style="padding: 5px !important;">X</b>
                </c:if>
            </div>
        </div>
    </div>

    <div class="text-center border border-dark">
        مقرر الترخيص
    </div>
    <div class="p-2">
        <div class=" row">
            <div class="col-4 text-right">يمنح الترخيص باستيراد النفايات</div>
            <div class="col-1 text-right">:</div>
            <div class="col-4 text-right"></div>
            <div class="col-1">
                <div class="border border-dark" style="width: 25px;height: 25px">
                    <c:if test="${notification.favorable=='favorable'}">
                        <b style="padding: 5px !important;">X</b>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row pt-2">
            <div class="col-4 text-right">رفض الترخيص باستيراد النفايات</div>
            <div class="col-1 text-right">:</div>
            <div class="col-4 text-right"></div>
            <div class="col-1">
                <div class="border border-dark" style="width: 25px;height: 25px">
                    <c:if test="${notification.favorable=='nonfavorable'}">
                        <b style="padding: 5px !important;">X</b>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="pt-2 row">
            <div class="col-4 text-right">تعليل الرفض</div>
            <div class="col-1 text-right">:</div>
            <div class="col-6 text-right">${notification.cause_favorable}</div>
        </div>
        <div class="row pt-3">
            <div class="col-9 text-right"> مدة صلاحية الترخيص من  <b>${notification.date_f}</b> إلى <b>${notification.date_d}</b> <br><br><strong>التوقيع</strong></div>
            <div class="col-2"><img src="../../assets/images/qr.png" width="100%" > </div>
        </div>


        <div class="mt-4"></div>
    </div>
</div>
</div>
</body>
    <script src="../../assets/js/html2pdf.bundle.min.js"></script>
    <script>
        let body = document.body
        let html = document.documentElement
        let height = Math.max(body.scrollHeight, body.offsetHeight,
            html.clientHeight, html.scrollHeight, html.offsetHeight)
        let heightCM = height / 50
        const options = {
            margin: 0.3,
            filename: 'autorisation.pdf',
            image: {
                type: 'jpeg',
                quality: 0.98
            },
            html2canvas: {
                scale: 2
            },
            jsPDF: {
                unit: 'in',
                format: 'a4',
                orientation: 'portrait',
                unit: 'cm',
                format: [heightCM, 28]
            }
        }

        var objstr = document.getElementById('block1').innerHTML;
        var objstr1 = document.getElementById('block2').innerHTML;

        var strr = '<html><head><title>Autorisation</title>';
        strr += '</head><body  style="direction: rtl !important;">';
        strr += '<div style="border:0.1rem solid #ccc!important;padding:0.5rem 1.5rem 0.5rem 1.5rem;margin-top:1.5rem">'+objstr+'</div>';
        strr += '<div style="border:0.1rem solid #ccc!important;padding:0.5rem 1.5rem 0.5rem 1.5rem;margin-top:1.5rem">'+objstr1+'</div>';
        strr += '</body></html>';


        $( document ).ready(function() {
            var element = document.getElementById('demo');
            //html2pdf().from(element).set(options).save();
            //html2pdf(element);
            html2pdf().from(strr).set(options).save();;
        });

        /*$('.btn-download').click(function(e){
            e.preventDefault();
            var element = document.getElementById('demo');
            //html2pdf().from(element).set(options).save();
            //html2pdf(element);
            html2pdf().from(strr).set(options).save();
        });*/
    </script>


</html>

