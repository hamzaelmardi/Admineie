/*Menu*/

$( ".page-wrapper a" ).click(function() {

    var  hrrf = $(this).attr('href');
	var test =hrrf.includes("#");
	if (!test){
		var url = window.location.href;
		var ses = url.substr(url.lastIndexOf('?') + 1);
		$(this).attr('href',hrrf+"?"+ses);
	}

});

(function() {

    var url = window.location.href;
    var ses = url.substr(url.lastIndexOf('?') + 1);

    /*if(ses == '' || ses== url)
    {
        window.location.href = " ../login/login.html";
    }*/
    if( ses!='verificateur' && ses!='evaluateur'  && ses!='evaluateur' && ses!='commission'  && ses!='superieur' && ses!='admin')
    {
        window.location.href = " ../login/login.html";
    }

    if(ses=='verificateur' || ses=='evaluateur'  || ses=='evaluateur' || ses=='commission'  || ses=='superieur')
    {
        $("a[name='add']").hide();
        $("a[data-target='#add-new-event']").hide();
        $("button[onclick='deletesweetfrmodel()']").hide();
        $("button.btn.btn-outline-secondary.font-18").hide();
        $("a.btn.btn-outline-secondary.font-18").hide();
        $(".btnEdit").hide();
        $(".btnDelete").hide();
    }


    $(".nav-item.search-box").remove();
    $(".navbar-nav.float-right li.nav-item.dropdown:eq(2),.navbar-nav.float-right li.nav-item.dropdown:eq(3)").remove();


    $("#sidebarnav").html("");
    $("#sidebarnav").append("<li class=\"sidebar-item selected\"> <a class=\"btn btn-block create-btn text-white no-block d-flex align-items-center\" href=\"../dashboard/dashboard.html?"+ses+"\" aria-expanded=\"false\"><i class=\"mdi mdi-view-dashboard\"></i><span class=\"hide-menu\"> Dashboard</span></a></li>\n" +
    "<li class=\"sidebar-item\"> <a class=\"sidebar-link has-arrow waves-effect waves-dark\" href=\"javascript:void(0)\" aria-expanded=\"false\"><i class=\"mdi mdi-gradient\"></i><span class=\"hide-menu\">Autorisations</span></a>\n" +
        "                   <ul aria-expanded=\"false\" class=\"collapse first-level\">\n" +
        "                        <li class=\"sidebar-item\"><a href=\"../demande/gestion_demande.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-playlist-plus\"></i><span class=\"hide-menu\"> Autorisation </span></a></li>\n" +
        "                        <li class=\"sidebar-item\"><a href=\"../gestion-reunions/gestion-reunions.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-playlist-check\"></i><span class=\"hide-menu\"> Réunions de la commission</span></a></li>\n" +
        "                        <li class=\"sidebar-item\"><a href=\"../gestion-visites/gestion-visites.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-playlist-check\"></i><span class=\"hide-menu\"> Gestion des visites </span></a></li>\n" +
        "                  </ul>\n" +
        " <li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\"  href=\"../messagerie/messagerie.html?"+ses+"\" aria-expanded=\"false\"><i class=\"mdi mdi-inbox-arrow-down\"></i><span class=\"hide-menu\">Messagerie</span></a></li>\n" +
        "                    <li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\" href=\"../gestion-terrains/gestion-terrains.html?"+ses+"\" aria-expanded=\"false\"><i class=\"mdi mdi-vector-rectangle\"></i><span class=\"hide-menu\">Gestion des terrains</span></a></li>\n" +
        " </li><li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\" href=\"../gestion-documents/gestion-documents.html?"+ses+"\" aria-expanded=\"false\"><i class=\"mdi mdi-file\"></i><span class=\"hide-menu\">Gestion documents</span></a></li>\n" +
        " <li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\" href=\"../audit/audit.html?"+ses+"\" aria-expanded=\"false\"><i class=\"ti-agenda\"></i><span class=\"hide-menu\">Audit</span></a></li>\n" +
        " <li class=\"sidebar-item \"> <a class=\"sidebar-link has-arrow waves-effect waves-dark\" href=\"javascript:void(0)\" aria-expanded=\"false\"><i class=\"mdi mdi-chart-areaspline\"></i><span class=\"hide-menu\">Statistiques </span></a>\n" +
        " <ul aria-expanded=\"false\" class=\"collapse first-level\">\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../statistique/statistique.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Statistiques </span></a></li>\n" +
        "                            <li class=\"sidebar-item \"><a href=\"../statistique/dossiers_region.html?"+ses+"\" class=\"sidebar-link \"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\">Etat de Dossier par Région </span></a></li>\n" +
        "                            <li class=\"sidebar-item \"><a href=\"../statistique/dossiers_types.html?"+ses+"\" class=\"sidebar-link \"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Type de Dossier </span></a></li>\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../statistique/autorisation_types.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\">Type d'Autorisation  </span></a></li>\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../statistique/statique_visites.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Statistique des visites </span></a></li>\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../statistique/statique_dechets.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Statistique des Déchets </span></a></li>\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../statistique/statique_projets.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Statistique des Projets  </span></a></li>\n" +
        "                        </ul>\n" +
        "                    <li class=\"sidebar-item\"> <a class=\"sidebar-link has-arrow waves-effect waves-dark\" href=\"javascript:void(0)\" aria-expanded=\"false\"><i class=\"ti-control-shuffle\"></i><span class=\"hide-menu\">Droits d'accès </span></a>\n" +
        " <ul aria-expanded=\"false\" class=\"collapse  first-level\">\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../gestion-droits-acces/gestion-comptes.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Gestion des comptes </span></a></li>\n" +
        "                            <li class=\"sidebar-item\"><a href=\"../gestion-droits-acces/gestion-profils.html?"+ses+"\" class=\"sidebar-link\"><i class=\"mdi mdi-adjust\"></i><span class=\"hide-menu\"> Gestion des profils </span></a></li>\n" +
        "                        </ul>\n" +
        "                    </li>\n" +
       " <li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\" href=\"../aide/aide.html?"+ses+"\" aria-expanded=\"false\"><i class=\"fa fa-plus-square\"></i><span class=\"hide-menu\">Aide</span></a></li>\n" +
       " <li class=\"sidebar-item\"> <a class=\"sidebar-link waves-effect waves-dark sidebar-link\" href=\"../parametres/parametres.html?"+ses+"\" aria-expanded=\"false\"><i class=\"mdi mdi-tune-vertical\"></i><span class=\"hide-menu\">Parametres</span></a></li>\n");




/*
  <!------------------------------------------------------------------------------------------------------------
*/


    /*    ---------------------------------------------------------------------------------------------------------------*/
    var url = window.location.href;
    var ses = url.substr(url.lastIndexOf('?') + 1);

    var sess = "ahmad@gmail.com";
    if(ses != url){
        sess = ses;
    }

    $("div#navbarSupportedContent").html("");
    $("div#navbarSupportedContent").html('<div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin1">\n' +
        '                <!-- ============================================================== -->\n' +
        '                <!-- toggle and nav items -->\n' +
        '                <!-- ============================================================== -->\n' +
        '                <ul class="navbar-nav float-left mr-auto">\n' +
        '                    <li class="nav-item d-none d-md-block"><a class="nav-link sidebartoggler waves-effect waves-light" href="javascript:void(0)" data-sidebartype="mini-sidebar"><i class="mdi mdi-menu font-24"></i></a></li>\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- mega menu -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <li class="nav-item dropdown mega-dropdown"><a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\n' +
        '                        <span class="d-none d-md-block">Mega<i class="fa fa-angle-down"></i></span>\n' +
        '                        <span class="d-block d-md-none"><i class="mdi mdi-dialpad font-24"></i></span>\n' +
        '                    </a>\n' +
        '                        <div class="dropdown-menu animated bounceInDown">\n' +
        '                            <div class="mega-dropdown-menu row">\n' +
        '                                <div class="col-lg-3 col-xlg-2 mb-4">\n' +
        '                                    <h4 class="mb-3">CAROUSEL</h4>\n' +
        '                                    <!-- CAROUSEL -->\n' +
        '                                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">\n' +
        '                                        <div class="carousel-inner" role="listbox">\n' +
        '                                            <div class="carousel-item active">\n' +
        '                                                <div class="container p-0"> <img class="d-block img-fluid" src="../static/assets/images/big/img1.jpg" alt="First slide"></div>\n' +
        '                                            </div>\n' +
        '                                            <div class="carousel-item">\n' +
        '                                                <div class="container p-0"><img class="d-block img-fluid" src="../static/assets/images/big/img2.jpg" alt="Second slide"></div>\n' +
        '                                            </div>\n' +
        '                                            <div class="carousel-item">\n' +
        '                                                <div class="container p-0"><img class="d-block img-fluid" src="../static/assets/images/big/img3.jpg" alt="Third slide"></div>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a>\n' +
        '                                        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>\n' +
        '                                    </div>\n' +
        '                                    <!-- End CAROUSEL -->\n' +
        '                                </div>\n' +
        '                                <div class="col-lg-3 mb-4">\n' +
        '                                    <h4 class="mb-3">ACCORDION</h4>\n' +
        '                                    <!-- Accordian -->\n' +
        '                                    <div id="accordion">\n' +
        '                                        <div class="card mb-1">\n' +
        '                                            <div class="card-header" id="headingOne">\n' +
        '                                                <h5 class="mb-0">\n' +
        '                                                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">\n' +
        '                                                        Collapsible Group Item #1\n' +
        '                                                    </button>\n' +
        '                                                </h5>\n' +
        '                                            </div>\n' +
        '                                            <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">\n' +
        '                                                <div class="card-body">\n' +
        '                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry.\n' +
        '                                                </div>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                        <div class="card mb-1">\n' +
        '                                            <div class="card-header" id="headingTwo">\n' +
        '                                                <h5 class="mb-0">\n' +
        '                                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">\n' +
        '                                                        Collapsible Group Item #2\n' +
        '                                                    </button>\n' +
        '                                                </h5>\n' +
        '                                            </div>\n' +
        '                                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">\n' +
        '                                                <div class="card-body">\n' +
        '                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry.\n' +
        '                                                </div>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                        <div class="card mb-1">\n' +
        '                                            <div class="card-header" id="headingThree">\n' +
        '                                                <h5 class="mb-0">\n' +
        '                                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">\n' +
        '                                                        Collapsible Group Item #3\n' +
        '                                                    </button>\n' +
        '                                                </h5>\n' +
        '                                            </div>\n' +
        '                                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">\n' +
        '                                                <div class="card-body">\n' +
        '                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry.\n' +
        '                                                </div>\n' +
        '                                            </div>\n' +
        '                                        </div>\n' +
        '                                    </div>\n' +
        '                                </div>\n' +
        '                                <div class="col-lg-3  mb-4">\n' +
        '                                    <h4 class="mb-3">CONTACT US</h4>\n' +
        '                                    <!-- Contact -->\n' +
        '                                    <form>\n' +
        '                                        <div class="form-group">\n' +
        '                                            <input type="text" class="form-control" id="exampleInputname1" placeholder="Enter Name"> </div>\n' +
        '                                        <div class="form-group">\n' +
        '                                            <input type="email" class="form-control" placeholder="Enter email"> </div>\n' +
        '                                        <div class="form-group">\n' +
        '                                            <textarea class="form-control" id="exampleTextarea" rows="3" placeholder="Message"></textarea>\n' +
        '                                        </div>\n' +
        '                                        <button type="submit" class="btn btn-info">Submit</button>\n' +
        '                                    </form>\n' +
        '                                </div>\n' +
        '                                <div class="col-lg-3 col-xlg-4 mb-4">\n' +
        '                                    <h4 class="mb-3">List style</h4>\n' +
        '                                    <!-- List style -->\n' +
        '                                    <ul class="list-style-none">\n' +
        '                                        <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> You can give link</a></li>\n' +
        '                                        <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Give link</a></li>\n' +
        '                                        <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Another Give link</a></li>\n' +
        '                                        <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Forth link</a></li>\n' +
        '                                        <li><a href="javascript:void(0)"><i class="fa fa-check text-success"></i> Another fifth link</a></li>\n' +
        '                                    </ul>\n' +
        '                                </div>\n' +
        '                            </div>\n' +
        '                        </div>\n' +
        '                    </li>\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- End mega menu -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- create new -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <li class="nav-item dropdown">\n' +
        '                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\n' +
        '                            <span class="d-none d-md-block" style="font-family: Sans-Serif">creer <i class="fa fa-angle-down"></i></span>\n' +
        '                            <span class="d-block d-md-none"><i class="fa fa-plus"></i></span>\n' +
        '                        </a>\n' +
        '                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">\n' +
        '                            <a class="dropdown-item" href="#">Action</a>\n' +
        '                            <a class="dropdown-item" href="#">Another action</a>\n' +
        '                            <div class="dropdown-divider"></div>\n' +
        '                            <a class="dropdown-item" href="#">Something else here</a>\n' +
        '                        </div>\n' +
        '                    </li>\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- Search -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    \n' +
        '                </ul>\n' +
        '                <!-- ============================================================== -->\n' +
        '                <!-- Right side toggle and nav items -->\n' +
        '                <!-- ============================================================== -->\n' +
        '                <ul class="navbar-nav float-right">\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- create new -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <li class="nav-item dropdown">\n' +
        '                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\n' +
        '                             \n' +
        '                        FR</a>\n' +
        '                        <div class="dropdown-menu dropdown-menu-right  animated bounceInDown" aria-labelledby="navbarDropdown2">\n' +
        '                            <a class="dropdown-item" onclick=\"change_language_site(\'FR\')\"> FR </a>\n' +
        '                            <a class="dropdown-item"onclick=\"change_language_site(\'AR\')\"> AR </a>\n' +
        '                        </div>\n' +
        '                    </li>\n' +
        '                    <li class="nav-item dropdown">\n' +
        '                            <a class="nav-link dropdown-toggle waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="mdi mdi-bell font-24"></i>\n' +
        '                                \n' +
        '                            </a>\n' +
        '                            <div class="dropdown-menu dropdown-menu-right mailbox animated bounceInDown">\n' +
        '                                <span class="with-arrow"><span class="bg-primary"></span></span>\n' +
        '                                <ul class="list-style-none">\n' +
        '                                    <li>\n' +
        '                                        <div class="drop-title bg-primary text-white">\n' +
        '                                            <h4 class="mb-0 mt-1">3 Nouveau</h4>\n' +
        '                                            <span class="font-light">Notifications</span>\n' +
        '                                        </div>\n' +
        '                                    </li>\n' +
        '                                    <li>\n' +
        '                                        <div class="message-center notifications ps-container ps-theme-default" data-ps-id="c37deaa9-4dd4-1adf-c7d8-b3c9e178fb1e">\n' +
        '                                            <!-- Message -->\n' +
        '                                            <a href="javascript:void(0)" class="message-item">\n' +
        '                                                <span class="btn btn-danger btn-circle"><i class="fa fa-link"></i></span>\n' +
        '                                                <div class="mail-contnet">\n' +
        '                                                    <h5 class="message-title">Autoristion XX/23 aura fin le  <span class="time">10-10-2020</span> </div>\n' +
        '                                            </a>\n' +
        '                                            <!-- Message -->\n' +
        '                                            <a href="javascript:void(0)" class="message-item">\n' +
        '                                                <span class="btn btn-success btn-circle"><i class="ti-calendar"></i></span>\n' +
        '                                                <div class="mail-contnet">\n' +
        '                                                    <h5 class="message-title">Le rapport annuel YT/67 doit etre actualiser avant le </h5> <span class="time">23-03-2020</span> </div>\n' +
        '                                            </a>\n' +
        '                                            <!-- Message -->\n' +
        '                                        <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; right: 3px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>\n' +
        '                                    </li>\n' +
        '                                    <li>\n' +
        '                                        <a class="nav-link text-center mb-1 text-dark" href="javascript:void(0);"> <strong>Vérifier toutes les notifications</strong> <i class="fa fa-angle-right"></i> </a>\n' +
        '                                    </li>\n' +
        '                                </ul>\n' +
        '                            </div>\n' +
        '                        </li>\n' +
        '                        <!-- ============================================================== -->\n' +
        '                        <!-- End Comment -->\n' +
        '                        <!-- ============================================================== -->\n' +
        '                    <li class="nav-item dropdown">\n' +
        '                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark pro-pic" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="../static/assets/images/users/1.jpg" alt="user" class="rounded-circle" width="31"></a>\n' +
        '                        <div class="dropdown-menu dropdown-menu-right user-dd animated flipInY">\n' +
        '                            <span class="with-arrow"><span class="bg-primary"></span></span>\n' +
        '                            <div class="d-flex no-block align-items-center p-15 bg-primary text-white mb-2">\n' +
        '                                <div class=""><img src="../static/assets/images/users/1.jpg" alt="user" class="img-circle" width="60"></div>\n' +
        '                                <div class="ml-2">\n' +
        '                                    <h4 class="mb-0">'+ses+'</h4>\n' +
        '                                    \n' +
        '                                </div>\n' +
        '                            </div>\n' +
        '                            <a class="dropdown-item" href="javascript:void(0)"><i class="ti-user mr-1 ml-1"></i>Profil</a>\n' +
        '                            <a class="dropdown-item" href="javascript:void(0)"><i class="ti-wallet mr-1 ml-1"></i> My Balance</a>\n' +
        '                            <a class="dropdown-item" href="javascript:void(0)"><i class="ti-email mr-1 ml-1"></i> Boîte de réception</a>\n' +
        '                            <div class="dropdown-divider"></div>\n' +
        '                            <a class="dropdown-item" href="javascript:void(0)"><i class="ti-settings mr-1 ml-1"></i> Account Setting</a>\n' +
        '                            <div class="dropdown-divider"></div>\n' +
        '                            <a class="dropdown-item" href="../login/login.html"><i class="fa fa-power-off mr-1 ml-1"></i> Déconnecter</a>\n' +
        '                            <div class="dropdown-divider"></div>\n' +
        '                            <div class="pl-4 p-10"><a href="javascript:void(0)" class="btn btn-sm btn-success btn-rounded">Voir le profil</a></div>\n' +
        '                        </div>\n' +
        '                    </li>\n' +
        '                    <!-- ============================================================== -->\n' +
        '                    <!-- User profile and search -->\n' +
        '                    <!-- ============================================================== -->\n' +
        '                </ul>\n' +
        '            </div>');

    /*
    ----------------------------------------------------------------------------------------------------------------
    */




})();




function deletesweetfr() {
    swal({
        title: 'Êtes-vous sûr ?',
        text: "Vous ne pourrez pas revenir sur cela !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00695c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer !',
        cancelButtonText: "Annuler",
    }).then((result) => {
       /* if (result.value) {*/
            swal(
                'Supprimé !',
                'Votre fichier a été supprimé.',
                'success'
            )
        /*}*/
    });
}

function modelchoisi(id) {
    $(".modelchoisi").removeClass("active");
    $("#"+id).addClass("active");
    $("#yasnid").html("");
    if(id=="model1"){$("#yasnid").append($(".model1").html());}
    if(id=="model2"){$("#yasnid").append($(".model2").html());}
    if(id=="model3"){$("#yasnid").append($(".model3").html());}
    if(id=="model4"){$("#yasnid").append($(".model4").html());}

}
function deletesweetfrmodel() {
    swal({
        title: 'Êtes-vous sûr ?',
        text: "Vous ne pourrez pas revenir sur cela !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00695c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer !',
        cancelButtonText: "Annuler",
    }).then((result) => {
        /* if (result.value) {*/
        swal(
            'Supprimé !',
            'Votre fichier a été supprimé.',
            'success'
        );
        $("#yasnid").html("");
        $("#yasnid").append($(".modelhome").html());
        /*}*/
    });
}
