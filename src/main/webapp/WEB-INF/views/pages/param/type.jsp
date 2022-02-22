
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="col-lg-12 grid-margin grid-margin-md-0">
              <div class="card crdt">
              <!-- debut from etat dossier -->
                      <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px;">
    					           <div class="row p-0 m-0 justify-content-center">
                           <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
                              <div class="photo  hvr-buzz-out" >
                                  <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                              </div>
                              <form name="type" id="type">
                                <div class="card">
                                   <div class="row justify-content-center">
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">
                                        
                                      </div>
                                    </div>
                                    
                                          <div class="col-10 mt-4">
                                          
                                            <h3 style="float:right;color:black">Type</h3>
                                            <div class="row p-0 m-0 mt-5">
                               
                              
                                              </div>
                                              
                                              <div class="row">
                                              
                                              <div class="col-12" dir="rtl">
                                                <div class="form-group" dir="rtl">
                                                <select name="id_code" class="form-control">
                                                <c:forEach items="${code }" var="cl">
                                                <option value="${cl.id_code }">${cl.nom_fr }</option>
                                                </c:forEach>
                                                </select>
                                                 </div>
                                                
                                              </div></div>
                                              <div class="row">
                                              
                                              <div class="col-12">
                                                <div class="form-group">
                                                  <label>Type</label>
                                                  <input  required type="text" id="nom"  name="nom_fr" class="form-control">
                                               </div>
                                                
                                              </div></div>
                                              
                                              <div class="row">
                                              
                                              <div class="col-12" dir="rtl">
                                                <div class="form-group" dir="rtl">
                                                  <label dir="rtl">النوع</label>
                                                  <input  required type="text" name="nom_ar" class="form-control">
                                               </div>
                                                
                                              </div></div>
                                              
                                              
                                            </div>
                                            </div>
                                            <div class="row  mb-4" style="margin:14px;">
                                              <a  class="btn btn-primary btn-block " onclick="addObject('type','type','getParamType')" > Enregistrer</a>
                                             <a class="btn btn-secondary btn-block" onclick="traitement_(0)" style="background: #f95f5f;"> Annuler</a>
                                           
                                          </div>
                                         </div>   
                                      </form>
                                      </div>
                                   </div>
              				</div>
                      
                       <!-- fin etat Dossier -->

              
                <div class="card-body">


     <!-- Début tableau paramètre "Etat de dossiers"-->
                      <div class="col-12 grid-margin stretch-card z_tab" id="subtab_0"  >
                        <div class="card">
                        
                           <div class="row justify-content-center">
                           
                             <div class="col-4 pt-4 pb-2 mt-5 bg-light text-dark"  id="zone_search" style="text-align:center;display:none;" >
                               
                               <img  class="n3VNCb text-center" src="https://www.shareicon.net/data/512x512/2016/08/18/814342_suit_512x512.png" data-noaft="1" jsname="HiaYvf" jsaction="load:XAeZkd;" style="width: 100px; height: 100px; margin: 0px;">
                               <div class="row p-4 justify-content-center">
                                 <div class="col-8">
                                   <div class="row p-0">
                                     <div class="col-12">
                                       <div class="form-group">
                                         <label>R&eacute;gion</label>
                                         <input type="text" name="desi" class="form-control">
                                       </div>
                                     </div>
                                     
                                   </div>
                                   <div class="row p-0 justify-content-end">
                                     <div class="col-12">
                                       <button class="btn btn-primary btn-block" onclick="frm_search('subtab_0')">rechercher</button>
                                     </div>
                                   </div>
                                 </div>
                               </div>
                             </div>
                             <div class="col-11 pr-0">
                               <div class="row m-0 pt-5">
                                 <div class="col-3 pl-0">
                                   <h2>Type</h2>

                                 </div>
                                 <div class="col-9 ">
                                   <a class="btn btn-primary float-right text-white" onclick="frm_table('subtab_0','frm_etatDoss')">
                                     Nouveau Type
                                   </a>
                                   
                                     
                                 </div>
                               </div>
                             </div>

                           </div>

                          



                           <div class="row justify-content-center">
                             <div class="col-6 pt-4">
                                 <table style="margin-bottom:12px;" id="example" class="table table-striped table-bordered">
                                     <thead class="thead-bleu">
                                       <tr>
                                         
                                         <th class="text-center">Type</th>
                                         
                                         <th class="text-center">النوع</th>
                                         <th class="text-center">Code</th>
                                         <th class="text-center">Action</th>
                                       </tr>
                                     </thead>
                                     <tbody>
                                    
                                    <c:forEach items="${listF}" var="f">
                                    
                                    
                                         
                                         <td>${f.nom_fr}</td>
                                          <td>${f.nom_ar}</td>
                                          <td>${f.code.nom_ar}</td>
                             
                                         <td class="text-center">
                                           <ul class="list-inline m-0">
                                             <li class="list-inline-item">
                                               <button onclick="frm_table('subtab_0','frm_etatDoss')" class="btn btn-warning btn-sm rounded-circle tab_edit" type="button" data-toggle="tooltip" data-placement="top" title="Editer">
                                                 <div class="icon_trash_1">
                                                  <span class="fa fa-edit"></span>
                                                 </div>

                                               </button>
                                             </li>
                                             <li class="list-inline-item">
                                               <button onclick="delete_famille(${f.id_type})" class="btn btn-danger btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer">
                                                 <div class="icon_trash_1">
                                                  <span class="fa fa-close"></span>
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

                        </div>
                      </div>





<script type="text/javascript">
function addcode(){
	
	
	
	
	var nom=$("#nom").val();
	
	var fournisseur={
			
			
			"nom":nom
			
	}
	
	
	$.ajax({
		 type: "POST",
         
         url :"/addcode",
         contentType : 'application/json; charset=utf-8',
         
         data : JSON.stringify(fournisseur),
         
		success : function(response) {
			
			$(".mpParam").html(response);
		},
		error : function(response) {

			alert('Erreur ajout non effectué');

		}
	}); 
	 
	
}
	
	
	
	
	/*  delete famille  begin */
	
	function delete_famille(id){
            Swal.fire({
                title: '<spring:message code="label.etesvousure"/>',
                text: "<spring:message code="label.sivouscliquezsursupprimervousnepouvezpaslerecuperer"/>",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '<spring:message code="label.supprimer"/>!'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        type : "POST",
                        url :"/deletecode"+id,
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
                        '<spring:message code="label.supprimer"/>!',
                        '<spring:message code="label.Votrefichieraetesupprime"/>.',
                        'success',
                    )
                }
            })


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



 


 

