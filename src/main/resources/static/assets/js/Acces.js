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
    getStat111();
   
}
function getStat111() {
	var date1 =$("#date1").val();
	var date2 = $("#date2").val();
//	var type_date = $("input[name=inlineRadioOptions]:checked").val();


	if(!date1 || !date2){
	Swal.fire("Attention!","Merci de saisir une date valide","error");
	return false;
	}

	$.ajax({
	url:"/api/statistique/getAcceptabilitesparcategorie",
	type:"GET",

	data:{
	"date1":date1,
	"date2":date2,
//	"type_date":type_date
	}
      }).done(function(data){
         if(data.length==0){
              Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
              return false;
          }

          var dataProvider = [];

          $(data).each(function(idx,el){
             
              dataProvider.push({
            	  "etat"  : el[0],
                  "AAE"   : el[1],
                  "DAE"  : el[2]
                  
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
                  "valueField": "AAE",
                  "valueField": "DAE",
                  "titleField": "etat",
                  "legend": {
                      "useGraphSettings": false,
                      "position":"right",
                      "fontSize":14,
                  },
                  "balloon": {
                      "fixedPosition": true
                  },
                  "export": {
                      "enabled": false
                  }
              });
          }else if(chart=="2"){
              var chart = AmCharts.makeChart("resultat", {
                  "type": "serial",
                  "theme": "none",
                  "marginRight": 70,
                  "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff","#0040ff","#0000ff"],
                  "dataProvider": dataProvider,
                  "hideCredits":true,
                  "valueAxes": [{
                      "axisAlpha": 0,
                      "position": "left",
                      "title": "Nombre d’Avis et de Décision d’Acceptabilité Environnementale(AAE/DAE) ",
                      
                  }],
                  "startDuration": 1,
                  "graphs": [ {
                      "balloonText": "[[title]]:[[value]]",
                      "fillAlphas": 0.8,
                      "lineAlpha": 0.2,
                      "title": "AAE",
                      "type": "column",
                      "valueField": "AAE"
                  }, {
                      "balloonText": "[[title]]:[[value]]",
                      "fillAlphas": 0.8,
                      "lineAlpha": 0.2,
                      "title": "DAE",
                      "type": "column",
                      "valueField": "DAE"
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
                  "export": {
                      "enabled": false
                  }

              });
          }else if (chart=="3"){
              var tr = "";
              $(dataProvider).each(function(ind,el){
                  tr+="<tr><td>"+el.etat+"</td><td>"+el.AAE+"</td><td>"+el.DAE+"</td></tr>";
              })

              var tab1 = '<button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button>' +
                  '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                  '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                  '<thead class="bg-vert text-white"> <tr> <th>Etat</th> <th>Nombre d\'AAE</th> <th>Nombre d\'DAE</th> </tr>' +
                  '</thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
              
             
             

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