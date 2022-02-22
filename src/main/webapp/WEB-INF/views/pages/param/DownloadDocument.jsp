
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">
    <div class="row">
        <!-- task, page, download counter  start -->
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-4 col-md-4">
                            <ul class="menu-items">
                                <li class="compose mb-3">
                                    <button class="btn btn-primary btn-block"><spring:message code="label.Modelesdisponibles"/> </button>
                                </li>
                                <li class="bg_hover rounded active mt-2 mb-2">
                                    <a id="model1" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file01',this)"><i class="mdi mdi-file-outline"></i>
                                        استيراد المخلفات (منطقة حرة)</a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model2" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file04',this)"><i class="mdi mdi-file-outline"></i> جمع / نقل النفايات الخطرة</a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model3" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file02',this)"><i class="mdi mdi-file-outline"></i> استيراد مخلفات غير خطرة من دولة أجنبية </a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model5" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file03',this)"><i class="mdi mdi-file-outline"></i> منشأة معالجة النفايات </a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model9" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file06',this)"><i class="mdi mdi-file-outline"></i> تصدير المخلفات الخطرة </a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model10" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file07',this)"><i class="mdi mdi-file-outline"></i> عبور النفايات </a>
                                </li>
                                <li class="bg_hover rounded mt-2 mb-2">
                                    <a id="model11" class="modelchoisi f-16 l_height_2" onclick="fun_affiche2('#file08',this)"><i class="mdi mdi-file-outline"></i> دراسة الأثر البيئي (EIE) </a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-sm-8 col-md-8">
                            <div class="row zone_tab" id="file01">
                                <h4>
                                    استيراد المخلفات (منطقة حرة)</h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoZF" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo" id="logo" value="${doc.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                         <spring:message code="label.Titre"/>   :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="title">${doc.title}
                                                                                </textarea>
                                        <input type="hidden" value="" id="bak_01t">
                                        <div id="z_btn0t">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#title','#z_btn1t','#z_btn0t')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn1t" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#title','#z_btn0t','#z_btn1t',$('#title').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_01t','#title')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zf1">${doc.p1} </textarea>
                                        <input type="hidden" value="" id="bak_02">
                                        <div id="z_btn2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf1','#z_btn3','#z_btn2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf1','#z_btn2','#z_btn3',$('#zf1').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_02','#zf1')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group col-12 mt-5 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf_4" value="${doc.nomSociete}">
                                            <input type="hidden" value="" id="bak__05">
                                            <div id="z__btn9">
                                                <button class="btn btn-primary float-right" onclick="change_text('#zf_4','#z__btn10','#z__btn9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z__btn10" class="collapse">
                                                <button class="btn btn-primary float-right " onclick="disable_text('#zf_4','#z__btn9','#z__btn10',$('#zf_4').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__05','#zf_4')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf_2" value="${doc.adresse}" >
                                            <input type="hidden" value="" id="bak__06">
                                            <div id="zz_btn9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf_2','#zz_btn10','#zz_btn9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="zz_btn10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf_2','#z_btn9','#zz_btn10',$('#zf_2').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__06','#zf_2')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf__5" value="${doc.tel}" >
                                            <input type="hidden" value="" id="bak__07">
                                            <div id="z_bbtn9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf__5','#z_bbtn10','#z_bbtn9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_bbtn10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf__5','#z_bbtn9','#z_bbtn10',$('#zf__5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__07','#zf__5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 ">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf_6" value="${doc.email}" >
                                            <input type="hidden" value="" id="bak__08">
                                            <div id="z_bttn9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf_6','#z_bttn10','#z_bttn9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_bttn10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf_6','#z_bttn9','#z_bttn10',$('#zf_6').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__08','#zf_6')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zf3">
                                            ${doc.p3} </textarea>
                                        <input type="hidden" value="" id="bak_04">
                                        <div id="z_btn6">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf3','#z_btn7','#z_btn6')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn7" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf3','#z_btn6','#z_btn7',$('#zf3').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_04','#zf3')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group col-12 mt-5 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf4" value="${doc.numero}">
                                            <input type="hidden" value="" id="bak_0zz5">
                                            <div id="z_btn91">
                                                <button class="btn btn-primary float-right" onclick="change_text('#zf4','#z_btn101','#z_btn91')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn101" class="collapse">
                                                <button class="btn btn-primary float-right " onclick="disable_text('#zf4','#z_btn91','#z_btn101',$('#zf4').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0zz5','#zf4')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf5" value="${doc.type}" >
                                            <input type="hidden" value="" id="bak_0ee5">
                                            <div id="z_btn92">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf5','#z_btn102','#z_btn92')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn102" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf5','#z_btn92','#z_btn102',$('#zf5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0ee5','#zf5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf_5" value="${doc.code}" >
                                            <input type="hidden" value="" id="bak_0ffc5">
                                            <div id="z_btn93">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf_5','#z_btn103','#z_btn93')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn103" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf_5','#z_btn93','#z_btn103',$('#zf_5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0ffc5','#zf_5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 ">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf6" value="${doc.source}" >
                                            <input type="hidden" value="" id="bak_0rre5">
                                            <div id="z_btn94">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf6','#z_btn104','#z_btn94')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn104" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf6','#z_btn94','#z_btn104',$('#zf6').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0rre5','#zf6')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 mb-3 ">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zf7" value="${doc.quantite}" >
                                            <input type="hidden" value="" id="bak_0bb5">
                                            <div id="z_btn9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf7','#z_btn10','#z_btn9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf7','#z_btn9','#z_btn10',$('#zf7').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0bb5','#zf7')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zf8">${doc.p6}
                                       </textarea>
                                        <input type="hidden" value="" id="bak_06">
                                        <div id="z_btn11">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf8','#z_btn12','#z_btn11')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn12" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf8','#z_btn11','#z_btn12',$('#zf8').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_06','#zf8')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right" disabled id="zf9" value="${doc.nomtr}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_0er7">
                                            <div id="z_btn135">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf9','#z_btn145','#z_btn135')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn145" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf9','#z_btn135','#z_btn145',$('#zf9').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0er7','#zf9')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right" disabled id="zf10" value=" ${doc.pattente}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_0ty7">
                                            <div id="z_btn13">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf10','#z_btn14','#z_btn13')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn14" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf10','#z_btn13','#z_btn14',$('#zf10').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0ty7','#zf10')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zf21" value=" ${doc.tatmin}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_21">
                                        <div id="z_btn13z">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf21','#z_btn14z','#z_btn13z')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14z" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf21','#z_btn13z','#z_btn14z',$('#zf21').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_21z','#zf21')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zf22" value=" ${doc.mo3alaja}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_22">
                                        <div id="z_btn13g">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf22','#z_btn14g','#z_btn13g')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14g" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf22','#z_btn13g','#z_btn14g',$('#zf22').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_22','#zf22')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zf23" value=" ${doc.stAccepte}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_23">
                                        <div id="z_btn13zf">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf23','#z_btn14zf','#z_btn13zf')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14zf" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf23','#z_btn13zf','#z_btn14zf',$('#zf23').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_23','#zf23')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zf24" value=" ${doc.stRefuse}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_24">
                                        <div id="z_btn13gz">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf24','#z_btn14gz','#z_btn13gz')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14gz" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf24','#z_btn13gz','#z_btn14gz',$('#zf24').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_24','#zf22')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zf11">${doc.p8}

                                        </textarea>
                                        <input type="hidden" value="" id="bak_09">
                                        <div id="z_btn17">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf11','#z_btn18','#z_btn17')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn18" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf11','#z_btn17','#z_btn18',$('#zf11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_09','#zf11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right " rows="1" disabled id="zf12" value="${doc.nom}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_08hh">
                                            <div id="z_btn156">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf12','#z_btn166','#z_btn156')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn166" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf12','#z_btn156','#z_btn166',$('#zf12').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_08hh','#zf12')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input class="form-control text-right " disabled id="zf13" value="${doc.tel}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_08xx">
                                            <div id="z_btn157">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf13','#z_btn167','#z_btn157')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn167" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf13','#z_btn157','#z_btn167',$('#zf13').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_08xx','#zf13')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input class="form-control text-right " disabled id="zf14" value="${doc.adresse}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_08ss">
                                            <div id="z_btn158">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf14','#z_btn168','#z_btn158')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn168" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf14','#z_btn158','#z_btn168',$('#zf14').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_08ss','#zf14')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right"  disabled id="zf15" value="${doc.pattente}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_08dd">
                                            <div id="z_btn159">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf15','#z_btn169','#z_btn159')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn169" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf15','#z_btn159','#z_btn169',$('#zf15').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_08dd','#zf15')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right"  disabled id="zf16" value="${doc.type}">
                                            <input type="hidden" value="" id="bak_08vv">
                                            <div id="z_btn1005">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf16','#z_btn1006','#z_btn1005')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn1006" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf16','#z_btn1005','#z_btn1006',$('#zf16').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_08vv','#zf16')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zf17">${doc.p10}</textarea>
                                        <input type="hidden" value="" id="bak_10">
                                        <div id="z_btn19">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zf17','#z_btn20','#z_btn19')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn20" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf17','#z_btn19','#z_btn20',$('#zf17').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_10','#zf17')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input type="text" class="form-control text-right "  disabled id="zf18" value="${doc.comment}">
                                            <input type="hidden" value="" id="bak_11">
                                            <div id="z_btn21">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf18','#z_btn22','#z_btn21')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn22" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf18','#z_btn21','#z_btn22',$('#zf18').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_11','#zf18')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right " rows="1" disabled id="zf19" value=" ${doc.temps}">
                                            <input type="hidden" value="" id="bak_12">
                                            <div id="z_btn23">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf19','#z_btn24','#z_btn23')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn24" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf19','#z_btn23','#z_btn24',$('#zf19').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_12','#zf19')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right " disabled id="zf20" value="${doc.ila}">
                                            <input type="hidden" value="" id="bak_13">
                                            <div id="z_btn25">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zf20','#z_btn26','#z_btn25')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn26" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#zf20','#z_btn25','#z_btn26',$('#zf20').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_13','#zf20')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right " disabled id="signe" value="${doc.signe}">
                                            <input type="hidden" value="" id="bak_13z">
                                            <div id="z_btn25z">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#signe','#z_btn26z','#z_btn25z')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn26z" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text('#signe','#z_btn25z','#z_btn26z',$('#signe').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_13z','#signe')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- <div class="row">
                                         <div class="col-4">
                                             <a href="/api/downloadDocumentImportDechet" class="btn btn-primary m-1 btn-block"><span class="fa fa-download text-success"></span> Télécharger</a>
                                         </div>
                                    <%-- <div class="col-4">
                                             <button class="btn btn-primary m-1 btn-block" onclick="AddDocument()"> Ajouter</button>
                                         </div>
                                    </div>--%>

                                </div>
                            </div>
                            <div class="row zone_tab collapse" id="file02">
                                <h4> استيراد مخلفات غير خطرة من دولة أجنبية
                                </h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoET" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo2"  id="logo2" value="${doc2.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt2">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Titre"/> :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="titlen">${doc2.title}
                                        </textarea>
                                        <input type="hidden" value="" id="bak_081n">
                                        <div id="z_btn__0n">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#titlen','#z_btn__1n','#z_btn__0n')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__1n" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#titlen','#z_btn__0n','#z_btn__1n',$('#titlen').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_081n','#titlen')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="titre_dechet">${doc2.titre}
                                        </textarea>
                                        <input type="hidden" value="" id="bak_081">
                                        <div id="z_btn__0">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#titre_dechet','#z_btn__1','#z_btn__0')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__1" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#titre_dechet','#z_btn__0','#z_btn__1',$('#titre_dechet').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_081','#titre_dechet')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zfnd1">${doc2.p1} </textarea>
                                        <input type="hidden" value="" id="bak_082">
                                        <div id="z_btn__2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd1','#z_btn__3','#z_btn__2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd1','#z_btn__2','#z_btn__3',$('#zfnd1').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_082','#zfnd1')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group col-12 mt-5 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd_4" value="${doc2.nomSociete}">
                                            <input type="hidden" value="" id="bak__085">
                                            <div id="z__btn09">
                                                <button class="btn btn-primary float-right" onclick="change_text('#zfnd4','#z__btn010','#z__btn09')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z__btn010" class="collapse">
                                                <button class="btn btn-primary float-right " onclick="disable_text2('#zfnd4','#z__btn09','#z__btn010',$('#zfnd_4').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__085','#zfnd4')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd_2" value="${doc2.adresse}" >
                                            <input type="hidden" value="" id="bak__086">
                                            <div id="zz_btn__9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd_2','#zz_btn__10','#zz_btn__9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="zz_btn__10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd_2','#z_btn__9','#zz_btn__10',$('#zfnd_2').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__086','#zfnd_2')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd__5" value="${doc2.tel}" >
                                            <input type="hidden" value="" id="bak__017">
                                            <div id="z_bbtn90">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd__5','#z_bbtn100','#z_bbtn90')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_bbtn100" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd__5','#z_bbtn90','#z_bbtn100',$('#zfnd__5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__017','#zfnd__5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 ">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd_6" value="${doc2.email}" >
                                            <input type="hidden" value="" id="bak__018">
                                            <div id="z_bt0tn9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd_6','#z_bt0tn10','#z_bt0n__9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_bt0tn10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd_6','#z_bt0tn9','#z_bt0tn10',$('#zfnd_6').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak__018','#zfnd_6')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zfnd3">
                                            ${doc.p3} </textarea>
                                        <input type="hidden" value="" id="bak_704">
                                        <div id="z_btn__6">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd3','#z_btn__7','#z_btn__6')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__7" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd3','#z_btn__6','#z_btn__7',$('#zfnd3').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_704','#zfnd3')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group col-12 mt-5 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd4" value="${doc2.numero}">
                                            <input type="hidden" value="" id="bak_605">
                                            <div id="z_btn0__9">
                                                <button class="btn btn-primary float-right" onclick="change_text('#zfnd4','#z_btn0__10','#z_btn0__9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn0__10" class="collapse">
                                                <button class="btn btn-primary float-right " onclick="disable_text2('#zfnd4','#z_btn0__9','#z_btn0__10',$('#zfnd4').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_605','#zfnd4')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd5" value="${doc2.type}" >
                                            <input type="hidden" value="" id="bak_405">
                                            <div id="z_btn__90">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd5','#z_btn__100','#z_btn__90')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__100" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd5','#z_btn__90','#z_btn__100',$('#zfnd5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_405','#zfnd5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd_5" value="${doc2.code}" >
                                            <input type="hidden" value="" id="bak_305">
                                            <div id="z0_btn__9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd_5','#z0_btn__10','#z0_btn__9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z0_btn__10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd_5','#z0_btn__9','#z0_btn__10',$('#zfnd_5').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_305','#zfnd_5')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 ">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd6" value="${doc2.source}" >
                                            <input type="hidden" value="" id="bak_105">
                                            <div id="z_0btn__9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd6','#z_0btn__10','#z_0btn__9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_0btn__10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd6','#z_0btn__9','#z_0btn__10',$('#zfnd6').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_105','#zfnd6')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group col-12 pb-4 mb-3">
                                            <label>

                                            </label>
                                            <input class="form-control text-right float-right "  disabled id="zfnd7" value="${doc2.quantite}" >
                                            <input type="hidden" value="" id="bak_0005">
                                            <div id="z_btn_0_9">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd7','#z_btn_0_10','#z_btn_0_9')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn_0_10" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd7','#z_btn_0_9','#z_btn_0_10',$('#zfnd7').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0005','#zfnd7')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zfnd8">${doc2.p6}
                                        </textarea>
                                        <input type="hidden" value="" id="bak_0016">
                                        <div id="z_btn__11">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd8','#z_btn__12','#z_btn__11')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__12" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd8','#z_btn__11','#z_btn__12',$('#zfnd8').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0016','#zfnd8')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right" disabled id="zfnd9" value="${doc2.nomtr}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_0017">
                                            <div id="z_btn__103">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd9','#z_btn__104','#z_btn__103')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__104" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd9','#z_btn__103','#z_btn__104',$('#zfnd9').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0017','#zfnd9')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right" disabled id="zfnd10" value=" ${doc2.pattente}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_107">
                                            <div id="z_bt0n__13">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd10','#z_bt0n__14','#z_bt0n__13')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_bt0n__14" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd10','#z_bt0n__13','#z_bt0n__14',$('#zfnd10').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_107','#zfnd10')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zfn21" value=" ${doc2.tatmin}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_21c">
                                        <div id="z_btn13zc">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfn21','#z_btn14zc','#z_btn13zc')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14zc" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfn21','#z_btn13zc','#z_btn14zc',$('#zfn21').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_21zc','#zfn21')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zfn22" value=" ${doc2.mo3alaja}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_22n">
                                        <div id="z_btn13gh">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfn22','#z_btn14gh','#z_btn13gh')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14gh" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfn22','#z_btn13gh','#z_btn14gh',$('#zfn22').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_22n','#zfn22')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zfn23" value=" ${doc2.stAccepte}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_23h">
                                        <div id="z_btn13zfn">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfn23','#z_btn14zfn','#z_btn13zfn')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14zfn" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfn23','#z_btn13zfn','#z_btn14zfn',$('#zfn23').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_23h','#zfn23')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4 col-12">
                                        <label>

                                        </label>
                                        <input class="form-control text-right" disabled id="zfn24" value=" ${doc2.stRefuse}">
                                        <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_24n">
                                        <div id="z_btn13gzn">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfn24','#z_btn14gzn','#z_btn13gzn')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn14gzn" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfn24','#z_btn13gzn','#z_btn14gzn',$('#zfn24').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_24n','#zfn22')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zfnd11">${doc2.p8}

                                        </textarea>
                                        <input type="hidden" value="" id="bak_1019">
                                        <div id="z_btn__17">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd11','#z_btn__18','#z_btn__17')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__18" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd11','#z_btn__17','#z_btn__18',$('#zfnd11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_1019','#zfnd11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input class="form-control text-right " rows="1" disabled id="zfnd12" value="${doc2.nom}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_308">
                                            <div id="z0_btn__15">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd12','#z0_btn__16','#z0_btn__15')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z0_btn__16" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd12','#z0_btn__15','#z0_btn__16',$('#zfnd12').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_308','#zfnd12')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input class="form-control text-right " disabled id="zfnd13" value="${doc2.tel}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_408">
                                            <div id="z_btn__015">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd13','#z_btn__016','#z_btn__015')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__016" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd13','#z_btn__015','#z_btn__016',$('#zfnd13').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_408','#zfnd13')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input class="form-control text-right " disabled id="zfnd14" value="${doc2.adresse}">
                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_508">
                                            <div id="z_b0tn__15">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd14','#z_b0tn__16','#z_b0tn__15')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_b0tn__16" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd14','#z_b0tn__15','#z_b0tn__16',$('#zfnd14').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_508','#zfnd14')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right"  disabled id="zfnd15" value="${doc2.pattente}">

                                            <input type="hidden" value="الاحتياطات الواجب اتخاذها " id="bak_608">
                                            <div id="z_btn_0_15">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd15','#z_btn_0_16','#z_btn_0_15')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn_0_16" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd15','#z_btn_0_15','#z_btn_0_16',$('#zfnd15').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_608','#zfnd15')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right"  disabled id="zfnd16" value="${doc2.type}">
                                            <input type="hidden" value="" id="bak_908">
                                            <div id="z_btn__15">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd16','#z_btn__16','#z_btn__15')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__16" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd16','#z_btn__15','#z_btn__16',$('#zfnd16').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_908','#zfnd16')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/>
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="zfnd17">${doc2.p10}</textarea>
                                        <input type="hidden" value="" id="bak_1110">
                                        <div id="z_btn__19">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd17','#z_btn__20','#z_btn__19')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn__20" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd17','#z_btn__19','#z_btn__20',$('#zfnd17').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_1110','#zfnd17')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="bg-light border-radius-5 mt-5 row">
                                        <div class="form-group pb-4 col-12">
                                            <label>
                                                <spring:message code="label.Paragraphe"/>
                                            </label>
                                            <input type="text" class="form-control text-right "  disabled id="zfnd18" value="${doc2.comment}">
                                            <input type="hidden" value="" id="bak_1010">
                                            <div id="z_btn__21">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd18','#z_btn__22','#z_btn__21')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__22" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd18','#z_btn__21','#z_btn__22',$('#zfnd18').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_1010','#zfnd18')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <input type="text" class="form-control text-right " rows="1" disabled id="zfnd19" value=" ${doc2.temps}">
                                            <input type="hidden" value="" id="bak_1020">
                                            <div id="z_btn__23">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd19','#z_btn__24','#z_btn__23')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__24" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd19','#z_btn__23','#z_btn__24',$('#zfnd19').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_1020','#zfnd19')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right " disabled id="zfnd20" value="${doc2.ila}">
                                            <input type="hidden" value="" id="bak_1030">
                                            <div id="z_btn__25">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#zfnd20','#z_btn__26','#z_btn__25')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn__26" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#zfnd20','#z_btn__25','#z_btn__26',$('#zfnd20').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_1030','#zfnd20')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                        <div class="form-group pb-4 col-12">
                                            <label>

                                            </label>
                                            <input class="form-control text-right " disabled id="signe2" value="${doc2.signe}">
                                            <input type="hidden" value="" id="bak_13z2">
                                            <div id="z_btn25z2">
                                                <button class="btn btn-primary float-right m-1" onclick="change_text('#signe2','#z_btn26z2','#z_btn25z2')"><spring:message code="label.Modifier"/></button>
                                            </div>
                                            <div id="z_btn26z2" class="collapse">
                                                <button class="btn btn-primary float-right m-1" onclick="disable_text2('#signe2','#z_btn25z2','#z_btn26z2',$('#signe2').val())"><spring:message code="label.Enregistrer"/></button>
                                                <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_13z2','#signe2')"><spring:message code="label.Annuler"/></button>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- <div class="row">
                                         <div class="col-4">
                                             <a href="/api/downloadDocumentImportDechet" class="btn btn-primary m-1 btn-block"><span class="fa fa-download text-success"></span> Télécharger</a>
                                         </div>
                                    <%-- <div class="col-4">
                                             <button class="btn btn-primary m-1 btn-block" onclick="AddDocument()"> Ajouter</button>
                                         </div>
                                    </div>--%>

                                </div>
                           </div>
                            <div class="row zone_tab collapse" id="file03">
                                <h4> منشأة معالجة النفايات</h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoIT" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo3" id="logo3" value="${doc3.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt23">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 1
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p001">${doc3.p1} </textarea>
                                        <input type="hidden" value="" id="bak_002">
                                        <div id="z_btn02">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p001','#z_btn03','#z_btn02')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn03" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p001','#z_btn02','#z_btn03',$('#p001').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_002','#p001')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 2
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p002">${doc3.p2}</textarea>
                                        <input type="hidden" value="" id="bak_003">
                                        <div id="z_btn04">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p002','#z_btn05','#z_btn04')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn05" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p002','#z_btn04','#z_btn05',$('#p002').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_003','#p002')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p003"> ${doc3.p3} </textarea>
                                        <input type="hidden" value="" id="bak_004">
                                        <div id="z_btn06">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p003','#z_btn07','#z_btn06')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn07" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p003','#z_btn06','#z_btn07',$('#p003').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_004','#p003')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 4
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p004">${doc3.p4} </textarea>
                                        <input type="hidden" value="" id="bak_005">
                                        <div id="z_btn08x">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p004','#z_btn09x','#z_btn08x')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn09x" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p004','#z_btn08x','#z_btn09x',$('#p004').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_005','#p004')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 5
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p005">${doc3.p5} </textarea>
                                        <input type="hidden" value=" " id="bak_006">
                                        <div id="z_btn010">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p005','#z_btn011','#z_btn010')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn011" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p005','#z_btn010','#z_btn011',$('#p005').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_006','#p005')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                    <label>
                                        <spring:message code="label.Paragraphe"/> 6
                                    </label>
                                    <textarea class="form-control text-right" rows="2" disabled id="p006">${doc3.p6}</textarea>
                                    <input type="hidden" value=" " id="bak_007">
                                    <div id="it1">
                                        <button class="btn btn-primary float-right m-1" onclick="change_text('#p006','#it2','#it1')"><spring:message code="label.Modifier"/></button>
                                    </div>
                                    <div id="it2" class="collapse">
                                        <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p006','#it1','#it2',$('#p006').val())"><spring:message code="label.Enregistrer"/></button>
                                        <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_007','#p006')"><spring:message code="label.Annuler"/></button>
                                    </div>
                                </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 7
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p007"> ${doc3.p7} </textarea>
                                        <input type="hidden" value="" id="bak_008">
                                        <div id="it3">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p007','#it4','#it3')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it4" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p007','#it3','#it4',$('#p007').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_008','#p007')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 8
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p008">  ${doc3.p8}</textarea>
                                        <input type="hidden" value="" id="bak_009">
                                        <div id="it5">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p008','#it6','#it5')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it6" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p008','#it5','#it6',$('#p008').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_009','#p008')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 9
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p009">	${doc3.p9}</textarea>
                                        <input type="hidden" value="" id="bak_0010">
                                        <div id="it7">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p009','#it8','#it7')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it8" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p009','#it7','#it8',$('#p009').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0010','#p009')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                    <label>
                                        <spring:message code="label.Paragraphe"/> 10
                                    </label>
                                        <input type="hidden" value="" id="bak_00m2">
                                        <textarea class="form-control text-right" rows="2" disabled id="p0010">	${doc3.p10}</textarea>
                                        <div id="it9">
                                        <button class="btn btn-primary float-right m-1" onclick="change_text('#p0010','#it10','#it9')"><spring:message code="label.Modifier"/></button>
                                    </div>
                                    <div id="it10" class="collapse">
                                        <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0010','#it9','#it10',$('#p0010').val())"><spring:message code="label.Enregistrer"/></button>
                                        <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00m2','#p0010')"><spring:message code="label.Annuler"/></button>
                                    </div>
                                </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 11
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0011">${doc3.p11}	 </textarea>
                                        <input type="hidden" value="" id="bak_00xx2">
                                        <div id="it11">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0011','#it12','#it11')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it12" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0011','#it11','#it12',$('#p0011').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00xx2','#p0011')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0012">${doc3.p12}</textarea>
                                        <input type="hidden" value="" id="bak_00x2">

                                        <div id="it13">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0012','#it14','#it13')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it14" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0012','#it13','#it14',$('#p0012').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00x2','#p0012')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 13
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0013">${doc3.p13}</textarea>
                                        <input type="hidden" value="" id="bak_00u2">
                                        <div id="it15">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0013','#it16','#it15')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it16" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0013','#it15','#it16',$('#p0013').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00u2','#p0013')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 14
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0014">${doc3.p14}</textarea>
                                        <input type="hidden" value="" id="bak_00cc2">

                                        <div id="it17">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0014','#it18','#it17')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it18" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text('#p0014','#it17','#it18',$('#p0014').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00cc2','#p0014')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 15
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0015">${doc3.p15}
 </textarea>                                        <input type="hidden" value="" id="bak_00cx2">

                                        <div id="it19">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0015','#it20','#it19')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it20" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0015','#it19','#it20',$('#p0015').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00cx2','#p0015')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 17
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0017">${doc3.p17}
                                        </textarea>
                                        <input type="hidden" value="" id="bak_00dd2">
                                        <div id="it21">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0017','#it22','#it21')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it22" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0017','#it21','#it22',$('#p0017').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00dd2','#p0017')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 18
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0018">${doc3.p18}</textarea>
                                        <input type="hidden" value="" id="bak_00fd2">
                                        <div id="it23">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0018','#it24','#it23')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it24" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0018','#it23','#it24',$('#p0018').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00fd2','#p0018')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 19
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0019">${doc3.p19}</textarea>
                                        <input type="hidden" value="" id="bak_00fg2">
                                        <div id="it25">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0019','#it26','#it25')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="it26" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0019','#it25','#it26',$('#p0019').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00fg2','#p0019')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 20
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0020">${doc3.p20}</textarea>
                                        <input type="hidden" value="" id="bak_00rg2">
                                        <div id="z_btn014">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0020','#z_btn015','#z_btn014')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn015" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0020','#z_btn014','#z_btn015',$('#p0020').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00rg2','#p0020')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 21
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0021">${doc3.p21}</textarea>
                                        <input type="hidden" value="" id="bak_00vg2">
                                        <div id="z_btn016">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0021','#z_btn017','#z_btn016')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn017" class="collapse">
                                         <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0021','#z_btn016','#z_btn017',$('#p0021').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00vg2','#p0021')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 22
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="p0016">${doc3.p16}</textarea>
                                        <input type="hidden" value="" id="bak_00ng2">
                                        <div id="z_btn018">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#p0016','#z_btn019','#z_btn018')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="z_btn019" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text3('#p0016','#z_btn018','#z_btn019',$('#p0016').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_00ng2','#p0016')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row zone_tab collapse" id="file04">
                                <h4>جمع / نقل النفايات الخطرة</h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoCT" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo4" id="logo4" value="${doc4.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt234">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Titre"/> :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="titre4">${doc4.p1}
                                        </textarea>
                                        <input type="hidden" value="" id="bak_0x1">
                                        <div id="ct_btn0">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#titre4','#ct_btn1','#ct_btn0')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn1" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#titre4','#ct_btn0','#ct_btn1',$('#titre4').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0x1','#titre4')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 1
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_02">${doc4.p2}</textarea>
                                        <input type="hidden" value="طلب يتعلق برخصة الاحتلال المؤقت للملك العمومي الطرقي.‎" id="bak_0x2">
                                        <div id="ct_btn2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_02','#ct_btn3','#ct_btn2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_02','#ct_btn2','#ct_btn3',$('#ct_02').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0x2','#ct_02')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 2
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_03">${doc4.p3}</textarea>
                                        <input type="hidden" value="" id="bak_03">
                                        <div id="ct_btn4">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_03','#ct_btn5','#ct_btn4')"><spring:message code="label.Modifier"/></button>
                                        </div>ct_03
                                        <div id="ct_btn5" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_03','#ct_btn4','#ct_btn5',$('#ct_03').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_03','#ct_03')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_04">${doc4.p4}</textarea>
                                        <input type="hidden" value="" id="bak_0x4">
                                        <div id="ct_btn6">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_04','#ct_btn7','#ct_btn6')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn7" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_04','#ct_btn6','#ct_btn7',$('#ct_04').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0x4','#ct_04')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 4
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_05">${doc4.p5} </textarea>
                                        <input type="hidden" value="" id="bak_0x5">
                                        <div id="ct_btn8">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_05','#ct_btn9','#ct_btn8')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn9" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_05','#ct_btn8','#ct_btn9',$('#ct_05').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0x5','#ct_05')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 5
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_06">${doc4.p6}</textarea>
                                        <input type="hidden" value=" " id="bak_0y5">
                                        <div id="ct_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_06','#ct_btn11','#ct_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_06','#ct_btn10','#ct_btn11',$('#ct_06').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0y5','#ct_06')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_07">${doc4.p7}</textarea>
                                        <input type="hidden" value=" " id="bak_0z5">
                                        <div id="ct_btn12">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_07','#ct_btn13','#ct_btn12')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn13" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_07','#ct_btn12','#ct_btn13',$('#ct_07').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0z5','#ct_07')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 7
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_08">${doc4.p8} </textarea>
                                        <input type="hidden" value="" id="bak_0r5">
                                        <div id="ct_btn14">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_08','#ct_btn15','#ct_btn14')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn15" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_08','#ct_btn14','#ct_btn15',$('#ct_08').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0r5','#ct_08')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 8
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_09"> ${doc4.p9} </textarea>
                                        <input type="hidden" value="" id="bak_0t5">
                                        <div id="ct_btn16">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_09','#ct_btn17','#ct_btn16')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn17" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_09','#ct_btn16','#ct_btn17',$('#ct_09').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0t5','#ct_09')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 9
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_10">${doc4.p10} </textarea>
                                        <input type="hidden" value="" id="bak_0g5">
                                        <div id="ct_btn18">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_10','#ct_btn19','#ct_btn18')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn19" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_10','#ct_btn18','#ct_btn19',$('#ct_10').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_0g5','#ct_10')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 10
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_11">${doc4.p11}</textarea>
                                        <div id="ct_btn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_11','#ct_btn21','#ct_btn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_11','#ct_btn20','#ct_btn21',$('#ct_11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 11
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_12">${doc4.p12} </textarea>
                                        <div id="ct_btn22">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_12','#ct_btn23','#ct_btn22')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn23" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_12','#ct_btn22','#ct_btn23',$('#ct_12').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_12')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_13">${doc4.p13}</textarea>
                                        <div id="ct_btn24">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_13','#ct_btn25','#ct_btn24')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn25" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_13','#ct_btn24','#ct_btn25',$('#ct_13').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_13')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 13
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_14">${doc4.p14}</textarea>
                                        <div id="ct_btn26">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_14','#ct_btn27','#ct_btn26')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn27" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_14','#ct_btn26','#ct_btn27',$('#ct_14').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_14')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 14
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_15">${doc4.p15}</textarea>
                                        <div id="ct_btn28">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_15','#ct_btn29','#ct_btn28')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn29" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_15','#ct_btn28','#ct_btn29',$('#ct_15').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_15')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 15
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_16">${doc4.p19}</textarea>
                                        <div id="ct_btn30">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_16','#ct_btn31','#ct_btn30')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn31" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_16','#ct_btn30','#ct_btn31',$('#ct_16').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_16')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 16
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_17"> ${doc4.p20}</textarea>
                                        <div id="ct_btn32">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_17','#ct_btn33','#ct_btn32')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn33" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_17','#ct_btn32','#ct_btn33',$('#ct_17').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_17')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 17
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_18">${doc4.p21} </textarea>
                                        <div id="ct_btn34">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_18','#ct_btn35','#ct_btn34')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn35" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_18','#ct_btn34','#ct_btn35',$('#ct_18').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_18')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 17
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="ct_19">${doc4.p16}</textarea>
                                        <div id="ct_btn36">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#ct_19','#ct_btn37','#ct_btn36')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="ct_btn37" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_textCT('#ct_19','#ct_btn36','#ct_btn37',$('#ct_19').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#bak_05','#ct_19')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                       <%-- <div class="row">
                                            <div class="col-4">
                                                <a href="/api/downloadDocumentCollecte" class="btn btn-primary m-1 btn-block"><span class="fa fa-download text-success"></span> Télécharger</a>
                                            </div>
                                            <div class="col-4">
                                                 <button class="btn btn-primary m-1 btn-block" onclick="AddDocument()"> Ajouter</button>
                                             </div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row zone_tab collapse" id="file06">
                                <h4> تصدير المخلفات الخطرة
                                </h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoEX" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo5"  id="logo5" value="${docExp.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt25">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 1
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp1">${docExp.p1}  </textarea>
                                        <input type="hidden" value="" id="exp_02">
                                        <div id="exp_btn2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp1','#exp_btn3','#exp_btn2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp1','#exp_btn2','#exp_btn3',$('#exp1').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_02','#exp1')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 2
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp2">${docExp.p2}

</textarea>
                                        <input type="hidden" value="" id="exp_03">
                                        <div id="exp_btn4">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp2','#exp_btn5','#exp_btn4')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn5" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp2','#exp_btn4','#exp_btn5',$('#exp2').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_03','#exp2')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>

                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp3">
                                            ${docExp.p3} </textarea>
                                        <input type="hidden" value="" id="exp_0v8">
                                        <div id="exp_btn006">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp3','#exp_btn007','#exp_btn006')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn007" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp3','#exp_btn006','#exp_btn007',$('#exp3').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0v8','#exp3')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>

                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 5
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp5">${docExp.p5}</textarea>
                                        <input type="hidden" value=" " id="exp_05">
                                        <div id="exp_btn8">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp5','#exp_btn9','#exp_btn8')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn9" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp5','#exp_btn8','#exp_btn9',$('#exp5').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_05','#exp5')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp4">
                                            ${docExp.p4} </textarea>
                                        <input type="hidden" value="" id="exp_0b8">
                                        <div id="exp_btn40">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp4','#exp_btn50','#exp_btn40')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn50" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp4','#exp_btn40','#exp_btn50',$('#exp4').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0b8','#exp4')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp6">${docExp.p6} </textarea>
                                        <input type="hidden" value=" " id="exp_0j6">
                                        <div id="exp7_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp6','#exp7_btn11','#exp7_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp7_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp6','#exp7_btn10','#exp7_btn11',$('#exp6').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0j6','#exp6')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp7">${docExp.p7} </textarea>
                                        <input type="hidden" value=" " id="exp_0l6">
                                        <div id="exp6_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp7','#exp6_btn11','#exp6_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp6_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp7','#exp6_btn10','#exp6_btn11',$('#exp7').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0l6','#exp7')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp8">${docExp.p8} </textarea>
                                        <input type="hidden" value=" " id="exp_0m6">
                                        <div id="exp5_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp8','#exp5_btn11','#exp5_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp5_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp8','#exp5_btn10','#exp5_btn11',$('#exp8').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0m6','#exp8')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp10">${docExp.p10} </textarea>
                                        <input type="hidden" value=" " id="exp_0i6">
                                        <div id="exp4_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp10','#exp4_btn11','#exp4_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp4_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp10','#exp4_btn10','#exp4_btn11',$('#exp10').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0i6','#exp10')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp11">${docExp.p11} </textarea>
                                        <input type="hidden" value=" " id="exp_0p6">
                                        <div id="exp3_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp11','#exp3_btn11','#exp3_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp3_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp11','#exp3_btn10','#exp3_btn11',$('#exp11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0p6','#exp11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp12">${docExp.p12} </textarea>
                                        <input type="hidden" value=" " id="exp_0s6">
                                        <div id="exp2_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp12','#exp2_btn11','#exp2_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp2_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp12','#exp2_btn10','#exp2_btn11',$('#exp12').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0s6','#exp12')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp13">${docExp.p13} </textarea>
                                        <input type="hidden" value=" " id="exp_0u6">
                                        <div id="exp1_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp13','#exp1_btn11','#exp1_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp1_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp13','#exp1_btn10','#exp1_btn11',$('#exp13').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0u6','#exp13')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp14">${docExp.p14} </textarea>
                                        <input type="hidden" value=" " id="exp_0k6">
                                        <div id="e0xp_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp14','#e0xp_btn11','#e0xp_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="e0xp_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp14','#e0xp_btn10','#e0xp_btn11',$('#exp14').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0k6','#exp14')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp15">${docExp.p15} </textarea>
                                        <input type="hidden" value=" " id="exp_0q6">
                                        <div id="exp_bt0n10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp15','#exp_bt0n11','#exp_bt0n10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_bt0n11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp15','#exp_bt0n10','#exp_bt0n11',$('#exp15').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0q6','#exp15')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp16">${docExp.p16} </textarea>
                                        <input type="hidden" value=" " id="exp_0xx6">
                                        <div id="exp_b0tn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp16','#exp_b0tn11','#exp_b0tn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_b0tn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp16','#exp_b0tn10','#exp_b0tn11',$('#exp16').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0xx6','#exp16')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp17">${docExp.p17} </textarea>
                                        <input type="hidden" value=" " id="exp_0ss6">
                                        <div id="exp0_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp17','#exp0_btn11','#exp0_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp0_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp17','#exp0_btn10','#exp0_btn11',$('#exp17').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0ss6','#exp17')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="exp9">${docExp.p9} </textarea>
                                        <input type="hidden" value=" " id="exp_0dd6">
                                        <div id="exp_btn010">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#exp9','#exp_btn011','#exp_btn010')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn011" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#exp9','#exp_btn010','#exp_btn011',$('#exp9').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0dd6','#exp9')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="expTitre">${docExp.titre} </textarea>
                                        <input type="hidden" value=" " id="exp_0ff6">
                                        <div id="exp_btn100">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#expTitre','#exp_btn101','#exp_btn100')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="exp_btn101" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text6('#expTitre','#exp_btn100','#exp_btn101',$('#expTitre').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#exp_0ff6','#expTitre')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>

                                    <%--  <div class="row">
                                         <div class="col-4">
                                             <a href="/api/downloadDocumentExportation" class="btn btn-primary-2 btn-block"><span class="fa fa-download"></span> Télécharger</a>
                                         </div>
                                   %--  <div class="col-4">
                                             <button class="btn btn-primary m-1 btn-block pt-2" onclick="AddDocument()"> Ajouter</button>
                                         </div>
                                    </div>--%>
                                </div>
                            </div>
                            <div class="row zone_tab collapse" id="file07">
                                <h4> عبور النفايات
                                </h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoTR" method="post">
                                            <input type="file" required class="form-control bg-light text-right file"  name="logo6"   id="logo6" value="${docTr.logo}"/>
                                            <input type="hidden" value="" id="bak_01tt26">
                                            <div>
                                                <button class="btn btn-primary float-right m-1" type="submit" required><spring:message code="label.Enregistrer"/></button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Titre"/> :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr1">${docTr.p1} </textarea>
                                        <input type="hidden" value="" id="tr01">
                                        <div id="tr_btn0">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr1','#tr_btn1','#tr_btn0')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn1" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr1','#tr_btn0','#tr_btn1',$('#tr1').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr01','#tr1')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 1
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr2">${docTr.p2}   </textarea>
                                        <input type="hidden" value="" id="tr_02">
                                        <div id="tr_btn2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr2','#tr_btn3','#tr_btn2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr2','#tr_btn2','#tr_btn3',$('#tr2').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_02','#tr2')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 2
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr3"> ${docTr.p3}

                                        </textarea>
                                        <input type="hidden" value="" id="tr_03">
                                        <div id="tr_btn4">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr3','#tr_btn5','#tr_btn4')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn5" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr3','#tr_btn4','#tr_btn5',$('#tr3').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_03','#tr3')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr4">
                                            ${docTr.p4}           </textarea>
                                        <input type="hidden" value="" id="tr_04">
                                        <div id="tr_btn6">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr4','#tr_btn7','#tr_btn6')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn7" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr4','#tr_btn6','#tr_btn7',$('#tr4').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_04','#tr4')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 4
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr5">
                                            ${docTr.p5} </textarea>
                                        <input type="hidden" value="" id="tr_066">
                                        <div id="tr_btn06">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr5','#tr_btn07','#tr_btn06')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn07" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr5','#tr_btn06','#tr_btn07',$('#tr5').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_066','#tr5')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 5
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr6">${docTr.p6} </textarea>
                                        <input type="hidden" value=" " id="tr_05">
                                        <div id="tr_btn8">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr6','#tr_btn9','#tr_btn8')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn9" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr6','#tr_btn8','#tr_btn9',$('#tr6').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_05','#tr6')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr7"> ${docTr.p7}</textarea>
                                        <input type="hidden" value=" " id="tr_06">
                                        <div id="tr_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr7','#tr_btn11','#tr_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr7','#tr_btn10','#tr_btn11',$('#tr7').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_06','#tr7')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 7
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr8"> ${docTr.p8}  </textarea>
                                        <input type="hidden" value=" " id="tr_07">
                                        <div id="tr_btn010">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr8','#tr_btn011','#tr_btn010')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn011" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr8','#tr_btn010','#tr_btn011',$('#tr8').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_07','#tr8')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 8
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr9">	${docTr.p9} </textarea>
                                        <input type="hidden" value=" " id="tr_08">
                                        <div id="tr_btn12">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr9','#tr_btn13','#tr_btn12')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn13" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr9','#tr_btn12','#tr_btn13',$('#tr9').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_07','#tr9')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 9
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr10">${docTr.p10}</textarea>
                                        <input type="hidden" value=" " id="tr_09">
                                        <div id="tr_btn14">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr10','#tr_btn15','#tr_btn14')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn15" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr10','#tr_btn14','#tr_btn15',$('#tr10').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_09','#tr10')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 10
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr11">${docTr.p11}</textarea>
                                        <input type="hidden" value=" " id="tr_10">
                                        <div id="tr_btn16">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr11','#tr_btn17','#tr_btn16')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn17" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr11','#tr_btn16','#tr_btn17',$('#tr11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_10','#tr11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 11
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr12">${docTr.p12}



 </textarea>
                                        <input type="hidden" value=" " id="tr_011">
                                        <div id="tr_btn18">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr12','#tr_btn19','#tr_btn18')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn19" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr12','#tr_btn18','#tr_btn19',$('#tr12').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_011','#tr12')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr13">${docTr.p13} </textarea>
                                        <input type="hidden" value=" " id="tr_12">
                                        <div id="tr_btn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr13','#tr_btn21','#tr_btn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr13','#tr_btn20','#tr_btn21',$('#tr13').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr13')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr14">${docTr.p14} </textarea>
                                        <input type="hidden" value=" " id="tr_13">
                                        <div id="tr_btn22">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr14','#tr_btn23','#tr_btn22')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn23" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr14','#tr_btn22','#tr_btn23',$('#tr14').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr14')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr15">${docTr.p15} </textarea>
                                        <input type="hidden" value=" " id="tr_14">
                                        <div id="tr_btn200">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr15','#tr_btn210','#tr_btn200')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn210" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr15','#tr_btn200','#tr_btn210',$('#tr15').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr15')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr16">${docTr.p16} </textarea>
                                        <input type="hidden" value=" " id="tr_15">
                                        <div id="tr_btn020">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr16','#tr_btn021','#tr_btn00')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn021" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr16','#tr_btn020','#tr_btn021',$('#tr16').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_15','#tr16')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr17">${docTr.p17} </textarea>
                                        <input type="hidden" value=" " id="tr_16">
                                        <div id="tr_bt0n20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr17','#tr_bt0n21','#tr_bt0n20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_bt0n21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr17','#tr_bt0n20','#tr_bt0n21',$('#tr17').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr17')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr18">${docTr.p18} </textarea>
                                        <input type="hidden" value=" " id="tr_17">
                                        <div id="tr_b0tn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr18','#tr_b0tn21','#tr_b0tn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_b0tn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr18','#tr_b0tn20','#tr_b0tn21',$('#tr18').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr18')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr19">${docTr.p19} </textarea>
                                        <input type="hidden" value=" " id="tr_18">
                                        <div id="tr_0btn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr19','#tr_0btn21','#tr_0btn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_0btn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr19','#tr_0btn20','#tr_0btn21',$('#tr19').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr19')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr20">${docTr.p20} </textarea>
                                        <input type="hidden" value=" " id="tr_19">
                                        <div id="t0r_btn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr20','#t0r_btn21','#0tr_btn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="t0r_btn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr20','#t0r_btn20','#t0r_btn21',$('#tr20').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr20')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr22">${docTr.p22} </textarea>
                                        <input type="hidden" value=" " id="tr_20">
                                        <div id="tr_btn201">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr22','#tr_btn211','#tr_btn201')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn211" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr22','#tr_btn201','#tr_btn211',$('#tr22').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr22')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr23">${docTr.p23} </textarea>
                                        <input type="hidden" value=" " id="tr_21">
                                        <div id="tr_btn202">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr23','#tr_btn212','#tr_btn202')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn212" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr23','#tr_btn202','#tr_btn212',$('#tr23').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr23')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="tr24">${docTr.p24} </textarea>
                                        <input type="hidden" value=" " id="tr_22">
                                        <div id="tr_btn203">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#tr24','#tr_btn213','#tr_btn203')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn213" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#tr24','#tr_btn203','#tr_btn213',$('#tr24').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#tr24')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="titre_tr">${docTr.titre} </textarea>
                                        <input type="hidden" value=" " id="tr_23">
                                        <div id="tr_btn204">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#titre_tr','#tr_btn214','#tr_btn204')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="tr_btn214" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text7('#titre_tr','#tr_btn204','#tr_btn214',$('#titre_tr').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#tr_12','#titre_tr')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row zone_tab collapse" id="file08">
                                <h4>دراسة الأثر البيئي (EIE)
                                </h4>
                                <div class="col-12">
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Logo"/> :
                                        </label>
                                        <form enctype="multipart/form-data" action="/api/UpdateLogoEie" method="post">
                                            <input type="file"  class="form-control bg-light text-right file" required name="file"  id="logo7"/>
                                            <div>
                                                <input class="btn btn-primary float-right m-1" type="submit" value="<spring:message code="label.Enregistrer"/>" />
                                            </div>
                                        </form>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Titre"/> :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eietitre">${docEie.titre} </textarea>
                                        <input type="hidden" value="" id="eie001">
                                        <div id="eie_btn00">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eietitre','#eie_btn01','#eie_btn00')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn01" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eietitre','#eie_btn00','#eie_btn01',$('#eietitre').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie001','#eietitre')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            Parahraphe :
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie1">${docEie.p1} </textarea>
                                        <input type="hidden" value="" id="eie01">
                                        <div id="eie_btn0">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie1','#eie_btn1','#eie_btn0')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn1" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie1','#eie_btn0','#eie_btn1',$('#eie1').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie01','#eie1')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 1
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie2">${docEie.p2}</textarea>
                                        <input type="hidden" value="" id="eie_02">
                                        <div id="eie_btn2">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie2','#eie_btn3','#eie_btn2')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn3" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie2','#eie_btn2','#eie_btn3',$('#eie2').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_02','#eie2')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 2
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie3"> ${docEie.p3}

                                        </textarea>
                                        <input type="hidden" value="" id="eie_03">
                                        <div id="eie_btn4">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie3','#eie_btn5','#eie_btn4')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn5" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie3','#eie_btn4','#eie_btn5',$('#eie3').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_03','#eie3')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 3
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie4">
                                            ${docEie.p4}           </textarea>
                                        <input type="hidden" value="" id="eie_04">
                                        <div id="eie_btn6">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie4','#eie_btn7','#eie_btn6')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn7" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie4','#eie_btn6','#eie_btn7',$('#eie4').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_04','#eie4')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 4
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie5">
                                            ${docEie.p5} </textarea>
                                        <input type="hidden" value="" id="eie_066">
                                        <div id="eie_btn06">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie5','#eie_btn07','#eie_btn06')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn07" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie5','#eie_btn06','#eie_btn07',$('#eie5').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_066','#eie5')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 5
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie6">${docEie.p6} </textarea>
                                        <input type="hidden" value=" " id="eie_05">
                                        <div id="eie_btn8">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie6','#eie_btn9','#eie_btn8')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn9" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie6','#eie_btn8','#eie_btn9',$('#eie6').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_05','#eie6')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 6
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie7"> ${docEie.p7}</textarea>
                                        <input type="hidden" value=" " id="eie_06">
                                        <div id="eie_btn10">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie7','#eie_btn11','#eie_btn10')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn11" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie7','#eie_btn10','#eie_btn11',$('#eie7').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_06','#eie7')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 7
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie8"> ${docEie.p8}  </textarea>
                                        <input type="hidden" value=" " id="eie_07">
                                        <div id="eie_btn010">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie8','#eie_btn011','#eie_btn010')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn011" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie8','#eie_btn010','#eie_btn011',$('#eie8').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_07','#eie8')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 8
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie9">	${docEie.p9} </textarea>
                                        <input type="hidden" value=" " id="eie_08">
                                        <div id="eie_btn12">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie9','#eie_btn13','#eie_btn12')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn13" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie9','#eie_btn12','#eie_btn13',$('#eie9').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_07','#eie9')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 9
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie10">${docEie.p10}</textarea>
                                        <input type="hidden" value=" " id="eie_09">
                                        <div id="eie_btn14">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie10','#eie_btn15','#eie_btn14')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn15" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie10','#eie_btn14','#eie_btn15',$('#eie10').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_09','#eie10')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 10
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie11">${docEie.p11}</textarea>
                                        <input type="hidden" value=" " id="eie_10">
                                        <div id="eie_btn16">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie11','#eie_btn17','#eie_btn16')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn17" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie11','#eie_btn16','#eie_btn17',$('#eie11').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_10','#eie11')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 11
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie12">${docEie.p12}



                                        </textarea>
                                        <input type="hidden" value=" " id="eie_011">
                                        <div id="eie_btn18">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie12','#eie_btn19','#eie_btn18')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn19" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie12','#eie_btn18','#eie_btn19',$('#eie12').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_011','#eie12')"><spring:message code="label.Annuler"/></button>
                                        </div>
                                    </div>
                                    <div class="form-group pb-4">
                                        <label>
                                            <spring:message code="label.Paragraphe"/> 12
                                        </label>
                                        <textarea class="form-control text-right" rows="2" disabled id="eie13">${docEie.p13} </textarea>
                                        <input type="hidden" value=" " id="eie_12">
                                        <div id="eie_btn20">
                                            <button class="btn btn-primary float-right m-1" onclick="change_text('#eie13','#eie_btn21','#eie_btn20')"><spring:message code="label.Modifier"/></button>
                                        </div>
                                        <div id="eie_btn21" class="collapse">
                                            <button class="btn btn-primary float-right m-1" onclick="disable_text8('#eie13','#eie_btn20','#eie_btn21',$('#eie13').val())"><spring:message code="label.Enregistrer"/></button>
                                            <button class="btn btn-danger float-right m-1" onclick="back_up('#eie_12','#eie13')"><spring:message code="label.Annuler"/></button>
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
<script>
    function AddDocument(){
        var titre=$("#titre6").val();
        var p1=$("#tr1").val();
        var p2=$("#tr2").val();
        var p3=$("#tr3").val();
        var p4=$("#tr4").val();
        var p5=$("#tr5").val();
        var p6=$("#tr6").val();
        var p7=$("#tr7").val();
        var p8=$("#tr8").val();
        var p9=$("#tr9").val();
        var p10=$("#tr10").val();
        var p11=$("#tr11").val();
        var p12=$("#tr12").val();




        var document={
            "titre":titre,
            "p1":p1,
            "p2":p2,
            "p3":p3,
            "p4":p4,
            "p5":p5,
            "p6":p6,
            "p7":p7,
            "p8":p8,
            "p9":p9,
            "p10":p10,
            "p11":p11,
            "p12":p12,


        }
        $.ajax({
            type : "POST",
            url :"/api/AddDocumenteTr",
            contentType : 'application/json; charset=utf-8',
            data : JSON.stringify(document),
            success : function() {
                window.location.reload();
            },
            error : function(response) {
                alert("error")
            }
        });
    }
</script>
<jsp:include page="../../includes/footer.jsp" />







