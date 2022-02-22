




function addObject(form,table,url) {
    $.fn.serializeObject = function () {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

var obj = $("#"+form).serializeObject();
$.ajax({
type: "POST",
url: "/api/add_object/"+table ,
contentType: 'application/json; charset=utf-8',
data: JSON.stringify(obj),
success: function (response) {
	getFunctionParam(url);
},
error: function (response) {

alert('Erreur ajout non effectue');

}
});


}
// $.fn.serializeObject = function () {
// 	var o = {};
// 	var a = this.serializeArray();
// 	$.each(a, function () {
// 	if (o[this.name]) {
// 	if (!o[this.name].push) {
// 	o[this.name] = [o[this.name]];
// 	}
// 	o[this.name].push(this.value || '');
// 	} else {
// 	o[this.name] = this.value || '';
// 	}
// 	});
// 	return o;
// 	};
//

// add datatable

$(document).ready(function() {
    $ ('table:not(.my_table)').DataTable ({
        "autoWidth": false,
        "searching": false,
        "bLengthChange": false,
        "ordering": false,
        "paging": false,
        "responsive": true,
        fixedColumns: {
            rightColumns: 1
        },
        language: {
            "sProcessing": "Traitement en cours...",
            "sSearch": "Rechercher&nbsp;:",
            "sLengthMenu": "",
            "sInfo": "",
            "sInfoEmpty": "",
            "sInfoFiltered": "",
            "sInfoPostFix": "",
            "sLoadingRecords": "",
            "sZeroRecords": "",
            "sEmptyTable": "",
            "oPaginate": {
                "sFirst": "Premier",
                "sPrevious": "Pr&eacute;c&eacute;dent",
                "sNext": "Suivant",
                "sLast": "Dernier"
            },
            "oAria": {
                "sSortAscending": ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            },
            "select": {
                "rows": {
                    _: "%d lignes séléctionnées",
                    0: "Aucune ligne séléctionnée",
                    1: "1 ligne séléctionnée"
                }
            }
        }
    });

});



/*
function info(id)
{

    $("#bodymodal").show();
    $("#repotreunion").hide();
    //var url = "/getdemandeinfo/"+id ;
    $.get(url, function(rep) {

        console.log(rep);
       /!* var table = $('#tabinfo').DataTable();

            table.destroy();

        $("#ttp").text(rep.demandeInformation.intitule_projet);
        $("#ptt").text(rep.demandeInformation.petitionaire);
        $("#rn").text(rep.nom_fr);
        $("#iddemanderepp").val(rep.demandeInformation.id_demande_information);
        $("#idreuniond").val(rep.id_reunion);*!/


        $('.modalinfo').modal({
            show: true
        });

    })



}
*/

function tcheckdatereunion(){


    var date = $("#date_reunion").val();
    $.get("/tcheckdatereunion/"+date , function(rep) {

        if(rep>0){
            swal({
                title: ' Date de la réunion',
                text: " Date déjà programmée",
                type: 'warning'
            }, function () {

            });
            $(".suivantreunion").attr("disabled",true);

        }else{
            $(".suivantreunion").attr("disabled",false);
        }

    });
}

function tcheckdatevisite(){
    var date = $("#date_visite").val();
    $.get("/tcheckdatevisite/"+date , function(rep) {

        if(rep>0){
            swal({
                title: 'Date de la  visite',
                text: "La date de la visite est déjà planifié",
                type: 'warning'
            }, function () {

            });
            $(".suivantvisite").attr("disabled",true);

        }else{
            $(".suivantvisite").attr("disabled",false);
        }

    });
}
