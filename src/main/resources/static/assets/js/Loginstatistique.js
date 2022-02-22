function fun_change(id,val){
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
    getStat1();

}

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
    getStat3();
}

function getStat1() {
	var date1 =$("#date1").val();
	var date2 = $("#date2").val();
	var type=new Array();
	type= $("#type").val();

	var type_date = $("input[name=inlineRadioOptions]:checked").val();


	if(!date1 || !date2){
	Swal.fire("Attention!","Merci de saisir une date valide","error");
	return false;
	}

	$.ajax({
	url:"/api/statistique/acceuilStatByDate",
	type:"GET",

	data:{
	"date1":date1,
	"date2":date2,
	"type":type,
	"type_date":type_date
	}
      }).done(function(data){
         if(data.length==0){
              Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
              return false;
          }

          var dataProvider = [];

          $(data).each(function(idx,el){

              dataProvider.push({
                  "nbr"   : el[0],
                  "etat"  : el[1]
              });
          });
          var chart = $("#affiche_shart").val();

          if(chart=="1"){
              var chart = AmCharts.makeChart("resultat", {
                  "type": "pie",
                  "theme": "none",
                  "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                  "labelRadius": -35,
                  "labelText": "[[percents]]%",
                  "dataProvider": dataProvider,
                  "valueField": "nbr",
                  "titleField": "etat",
                  "legend": {
                      "position":"right",
                      "color":"#003399",
                      "fontSize":14,
                      "markerDisabledColor":"#AAB3B3"
                  },
                  "balloon": {
                      "fixedPosition": true
                  },
                  "export": {
                      "enabled": false
                  },
                  "hideCredits":true,
              });
          }else if(chart=="2"){
              var chart = AmCharts.makeChart("resultat", {
                  "type": "serial",
                  "theme": "none",
                  "marginRight": 70,
                  "hideCredits":true,
                  "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                  "dataProvider": dataProvider,
                  "valueAxes": [{
                      "axisAlpha": 0,
                      "position": "left",
                      "title": "Nombre d'autorisation",

                  }],
                  "startDuration": 1,
                  "graphs": [{
                      "balloonText": "<b>[[etat]]: [[nbr]]</b>",

                      "fillAlphas": 0.9,
                      "lineAlpha": 0.2,
                      "type": "column",
                      "valueField": "nbr"
                  }],
                  "chartCursor": {
                      "categoryBalloonEnabled": false,
                      "cursorAlpha": 0,
                      "zoomable": false
                  },
                  "categoryField": "etat",
                  "categoryAxis": {
                      "gridPosition": "start",
                      "labelRotation": 45
                  },
                  "legend": {
                      "useGraphSettings": true,
                  },
                  "export": {
                      "enabled": false
                  }

              });
          }else if (chart=="3"){
              var tr = "";
              $(dataProvider).each(function(ind,el){
                  tr+="<tr><td>"+el.etat+"</td><td>"+el.nbr+"</td></tr>";
              })

              var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                  '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                  '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                  '<thead class="bg-vert text-white"> <tr> <th>Etat</th> <th>Nombre d\'autorisations</th> </tr>' +
                  ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

              $("#resultat").html(tab1);
          }


      }).fail(function(){
          alert("error");
      })
  }


function getStat2() {

    var date1 =$("#date1").val();
    var date2 = $("#date2").val();
    var type = $("#type").val();
    alert(type);
    $.ajax({
        url:"/api/acceuilStatByDate",
        type:"post",

        data:{
            "date1":date1,
            "date2":date2,
            "type":type,
        }
    }).done(function(data){


        var dataProvider = [];

        $(data).each(function(idx,el){
            console.log(el)
            dataProvider.push({
                "nbr"   : el[0],
                "etat"  : el[1],
            });
        });

        var chart = AmCharts.makeChart("resultat", {
            "type": "pie",
            "theme": "none",
            "dataProvider": dataProvider,
            "valueField": "nbr",
            "titleField": "etat",
            "hideCredits":true,
            "balloon": {
                "fixedPosition": true
            },
            "export": {
                "enabled": false
            }
        });


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

function getStat3() {
    var annee = new Array();
    var annee = $("#annee").val();

    if(annee == 0){
        Swal.fire("Attention!","Merci de choisir une année valide","error");
        return false;
    }

    $.ajax({
        url:"/api/acceuilStatReunion",
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
                "examen": el[0],
                "reexamen": el[1]
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
                    "title": "Nombre de réunions ",

                }],
                "startDuration": 1,
                "graphs": [{
                    "balloonText": "[[title]]:[[value]]",
                    "fillAlphas": 0.8,
                    "lineAlpha": 0.2,
                    "title": "Examen",
                    "type": "column",
                    "labelText": "[[title]]",
                    "valueField": "examen",
                }, {
                    "balloonText": "[[title]]:[[value]]",
                    "fillAlphas": 0.8,
                    "lineAlpha": 0.2,
                    "title": "Réexamen",
                    "type": "column",
                    "labelText": "[[title]]",
                    "valueField": "reexamen"
                }],
                "legend": {
                    "useGraphSettings": true,
                    "position":"right",
                    "color":"#003399",
                    "fontSize":14,
                    "markerDisabledColor":"#AAB3B3"
                },
                "export": {
                    "enabled": false
                },
                "titles": [
                    {
                        "text": "Nombre de réunions",
                        "color":"#003399",
                        "size": 20
                    }
                ],
                "chartCursor": {
                    "categoryBalloonEnabled": false,
                    "cursorAlpha": 0,
                    "zoomable": false
                },
                "categoryAxis": {
                    "gridPosition": "start",
                    "labelsEnabled":false
                }

            });
        }else if (chart=="3"){
            var tr = "";
            $(dataProvider).each(function(ind,el){
                tr+="<tr><td>"+el.examen+"</td><td>"+el.reexamen+"</td></tr>";
            })

            var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre de réunions</p> ' +
                '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                '<thead class="text-white"> <tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="2" class="text-center">Année : ' + annee + '</th></tr>' +
                '<tr style="background-color: #1b5e20; color: white"> <th>Examen</th> <th>Réexamen</th></tr>' +
                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div></div>';

            $("#resultat").html(tab1);
        }


    }).fail(function(){
        alert("error");
    })
}





