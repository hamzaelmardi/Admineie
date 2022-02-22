<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../menu/menu.jsp" />

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<link href="https://www.wrappixel.com/demos/admin-templates/niceadmin-bt5/nice/src/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css" rel="stylesheet">

<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .fl {
            float: right;
        }
        .fr{
            float: left;
        }
        table{
            direction: rtl;
        }
        table i{
            margin-right: 0px;
        }

    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .fl {
            float: left;
        }
        .fr{
            float: right;
        }
        table{
            direction: ltr;
        }
        @media only screen and (max-width:376px){
            .mx-xs-2{
                margin: 0.5rem !important;
            }
        }
    </style>
</c:if>
<c:set var="lng" value="nom_${pageContext.response.locale}"/>

<div class="container-fluid" style="margin-top: 170px;">
     <div class="row justify-content-center card mx-lg-5 mx-sm-2 mx-xs-2">
         <div class="card-body" style="background-color: white">
            <div class="table-responsive">
                <div class="row justify-content-center">
                <div class="col-lg-12 pr-0">
                    <div class="row m-0 pt-5">
                        <div class="col-4 pl-0">
                            <h4 class="ml6">
                    <span><spring:message code="label.TousProfil"/></span>
                            </h4>
                        </div>
                        <div class="col-8">
                            <a class="button text-white bgMyColor float-right" href="/api/droit_acces/0"><span><spring:message code="label.CreerProfil"/></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
                <table class="table tablee table-hover table-bordered">
                    <thead>
                    <tr>
                        <th><spring:message code="label.Nom"/></th>
                        <th><spring:message code="label.Detail"/></th>
                        <th><spring:message code="label.DroitAcces"/></th>
                        <th><spring:message code="label.Action"/></th>
                    </tr>
                    </thead>
                    <tbody class="tbodyy table-bordered">
                    <c:forEach items="${profiles}" var="f">

                        <tr id="tr-${f.profilId}">
                            <td><span class="font-monospace">${f.nom}</span></td>
                            <td><span class="font-monospace">${f.detail}</span></td>
                            <td><button type="button" onclick="show_acces('${f.profilId}')" class="button bgMyColor text-white"><spring:message code="label.Modifier"/></button>
                                <div id="cc"></div>
                            </td>
                            <td class="text-center" style="width: 15%">
                                <ul class="list-inline m-0">
                                    <li class="list-inline-item">
                                        <a type="button" href="/api/getProfilDetails/${f.profilId}" class="btn btn-outline-info btn-sm rounded-circle tab_edit" type="button" data-toggle="tooltip" data-placement="top" title="Editer" style="background-color: white">
                                            <div class="icon_trash_1">
                                                <span class="fas fa-pencil-alt text-info mt-2"></span>
                                            </div>

                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <button onclick="deleteProfile(${f.profilId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer" style="background-color: white">
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
                    <c:when test="${profiles!='[]'}"> <div class="text-center" dir="ltr">
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

                            <select class="custom-select" id="optionselected" onchange="getParamProfil(this.value)" style="margin: auto; width: 100px" >

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
        <%--    <div class="col-12 table-responsive">

                <table style="margin-bottom:12px;" id="example">
                    <thead>
                    <tr>

                        <th class="text-center bg-info text-white"><spring:message code="label.Nom"/></th>
                        <th class="text-center bg-info text-white"><spring:message code="label.Detail"/></th>
                        <th class="text-center bg-info text-white"><spring:message code="label.Action"/></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${profiles}" var="f">

                        <tr id="tr-${f.profilId}">
                            <td>${f.nom}</td>
                            <td>${f.detail}</td>
                            <td class="text-center">
                                <ul class="list-inline m-0">
                                    <li class="list-inline-item text-center">
                                        <a href="/api/getProfilDetails/${f.profilId}" class="btn btn-outline-warning btn-sm rounded-circle tab_edit text-center" type="button" data-toggle="tooltip" data-placement="top" title="Editer" >
                                            <div class="icon_trash_1">
                                                <span class="fas fa-edit text-success animated " style="margin-top: 10px"></span>
                                            </div>

                                        </a>
                                    </li>
                                    <li class="list-inline-item">
                                        <button onclick="deleteProfile(${f.profilId})" class="btn btn-outline-warning btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer">
                                            <div class="icon_trash_1">
                                                <span class="fas fa-trash animated" style="color: red"></span>
                                            </div>
                                        </button>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>--%>
        </div>
    </div>

<script type="text/javascript">
    function show_acces(id) {
        $.ajax({
            url: "/api/getProfilDroisAcces/" + id,
            type: "GET",
            data: {},
            success: function (response) {
                $("#cc").html(response);
                $("#getModal1").modal('show');
            },
            error: function (response) {
                alert('Erreur ajout non effectué');
            }
        });
    }

    function getParamProfil(vals){
        window.location.href='/api/getListProfile/'+vals+'/6';
    }

    function Edit(val){
        $.ajax({
            type : "GET",
            url :"/api/getProfilDetails",
            data:{
                'val':val
            },

            success : function(data) {

            },
            error : function(response) {
                alert("error")
            }
        });

    }
    function deleteProfile(id){
        Swal.fire({
            title: '<spring:message code="label.etesvousure"/>',
            text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#42ba96',
            cancelButtonColor: '#d33',
            confirmButtonText: '<spring:message code="label.supprimer"/>'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type : "POST",
                    url :"/api/delete/"+id,
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
            }
        });

    }

    $(document).ready(function() {
        $('table').DataTable().destroy();
    });
</script>


<jsp:include page="../../includes/footer.jsp" />
