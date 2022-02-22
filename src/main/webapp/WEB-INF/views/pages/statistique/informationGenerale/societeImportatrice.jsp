<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<c:if test="${type.equals('1')}">
    <div class="col-12">
        <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <div id="w">
                            <div id="contente">
                            </div>
                        </div>
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select id="typeDechet" class="custom-select" style="width: 100%">
                                        <option value="0" selected="selected">Choisir</option>
                                        <option value="1">Dangereux</option>
                                        <option value="2">Non dangereux</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <button onclick="getSocieteImportatriceZF()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card mt-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                        <hr>
                        <div class="row " style="margin-top: 10%">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart3.png"  class="w-100 img_chart" width="70%"></label>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="1" id="affiche_shart">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div id="resultat" style="height: auto!important; min-height:50vh">
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${type.equals('2')}">
    <div class="col-12">
        <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <div id="w">
                            <div id="contente">
                            </div>
                        </div>
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select id="typeDechet" class="custom-select" style="width: 100%">
                                        <option value="0" selected="selected">Choisir</option>
                                        <option value="1">Dangereux</option>
                                        <option value="2">Non dangereux</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <button onclick="getSocieteExportateurXD()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card mt-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                        <hr>
                        <div class="row " style="margin-top: 10%">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart3.png"  class="w-100 img_chart" width="70%"></label>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="1" id="affiche_shart">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <div class="card">
                    <div class="card-body">
                        <div id="resultat" style="height: auto!important; min-height:50vh">
                        </div>
                    </div>
                </div>
        </div>
</c:if>

<c:if test="${type.equals('3')}">
    <div class="col-12">
        <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <div id="w">
                            <div id="contente">
                            </div>
                        </div>
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select id="typeDechet" class="custom-select" style="width: 100%">
                                        <option value="0" selected="selected">Choisir</option>
                                        <option value="1">Dangereux</option>
                                        <option value="2">Non dangereux</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <button onclick="afficheZonProducteur()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card mt-3">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                        <hr>
                        <div class="row " style="margin-top: 10%">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="custom-control">
                                        <label><img src="/assets/images/chart3.png"  class="w-100 img_chart" width="70%"></label>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" value="1" id="affiche_shart">
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <div class="card">
                    <div class="card-body">
                        <div id="resultat" style="height: auto!important; min-height:50vh">
                        </div>
                    </div>
                </div>
    </div>
</c:if>

<c:if test="${type.equals('4')}">
    <div class="col-12">
        <div class="row justify-content-center" style="height: auto!important; min-height:50vh">
            <div class="col-lg-6 grid-margin stretch-card mt-2">
                <div class="card">
                    <div class="card-body">
                        <div id="w">
                            <div id="contente">
                            </div>
                        </div>
                        <h5 style="text-align:center"><spring:message code='label.Autorisationdesdechets'/></h5>
                        <hr>
                        <form>
                            <div class="form-group">
                                <div class="col-auto">
                                    <label><spring:message code="label.typededechet"/> </label>
                                    <select  id="type"  class="form-control" style="width: 100%" onchange="selectStatutDossier(this)">
                                        <option value="0" selected="selected"><spring:message code='label.Choisir'/> </option>
                                        <option value="ZF"><spring:message code='label.ImportationDesDechetsEnZoneFranche'/> </option>
                                        <option value="ET"><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></option>
                                        <option value="IT"><spring:message code='label.Installationdetraitementdesdechets'/></option>
                                        <option value="CT"><spring:message code='label.CollecteTransport'/></option>
                                        <option value="XD"><spring:message code='label.ExportationDesDechetsDangereux'/></option>
                                        <option value="TR"><spring:message code='label.TransitDesDechets'/></option>

                                    </select>
                                </div>
                            </div>

                            <div class="col-auto" id="statut" >

                                <select id="statut_select" class="form-control">

                                </select>

                            </div>

                            <div class="form-group">
                                <button onclick="getStatutDossier()" type="button" class="btn btn-primary"><spring:message code='label.Rechercher'/></button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 grid-margin stretch-card mt-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title" style="text-align:center"><spring:message code='label.Typedaffichages'/></h4>
                            <hr>
                            <div class="row " style="margin-top: 10%">
                                <div class="col-md-4 pie1">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart1.png" class="w-100 img_chart" width="70%" onclick="fun_changesStatut(1,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 chart1">
                                    <div class="form-group">
                                        <div class="custom-control">

                                            <label><img src="/assets/images/chart2_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesStatut(2,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 tab1">
                                    <div class="form-group">
                                        <div class="custom-control">
                                            <label><img src="/assets/images/chart3_gris.png"  class="w-100 img_chart" width="70%" onclick="fun_changesStatut(3,this)"></label>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="1" id="affiche_shart">
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            <div class="card">
                <div class="card-body">
                    <div id="resultat" style="height: auto!important; min-height:50vh">
                    </div>
                </div>
            </div>
        </div>
</c:if>

<script>

    $(document).ready(function() {
        $(".select2").select2();
    });

    function selectStatutDossier(val){

        event.preventDefault();
        var type = $(val).val();
        if(type==="" || type==null){
            return false;
        }

        $.ajax({
            url: '/api/getStatutDossierBytype/'+type,
            type: 'post',
            dataType: "html",
            data: {},
        })
            .done(function(data) {

                $("#statut_select").html(data);
            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
                console.log("complete");
            });


    }
</script>