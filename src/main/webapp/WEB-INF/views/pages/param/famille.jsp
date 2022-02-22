
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

            <div class="col-lg-12 grid-margin grid-margin-md-0">
              <div class="card crdt">
              <!-- debut from etat dossier -->
                      <div class="col-12 from_add" id="frm_etatDoss" style="display: none; margin-top: 43px;">
    					           <div class="row p-0 m-0 justify-content-center">
                           <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
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
                                            <h3 style="float:right;color:black">Region</h3>
                                            <div class="row p-0 m-0 mt-5">
                               
                              
                                              </div>
                                              
                                              
                                              <div class="row">
                                              <div class="col-12">
                                                <div class="form-group">
                                                  <label>Region</label>
                                                  <input  onchange="checkCode(this.value)" type="text" id="code" class="form-control">
                                                <label id="codeLabel" style="display:none">Region déja existe</label>
                                                <input   type="hidden" id="testAjout" value="0">
                                               
                                                
                                                </div>
                                              </div>
                                              </div>
                                              
                                              
                                            </div>
                                            </div>
                                            
                                         </div>
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
                                         <label>Region</label>
                                         <input type="text" name="desi" class="form-control">
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
                                   <h2>Région</h2>

                                 </div>
                                 <div class="col-9 ">
                                   <a class="btn btn-primary float-right text-white" onclick="frm_table('subtab_0','frm_etatDoss')">
                                     Nouvelle Région
                                   </a>
                                   <div class="dropdown float-right mr-2">
                                       <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                         Télecharger
                                       </a>

                                       <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                         <a class="dropdown-item" href="tab.pdf">PDF</a>
                                         <a class="dropdown-item" href="tab.docx">Word</a>
                                         <a class="dropdown-item" href="tab.xlsx">Excel</a>
                                       </div>
                                     </div>
                                     <button class="btn btn-primary float-right mr-2" onclick="frm_search('subtab_0')">
                                       Rechercher
                                     </button>
                                     <button data-backdrop="static" data-keyboard="false" class="btn btn-secondary float-right mr-2" data-toggle="modal" data-target="#exampleModal">
                                      <i class="fa fa-filter"></i> Filtrer
                                     </button>
                                 </div>
                               </div>
                             </div>

                           </div>

                           <!-- Modal -->
                           <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                             <div class="modal-dialog">
                             <div class="modal-content">
                             <div class="modal-header">
                             <h5 class="modal-title" id="exampleModalLabel">Filtrer</h5>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                             </button>
                             </div>
                             <div class="modal-body">
                             <div class="row text-dark">
                             <div class="col-12 table-responsive">
                             <table class="table table-bordered table-hover">
                                 <thead>
                                   <tr>
                                     <th>Colonne</th>
                                     <th>Etat</th>
                                   </tr>
                                 </thead>
                                 <tbody>
                                   <tr>z
                                     <td>Nom</td>
                                     <td>
                                       <div class="custom-control custom-checkbox custom-switch">
                                         <input name="col_0" type="checkbox" class="custom-control-input" id="col_0" checked>
                                         <label class="custom-control-label" for="col_0"></label>
                                       </div>
                                     </td>
                                   </tr>
                                   <tr>
                                     <td>Description</td>
                                     <td>
                                       <div class="custom-control custom-checkbox custom-switch">
                                         <input name="col_1" type="checkbox" class="custom-control-input" id="col_1" checked>
                                         <label class="custom-control-label" for="col_1"></label>
                                       </div>
                                     </td>
                                   </tr>
                                 </tbody>
                             </table>
                             </div>
                             </div>
                             </div>
                             <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                             <button type="button" class="btn btn-primary" data-dismiss="modal">Enregistrer</button>
                             </div>
                             </div>
                             </div>
                           </div>



                           <div class="row justify-content-center">
                             <div class="col-11 pt-4">
                                 <table id="tableProfils" class="table table-striped hover compact table-bordered text-md-nowrap">
                                     <thead class="thead-bleu">
                                       <tr>
                                         <th class="text-center">Région</th>
                                         
                                         <th class="text-center">Action</th>
                                       </tr>
                                     </thead>
                                     <tbody>
                                    
                                    <c:forEach items="${listF}" var="f">
                                    
                                    <tr id="tr-${f.regionId}">
                                          <td>${f.region}</td>
                                        
                             
                                         <td class="text-center">
                                           <ul class="list-inline m-0">
                                             <li class="list-inline-item">
                                               <button onclick="frm_table('subtab_0','frm_etatDoss')" class="btn btn-warning btn-sm rounded-circle tab_edit" type="button" data-toggle="tooltip" data-placement="top" title="Editer">
                                                 

                                               </button>
                                             </li>
                                             <li class="list-inline-item">
                                               <button onclick="delete_famille(${f.regionId})" class="btn btn-danger btn-sm rounded-circle tab_trash" type="button" data-toggle="tooltip" data-placement="top" title="Supprimer">
                                                 <div class="icon_trash_1">
                                                   
                                                 </div>
                                                 <div class="icon_trash_2 d-none">
                                                   
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
                           <div class="row justify-content-center">
                             <div class="col-11 mt-4">
                               <div class="row m-0 p-0 justify-content-end">
                                 <nav aria-label="Page navigation float-right mt-2">
                                   <ul class="pagination">
                                     <li class="page-item">
                                       <a class="page-link" href="#" aria-label="Previous">
                                         <span aria-hidden="true">&laquo;</span>
                                       </a>
                                     </li>
                                     <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                     <li class="page-item"><a class="page-link" href="#">2</a></li>
                                     <li class="page-item"><a class="page-link" href="#">3</a></li>
                                     <li class="page-item">
                                       <a class="page-link" href="#" aria-label="Next">
                                         <span aria-hidden="true">&raquo;</span>
                                       </a>
                                     </li>
                                   </ul>
                                 </nav>
                               </div>

                             </div>
                           </div>

                        </div>
                      </div>


 </div>

                        </div>
                      </div>





<script type="text/javascript">
function addFamille(){
	
	
	var data = new FormData();
	data.append("fileToUpload", document.getElementById('fileToUpload').files[0]);
	var code=$("#code").val();
	var nom=$("#nom").val();
	
	var inputData={
			
			"code":code,
			"nom":nom
			
	}
	data.append('famille', JSON.stringify(inputData));
	
	$.ajax({
		 type: "POST",
         enctype: 'multipart/form-data',
         url :"/addFamily",
         data: data,
         processData: false,
         contentType: false,
         cache: false,
         timeout: 600000,
		success : function(response) {
			
			$(".mpParam").html(response);
		},
		error : function(response) {

			alert('NOK');

		}
	}); /* }
	else if(t="non"){
		window.location.href="/index";
	}}) */
	 
	
}
	
	
	
	
	/*  delete famille  begin */
	
	function delete_famille(id){
		
		$.ajax({
			 type : "POST",
			 url :"/deleteFamille",
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
