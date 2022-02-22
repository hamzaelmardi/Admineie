<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<div class="col-12">
    <div class="card">
        <div class="card-body">
            <div id="resultat1" style="height: auto!important; min-height:50vh">
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {
        $.ajax({
            url:"/api/statistique/getDateExpirationInstall",
            type:"GET",
            data:{
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            var dataProvider = [];
            $(data).each(function(idx,el){
                dataProvider.push({
                    "num"    : el[0],
                    "date"   : el[1]
                });
            });

            var tr1 = "";
            $(dataProvider).each(function(ind,el){
                tr1+="<tr><td>"+el.num+"</td><td>"+el.date+"</td></tr>";
            })
            var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Dates d’expiration des autorisations de traitement des Déchets Dangereux</p>' +
                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                '<thead><tr class="bg-vert text-white"><th>Numéro de la demande</th><th>Date d\'expiration</th></tr>' +
                ' </thead> <tbody>'+tr1+' </tbody> </table> </div> </div>';

            $("#resultat1").html(tab1);

        }).fail(function(){
            alert("error");
        })
    });
</script>