
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
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

        <div class="col-12 from_add" id="frm_etatDoss" style="margin-top: 43px;">
          <div class="row p-0 m-0 justify-content-center">
            <div class="col-md-4 col-sm-12 grid-margin stretch-card " >
              <div class="photo  hvr-buzz-out" >
                <i class="mdi icc mdi-folder-multiple menu-icon"></i>
              </div>
              <form action="/api/addEtatFinalCollecte/${id}" method="post" enctype="multipart/form-data">
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

                          <div class="form-group dt" style="${pageContext.response.locale=='ar'?'text-align:right':'text-align:left'}">
                            <label><spring:message code="label.Statut"/>  </label>
                            <select required id="personne" class="form-control select2" name="etat" ${dd}>
                              <option value=""><spring:message code="label.Choisir"/></option>
                              <option value="25"><spring:message code="label.Favorable"/></option>
                              <option value="26"><spring:message code="label.Defavorable"/></option>
                            </select>
                          </div>

                          <div class="form-group dt">
                            <label><spring:message code="label.Datedebut"/></label>
                            <input type="date" class="form-control dt dateDebut" name="date1" id="datecoll1" placeholder="">
                          </div>
                          <div class="form-group dt">
                            <label><spring:message code="label.DateFin"/></label>
                            <input type="date" class="form-control dt" name="date2" id="datecoll2" placeholder="">
                          </div>

                          <div class="form-group" id="morale" style="display: none">
                            <label> <spring:message code="label.DocumentAttache"/>: </label>
                            <input accept=".doc,.docx,.pdf" id="doc" type="file" class="form-control" name="doc">
                          </div>

                        </div>

                      </div>
                    </div>
                  </div>
                  <div class="row  mb-4" style="margin:14px;">
                    <button class="btn btn-primary btn-block" type="submit" ><spring:message code="label.Valider"/> </button>
                      <a class="btn btn-primary btn-block"  href="/api/getListeCollecte/0/6/0"> <spring:message code="label.Retour"/></a>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <script>

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
    $(document).ready(function () {
      document.getElementById('date1').min = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];
    })

    function addEtat(id){

      var date1=$("#date1").val();
      var date2=$("#date2").val();

      $.ajax({
        type: "POST",
        url :"/api/addEtatFinalCollecte/"+id,

        data : {
          "date1":date1,
          "date2":date2

        },

        success : function(response) {
          window.location="/api/getListeCollecte/0/6/0";
        },
        error : function(response) {
          alert(' ajout non effectué');
        }
      });

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

    document.getElementById('personne').onchange = function(){
      if(this.value == 26){
        document.getElementById('morale').style.display = 'block';
      } else {
        document.getElementById('morale').style.display = 'none';
      }
    };

    function updatePdf(id) {

      fetch('/api/generate_pdf_collecte/'+id)
              .then(resp => resp.blob())
              .then(blob => {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.style.display = 'none';
                a.href = url;
                // the filename you want
                a.download = 'Collecte.pdf';
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
              })
              .catch(() => alert('oh no!'));


    }

  </script>

<jsp:include page="../../includes/footer.jsp" />
