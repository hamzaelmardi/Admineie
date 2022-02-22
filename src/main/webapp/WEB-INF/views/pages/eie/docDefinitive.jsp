
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<spring:url value="/resources/" var="resources" />

<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<style>
    .titre_abs{
        position: absolute;
        top: -15px;
        display: block;
        background:  #d59d32;
        padding: 10px 20px;
        border-radius: 6px;
        color: white;
    }
    @media (max-width: 1200px){
        .myH3{
            font-size: 13pt;
            margin-left: 9rem;
        }
    }
</style>

<c:if test="${pageContext.response.locale=='ar' }">
    <c:set var="dd" value="data-dir='RTL'"/>
    <style>.select2-results__option{text-align:right}	</style>
</c:if>
<c:if test="${pageContext.response.locale!='ar' }">
    <c:set var="dd" value="data-dir='LTR'"/>
    <style>.select2-results__option{text-align:left}	</style>
</c:if>

<div class=" container-fluid page-body-wrapper">
    <div class="main-panel l bg-white col-12" style="margin-top: 175px">
        <div class="row justify-content-center">
            <div class="col-md-12 col-sm-12 col-lg-11 mt-3" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"
                <c:set var="p_page" value="Verification des documents définitives"/>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb ml-4">
                        <li class="breadcrumb-item" style="${pageContext.response.locale=='ar'?'margin-right: -4% !important;':'margin-left: -4% !important;'}"><a href="/api/getMenu"><i class="fa fa-home pt-3 Pl-2"></i></a></li>
                        <c:if test="${type=='EE'}">
                            <spring:message code="label.Etudedimpactenvirementale" var="pp_page"/>
                        </c:if>
                        <c:if test="${type=='NT'}">
                            <spring:message code="label.Noticedimpact" var="pp_page"/>
                        </c:if>
                        <c:if test="${type=='AE'}">
                            <spring:message code="label.Auditenvirementale" var="pp_page"/>
                        </c:if>
                        <c:set var="url_mini" value="/api/getEie/${type}/0/6/0"/>
                        <li class="breadcrumb-item"><a href="${url_mini}">${pp_page}</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${p_page}</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col-12 from_add" id="frm_etatDoss">
                <div class="row p-0 m-0 justify-content-center">
                    <div class="col-md-8 mt-5 col-sm-12 grid-margin" >
                        <div class="photo  hvr-buzz-out" >
                            <i class="mdi icc mdi-file-document-box-check menu-icon"></i>
                        </div>
                        <div class="card">
                            <div class="row justify-content-center">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" style="width: 29%; background-color: seagreen" aria-valuenow="29" aria-valuemin="0" aria-valuemax="100">

                                    </div>
                                </div>

                                <div class="col-10 mt-4">
                                    <h3 class="ml6 float-right" style="color:#336c4e !important; margin-top: -5px">
                                                      <span class="text-wrapper">
                                                                <span class="letters"><span class="letters"><spring:message code="label.Verificationdesdocumentsvalides"/></span></span>
                                                      </span>
                                    </h3>
                                    <div class="row p-0 m-0 mt-5">
                                    </div>
                                    <form dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" class="form-horizontal mt-3" action="/api/changerStatut/${iddemande}/${type}" id="deposestatut" name="deposestatut" method="post">

                                        <div class="row mt-5 justify-content-center">
                                            <div class="col-xl-6 col-lg-12 col-md-6 col-sm-12 mt-2">
                                                <a target="_blank" href="${fn:replace(demande.url_enquette_defenitive,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-block"> <span class="fa fa-download ml-2"></span><spring:message code="label.EtudedImpactsurlEnvironnementdefinitive"/> </a>
                                            </div>
                                            <div class="col-xl-6 col-lg-12 col-md-6 col-sm-12 mt-2">
                                                <a target="_blank" href="${fn:replace(demande.url_cachier_defenitive,"/assets/myFile/","/dowload_uploaded/")}" class="btn btn-primary btn-block"> <span class="fa fa-download ml-2"></span> <spring:message code="label.Cahierdeschargesdefinitif"/> </a>
                                            </div>
                                        </div>


                                        <div class="row m-0 p-0 mt-3" style="text-align: ${pageContext.response.locale=='ar'?'right':'left'}">
                                            <div class="col-xl-6 col-lg-12 col-md-6 col-sm-12">
                                                <label ><spring:message code="label.Statut"/> </label>
                                                <select  name="etat"  class="form-control select2" data-width="100%" style="height: 100px !important" ${dd}>
                                                    <option value=""><spring:message code="label.Choisir"/></option>
                                                    <option  value="5"><spring:message code="label.Enattentedesignature"/> </option>
                                                    <option  value="10"><spring:message code="label.Documentameliore"/> </option>



                                                </select>
                                            </div>
                                            <div class="col-xl-6 col-lg-12 col-md-6 col-sm-12">
                                                <label ><spring:message code="label.Commentaire"/>  </label><br/>
                                                <textarea rows="3" class="form-control" name="cause" id="causereuni" ></textarea>
                                            </div>
                                        </div>


                                        <div class="row m-0 p-0 mt-5">
                                            <div class="col-3">
                                            </div>
                                            <div class="col-6" style="text-align: center">
                                                <button style="margin-top: 10px;margin-bottom: 10px;"  type="submit"     class="btn btn-success" ><spring:message code="label.Modifier"/></button>

                                            </div>
                                            <div class="col-3">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%-- <div class="col-md-12 div2 bg-white" style="margin-top: 10%;">

             <div class="tab-content tab-content-vertical">
                 <div class="tab-pane fade active show" id="home-2" role="tabpanel" aria-labelledby="home-tab-vertical">
                     <div class="row m-0 p-0 zone_table ">
                         <div class="col-2 m-0 p-0"></div>
                         <div class="col-8 m-0 p-0">


                             <form  class="form-horizontal mt-3" action="/api/changerStatut/${iddemande}" id="deposestatut" name="deposestatut" method="post">



                                 <div class="row m-0 p-0 mt-5">
                                     <div class="col-6">
                                         <label ><spring:message code="label.Statut"/> : </label>
                                         <select  name="etat"  class="form-control select2" data-width="100%" >
                                             <option value=""><spring:message code="label.Choisir"/></option>
                                             <option  value="5"><spring:message code="label.Enattentedesignature"/> </option>
                                             <option  value="10"><spring:message code="label.Documentameliore"/> </option>



                                         </select>
                                     </div>
                                     <div class="col-6">
                                         <label ><spring:message code="label.Commentaire"/>  </label><br/>
                                         <textarea rows="2" class="form-control" name="cause" id="causereuni" ></textarea>
                                         <input type="hidden" class="form-control" name="commentaire"   ></input>
                                     </div>
                                 </div>


                                 <div class="row m-0 p-0 mt-5">
                                     <div class="col-3">
                                     </div>
                                     <div class="col-6" style="text-align: center">
                                         <button style="margin-top: 10px;margin-bottom: 10px;"  type="submit"     class="btn btn-success" ><spring:message code="label.Modifier"/></button>

                                     </div>
                                     <div class="col-3">
                                     </div>
                                 </div>
                             </form>

                         </div>
                         <div class="col-2 m-0 p-0"></div>
                     </div>
                 </div>
             </div>

         </div>--%>
    </div>

</div>







<script type="text/javascript">
function addDoc(id,type,idInput){
	var data = new FormData();
		
		var ins = document.getElementById(idInput).files.length;
		
		for (var x = 0; x < ins; x++) {
			data.append("fileToUpload", document.getElementById(idInput).files[x]);
		}
		

		$.ajax({
			
			 type: "POST",
	         enctype: 'multipart/form-data',
	         url : "/api/addDoc/"+id+"/"+type,
	         data: data,
	         processData: false,
	         contentType: false,
	         cache: false,
			success : function(response) {
				
			    



			},
			error : function() {

	            

			}
		}); 
	}
</script>

<jsp:include page="../../includes/footer.jsp" />
