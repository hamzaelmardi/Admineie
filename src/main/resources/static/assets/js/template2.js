$(document).ready(function() {
      $('.dropdown-toggle').dropdown();
      $(".select2").select2();


      $(".tab_trash").on({
          mouseenter: function() {
            $(this).parent().find(".icon_trash_1").addClass('d-none');
            $(this).parent().find(".icon_trash_2").removeClass('d-none');

          },
          mouseleave: function() {
            $(this).parent().find(".icon_trash_2").addClass('d-none');
            $(this).parent().find(".icon_trash_1").removeClass('d-none');

          }
      });



    /*  $("#cancelBtnForm").on("click", function() {
        $('#frm_region').fadeOut('fast');
        $('#tblReuComm').fadeIn('fast');
      });*/

    });
    function frm_search(){
        if($("#zone_search:visible").length!=0)
          $("#zone_search:visible").hide('slow');
        else
          $("#zone_search").show('slow');
      }


    function frm_table(id_tab,id_form){
      $("#"+id_tab).hide("slow");
      $("#"+id_form).show("slow");
    }



      function delete_tr(val){
        swal({
        title: 'Êtes-vous sûr ?',
        text: "Vous ne pourrez pas revenir sur cela !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00695c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer !',
        cancelButtonText: "Annuler",
        closeOnConfirm: false,
        closeOnCancel: false
      }, function (isConfirm) {
          if (isConfirm) {
              swal("Supprimé!", "L'élément à bien été supprimé", "success");
              //tableProfils.row($(btn).parents('tr')).remove().draw(false);
              $(val).parents("tr:first").remove();
          } else {
              swal("Annulé!", "L'élément n'a pas été supprimé", "error");
          }
      });
    }


function remove_membre(val){
  $(val).parents(".row:first").remove();
}

function add_membre(){
  
  if(!$("#add_membre input").val()){
    swal('Le nom du Participant est obligatoire!');
    return false
  }
  $("#list_membre").append( '<div class="row p-0 m-0"><div class="col-11 pl-0"><input disabled type="text" name="" value="'+$("#add_membre input").val()+'" class="form-control"></div><div class="col-1 pr-0 pl-0"> <button onclick="remove_membre(this)" class="btn btn-danger btn-block" style="padding: 5px"><i class="mdi mdi-minus-circle" style="font-size: 25px"></i></button></div></div>');
  $("#add_membre input").val("");
}

function type_pers(val){
  $(".type_sts").hide('fast');
  var id = $(val).val();
  if(id!=0){
    $('#'+id).show('slow');
  }
}

function add_reunion(){
  var nbr = $("#result > .row").length

  if(nbr==0){
     nbr=nbr+1;
     nbr+='<sup>ère</sup>'
  }else{
    nbr=nbr+1;
    nbr+='<sup>ème</sup>'
  }
 
  var div= '<div class="row m-0 p-0 mt-5 mb-3">'+
'<div class="col-12" style="border: #aaa solid 1px;border-radius: 6px;">'+
'<h5 class="titre_abs">'+nbr+' reunion </h5>'+
'<div class="form-group mt-5">'+
'<label>Date</label>'+
'<input type="date" name="" class="form-control">'+
'</div>'+
'<div class="form-group">'+
'<label>Observations/résultats</label>'+
'<textarea class="form-control" rows="2"></textarea>'+
'</div>'+
'</div>'+
'</div>';
$("#result").append(div);
}

function lod_modal(ch){
  var title = '';
  var content = '';
  if(ch=='Participants'){
    title = "liste des Participants"
    content='<ul><li>Nom : khalid</li><li>telephone : 0612121200</li> <li>Adress : 12 rue 4 Paris</li> <li>Email : test@gmail.com</li> </ul>';
  }else if(ch=='Etapes'){
    title = "les différentes étapes d’examen de l’EIE";
    content='<table class="table table-striped table-hover table-bordered"> <thead> <tr> <th>Etape</th> <th>Date</th> <th>Observations/résultats</th> </tr> </thead> <tbody> <tr> <td>Récéption de l\'avis de projet</td> <td>2/12/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td>Trie et catégorie de projet</td> <td>13/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td>Cadrage</td> <td>14/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td>Récéption de l\'EIE</td> <td>15/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td>Récéption des rapports de l\'EP</td> <td>16/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td>Examen de l\'EIE</td> <td>16/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td> - 1<sup>ère</sup> réunion</td> <td>20/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td> - 2<sup>ème</sup> réunion</td> <td>21/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td> - 3<sup>ème</sup> réunion</td> <td>22/02/2020</td> <td>Observation et Résultat</td> </tr> <tr> <td> Avis de Comité</td> <td>23/02/2020</td> <td>Observation et Résultat</td> </tr> </tbody> </table>';
  }else{
    return false;
  }

  $("#mod_1_titre").text(title);
  $("#mod_1_content > *").remove();
  $("#mod_1_content").append(content);
  $("#mod_1").modal("show");
}