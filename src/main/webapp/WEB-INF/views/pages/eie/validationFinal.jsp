

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

  <div class="main-panel " style="margin-top:120px">
  <div class="content-wrapper">
		
<div class="row" style="display:flex;">
                
<div class="col-md-12 col-sm-12 col-lg-12" style="margin-top: 13px;display:flex;" >

     
  

         <!-- debut from etat dossier -->
                      <div class="col-12 from_add" id="frm_etatDoss"  style="margin-top: 43px;">
    					           <div class="row p-0 m-0 justify-content-center">
                           <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
                              <div class="photo  hvr-buzz-out" >
                                  <i class="mdi icc mdi-folder-multiple menu-icon"></i>
                              </div>
                              <form name="doc" id="doc">
                                <div class="card">
                                   <div class="row justify-content-center">
                                    <div class="progress">
                                      <div class="progress-bar" role="progressbar" style="width: 29%;" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">
                                        
                                      </div>
                                    </div>
                                    
                                          <div class="col-10 mt-4">
                                          
                                            <h5 style="float:right;color:black"><spring:message code="label.Validation"/></h5>
                                            <div class="row p-0 m-0 mt-5">
                               <div class="form-group mt-5" style="width: 100%;">
    
    <select class="form-control" id="exampleFormControlSelect1" onchange="addStatut(this.value)">
      <option value="1"><spring:message code="label.Favorable"/></option>
      <option value="2"><spring:message code="label.Defavorable"/></option>
      
    </select>
    <div class="form-group dt">
    <label for="exampleFormControlInput1"><spring:message code="label.Datedebut"/></label>
    <input type="date" class="form-control dt" id="date1" placeholder="">
  </div>
  <div class="form-group dt">
    <label for="exampleFormControlInput1"><spring:message code="label.DateFin"/></label>
    <input type="date" class="form-control dt" id="date2" placeholder="">
  </div>
  
  <div class="form-group hidden st">
    <label ><spring:message code="label.Commentaire"/></label>
      <textarea type="text" class="form-control st "  rows="3"></textarea>
  </div>
  </div>
                              
                                              </div>
       
                                              
                                            </div>
                                            </div>
                                            <div class="row  mb-4" style="margin:14px;">
                                              <a  class="btn btn-primary btn-block " onclick="addEtat(${id},'valide')" > <spring:message code="label.Valider"/></a>
                                             <a class="btn btn-secondary btn-block"  href="/api/getListeAutorisation" style="background: #f95f5f;"><spring:message code="label.Annuler"/> </a>
                                           
                                          </div>
                                         </div>   
                                      </form>
                                      </div>
                                   </div>
              				</div>
                      
     </div> 
         
     </div> 
                                      
                                   </div> </div>
      <!-- main-panel ends -->
<jsp:include page="../../includes/footer.jsp" />

<script type="text/javascript">
function addStatut(etat){
	
	if(etat=="1"){
		$(".st").addClass("hidden");
		$(".dt").removeClass("hidden");
	}
	else if(etat=="2"){
		$(".dt").addClass("hidden");
		$(".st").removeClass("hidden");
	}
	
}

function addEtat(id,etat){
	
	var date1=$("#date1").val();
	var date2=$("#date2").val();

	$.ajax({
		 type: "POST",     
        url :"/api/addEtatFinal/"+id,
        
        data : {
        	"etat":etat,
        	"date1":date1,
        	"date2":date2
        	
        },
        
		success : function(response) {
			window.location="/api/getListeAutorisation";
		},
		error : function(response) {
			alert(' ajout non effectué');
		}
	}); 
	
}
</script>
