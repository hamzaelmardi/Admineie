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
            <div id="resultat" style="height: auto!important; min-height:50vh">
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function () {

        $.ajax({
            url:"/api/getSocietesCollecte",
            type:"GET",
            data:{
            },
            success:function(data) {
                getCodeTypeBySociete(data);
            },
            error:function() {
                alert("error");
            }
        });
    });


    function getCodeTypeBySociete(societe) {

        $.ajax({
            url:"/api/statistique/getTypeCodeSociete",
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
                    "societe"    : el[0],
                    "code"     : el[1],
                    "type"      : el[2]
                });
            });

                var tr = "";
                var tr2 = "";
                var tab1 = "";
                 $(societe).each(function (ind, ell) {
                     var nom = ell;
                     $(dataProvider).each(function (ind, el) {
                         if (nom === el.societe)
                             tr += "<td>" + el.code + "</td><td>" + el.type + "</td></tr>";
                     })
                     if (tr != '') {
                         tr2 += '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> <table class="table table-bordered"> ' +
                             '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Société : ' + nom + '</th></tr><tr class="bg-vert text-white"><th style="width: 20%">Code</th><th>Type de déchet</th></tr>' +
                             ' </thead> <tbody>' + tr + ' </tbody> </table> </div> </div>';
                         tr = '';
                     }
                 })
                 tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                     '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Types des déchets autorisés pour chaque société  </p> ' + tr2 + '</div>';
                 $("#resultat").html(tab1);

        }).fail(function(){
            alert("error");
        })
    }

    function fun_changes3CT(id,val){

        $(".img_chart").each(function(ind,el){
            var src = "";
            if((id-1)==ind){
                src="/assets/images/chart"+(ind+1)+".png";
            }else {
                src="/assets/images/chart"+(ind+1)+"_gris.png";
            }
            $("#affiche_shart").val(id);
            $(el).attr("src",src);

        });
        $(document).ready(function () {

            $.ajax({
                url:"/api/getSocietesCollecte",
                type:"GET",
                data:{
                },
                success:function(data) {
                    getCodeTypeBySociete(data);
                },
                error:function() {
                    alert("error");
                }
            });
        });
    }
</script>
