
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flag.css" >

<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .button {
            float: left;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale=='fr' }">
    <style>
        .button {
            float: right;
        }
    </style>
</c:if>
<div class="col-12 from_add" style=" padding-left: 15px; float: none; margin: 15px;">
    <c:set var="lng" value="nom_${pageContext.response.locale}"/>
    <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
        <div class="row p-0 m-0 justify-content-center">
            <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5 grid-margin" >
                <div class="photo  hvr-buzz-out" >
                    <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                </div>
                <form name="code" id="code">
                    <div class="card" >
                        <div class="row justify-content-center">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                </div>
                            </div>

                            <div class="col-10 mt-4">

                                <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters">Departement</span></span>
                                                      </span>
                                </h3>                                    <div class="row p-0 m-0 mt-5">


                            </div>

                                <div class="row">

                                    <div class="col-12 mt-4">
                                        <div class="form-group">
                                            <label>departement</label>
                                            <input  required type="text" id="departementnom" value="${departementone.departementnom}" class="form-control">
                                            <input  required type="hidden" id="departementid" value="${departementone.departementid}" class="form-control">
                                            <span style="color: red;font-style: italic" id="enom"></span>
                                        </div>

                                    </div></div>


                        </div>
                    </div>
                    <div class="row  mb-4" style="margin:14px;">
                        <a  class="btn btn-success btn-block " onclick="adddepartement()" > <spring:message code="label.Enregistrer" /></a>
                        <a class="btn btn-danger-2 text-white btn-block" onclick="getFunctionParam('getDepartement')"><spring:message code="label.Annuler"/></a>

                    </div>
            </div>
            </form>
        </div>
    </div>
</div>

<!-- fin etat Dossier -->


<div class="col-12 grid-margin z_tab" id="subtab_0">
    <div>
        <div class="row justify-content-center">

            <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >

                <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                <div class="row p-4 justify-content-center">
                    <div class="col-8">
                        <div class="row p-0">
                            <div class="col-12">
                                <div class="form-group">
                                    <label>departement</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>

                        </div>
                        <div class="row p-0 justify-content-end">
                            <div class="col-12">
                                <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')"><spring:message code="label.rechercher" /> </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12 pr-0 pl-0" >
                <div class="row m-0">
                    <div class="col-3">
                        <h4 class="ml6">
                                      <span class="text-wrapper">
                                        <span class="letters"><span class="letters">departement</span></span>
                                      </span>
                        </h4>
                    </div>
                    <div class="col-9">
                        <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                            <span> new departement </span>
                        </a>

                    </div>
                </div>
            </div>

        </div>





        <div class="row justify-content-center">
            <div class="col-12">
                <table id="example2" class="table tablee table-hover">
                    <thead>
                    <tr>


                        <th class="text-center">nom departement</th>
                        <th class="text-center"><spring:message code="label.Action"/></th>


                    </tr>
                    </thead>
                    <tbody class="tbodyy">

                    <c:forEach items="${listF}" var="f">
                        <tr id="tr-${f.departementid}">

                                <%-- <td>${f.nom_fr}</td> --%>
                            <td>${f.departementnom}</td>

                            <td class="text-center">
                                <ul class="list-inline m-0">
                                    <li class="list-inline-item">
                                        <button onclick="editdepartement(${f.departementid})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white">
                                            <div class="icon_trash_1">
                                                <span class="fa fa-edit" style="color: orange"></span>
                                            </div>

                                        </button>
                                    </li>
                                    <li class="list-inline-item">
                                        <button onclick="deletedepartement(${f.departementid})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white">
                                            <div class="icon_trash_1">
                                                <span class="fas fa-trash" style="color: red"></span>
                                            </div>
                                        </button>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <c:choose>
                    <c:when test="${listF!='[]'}"> <div class="text-center" dir="ltr">
                        <c:if test="${(page)>0}">
                            <c:set value="${page-1}" var="page_db"/>
                            <c:set value="${totalPage-1}" var="page_LAST"/>
                        </c:if>
                        <c:if test="${(page)<=0}">
                            <c:set value="0" var="page_db"/>
                            <c:set value="0" var="page_LAST"/>
                        </c:if>


                        <c:set var = "salary"  value = "${totalPage-page-1}"/>
                        <c:choose>
                            <c:when test="${salary>5 }">
                                <c:set var = "toAdd"  value = "5"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var = "toAdd"  value = "${totalPage-page-1}"/>
                            </c:otherwise>
                        </c:choose>

                        <c:if test="${totalPage>0}">

                            <select class="custom-select" id="optionselected" onchange="getParamP(this.value)" style="margin: auto; width: 100px;font-size: 15pt" >

                                <c:forEach begin="${page}" end="${totalPage-1}" var="c">
                                    <option  value="${c}"   ${c==number ? 'selected' : ''} >
                                            ${c+1}
                                    </option>
                                </c:forEach>

                            </select>

                        </c:if>
                        <c:if test="${(page)>=(totalPage-1)}">
                            <c:set value="${totalPage-1}" var="page_end"/>
                        </c:if>

                        <c:if test="${(page)<(totalPage-1)}">
                            <c:set value="${page+1}" var="page_end"/>
                        </c:if>




                    </div></c:when>
                    <c:otherwise>

                        <h4 style="color:black;text-align: center"> <spring:message code="label.Ilnyaaucuneenregistrement"/></h4>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
</div>





<script type="text/javascript">
    function adddepartement(){

        var departementnom=$("#departementnom").val();
        var departementid=$("#departementid").val();

        if(departementnom==""){
            document.getElementById('enom').innerHTML="Choissir Un Nom departement";
        }

        else {
            var departement={

                "departementnom":departementnom,
                "departementid":departementid,

            }



            $.ajax({
                type: "POST",

                url :"/api/adddepartement/",
                contentType : 'application/json; charset=utf-8',

                data : JSON.stringify(departement),

                success : function(response) {

                    $(".mpParam").html(response);
                },
                error : function() {

                    alert('Erreur ajout non effectué');

                }
            });


        }
    }




    /*  delete famille  begin */

    function deletedepartement(id){

        Swal.fire({
            title: '<spring:message code="label.etesvousure"/>',
            text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
            type: 'Attention',
            showCancelButton: true,
            confirmButtonColor: '#42ba96',
            cancelButtonColor: '#d33',
            confirmButtonText: '<spring:message code="label.supprimer"/>!',
            cancelButtonText: '<spring:message code="label.Annuler"/>'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type : "POST",
                    url :"/api/deleteDepartement/"+id,
                    data:{
                        "id":id
                    },
                    success : function(data) {
                        $("#tr-"+id).css("display","none");
                    },
                    error : function(response) {
                        alert("error")
                    }
                });
                Swal.fire(
                    '<spring:message code="label.Supprimer"/>!',
                    '<spring:message code="label.Votrefichieraetesupprime"/>',
                    'Succès',
                )
            }
        })


    }








    function editdepartement(id){
        $.ajax({
            type : "GET",
            url :"/api/updateDepartement/"+id,
            data:{

            },
            success : function(data) {

                $(".mpParam").html(data);
                $("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");
            },
            error : function(response) {
                alert("error")
            }
        });

    }

    /*  delete famille  end */

    function checkCode(val){
        $('#codeLabel').css("display","none");
        $.ajax({
            type : "GET",
            url :"/checkCode",
            data:{
                'val':val
            },
            success : function(data) {
                /* alert()  */
                if(data=="oui"){
                    $('#codeLabel').css("display","block");
                    $(".btnTo").prop("disabled", true);

                }
                else{
                    $(".btnTo").prop("disabled", false);
                }


            },
            error : function(response) {
                alert("error")
            }
        });

    }

</script>



<jsp:include page="../../includes/footer.jsp" />




