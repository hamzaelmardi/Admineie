<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>

<div class="col-12">
    <div class="row justify-content-center">
        <div class="col-lg-12 grid-margin stretch-card mt-2">
            <div class="card">
                <div class="card-body">
                    <div id="resultat" style="height: auto!important; min-height:50vh">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

    $(document).ready(function (){
        $.ajax({
            url:"/api/pays",
            type:"GET",
            data:{
            },
            success:function(data) {
                getPaysExportation(data);
            },
            error:function() {
                alert("error");
            }
        });
    })

    function getPaysExportation(paysXD){
        $.ajax({
            url:"/api/statistique/getCodePaysXD",
            type:"GET",

            data:{
            }
        }).done(function(data){

            var dataProvider = [];

            $(data).each(function(idx,el){

                dataProvider.push({
                    "pays"   : el[0],
                    "code"   : el[1],
                    "type"   : el[2]
                });
            });
            $("#affiche_shart").val();

            var tr='';
            var tab1='';
            var tr2='';
            $(paysXD).each(function(ind,ell){
                var nom = ell;
                $(dataProvider).each(function(ind,el){
                    if(nom === el.pays)
                        tr+="<td>"+el.code+"</td><td>"+el.type+"</td></tr>";
                })
                if(tr!=''){
                    tr2+='<div class="row justify-content-center mt-4"><div class="col-md-8 col-sm-12"> <table class="table table-bordered"> ' +
                        '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Pays : '+nom+'</th></tr><tr class="bg-vert text-white"><th>Code</th><th>Type de déchet</th></tr>' +
                        ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
                    tr='';
                }
            })
            tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Les types des déchets autorisés à exporter pour chaque pays</p> '+tr2+'</div>';
            $("#resultat").html(tab1);

        }).fail(function(){
            alert("error");
        })
    }
</script>
