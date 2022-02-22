<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../includes/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                                                    <div class="pl-2 pr-2 col-md-12 text-center mb-2" style=" max-width: 521px; margin: auto;">

                                                        <div class="border rounded p-2">
                                                            <h3><spring:message code="label.Retrouvezvotrecompte" /></h3>
                                                            <hr>
                                                            <h6><spring:message code="label.veuillezentrervotreidentifiantpourrecherchervotrecompte" /></h6>
                                                            <form id="checkEmail" name="checkEmail">
                                                                <div  style="margin-top: 5%;">
                                                                    <input id="emaily" name="emaily" style="width: 95%;margin-left: 3%;" class="form-control" type="email">
                                                                </div>
                                                                <div  style="margin-top: 5%;">
                                                                    <a onclick="checkmail1()" class="btn btn-success mb-2"> <i class="fa fa-unlock" ></i> <spring:message code="label.reinitialiservotremotdepasse"/></a>
                                                                </div>
                                                            </form>
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

    function checkmail1(){
        var mail = $("#emaily").val();
        if($("form[name='checkEmail']").valid()) {
        var getUrl = window.location;
        var baseUrl = getUrl .protocol + "//" + getUrl.host;
            $.get(baseUrl + "/chackmail_reset1/" + mail, function (rep) {
                if (rep == 1) {
                    Swal.fire({
                            title: 'Message',
                            text: "<spring:message code="label.pourchangervotremotdepassemercideverifiervotreboîteemail"/>",
                            icon: 'warning',
                            confirmButtonColor: '#3085d6',
                            confirmButtonText: 'oui !'
                        }
                    ).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = "/index"
                        }
                    })
                }else if (rep==0){
                    swal("<spring:message code="label.Avertissement"/>", "Cet email n'existe pas", "error")
                }
            })
        }else{
            return false;
        }
    }

    $(function() {
        $("form[name='checkEmail']").validate({
            rules: {
                emaily: {
                    required: true
                }
            },
            messages: {
                emaily: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });

    $('#modal_pass').modal('show');
</script>
