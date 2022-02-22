<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../../menu/menu.jsp" />

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<style>
    .form-container{
   margin-top: 80px;
    padding: 30px;
    border-raduis: 10px;
    box-shadow:0px 0px 5px 0px #000;

    }
</style>
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
    </style>
</c:if>
<c:set var="lng" value="nom_${pageContext.response.locale}"/>
<fmt:parseNumber var = "i" type = "number" value = "0" />

 <div class="container-fluid" style="margin-top: 180px">
     <div class="row justify-content-center card mx-2">
         <div class="card-body col-md-12" style="background-color: white">
             <div class="table-responsive">
                 <div class="row justify-content-start ">
                     <div class="col-lg-12 pr-0">
                         <div class="row m-0 pt-5" style="${pageContext.response.locale=='ar'?'text-align:right':'text-align:left'}">
                             <div class="col-4 pl-0" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                 <h4 class=""><spring:message code="label.TousProfil"/></h4>
                                 <select class="form-select bg-light fl col-sm-12" id="selectBox" onchange="getFunctionProfil(this.value, '${page}');" style="cursor: pointer;height:40px">
                                     <option value="0" >Tous</option>
                                     <c:forEach items="${profiless}" var="p">
                                         <option ${Idrefence.equals(p.profilId)?"selected":"" } value="${p.profilId}">${p.nom}</option>
                                     </c:forEach>
                                 </select>
                             </div>
                         </div>
                     </div>
                     <div class="col-lg-12 pr-0">
                         <div class="row m-0 pt-5">
                             <div class="col-4 pl-0">
                                 <h4 class="ml6">
                                     <span><spring:message code="label.listDesComptes"/></span>
                                 </h4>
                             </div>
                             <div class="col-8">
                                 <a class="button text-white bgMyColor float-right" href="/api/getFormToAdd"><span><spring:message code="label.Creationdescomptes"/></span>
                                 </a>
                             </div>
                         </div>
                     </div>
                 </div>
                 <table style="margin-bottom:12px;" class="table tablee table-hover">
                                    <thead>
                                       <tr>
                	                      <th class="text-center"><spring:message code="label.Nom"/></th>
                	                      <th class="text-center"><spring:message code="label.Email"/></th>
                	                      <th class="text-center"><spring:message code="label.Telephone"/></th>
                	                      <th class="text-center"><spring:message code="label.Profile"/></th>
                	                      <th class="text-center"><spring:message code="label.Region"/></th>
                                          <th class="text-center"><spring:message code="label.Action"/></th>
                                       </tr>
                                     </thead>
                                     <tbody class="tbodyy table-bordered">
                                        <c:forEach items="${listF}" var="f">

                                    <tr id="tr-${f.compteId}">

                                         <%-- <td>${f.nom_fr}</td> --%>
                                         <td>${f.nom}</td>
                                          <td>${f.email}</td>
                                           <td>${f.tel}</td>
                                            <td>${f.profil.nom}</td>
                                           <td>${f.region.nom_fr}</td>
                                         <td class="text-center">
                                           <ul class="list-inline m-0">
                                             <li class="list-inline-item text-center">
                                               <a href="/api/updateCompte5/${f.compteId}" class="btn btn-outline-warning btn-sm rounded-circle tab_edit text-center" type="button" data-toggle="tooltip" data-placement="top" title="Editer" style="background-color: white">
                                                 <div class="icon_trash_1">
                                                  <span class="fas fa-pencil-alt" style="color: orange;margin-top: 10px"></span>
                                                 </div>
                                               </a>
                                             </li>
                                             <li class="list-inline-item">
                                               <button onclick="deleteCompte(${f.compteId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer" style="background-color: white">
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

                             <select class="custom-select" id="optionselected" onchange="getParamCompte(this.value)" style="margin: auto; width: 100px" >

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

<jsp:include page="../../includes/footer.jsp" />
 <script type="text/javascript">

     function getParamCompte(vals){
         var id = $("#selectBox").val()
         $.ajax({
             type : "GET",
             url :'/api/getAccountByProfil/'+id+'/'+ vals +'/6',
             data:{
             },
             success : function(data) {
                 $(".container-fluid").html(data)
                 document.getElementsByClassName('navbar')[1].style.display='none';
                 $(".container-fluid").css('margin-top','90px')
                 if(($('.tbodyy').find('tr').length)===0){
                     $("#h1").removeClass("d-none");
                 }
             },
             error : function(response) {
                 alert("Erreur")
             }
         });
     }

     function deleteCompte(id){
        Swal.fire({
            title: '<spring:message code="label.etesvousure"/>',
            text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#42ba96',
            cancelButtonColor: '#d33',
            confirmButtonText: '<spring:message code="label.Supprimer"/>'
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type : "POST",
                    url :"/api/deleteCompte5/"+id,
                    data:{
                        "id":id
                    },
                    success : function(data) {
                        $("#tr-"+id).css("display","none");
                    },
                    error : function(response) {
                        alert("Erreur")
                    }
                });
                Swal.fire(
                    '<spring:message code="label.Supprimer"/>!',
                    '<spring:message code="label.votrefichieraetesupprimeavecsucces"/>.',
                    'success'
                )
            }
        })

        }
    function editCompte(id){
     $.ajax({
        type : "GET",
        url :"/api/updateCompte5/"+id,
        data:{

        },
        success : function(data) {
            window.location.href=''
            $(".mpParam").html(data);
        },
        error : function(response) {
            alert("error")
        }
    });

}
    function getFunctionProfil(id, page){
            $("#h1").html("");
            $.ajax({
            type : "GET",
            url :'/api/getAccountByProfil/'+id+'/'+ page +'/6',
            success : function(data) {
                    $(".container-fluid").html(data)
                    document.getElementsByClassName('navbar')[1].style.display='none';
                    $(".container-fluid").css('margin-top','90px')
                    if(($('.tbodyy').find('tr').length)===0){
                        $("#h1").removeClass("d-none");
                    }
            },
            error : function(response) {
                alert("error")
            }
        });
    }
 </script>
