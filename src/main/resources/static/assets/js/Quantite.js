function fun_change2(id,val){
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
    getQuantite();
   
}
function getQuantite() {

    var annee = new Array();
    var annee = $("#annee").val();

    if(annee == 0){
        Swal.fire("Attention!","Merci de saisir une année valide","error");
        return false;
    }

    $.ajax({
        url:"/api/statistique/numberQuantite",
        type:"GET",
        data:{
            "annee":annee
        }
    }).done(function(data){
        if(data.length==0){
            Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
            return false;
        }

        var dataProvider = [];

        $(data).each(function(idx,el){

            dataProvider.push({
                "date": el[0],
                "Quantité_estimée": el[1],
                "Quantité_réel": el[2],

            });
        });
        var chart = $("#affiche_shart").val();

        if(chart=="2"){
            var chart = AmCharts.makeChart("resultat", {
                "type": "serial",
                "theme": "none",
                "marginRight": 70,
                "hideCredits":true,
                "colors": ["#80cbc4","#00897b","#004d40"],
                "dataProvider": dataProvider,
                "valueAxes": [{
                    "axisAlpha": 0,
                    "position": "left",
                    "title": "Quantité estimée avec quantité réelle par mois",

                }],
                "startDuration": 1,
                "graphs": [ {
                    "balloonText": "[[title]]:[[value]]",
                    "fillAlphas": 0.8,
                    "lineAlpha": 0.2,
                    "title": "Quantité_estimée",
                    "type": "column",
                    "valueField": "Quantité_estimée"
                }, {
                    "balloonText": "[[title]]:[[value]]",
                    "fillAlphas": 0.8,
                    "lineAlpha": 0.2,
                    "title": "Quantité_réel",
                    "type": "column",
                    "valueField": "Quantité_réel"
                }],
                "legend": {
                    "useGraphSettings": true,
                },
                "chartCursor": {
                    "categoryBalloonEnabled": false,
                    "cursorAlpha": 0,
                    "zoomable": false
                },
                "categoryField": "date",
                "categoryAxis": {
                    "gridPosition": "start",
                    "labelRotation": 45
                },
                "export": {
                    "enabled": false
                },
                "titles": [
                    {
                        "text": "Quantité estimée avec quantité réelle par mois",
                        "color":"#003399",
                        "size": 20
                    }
                ],
            });
        }else if (chart=="3"){
            var tr = "";
            $(dataProvider).each(function(ind,el){
                tr+="<tr><td>"+el.date+"</td><td>"+el.Quantité_estimée+"</td><td>"+el.Quantité_réel+"</td></tr>";
            })

            var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Quantité estimée avec quantité réelle par mois</p> ' +
                '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover"> ' +
                '<thead class="text-white"> <tr style="background-color: #1b5e20; color: white"> <th>Mois</th> <th>Quantité_estimée</th><th>Quantité_réel</th> </tr>' +
                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div></div>';

            $("#resultat").html(tab1);
        }


    }).fail(function(){
        alert("error");
    })
  }

var tableToExcel = (function() {
    var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
        , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
    return function(table, name) {
        if (!table.nodeType) table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        window.location.href = uri + base64(format(template, ctx))
    }
})()