function setdemandeDocumentSigner(val,id_dmd){

    if (!val.files[0]) {
        return false;
    }

    var formdata = new FormData();
    formdata.append("fileToUpload",val.files[0]);


    $.ajax({
        url: '/api/setdemandeDocumentSigner/'+id_dmd,
        type:'POST',
        enctype: 'multipart/form-data',
        data: formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    })
        .done(function() {

        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}

function setdemandeDocument_decision(val,id_dmd){

    if (!val.files[0]) {
        return false;
    }

    var formdata = new FormData();
    formdata.append("fileToUpload",val.files[0]);


    $.ajax({
        url: '/api/setdemandeDocument_decision/'+id_dmd,
        type:'POST',
        enctype: 'multipart/form-data',
        data: formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    })
        .done(function() {

        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}

function setDocumentSigner(val,id_dmd,type){

    if (!val.files[0]) {
        return false;
    }

    var formdata = new FormData();
    formdata.append("fileToUpload",val.files[0]);


    $.ajax({
        url: '/api/setAutorisationDocumentSigner/'+id_dmd+"/"+type,
        type:'POST',
        enctype: 'multipart/form-data',
        data: formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    })
        .done(function() {
            swal("le fichier est enregistré avec succès");
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}

function addCategorieToDemande(val,id_dmd){
    var id_cat = $(val).val();
    $.ajax({
        url: '/api/addCategorieToDemande/'+id_dmd+'/'+id_cat,
        type:'POST',
        data:{

        },
    })
        .done(function(response) {
            $("#soucat").empty();
            $("#soucat").html(response);
            $("#soucat").trigger("change");
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}

function addSousCategorieToDemande(val,id_dmd){
    var id_souscat = $(val).val();
    $.ajax({
        url: '/api/addSousCategorieToDemande/'+id_dmd+'/'+id_souscat,
        type:'POST',
        data:{

        },
    })
        .done(function(response) {
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}


function save_addPVReunion(id_dmd,id_reunion,type){
    if(event!=null)
        event.preventDefault();
    var data = new FormData();
    var statu = $("#statut_pv").val();
    var ins_pv = document.getElementById("doc_pv").files.length;
    var ins_presence = document.getElementById("doc_presence").files.length;

    if($.trim(statu) === "" || statu == null || ins_pv === 0 || ins_presence === 0){
        Swal.fire(
            'Warning!',
            'Tous les champs sont obligatoires',
            'waarning'
        )
        return false;
    }

    var comment = $("#causereuni").val();
    var periode = $("#periode_send_rapport").val();
    var date_debut = $("#date_debut").val();
    var date_fin = $("#date_fin").val();


    for (var x = 0; x < ins_pv; x++) {
        data.append("fileToUpload_pv", document.getElementById("doc_pv").files[x]);
    }

    for (var x = 0; x < ins_presence; x++) {
        data.append("fileToUpload_presence", document.getElementById("doc_presence").files[x]);
    }

    if($.trim(periode)==="" || periode==null){
        periode = 0;
    }
    if($.trim(date_debut)==="" || date_debut==null){
        date_debut = "0";
    }
    if($.trim(date_fin)==="" || date_fin==null){
        date_fin = "0";
    }
    data.append("comment",comment);
    data.append("periode",periode);
    data.append("date_debut",date_debut);
    data.append("date_fin",date_fin)

    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/save_addPVReunion/"+id_dmd+"/"+id_reunion+"/"+statu,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success : function(response) {
           window.location.href="/api/getEie/"+type+"/0/6/0";
        },
        error : function() {
        }
    });
}

function reporterReunion(id_dmd,id_reunion){
    if(event !=null)
        event.preventDefault();
    var date = $("#date_reunion").val();
    var examen = $("#examen").val();
    var oui = $("#comiteOui").val();
    var non = $("#comiteNon").val();

    if( date==null || $.trim(examen)==="" ){
        swal("Avertissement ! ","La date est obligatoire","error");
        return false;
    }

    if(oui ==null || $.trim(oui)===""){
        oui = 0;
    }
    if( non==null || $.trim(non)==="" ){
        non = 0;
    }

    if( examen==null || $.trim(examen)==="" ){
        examen = 0;
    }

    var data = new FormData();
    data.append("date",date);

    $.ajax({
        url: '/api/reporterReunion/'+id_dmd+"/"+id_reunion+"/"+oui+"/"+non+"/"+examen+"/"+date,
        type: 'POST',
        data: {},
    })
        .done(function(response) {
            window.location.href = "/api/getEie/0/6/0";
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

}

function affiche_modal_transporteur(id_notif){
    $("#declarationTransp").modal("show");
    $.ajax({
        url: '/api/getOneDeclarationTransporteur/'+id_notif,
        type: 'POST',
        data: {},
    })
        .done(function(response) {
            console.log(response.declaration);
            var id_decl = response.declaration.declarationId;
            var transp = response.declaration.transporteurParam.nom;
            var url_file = response.declaration.url_file;
            var type = response.declaration.notification.zf_et;

            $("#name_trans").val(transp);
            $("#id_declaration").val(id_decl);
            $("#id_notif").val(id_notif);
            $("#type").val(type);
            console.log(url_file==null);
            if(url_file==null || $.trim(url_file)===""){
                $("#file_down").attr("onclick","no_file()");
                $("#file_down").attr("href","");
            }
            else{
                $("#file_down").attr("onclick","");
                $("#file_down").attr("href",url_file);
            }

        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });
}

function affiche_comment(val){
    if(val==2){
        $("#msg_comment").removeClass("d-none");
    }else{
        $("#msg_comment").addClass("d-none");
    }
}

function Modalclose_modal(id){
    $("#"+id).modal("hide");
}
function go_link(url){
    window.location.href=url;
}
function no_file(){
    if(event!=null)
        event.preventDefault();
    swal("Aucun Fichier n'est attaché","","info");
}

function saveDeclarationTransporteur(){
    var id_decl = $("#id_declaration").val();
    var id_valid = $("#id_select").val();
    var type = $("#type").val();
    var message = $("#id_comment").val();
    if($.trim(id_valid)==="" || id_valid==null ){
        swal("Avertissement ! ","Merci de selectionner un statut Valide","error");
        return false;
    }

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/updateDeclarationTransporteur/"+id_decl+"/"+id_valid,
        data: {"msg":message},

        success : function(response) {
            $("#declarationTransp").modal("hide");
            swal({
                    title: "Statut modifié avec succès",
                    text: "",
                    type: "success",
                },
                function () {
                    window.location.href="/api/getListeAutorisation/"+type+"/0/6/0";
                })
        },
        error : function() {
        }
    });
}

function param_EIE_hide_Class(val){
    if(event!=null)
        event.preventDefault();

    var v = $(val).val();
    if(v==="EIE" || v==="AE" || v==="NT"){
        $("#DANG_group").hide();
    }else{
        $("#DANG_group").show();
    }
}

function fun_save_document(id,type){
    var dt1 = $("#date_debut").val();
    var dt2 = $("#date_fin").val();

    if($.trim(dt1)===1 || dt1==null){
        swal("Avertissement ! ","La date de début est obligatoire","error");
        return false
    }


    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/fun_save_document/"+id,
        data: { "date1":dt1,
                "date2":dt2},
        success : function() {
            swal({
                    title: "le fichier est enregistré avec succès",
                    text: "",
                    type: "success",
                },
                function () {
                    window.location.href="/api/getEie/"+type+"/0/6/0";
                })
        },
        error : function() {
        }
    });

}

function fun_save_document_decision(id,type){
    var dt1 = $("#date_debut").val();
    var dt2 = $("#date_fin").val();

    if($.trim(dt1)===1 || dt1==null){
        swal("Avertissement ! ","La date de début est obligatoire","error");
        return false
    }


    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/fun_save_document_decision/"+id,
        data: { "date1":dt1,
            "date2":dt2},
        success : function() {
            swal({
                    title: "le fichier est enregistré avec succès",
                    text: "",
                    type: "success",
                },
                function () {
                    window.location.href="/api/getEie/"+type+"/0/6/0";
                })
        },
        error : function() {
        }
    });

}

function show_comment(val,id_test,id_comment){
    var id=$(val).val();
    if(id!=id_test){
        $("#"+id_comment).addClass('d-none');
    }else{
        $("#"+id_comment).removeClass('d-none');
    }
}

function save_pv_visite(id){
    if(event!=null)
        event.preventDefault();
    var formdata = new FormData();
    formdata.append("comment",$("#comment").val());

    var ins_pv = document.getElementById("pv_file").files.length;
    for (var x = 0; x < ins_pv; x++) {
        formdata.append("fileToUpload_pv", document.getElementById("pv_file").files[x]);
    }
    var id_stat = $("#id_stat").val();

    $.ajax({
        type: "POST",
        url : "/api/demandePV_visite/"+id+"/"+id_stat,
        data:formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success : function() {
            swal({
                    title: "le fichier est enregistré avec succès",
                    text: "",
                    type: "success",
                },
                function () {
                    window.location.href="/api/getEie/NT/0/6/0";
                })
        },
        error : function() {
        }
    });
}


function setpv_file(val,id){
    if(event!=null)
        event.preventDefault();
    var formdata = new FormData();

    var ins_pv = document.getElementById("pv_file").files.length;
    for (var x = 0; x < ins_pv; x++) {
        formdata.append("fileToUpload_pv", document.getElementById("pv_file").files[x]);
    }

    $.ajax({
        type: "POST",
        url : "/api/collectePV_comission/"+id,
        data:formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success : function() {

        },
        error : function() {
        }
    });
}
function fun_date100(val){
    var l = $(val).val();
    $(val).attr("value",l);
}

function addComment_AE(id,val){
    if(event!=null)
        event.preventDefault();
    var com = $(val).val();
    if($.trim(com)==="" || com==null){
        return false;
    }

    $.ajax({
        type: "POST",
        url : "/api/addcommentAE/"+id,
        data: {"com":com},
        success : function(data) {
            console.log(data);
        },
        error : function() {
            console.log("error");
        }
    });

}

function delete_doc(id_doc,id_dmd){
    $.ajax({
        type: "POST",
        url : "/api/delete_doc_AE/"+id_doc+"/"+id_dmd,
        data: {},
        success : function(data) {
            $("#rows_document").html(data);
        },
        error : function() {
            console.log("error");
        }
    });
}

function save_doc_AE(id){
    var text = $("#fiel_name").val();
    if($.trim(text)==="" || text==null){
        swal("Avertissement ! ","le nom du documents est vide","error");
        return false;
    }

    $.ajax({
        type: "POST",
        url : "/api/addDocumentAE/"+id,
        data: {"name":text},
        success : function(data) {
            $("#rows_document").html(data);
        },
        error : function() {
            console.log("error");
        }
    });

}

function validate_doc_AE(id,val){
    if(event!=null)
        event.preventDefault();
    var send = "non"
    if($(val).is(":checked")){
        send="oui";
    }


    $.ajax({
        type: "POST",
        url : "/api/changer_statut_docAE/"+id+"/"+send,
        data: {},
        success : function() {
            test_checkbox(val)
        },
        error : function() {
            console.log("error");
        }
    });
}
// affiche et cache la zone commentaire
// active button valider/incomplet des document
function test_checkbox(val){
    var check = false;
    $(".my_check").each(function (ind,el){
        if(!check && !$(el).is(":checked")){
            check=true;
        }
    });

    var id = $(val).attr("data-choose");
    if(check){
        $("#valider").prop("disabled",true);
        $("#non_conforme").prop("disabled",false);
    }else{
        $("#valider").prop("disabled",false);
        $("#non_conforme").prop("disabled",true);
    }

    if($(val).is(":checked")){
        $(id).addClass("d-none");
    }else{
        $(id).removeClass("d-none");
    }
}

function addComment_doc(id,val){
    if(event!=null)
        event.preventDefault();

    var com = $(val).val();

    $.ajax({
        type: "POST",
        url : "/api/updCommentDocAE/"+id,
        data: {
            "com" : com,
        },
        success : function(data) {
            console.log(data);
        },
        error : function() {
            console.log("error");
        }
    });
}

function addComment_AE(id,val){
    if(event!=null)
        event.preventDefault();
    var com = $(val).val();
    $.ajax({
        type: "POST",
        url : "/api/updCommentFILEAE/"+id,
        data: {
            "com" : com,
        },
        success : function(data) {
            console.log(data);
        },
        error : function() {
            console.log("error");
        }
    });

}

function validate_list (id,val){
    if(event!=null)
        event.preventDefault();
    var send = "non"
    if($(val).is(":checked")){
        send="oui";
    }

    $.ajax({
        type: "POST",
        url : "/api/changer_statut_listdocAE/"+id+"/"+send,
        data: {},
        success : function() {
            test_checkbox(val)
        },
        error : function() {
            console.log("error");
        }
    });
}

function addComment_list(id,val){
    if(event!=null)
        event.preventDefault();
    var com = $(val).val();
    $.ajax({
        type: "POST",
        url : "/api/updCommentlistdocAE/"+id,
        data: {
            "com" : com,
        },
        success : function(data) {
            console.log(data);
        },
        error : function() {
            console.log("error");
        }
    });
}

function save_visite_AE(id){
    if(event!=null){
        event.preventDefault();
    }
    var obj = $("#visite_objet").val();
    var site = $("#visite_site").val();
    var date = $("#visite_date").val();


    $.ajax({
        type: "POST",
        url :"/api/add_Visite_AE/"+id,
        data :{
            obj : obj,
            site : site,
            date : date,
        },

        success : function(data) {
           $("#tableau_visite").html(data);
           $("#visite_objet").val("");
            $("#visite_site").val("");
           $("#visite_date").val("");
        },
        error : function(response) {
            alert(' ajout non effectué');
        }
    });
}

function AttacherPV(id){
    if(event!=null)
        event.preventDefault();
    $("#AttachePV"+id).modal("show");
}


function set_file_vosite(id,val){

    if (!val.files[0]) {
        return false;
    }

    var formdata = new FormData();
    formdata.append("fileToUpload",val.files[0]);

    var id_dmd = $(val).attr("data-id");

    $.ajax({
        url: '/api/save_file_visite_ae/'+id + "/"+id_dmd,
        type:'POST',
        enctype: 'multipart/form-data',
        data: formdata,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    })
        .done(function(data) {
            $("#AttachePV"+id).modal("hide");
            $("#tableau_visite").html(data);
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        })

}


