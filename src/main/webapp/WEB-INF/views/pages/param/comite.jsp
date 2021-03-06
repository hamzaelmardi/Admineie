
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<style>
    @media only screen and (max-width:449px) {
        h4 {
            font-size: 12pt;
        }
    }

</style>
<c:if test="${pageContext.response.locale=='ar' }">
    <style>
        .button {
            float: left;
        }
    </style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <style>
        .button {
            float: right;
        }
    </style>
</c:if>
<div class="col-12 from_add">

<c:choose>
<c:when test="${pageContext.response.locale=='ar'}">
	<c:set var="lng" value="nomComite_ar"/>
</c:when>
<c:otherwise>
<c:set var="lng" value="nomComite_fr"/>
</c:otherwise>
</c:choose>



 <%-- <c:set var="lng" value="nomComite_${pageContext.response.locale}"/> --%>



    <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px; padding-right: 20%; float: none;">
        <div class="row p-0 m-0 justify-content-center">
            <div class="col-xl-5 col-lg-7 mt-5 col-sm-12 mt-5" >

                    <div class="photo  hvr-buzz-out" >
                        <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                    </div>
                        <div class="card" >
                            <div class="row justify-content-center" >
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                    </div>
                                </div>

                                <div class="col-10 mt-4">
                                    <h3 class="ml6 float-right mb-1">
                                                      <span class="text-wrapper">
                                                        <span class="letters"><span class="letters"><spring:message code="label.Membresdecomite" /></span></span>
                                                      </span>
                                    </h3>                                    <div class="row p-0 m-0 mt-5">


                                    </div>

                                    <div class="row">

                                        <div class="col-6">
                                       
                                            <div class="form-group">
                                              
                                                <label>comit??</label>
                                                
                                                <input  required type="hidden" id="comiteId" value="${comite.comiteId}" class="form-control">

                                                <input  required type="text" id="nomComite_fr" value="${comite.nomComite_fr}" class="form-control">
                                            </div>

                                        </div>
                                        <div class="col-6" dir="rtl">
                                            <div class="form-group" dir="rtl">
                                                <label dir="rtl">????????????</label>
                                                <input  required type="text" id="nomComite_ar" value="${comite.nomComite_ar}" class="form-control">
                                            </div>

                                        </div></div>

                                    <div class="row">

                                        <div class="col-6">
                                            <div class="form-group">
                                                <label><spring:message code="label.Email" /></label>
                                                <input onchange="valideMe(this.value)" type="email" id="email" value="${comite.email}"
                                                         class="form-control" required="required">
                                                <small style="color: red;font-style: italic" id="spemail"></small>
                                            </div>

                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label><spring:message code="label.Adresse" /></label>
                                                <input  required type="text" id="adresse" value="${comite.adresse}" class="form-control">
                                            </div>

                                        </div>
                                        </div>
                                    <div class="row">

                                        <div class="col-6">
                                            <div class="form-group">
                                                <label><spring:message code="label.Telephone" /></label>
                                                <input required type="tel" id="tel" value="${comite.tel}" class="form-control" maxlength="10">
                                            </div>

                                        </div>

                                        <div class="col-6">
                                            <div class="form-group">
                                                <label><spring:message code="label.Type" /></label>
                                                <select  required id="type" class="form-select bg-light" onchange="changeType(this.value)" style="height: 40px">
                                                    <option selected value="1" ${comite.type=='1'?'selected':''}><spring:message code="label.Regionale" /></option>
                                                    <option value="2" ${comite.type=='2'?'selected':''}><spring:message code="label.Nationale" /></option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label><th ><spring:message code="label.Permanent"/></th></label>
                                                <select  required id="permanent" class="form-select bg-light" style="height: 40px">
                                                    <option value="oui" ${comite.permanent=='oui'?'selected':''}>${pageContext.response.locale=='ar'? "??????":"Oui"}</option>
                                                    <option value="non" ${comite.permanent=='non'?'selected':''}>${pageContext.response.locale=='ar'? "????":"Non"}</option>
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    
                                  
                                        <div class="row region1  ${comite.type.equals('2')?'hidden':''}">
                                            <div class="col-12" dir="ltr">
                                                    <div class="form-group" id="region_form_group">
                                                        <label><spring:message code="label.Region" /></label>

                                                    <select id="region" class="form-select bg-light" style="height: 40px">
                                                        <option  selected value="0"><spring:message code="label.Choisir" /></option>
                                                        <c:forEach items="${region }" var="r">
                                                            <option value="${r.regionId}"
                                                                ${comite.region.regionId== r.regionId ?'selected':''}>${r.nom_fr }
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                            </div>
                                        </div>



                      </div>
                            </div>
                            <div class="row  mb-4" style="margin:14px;">
                                <a  class="btn btn-success btn-block" onclick="addComite()" ><spring:message code="label.Enregistrer" /> </a>
                                <a class="btn btn-danger-2 text-white btn-block" onclick="getFunctionParam('getParamComite')"><spring:message code="label.Annuler" /></a>

                            </div>
                        </div>

                </div>
            </div>
        </div>
        <!-- fin etat Dossier -->

            <div class="col-12 grid-margin z_tab" id="subtab_0">

                <div class="col-md-12 mt-4 col-lg-12" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" style="padding:0">


                    <div class="col-md-12 col-lg-12"
                         style="width: 98%;margin-left: auto;margin-right: auto;background: white;padding-top: 19px;border-radius: 5px;display:flex;">
                        <div id="gamesForm" style=" display:flex;">

                            <div class="row" style="width: 100%!important;">
                                <input name="selst" type="hidden" value="${statutEnc}">

                                <div class="col-lg-12 col-sm-12" style="margin-top: -2px">
                                    <div class="input-group">
                                        <input onkeyup="searchBy()" name="recherche" type="text" class="form-control" id="nomtr" placeholder="<spring:message code="label.rechercher" />">
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="row justify-content-center">

                        <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >

                            <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                            <div class="row p-4 justify-content-center">
                                <div class="col-8">
                                    <div class="row p-0">
                                        <div class="col-12 mt-4">
                                            <div class="form-group">
                                                <label>Comite</label>
                                                <input type="text" name="desi" class="form-control">
                                            </div>
                                        </div>

                                    </div>
                                    <div class="row p-0 justify-content-end">
                                        <div class="col-12">
                                            <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')"><spring:message code="label.rechercher" /></button>
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
                                        <span class="letters"><span class="letters"><spring:message code="label.Membresdecomite" /></span></span>
                                      </span>
                                    </h4>

                                </div>
                                <div class="col-9">
                                    <a class="button text-white fr_btn" onclick="frm_table('subtab_0','frm_etatDoss')">
                                        <span><spring:message code="label.NouveauMembre"/></span></a>
                                </div>

                            </div>
                        </div>

                    </div>





                    <div class="row justify-content-center">
                        <div class="col-12" id="tr">
                            <table id="example2" class="table tablee table-hover">
                                <thead  class="text-white">
                                <tr>        
                                    <th ><spring:message code="label.Membresdecomite" /></th>
                                    <th ><spring:message code="label.Email"/></th>
                                    <th ><spring:message code="label.Adresse"/></th>
                                    <th ><spring:message code="label.TelFax"/></th>
                                    <th ><spring:message code="label.Type"/></th>
                                    <th ><spring:message code="label.Region"/></th>
                                    <th ><spring:message code="label.Permanent"/></th>
                                    <th ><spring:message code="label.Action"/></th>
                	                   
                                     
                                    
                                </tr>
                                </thead>
                                <tbody class="tbodyy">

                                <c:forEach items="${comiteP}" var="f">

                                    <tr id="tr-${f.comiteId}">

                                    <%-- <td>${f.nomComite_fr}</td> --%>
                                    <td class="font-monospace">${f[lng]}</td>
                                    <td class="font-monospace">${f.email}</td>
                                    <td class="font-monospace">${f.adresse}</td>
                                    <td class="font-monospace">${f.tel}</td>
                                    <td class="font-monospace">${f.type.equals("1")?"R??gionale":"Nationale"}</td>
                                    <td class="font-monospace">${f.region.nom_fr}</td>
                                    <td class="font-monospace">
                                        <c:if test="${f.permanent.equals('non')}">
                                        <spring:message code="label.Non"/>
                                        </c:if>
                                        <c:if test="${f.permanent.equals('oui')}">
                                        <spring:message code="label.Oui"/>
                                        </c:if>
                                    </td>
                                    <td>
                                        <ul class="list-inline m-0">
                                            <li class="list-inline-item">
                                                <button onclick="editComite(${f.comiteId})" class="btn btn-outline-warning btn-sm rounded-circle tab_edit" type="button" title="Editer" style="background-color: white;">
                                                    <div class="icon_trash_1">
                                                        <span class="fas fa-pencil-alt" style="color: orange; font-size: 18px"></span>
                                                    </div>

                                                </button>
                                            </li>
                                            <li class="list-inline-item">
                                                <button onclick="deleteComite(${f.comiteId})" class="btn btn-outline-danger btn-sm rounded-circle tab_trash" type="button" title="Supprimer" style="background-color: white;">
                                                    <div class="icon_trash_1">
                                                        <span class="fas fa-trash" style="color: red; font-size: 18px"></span>
                                                    </div>
                                                </button>
                                            </li>
                                        </ul>
                                    </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>


                </div>
            </div>

</div>
<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">
    function addComite(){

        var nomComite_fr=$("#nomComite_fr").val();
        var nomComite_ar=$("#nomComite_ar").val();
        var email=$("#email").val();
        var adresse=$("#adresse").val();
        var tel=$("#tel").val();
        var type=$("#type").val();
        var permanent=$("#permanent").val();
        var comiteId=$("#comiteId").val();
        var region=$("#region").val();
        if(type=="2"){
            region="";
        }
        if(email=="" && !email.match(regex))
        {
            document.getElementById('spemail').innerHTML="Entrez Un Email Valid !!!!";
        }else{
            document.getElementById('spemail').innerHTML="";
        }
        if( !validateEmail(email)) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Email invalide !!!!!',
            });
            return false;
        }
        else{

if(region==0){
	var fournisseur={

	        "nomComite_fr":nomComite_fr,
	        "nomComite_ar":nomComite_ar,
	        "email":email,
	        "adresse":adresse,
	        "tel":tel,
	        "type":type,
	        "comiteId":comiteId,
	        "permanent":permanent
	        
	    }
}
else{
	var fournisseur={

	        "nomComite_fr":nomComite_fr,
	        "nomComite_ar":nomComite_ar,
	        "email":email,
	        "adresse":adresse,
	        "tel":tel,
	        "type":type,
	        "comiteId":comiteId,
	        "region":{regionId:region},
	        "permanent":permanent
	        
	    }
}
        


        $.ajax({
            type: "POST",

            url :"/api/addcomite",
            contentType : 'application/json; charset=utf-8',

            data : JSON.stringify(fournisseur),

            success : function(response) {

                $(".mpParam").html(response);
                getFunctionParam('getParamComite')
            },
            error : function(response) {

                alert('Erreur ajout non effectu??');

            }
        });


    }

    }


    /*  delete famille  begin */

    function deleteComite(id){
            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                type: 'Attention',
                showCancelButton: true,
                confirmButtonColor: '#42ba96',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.supprimer"/>',
                cancelButtonText: '<spring:message code="label.Annuler"/>'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/api/deleteComite/"+id,
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
                        '<spring:message code="label.Votrefichieraetesupprime"/>.',
                        'Succ??s',
                    )
                }
            })



        }

    function editComite(id){
        $.ajax({
            type: "GET",

            url :"/api/editComite/"+id,
            contentType : 'application/json; charset=utf-8',
            data:{
            },

            success : function(response) {

                $(".mpParam").html(response);
                $("#subtab_0").hide("slow");
                $("#frm_etatDoss").show("slow");
            },
            error : function(response) {

                alert('Erreur ajout non effectu??');

            }
        });
    }
    function searchBy() {

        var nom=$("#nomtr").val();

        if(nom==="" ){

            return false;
        }
        $.ajax({
            url: "/api/getComiteSearch/"+nom,
            type: "GET",

            data: {},


            success: function (response) {


                $("#tr").html(response);

            },
            error: function (response) {

                alert('Erreur ajout non effectu??');

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

    function changeType(id){
    	
        if(id=="1"){
        	
        	$(".region1").removeClass('hidden');

        }
        else{
        	$(".region1").addClass('hidden');
        }

    }

    function validation(){
        var email = document.getElementById('emails').value;
        if(email == null){
            document.getElementById('emails').innerHTML = "entrer email";
            return false;
        }
    }

</script>

