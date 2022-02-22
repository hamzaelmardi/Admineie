
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

<%@ page session="false"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>
<style>
    .btn-primary{
        background:  #d59d32;
        border-color:  #d59d32;
    }

    .titre_abs{
        position: absolute;
        top: -15px;
        display: block;
        background:  #d59d32;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
    }
    .tabcontent {
        float: left;
        padding: 0px 20px;
        width: 80%;
    }
    .tab {
        float: left;

    }
    .tablinks {
        width: 100% !important;
        text-align: left;
        margin-bottom: 3px;
    }
    .tab button:hover {
        background-color: #ddd;
    }
    .tab button.active {
        background-color: red;
    }

</style>

<div class="main-panel " style="margin-top:120px">
    <div class="content-wrapper">
<div class="row" style="display:flex;">

    <div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >
        <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px; text-align: ${pageContext.response.locale=='ar'?'right':'left'}" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="row p-0 m-0 justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-12 grid-margin stretch-card " >
                <div class="photo  hvr-buzz-out" >
                    <i class="mdi icc mdi-file-check menu-icon"></i>
                </div>
                <form action="/api/add_rapport_attache/${id}" method="post" enctype="multipart/form-data">
                   <input name="result" type="hidden">
                    <div class="card">
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                </div>
                            </div>

                            <div class="col-10 mt-4">

                                <h5 style="float:right;color:black"><spring:message code='label.Rapportdeconformite'/></h5>
                                <div class="row p-0 m-0 mt-5">
                                    <div class="form-group mt-5" style="width: 100%;">

                                        <div class="form-group text-left">
                                            <label><spring:message code='label.Rapportdeconformite'/> </label>
                                            <input required="required" accept=".doc,.docx,.pdf" type="file" class="form-control" name="doc">
                                        </div>
                                        <div class="form-group" id="f">
                                            <div class="form-group text-left">
                                                <label> <spring:message code='label.conclusiondurapport'/> </label>
                                                <textarea type="text" required="required" id="conclu" class="form-control" name="conclu"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group dt " style="${pageContext.response.locale=='ar'?'text-align:right':'text-align:left'}">
                                            <label> <spring:message code='label.Statut'/> </label>
                                            <select required id="attachement" class="custom-select" name="etat" ${dd}>
                                                <option value=""><spring:message code='label.Choisir'/></option>
                                                <option value="17"><spring:message code='label.Favorable'/></option>
                                                <option value="87"><spring:message code='label.Favorablesousreserve'/></option>
                                                <option value="18"><spring:message code='label.Defavorable'/></option>
                                            </select>
                                        </div>
                                        <div class="form-group text-left" id="n" style="display: none">
                                            <label><spring:message code='label.Commentaire'/> </label>
                                            <textarea id="comment" type="text" class="form-control" name="comment" rows="3"></textarea>
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>
                        <div class="row  mb-4" style="margin:14px;">
                            <button  class="btn btn-primary btn-block" type="submit"> <spring:message code='label.Enregistrer'/></button>
                            <a class="btn btn-secondary btn-block"  href="/api/getListeInstallation/0/6/0" style="background: #f95f5f;"> <spring:message code='label.Annuler'/></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
        <div class="col-12 from_add" id="checkDoc" style="margin-top: 43px;">
            <div class="row p-0 m-0 justify-content-center">
                <div class="col-md-8 col-sm-12 grid-margin stretch-card " >
                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                    <div class="card">
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                </div>
                            </div>
                            <div class="col-10 mt-4">
                                <h5 class="ml-2" style="float:right;color:black"><spring:message code="label.ValidationdesCodesdesdchets"/> </h5>
                                <div class="row p-0 m-0 mt-5">
                                    <div class="col-sm-12">
                                        <table class="table table-striped" data-page-length="15">
                                            <thead>
                                            <tr>
                                                <th scope="col" style="min-width: 100px"><spring:message
                                                        code="label.Code"/></th>
                                                <th scope="col"><spring:message code="label.Type"/></th>
                                                <th scope="col"><spring:message code="label.Valider"/></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${inst.code}" var="c">
                                                <tr id="tr-${c.id_code}">
                                                    <td>${c.nom_fr }</td>
                                                    <td>${c.nom_ar }</td>
                                                    <td>
                                                        <input checked  class="h-15" type="checkbox" id="id-${c.id_code }" onchange="DeleteCode('id_installation','${c.id_code}')">
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row  justify-content-center mb-4" style="margin:14px;">
                                    <a  class="btn btn-primary btn-lg mx-2 col-5" href="/api/getListeInstallation/0/6/0" ><spring:message code="label.Enregistrer"/>  </a>
                                    <a class="btn btn-secondary btn-lg col-5"  href="/api/getListeInstallation/0/6/0" style="background: #f95f5f;"> <spring:message code="label.Annuler"/></a>
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

    function addStatut(etat){

        if(etat==="1"){
            $(".st").addClass("hidden");
            $(".dt").removeClass("hidden");
        }
        else if(etat==="2"){
            $(".dt").addClass("hidden");
            $(".st").removeClass("hidden");
        }

    }
    function opendemande(evt, cityName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(cityName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    document.getElementById('attachement').onchange = function(){
        if(this.value == 46){
           /* document.getElementById('f').style.display = 'none';*/
            document.getElementById('n').style.display = 'block';
        } else {
           /* document.getElementById('f').style.display = 'block';*/
            document.getElementById('n').style.display = 'none';
        }
    };

    function DeleteCode(id_installation, id_code) {
        event.preventDefault();
        var id_ins = $("#" + id_installation).val();
        $.ajax({
            type : "POST",
            url: '/api/removeCode/' + id_ins + '/' + id_code,
            data:{},
            success : function(data) {
                $("#tr-"+id_code).css("display","none");
            },
            error : function(response) {
                alert("error")
            }
        });

    }

</script>

<jsp:include page="../../includes/footer.jsp" />
