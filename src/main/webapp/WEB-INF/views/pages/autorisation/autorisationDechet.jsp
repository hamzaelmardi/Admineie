
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />

<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <div class="card">
            <div class="row pl-4 pr-4">
              <div class="card-body bg-white">
                       
                    <div class="col-md-12 div1 pl-0">

                      <ul class="nav nav-tabs nav-tabs-vertical my_tab rounded" role="tablist" style="display: -webkit-inline-box;width: 100%;">
                          <li class="nav-item col-4 p-0" style="" onclick="init_left_menu('home-2')">
                            <a  class="nav-link nav-links  mini_text" id="home-tab-vertical" data-toggle="tab" href="#home-2"  role="tab" aria-controls="home-2" aria-selected="false">
                            
                            <i class="mdi mdi-delete-variant text-info ml-2" ></i>
                           <spring:message code="label.ImportationdesdechetsZonefranche"/> <span class="badge bd badge-info" >4</span>
                            
                            </a>
                          </li>
                          <li class="nav-item col-4 p-0" onclick="init_left_menu('profile-2')">
                            <a class="nav-link nav-links active mini_text" id="profile-tab-vertical" data-toggle="tab"  href="#profile-2"  role="tab" aria-controls="profile-2" aria-selected="true">
                           
                           
                           <i class="mdi mdi-gavel text-danger ml-2"></i>
                            <spring:message code="label.Etudedimpactenviromentale"/>  <span class="badge bd badge-danger">2</span>
                            

                            </a>
                          </li>
                          <li onclick="init_left_menu('contact-2')" class="nav-item col-4 p-0" >
                            <a class="nav-link nav-links mini_text" id="contact-tab-vertical" data-toggle="tab" href="#contact-2" role="tab" aria-controls="contact-2" aria-selected="false">
                             <i class="mdi mdi-factory text-success ml-2"></i>
                          <spring:message code="label.Autorisationsrelativesalutilisationdesproduitschimique"/>    <span class="badge  bd badge-success">8</span>
                           
                            </a>
                          </li>
                        </ul>
                      </div>
              </div>
            </div>
          </div></div>

   
<jsp:include page="../../includes/footer.jsp" />


