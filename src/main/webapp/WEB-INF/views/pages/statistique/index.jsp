<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/header.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix
                   = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="//www.amcharts.com/lib/3/plugins/export/export.css" media="all" rel="stylesheet" type="text/css" />
<style>
    #chart-selector li {
        display: inline-block;
        border: 1px solid #ececec;
        border-radius: 5px;
        padding: .5em;
        background: #ececec;
        cursor: pointer;
    }

    #chart-selector li:hover {
        background: #FFFF60;
        border: 1px solid #FFFF60;
    }
    .card-counter{
        margin: 5px;
        padding: 20px 10px;
        background-color: #fff;
        height: 150px;
        border-radius: 5px;
        transition: .3s linear all;
        box-shadow: #ccccb3 -5px 5px, #d6d6c2 -10px 10px, #e0e0d1 -15px 15px, #ebebe0 -20px 20px, #f5f5f0 -25px 25px;
    }

    .card-counter:hover{
        box-shadow: 4px 4px 20px #DADADA;
        transition: .3s linear all;
    }

    .card-counter.primary{
        background-color: #604020;
        color: #FFF;
    }

    .card-counter.danger{
        background-color: #339966;
        color: #FFF;
    }

    .card-counter.success{
        background-color: #996633;
        color: #FFF;
    }

    .card-counter.info{
        background-color: #998033;
        color: #FFF;
    }

    .card-counter.primary1{
        background-color: #266a26;
        color: #FFF;
    }

    .card-counter.danger1{
        background-color: #847840;
        color: #FFF;
    }

    .card-counter.success1{
        background-color: #918257;
        color: #FFF;
    }

    .card-counter.info1{
        background-color: #306030;
        color: #FFF;
    }

    .card-counter i{
        font-size: 5em;
        opacity: 0.2;
    }

    .card-counter .count-numbers{
        position: absolute;
        right: 35px;
        top: 20px;
        font-size: 32px;
        display: block;
    }

    .card-counter .count-name{
    //position: absolute;
    //right: 35px;
        margin-top: 15px;
        font-style: italic;
        text-transform: capitalize;
        display: block;
        font-size: 18px;
    }
    .active {
        color: #f8b739 !important;

    }
</style>
<div class="wrapperST d-flex align-items-stretch">
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <ul class="list-unstyled components mb-5">
                <li class="active">
                    <a type="button" class="dropdown-toggle active" onclick="window.location.reload()"><i class="fa fa-home icon"></i><spring:message code='label.Acceuil'/></a>
                </li>
                <c:if test="${auto.equals('auto')}">
                    <li class="">
                        <a href="#ZF" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.Importationdesdechetsdunezonnefranche'/></a>
                        <ul class="collapse list-unstyled" id="ZF">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','new',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets Dangereux autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','societe',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés importatrices </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','quantite',this)"><i class="fa fa-angle-double-right"></i>Quantité des déchets autorisée </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#ET" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i>Importation Des Déchets D'un pays Etranger</a>
                        <ul class="collapse list-unstyled" id="ET">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspPaysEtranger','new',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspNombrePaysEtranger','nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspPaysExportateur', 'pays',this)"><i class="fa fa-angle-double-right"></i>Les pays exportateurs au Maroc</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetPaysEtranger','nbrPays',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées par pays</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#XD" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.ExportationDesDechetsDangereux'/></a>
                        <ul class="collapse list-unstyled" id="XD">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeExportJsp','type',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés à exporter</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/paysExportJsp', 'pays',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés à exporter pour chaque pays</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/nombreCodeExportJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées pour exportation des déchets</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/paysMarocExportJsp', 'maroc',this)"><i class="fa fa-angle-double-right"></i>Les pays d’exportation des déchets non dangereux du Maroc </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/nombreXDByPaysAndTypeExportJsp', 'nbrPays',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées pour exportation des déchets Par chaque Pays</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/quantitePaysExportJsp', 'quantite',this)"><i class="fa fa-angle-double-right"></i>La quantité des déchets autorisés à exporter</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#TR" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.TransitDesDechets'/></a>
                        <ul class="collapse list-unstyled" id="TR">
                            <li>
                                <a href="#"><i class="fa fa-angle-double-right"></i> Home 1</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-double-right"></i> Home 2</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-angle-double-right"></i> Home 3</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#CT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-truck icon"></i><spring:message code='label.CollecteETTransportDesDEchets'/></a>
                        <ul class="collapse list-unstyled" id="CT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à collecter et transporter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueCodeJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées par Type des déchets (Code et Intitulé) </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/demandeAjoutStatistiqueCountJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des demandes d’ajout des véhicules et déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/vehiculesStatistiqueCountJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des véhicules autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeCodeSociete',this)"><i class="fa fa-angle-double-right"></i>Types des déchets autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueJsp', 'societe',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à collecter et transporter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/societeDemandeAjout',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées ayant demande des ajouts des véhicules et déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/dateExpiration',this)"><i class="fa fa-angle-double-right"></i>Dates d’expiration des autorisations de Collecte et Transport des déchets </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#IT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-trash-restore icon"></i><spring:message code='label.Installationdetraitementdesdechets'/></a>
                        <ul class="collapse list-unstyled" id="IT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à traiter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueCodeJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à traiter les Déchets Dangereux par Type des déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueJsp', 'societe',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à traiter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeCodeSocieteInstalaltion',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à traiter les Déchets Dangereux par Type des déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/dateExpirationInstall',this)"><i class="fa fa-angle-double-right"></i>Dates d’expiration des autorisations de traitement des Déchets Dangereux </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#IG" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-info-circle icon"></i>Information générale</a>
                        <ul class="collapse list-unstyled" id="IG">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '1',this)"><i class="fa fa-angle-double-right"></i>Sociétés importatrices des déchets des Zones Franches </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '2',this)"><i class="fa fa-angle-double-right"></i>Sociétés des pays exportateurs des déchets non dangereux au Maroc </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '3',this)"><i class="fa fa-angle-double-right"></i>Producteurs des déchets aux Zones Franches </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '4',this)"><i class="fa fa-angle-double-right"></i>Dossiers en Instance </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/avisDepartementJsp', '5',this)"><i class="fa fa-angle-double-right"></i>Avis des départements concernés dont le délai règlementaire est dépassé</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/autorisation_octroyees', '6',this)"><i class="fa fa-angle-double-right"></i>Nombre totale des autorisations des déchets par type</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Quantite', '5',this)"><i class="fa fa-angle-double-right"></i>Quantité estimée avec quantité réelle</a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${auto.equals('ev')}">
                    <li class="">
                        <a href="#EE" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Etude d'impact sur l'environnement</a>
                        <ul class="collapse list-unstyled" id="EE">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/EE','1',this)"><i class="fa fa-angle-double-right"></i>Nombre de projets examinés</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/reunionstatistique', '2',this)"><i class="fa fa-angle-double-right"></i>Nombre de réunions</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/EE', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de DAE délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/getMontantInvestis/EE', '6',this)"><i class="fa fa-angle-double-right"></i>Montant d’investissement</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#NT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Notice d'impact sur l'environnement</a>
                        <ul class="collapse list-unstyled" id="NT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/NT','1',this)"><i class="fa fa-angle-double-right"></i>Nombre de projets présentés</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/NT', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de DAE délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/getMontantInvestis/NT', '6',this)"><i class="fa fa-angle-double-right"></i>Montant d’investissement</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#AE" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Audit environnemental</a>
                        <ul class="collapse list-unstyled" id="AE">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/AE','1',this)"><i class="fa fa-angle-double-right"></i>Nombre d’études examinées</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/AE', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de CCE délivrées</a>
                            </li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${auto.equals('tous')}">
                    <li class="">
                        <a href="#ZF" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.Importationdesdechetsdunezonnefranche'/></a>
                        <ul class="collapse list-unstyled" id="ZF">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','new',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets Dangereux autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','societe',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés importatrices </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetDangereux','quantite',this)"><i class="fa fa-angle-double-right"></i>Quantité des déchets autorisée </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#ET" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i>Importation Des Déchets D'un pays Etranger</a>
                        <ul class="collapse list-unstyled" id="ET">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspPaysEtranger','new',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspNombrePaysEtranger','nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/jspPaysExportateur', 'pays',this)"><i class="fa fa-angle-double-right"></i>Les pays exportateurs au Maroc</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeDechetPaysEtranger','nbrPays',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées par pays</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#XD" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.ExportationDesDechetsDangereux'/></a>
                        <ul class="collapse list-unstyled" id="XD">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeExportJsp','type',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés à exporter</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/paysExportJsp', 'pays',this)"><i class="fa fa-angle-double-right"></i>Les types des déchets autorisés à exporter pour chaque pays</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/nombreCodeExportJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées pour exportation des déchets</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/paysMarocExportJsp', 'maroc',this)"><i class="fa fa-angle-double-right"></i>Les pays d’exportation des déchets non dangereux du Maroc </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/nombreXDByPaysAndTypeExportJsp', 'nbrPays',this)"><i class="fa fa-angle-double-right"></i>Nombre des autorisations délivrées pour exportation des déchets Par chaque Pays</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/quantitePaysExportJsp', 'quantite',this)"><i class="fa fa-angle-double-right"></i>La quantité des déchets autorisés à exporter</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#TR" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-recycle icon"></i><spring:message code='label.TransitDesDechets'/></a>
                        <ul class="collapse list-unstyled" id="TR">

                        </ul>
                    </li>
                    <li class="">
                        <a href="#CT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-truck icon"></i><spring:message code='label.CollecteETTransportDesDEchets'/></a>
                        <ul class="collapse list-unstyled" id="CT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à collecter et transporter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueCodeJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées par Type des déchets (Code et Intitulé) </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/demandeAjoutStatistiqueCountJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des demandes d’ajout des véhicules et déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/vehiculesStatistiqueCountJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des véhicules autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeCodeSociete',this)"><i class="fa fa-angle-double-right"></i>Types des déchets autorisés </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/collecteStatistiqueJsp', 'societe',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à collecter et transporter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/societeDemandeAjout',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées ayant demande des ajouts des véhicules et déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/dateExpiration',this)"><i class="fa fa-angle-double-right"></i>Dates d’expiration des autorisations de Collecte et Transport des déchets </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#IT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-trash-restore icon"></i><spring:message code='label.Installationdetraitementdesdechets'/></a>
                        <ul class="collapse list-unstyled" id="IT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueJsp', 'nombre',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à traiter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueCodeJsp',this)"><i class="fa fa-angle-double-right"></i>Nombre des sociétés autorisées à traiter les Déchets Dangereux par Type des déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/installationStatistiqueJsp', 'societe',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à traiter les Déchets Dangereux </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/typeCodeSocieteInstalaltion',this)"><i class="fa fa-angle-double-right"></i>Les sociétés autorisées à traiter les Déchets Dangereux par Type des déchets </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/dateExpirationInstall',this)"><i class="fa fa-angle-double-right"></i>Dates d’expiration des autorisations de traitement des Déchets Dangereux </a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#IG" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-info-circle icon"></i>Information générale</a>
                        <ul class="collapse list-unstyled" id="IG">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '1',this)"><i class="fa fa-angle-double-right"></i>Sociétés importatrices des déchets des Zones Franches </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '2',this)"><i class="fa fa-angle-double-right"></i>Sociétés des pays exportateurs des déchets non dangereux au Maroc </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '3',this)"><i class="fa fa-angle-double-right"></i>Producteurs des déchets aux Zones Franches </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/InformationGeneraleJsp', '4',this)"><i class="fa fa-angle-double-right"></i>Dossiers en Instance </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/avisDepartementJsp', '5',this)"><i class="fa fa-angle-double-right"></i>Avis des départements concernés dont le délai règlementaire est dépassé</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/autorisation_octroyees', '6',this)"><i class="fa fa-angle-double-right"></i>Nombre totale des autorisations des déchets par type</a>
                            </li>

                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Quantite', '5',this)"><i class="fa fa-angle-double-right"></i>Quantité estimée avec quantité réelle</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#EE" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Etude d'impact sur l'environnement</a>
                        <ul class="collapse list-unstyled" id="EE">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/EE','1',this)"><i class="fa fa-angle-double-right"></i>Nombre de projets examinés</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/reunionstatistique', '2',this)"><i class="fa fa-angle-double-right"></i>Nombre de réunions</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/EE', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de DAE délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/getMontantInvestis/EE', '6',this)"><i class="fa fa-angle-double-right"></i>Montant d’investissement</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#NT" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Notice d'impact sur l'environnement</a>
                        <ul class="collapse list-unstyled" id="NT">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/NT','1',this)"><i class="fa fa-angle-double-right"></i>Nombre de projets présentés</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/NT', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de DAE délivrées </a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/getMontantInvestis/NT', '6',this)"><i class="fa fa-angle-double-right"></i>Montant d’investissement</a>
                            </li>
                        </ul>
                    </li>
                    <li class="">
                        <a href="#AE" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-tree icon"></i>Audit environnemental</a>
                        <ul class="collapse list-unstyled" id="AE">
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/Environnementaleparregion/AE','1',this)"><i class="fa fa-angle-double-right"></i>Nombre d’études examinées</a>
                            </li>
                            <li>
                                <a type="button" onclick="goToStat('/api/statistique/NombreEIE/AE', '3',this)"><i class="fa fa-angle-double-right"></i>Nombre de CCE délivrées</a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #f9f8f6; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
            <div class="container-fluid">
                <button type="button" style="width: 40px" id="sidebarCollapse" class="btn btn-primary">
                    <i class="fa fa-bars"></i>
                    <span class="sr-only">Toggle Menu</span>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
        </nav>
        <div class="row" id="contenu">
            <c:if test="${auto.equals('auto')}">
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter primary">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_ZF}</span>
                        <h6 class="count-name"><spring:message code='label.Importationdesdechetsdunezonnefranche'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter danger">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_ET}</span>
                        <h6 class="count-name"><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter success">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_XD}</span>
                        <h6 class="count-name"><spring:message code='label.ExportationDesDechetsDangereux'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter info">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_TR}</span>
                        <h6 class="count-name"><spring:message code='label.TransitDesDechets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter primary1">
                        <i class="fa fa-truck"></i>
                        <span class="count-numbers">${nbr_CT}</span>
                        <h6 class="count-name"><spring:message code='label.CollecteETTransportDesDEchets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter danger1">
                        <i class="fa fa-trash-restore"></i>
                        <span class="count-numbers">${nbr_INST}</span>
                        <h6 class="count-name"><spring:message code='label.Installationdetraitementdesdechets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter info1">
                        <i class="fa fa-info-circle"></i>
                        <span class="count-numbers"></span>
                        <h6 class="count-name">Information générale</h6>
                    </div>
                </div>
            </c:if>
            <c:if test="${auto.equals('ev')}">
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_EE}</span>
                        <h6 class="count-name"><spring:message code='label.EtudeImpactEnvironnemental'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_NT}</span>
                        <h6 class="count-name"><spring:message code='label.NoticeImpact'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_AE}</span>
                        <h6 class="count-name"><spring:message code='label.Auditenvirementale'/></h6>
                    </div>
                </div>
            </c:if>
            <c:if test="${auto.equals('tous')}">
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter primary">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_ZF}</span>
                        <h6 class="count-name"><spring:message code='label.Importationdesdechetsdunezonnefranche'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter danger">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_ET}</span>
                        <h6 class="count-name"><spring:message code='label.Importationdesdechetsnondangereuxdunpaysetranger'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter success">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_XD}</span>
                        <h6 class="count-name"><spring:message code='label.ExportationDesDechetsDangereux'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="card-counter info">
                        <i class="fa fa-recycle"></i>
                        <span class="count-numbers">${nbr_TR}</span>
                        <h6 class="count-name"><spring:message code='label.TransitDesDechets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter primary1">
                        <i class="fa fa-truck"></i>
                        <span class="count-numbers">${nbr_CT}</span>
                        <h6 class="count-name"><spring:message code='label.CollecteETTransportDesDEchets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter danger1">
                        <i class="fa fa-trash-restore"></i>
                        <span class="count-numbers">${nbr_INST}</span>
                        <h6 class="count-name"><spring:message code='label.Installationdetraitementdesdechets'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter info1">
                        <i class="fa fa-info-circle"></i>
                        <span class="count-numbers"></span>
                        <h6 class="count-name">Information générale</h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_EE}</span>
                        <h6 class="count-name"><spring:message code='label.EtudeImpactEnvironnemental'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_NT}</span>
                        <h6 class="count-name"><spring:message code='label.NoticeImpact'/></h6>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6" style="margin-top: 25px">
                    <div class="card-counter success1">
                        <i class="fa fa-tree"></i>
                        <span class="count-numbers">${nbr_AE}</span>
                        <h6 class="count-name"><spring:message code='label.Auditenvirementale'/></h6>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/main.js"></script>

<%-----------------------------------------------Zonne franche-------------------------------------------------------%>
<script type="text/javascript">

    $(document).ready(function(){
        $('.counter-value').each(function(){
            $(this).prop('Counter',0).animate({
                Counter: $(this).text()
            },{
                duration: 3500,
                easing: 'swing',
                step: function (now){
                    $(this).text(Math.ceil(now));
                }
            });
        });
    });

    function tousAut() {
        var autorisation = document.getElementById("autorisation");
        autorisation.classList.remove('show');
        autorisation.classList.add('hide');

    }

    function choisirAut() {
        var autorisation = document.getElementById("autorisation");
        autorisation.classList.remove('hide');
        autorisation.classList.add('show');
    }

    function fun_change(){
        $(".img_chart").each(function(ind,el){
            var src = "";
            //$("#affiche_shart").val(id);
            $(el).attr("src",src);
        });
        getStatZF();

    }

    function selectstatut(val){
        event.preventDefault();
        var type = $(val).val();
        if(type==="" || type==null){
            return false;
        }

        $.ajax({
            url: '/api/getTransporteurByClassification/'+type,
            type: 'post',
            dataType: "html",
            data: {
            },
        })
            .done(function(data) {
                $("#toutes").html(data);
            })
            .fail(function() {
                alert("error");
            })
            .always(function() {
            });
    }

    function fun_changesT(id,val){

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
        getStatZF();

    }

    function getStatZF() {

        var typeDechet =$("#typeDechet").val();
        var transporteur=$("#transporteur").val();
        var zonneFranche=$("#zonneFranche").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }

        $(".chart1").hide();
        $(".pie1").hide();

        var title='';
        if(typeDechet==1){
            title='dangereux';
        }else{
            title='non dangereux';
        }
        $.ajax({
            url:"/api/statistique/getCodeTypeDangereux",
            type:"GET",

            data:{
                "typeDechet":typeDechet,
                "transporteur":transporteur,
                "zonneFranche":zonneFranche
            }
        }).done(function(data){

            if(data.length==0){
                Swal.fire(
                    'Aucun résultat',
                    'Aucun résultat ne corréspond à vos critères de recherche',
                    'warning');
                return false;
            }

            var dataProvider = [];

            $(data).each(function(idx,el){

                dataProvider.push({
                    "code"   : el[0],
                    "type"   : el[1]
                });
            });
            $("#affiche_shart").val();

            var tr = "";
            $(dataProvider).each(function(ind,el){
                tr+="<tr><td>"+el.code+"</td><td>"+el.type+"</td></tr>";
            })
            var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Les types des déchets '+title+' autorisés pour importation de la zone franche</p> ' +
                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover"> ' +
                '<thead class="bg-vert text-white"> <tr> <th>Code</th> <th>Type de déchet</th> </tr>' +
                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div></div>';


            $("#resultat").html(tab1);



        }).fail(function(){
            alert("error");
        })
    }

    function afficheZon(val){

        $.ajax({
            url:"/api/zonne",
            type:"GET",
            data:{
            },
            success:function(data) {
                getNombreQuantiteZF(data,val);
            },
            error:function() {
                alert("error");
            }
        });
    }
    function getNombreStatZF() {

        var typeDechet =$("#typeDechet").val();
        var transporteur=$("#transporteur").val();
        var zonneFranche=$("#zonneFranche").val();

        if(typeDechet==0){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }

        $.ajax({
            url:"/api/statistique/getNombreTypeDangereux",
            type:"GET",

            data:{
                "typeDechet":typeDechet,
                "transporteur":transporteur,
                "zonneFranche":zonneFranche
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire(
                    'Aucun résultat',
                    'Aucun résultat ne corréspond à vos critères de recherche',
                    'warning');
                return false;
            }
            if((transporteur==0 && zonneFranche==0) || (transporteur!=0 && zonneFranche!=0)){
                $(".chart1").hide();
                $(".tab1").hide();
            }
            else{
                $(".chart1").show();
                $(".tab1").show();
            }
            var title='';
            if(typeDechet==1){
                title='dangereux';
            }else{
                title='non dangereux';
            }
            if((transporteur==0 && zonneFranche==0) || (transporteur!=0 && zonneFranche!=0)){
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "code"   : el[0],
                        "total"  : el[1]
                    });
                });
                var chart = $("#affiche_shart").val();

                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "hideCredits":true,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "code",
                        "valueField": "total",
                        "legend": {
                            "useGraphSettings": true,
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
                        "titles": [
                            {
                                "text": "Nombre des autorisations délivrées pour importation des déchets "+title+" des zones franches",
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
            }
            else{
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "nom"   : el[0],
                        "type"   : el[1],
                        "total"  : el[2]
                    });
                });
                var chart = $("#affiche_shart").val();

                var trans='';
                if(transporteur!=0){
                    trans='Société';
                }else if (zonneFranche!=0){
                    trans='Zonne franche';
                }

                var trans1=data[0].slice(1,-1);

                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "pie",
                        "theme": "none",
                        "hideCredits":true,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "labelRadius": -35,
                        //"labelText": "[[percents]]%",
                        "dataProvider": dataProvider,
                        "titleField"  : "nom",
                        "valueField": "total",
                        "legend": {
                            "useGraphSettings": true,
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
                        "titles": [
                            {
                                "text": "Nombre des autorisations délivrées pour importation des déchets "+title+" des zones franches par "+trans+ " "+trans1,
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
                else if(chart=="2"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "hideCredits":true,
                        "marginRight": 70,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left",
                            "title": "Nombre des autorisations délivrées",

                        }],
                        "startDuration": 1,
                        "graphs": [  {
                            "balloonText": "[[title]]:[[value]]",
                            "fillAlphas": 0.8,
                            "lineAlpha": 0.2,
                            "title": "Total",
                            "type": "column",
                            "valueField": "total"
                        }],
                        "legend": {
                            "useGraphSettings": true,
                        },
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": "nom",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "export": {
                            "enabled": false
                        },
                        "maxSelectedSeries": 10,
                        "mouseWheelScrollEnabled": false,
                        "chartScrollbar": {
                            "graphType": "column",
                            "resizeEnabled": false,
                            "scrollbarHeight": 21,
                            "scrollDuration": 0,
                            "updateOnReleaseOnly": true
                        },
                        "titles": [
                            {
                                "text": "Nombre des autorisations délivrées pour importation des déchets "+title+" des zones franches par "+trans+ " "+trans1,
                                "color":"#003399",
                                "size": 20
                            }
                        ]

                    });
                }
                else if (chart=="3"){
                    if(transporteur!=0){
                        var tr = "";
                        $(dataProvider).each(function(ind,el){
                            tr+="<tr><td>"+el.nom+"</td><td>"+el.total+"</td></tr>";
                        })

                        var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                            '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des autorisations délivrées pour importation des déchets '+title+' des zones franches par '+trans+' '+trans1+'</p>' +
                            '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                            '<table class="table table-bordered table-striped table-hover"> ' +
                            '<thead class="bg-vert text-white"> <tr> <th>Zonne franche</th> <th>Total</th> </tr>' +
                            ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div></div>';

                        $("#resultat").html(tab1);
                    }
                    else if(zonneFranche!=0){
                        var tr = "";
                        $(dataProvider).each(function(ind,el){
                            tr+="<tr><td>"+el.nom+"</td><td>"+el.total+"</td></tr>";
                        })

                        var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                            '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des autorisations délivrées pour importation des déchets '+title+' des zones franches par '+trans+' '+trans1+'</p> ' +
                            '<div class="row justify-content-center mt-4"> <div class="col-md-6 col-sm-12"> ' +
                            '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                            '<thead class="bg-vert text-white"> <tr> <th>Société</th> <th>Total</th> </tr>' +
                            ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                        $("#resultat").html(tab1);
                    }
                }
            }

        }).fail(function(){
            alert("error");
        })
    }
    function getNombreSocieteZF() {
        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getNombreSociete",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){

            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "code"   : el[0],
                    "total"  : el[1],
                });
            });
            var chart = $("#affiche_shart").val();
            var t ="";
            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }

            if(chart=="1"){
                var chart = AmCharts.makeChart("resultat1", {
                    "type": "pie",
                    "theme": "none",
                    "hideCredits":true,
                    "colors": ["#80cbc4","#00897b","#004d40"],
                    "labelRadius": -35,
                    //"labelText": "[[percents]]%",
                    "dataProvider": dataProvider,
                    "titleField"  : "code",
                    "valueField": "total",
                    "legend": {
                        "useGraphSettings": true,
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
                    "titles": [
                        {
                            "text": "Nombre des sociétés importatrices des déchets "+t+" des Zones Franches ",
                            "color":"#003399",
                            "size": 20
                        }
                    ]
                });
            }else if(chart=="2"){
                var chart = AmCharts.makeChart("resultat1", {
                    "type": "serial",
                    "theme": "none",
                    "hideCredits":true,
                    "marginRight": 70,
                    "colors": ["#80cbc4","#00897b","#004d40"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre des sociétés importatrices",

                    }],
                    "startDuration": 1,
                    "graphs": [  {
                        "balloonText": "[[title]]:[[value]]",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "title": "Total",
                        "type": "column",
                        "valueField": "total"
                    }],

                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "code",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": false
                    },
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
                    "legend": {
                        "useGraphSettings": false,
                    },
                    "titles": [
                        {
                            "text": "Nombre des sociétés importatrices des déchets "+t+" des Zones Franches ",
                            "color":"#003399",
                            "size": 20
                        }
                    ]
                });
            }else if (chart=="3"){
                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.code+"</td><td>"+el.total+"</td></tr>";
                })
                var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des sociétés importatrices des déchets '+t+' des Zones Franches</p>' +
                    '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead class="bg-vert text-white"> <tr> <th>Zonne franche</th> <th>Total</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat1").html(tab1);
            }

        }).fail(function(){
            alert("error");
        })
    }
    function getNombreQuantiteZF(zonne,etat){
        var typeDechet =$("#typeDechet").val();
        var transporteur =$("#transporteur").val();
        var zonneFranche =$("#zonneFranche").val();

        if(typeDechet==0 || typeDechet==null){
            swal("<spring:message code="label.Avertissement" />","S'il vous plaît Choisir un type de déchet", "error");
            return false;
        }
        $(".pie1").hide();
        $.ajax({
            url:"/api/statistique/getQuantiteTypeDangereux",
            type:"GET",

            data:{
                "typeDechet":typeDechet,
                "transporteur":transporteur,
                "zonneFranche":zonneFranche,
                "etat":etat
            }
        }).done(function(data){

            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            var chart = $("#affiche_shart").val();
            var t ="";
            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }
            if(transporteur!=0 && zonneFranche ==0){
                if(etat==='bar') {
                    var dataProvider = [];
                    $(data).each(function (idx, el) {

                        dataProvider.push({
                            "trans": el[0],
                            "elimine": el[1],
                            "saisie": el[2],
                            "code": el[3],
                            "type": el[4],
                            "total": el[2] - el[1],
                            "qtesaisie": "Quantité saisie",
                            "qteElimine": "Quantité éliminé"
                        });
                    });
                    if (chart == "1") {
                        var trans = data[0].slice(0,-4);
                        var chart = AmCharts.makeChart("resultat", {
                            "type": "serial",
                            "theme": "none",
                            "hideCredits": true,
                            "categoryField": "code",
                            "rotate": false,
                            "startDuration": 1,
                            "colors": ["#80cbc4", "#00897b", "#004d40"],
                            "categoryAxis": {
                                "gridPosition": "start",
                                "position": "left"
                            },
                            "chartCursor": {
                                "categoryBalloonEnabled": false,
                                "cursorAlpha": 0,
                                "zoomable": false
                            },
                            "graphs": [
                                {
                                    "balloonText": "Quantité saisie:[[value]]",
                                    "fillAlphas": 0.8,
                                    "id": "AmGraph-1",
                                    "lineAlpha": 0.2,
                                    "title": "Quantité saisie",
                                    "type": "column",
                                    "valueField": "saisie"
                                },
                                {
                                    "balloonText": "Quantité éliminée:[[value]]",
                                    "fillAlphas": 0.8,
                                    "id": "AmGraph-2",
                                    "lineAlpha": 0.2,
                                    "title": "Quantité éliminée",
                                    "type": "column",
                                    "valueField": "elimine"
                                }
                            ],
                            "legend": {
                                "useGraphSettings": true,
                                "position": "right",
                                "color": "#003399",
                                "fontSize": 14,
                                "markerDisabledColor": "#AAB3B3",
                                "valueField": "total"
                            },
                            "guides": [],
                            "valueAxes": [
                                {
                                    "id": "ValueAxis-1",
                                    "position": "top",
                                    "axisAlpha": 0
                                }
                            ],
                            "allLabels": [],
                            "balloon": {},
                            "dataProvider": dataProvider,
                            "export": {
                                "enabled": false
                            },
                            "maxSelectedSeries": 10,
                            "mouseWheelScrollEnabled": false,
                            "chartScrollbar": {
                                "graphType": "column",
                                "resizeEnabled": false,
                                "scrollbarHeight": 21,
                                "scrollDuration": 0,
                                "updateOnReleaseOnly": true
                            },
                            "titles": [
                                {
                                    "text": "Quantité des déchets " + t + " autorisée à importer des zones franches par société "+trans,
                                    "color": "#003399",
                                    "size": 20
                                }
                            ]
                        });
                    }
                }
                else {
                    var dataProvider = [];
                    $(data).each(function (idx, el) {

                        dataProvider.push({
                            "nom": el[0],
                            "trans": el[1],
                            "elimine": el[2],
                            "saisie": el[3],
                            "code": el[4],
                            "type": el[5],
                            "total": el[3] - el[2],
                            "qtesaisie": "Quantité saisie",
                            "qteElimine": "Quantité éliminé"
                        });
                    });

                    if (chart == "2") {
                        var tr = '';
                        var tab1 = '';
                        var tr2 = '';
                        var title = '';
                        var trans = data[0].slice(1, -4);
                        if (typeDechet == 1) {
                            title = 'dangereux';
                        } else {
                            title = 'non dangereux';
                        }
                        $(zonne).each(function (ind, ell) {
                            var nom = ell;
                            $(dataProvider).each(function (ind, el) {
                                if (nom === el.nom)
                                    tr += "<td>" + el.code + "</td><td>" + el.type + "</td><td>" + el.saisie + "</td><td>" + el.elimine + "</td><td>" + el.total + "</td></tr>";
                            })
                            if (tr != '') {
                                tr2 += '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> <table class="table table-bordered"> ' +
                                    '<thead><tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">Société : ' + trans + '</th></tr><tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">Zonne franche : ' + nom + '</th></tr><tr class="bg-vert text-white"><th>Code</th><th>Type de déchet</th><th>Quantité saisie</th> <th>Quantité éliminé</th><th>Reste</th></tr>' +
                                    ' </thead> <tbody>' + tr + ' </tbody> </table> </div> </div>';
                                tr = '';
                            }
                        })
                        tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                            '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Quantité des déchets ' + title + ' autorisée à importer des zones franches par Société '+trans+' </p> ' + tr2 + '</div>';
                        $("#resultat").html(tab1);
                    }
                }
            }
            else if (transporteur==0 && zonneFranche!=0){
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "nom"      : el[0],
                        "elimine"  : el[1],
                        "saisie"   : el[2],
                        "code"     : el[3],
                        "type"     : el[4],
                        "total"    : el[2]-el[1],
                        "qtesaisie": "Quantité saisie",
                        "qteElimine": "Quantité éliminé"
                    });
                });
                if(chart=="1"){
                    var nom=data[0].slice(0,-4);
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "hideCredits":true,
                        "categoryField": "code",
                        "rotate": false,
                        "startDuration": 1,
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "categoryAxis": {
                            "gridPosition": "start",
                            "position": "left",
                            "labelRotation": 70,
                        },
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "graphs": [
                            {
                                "balloonText": "Quantité saisie:[[value]]",
                                "fillAlphas": 0.8,
                                "id": "AmGraph-1",
                                "lineAlpha": 0.2,
                                "title": "Quantité saisie",
                                "type": "column",
                                "valueField": "saisie"
                            },
                            {
                                "balloonText": "Quantité éliminée:[[value]]",
                                "fillAlphas": 0.8,
                                "id": "AmGraph-2",
                                "lineAlpha": 0.2,
                                "title": "Quantité éliminée",
                                "type": "column",
                                "valueField": "elimine"
                            }
                        ],
                        "legend": {
                            "useGraphSettings": true,
                            "position":"right",
                            "color":"#003399",
                            "fontSize":14,
                            "markerDisabledColor":"#AAB3B3",
                            "valueField":"total"
                        },
                        "guides": [],
                        "valueAxes": [
                            {
                                "id": "ValueAxis-1",
                                "position": "top",
                                "axisAlpha": 0
                            }
                        ],
                        "allLabels": [],
                        "balloon": {},
                        "dataProvider": dataProvider,
                        "export": {
                            "enabled": false
                        },
                        "maxSelectedSeries": 10,
                        "mouseWheelScrollEnabled": false,
                        "chartScrollbar": {
                            "graphType": "column",
                            "resizeEnabled": false,
                            "scrollbarHeight": 21,
                            "scrollDuration": 0,
                            "updateOnReleaseOnly": true
                        },
                        "titles": [
                            {
                                "text": "Quantité des déchets "+t+" autorisée à importer de la zone franche "+nom,
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
                else if (chart=="2"){
                    var tr='';
                    var tab1='';
                    var tr2='';
                    var title='';
                    //var trans=data[0].slice(1,-4);
                    if(typeDechet==1){
                        title='dangereux';
                    }else{
                        title='non dangereux';
                    }
                    $(zonne).each(function(ind,ell){
                        var nom = ell;
                        $(dataProvider).each(function(ind,el){
                            if(nom === el.nom)
                                tr+="<td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.saisie+"</td><td>"+el.elimine+"</td><td>"+el.total+"</td></tr>";
                        })
                        if(tr!=''){
                            tr2+='<p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Quantité des déchets '+title+' autorisée à importer de la zonne franche '+nom+' </p> ' +
                                '<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"> <table class="table table-bordered"> ' +
                                '<thead><tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">Zonne franche : '+nom+'</th></tr><tr class="bg-vert text-white"><th style="width: 20%">Code</th><th>Type de déchet</th><th>Quantité saisie</th> <th>Quantité éliminé</th><th>Reste</th></tr>' +
                                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';
                            tr='';
                        }
                    })
                    tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                        '<div  id="tab_stat">'+tr2+'</div>';
                    $("#resultat").html(tab1);
                }
            }
            else if (transporteur==0 && zonneFranche==0){
                var dataProvider = [];

                if(etat==="bar") {
                    $(data).each(function (idx, el) {
                        dataProvider.push({
                            "elimine": el[0],
                            "saisie": el[1],
                            "code": el[2],
                            "type": el[3],
                            "total": el[1] - el[0],
                            "qtesaisie": "Quantité saisie",
                            "qteElimine": "Quantité éliminé"
                        });
                    });
                    if(chart=="1"){
                        var chart = AmCharts.makeChart("resultat", {
                            "type": "serial",
                            "theme": "none",
                            "hideCredits":true,
                            "categoryField": "code",
                            "rotate": false,
                            "startDuration": 1,
                            "colors": ["#80cbc4","#00897b","#004d40"],
                            "categoryAxis": {
                                "gridPosition": "start",
                                "position": "left",
                                "labelRotation": 70,
                            },
                            "chartCursor": {
                                "categoryBalloonEnabled": false,
                                "cursorAlpha": 0,
                                "zoomable": false
                            },
                            "maxSelectedSeries": 10,
                            "mouseWheelScrollEnabled": false,
                            "chartScrollbar": {
                                "graphType": "column",
                                "resizeEnabled": false,
                                "scrollbarHeight": 21,
                                "scrollDuration": 0,
                                "updateOnReleaseOnly": true
                            },
                            "graphs": [
                                {
                                    "balloonText": "Quantité saisie:[[value]]",
                                    "fillAlphas": 0.8,
                                    "id": "AmGraph-1",
                                    "lineAlpha": 0.2,
                                    "title": "Quantité saisie",
                                    "type": "column",
                                    "valueField": "saisie"
                                },
                                {
                                    "balloonText": "Quantité éliminée:[[value]]",
                                    "fillAlphas": 0.8,
                                    "id": "AmGraph-2",
                                    "lineAlpha": 0.2,
                                    "title": "Quantité éliminée",
                                    "type": "column",
                                    "valueField": "elimine"
                                }
                            ],
                            "legend": {
                                "useGraphSettings": true,
                                "position":"right",
                                "color":"#003399",
                                "fontSize":14,
                                "markerDisabledColor":"#AAB3B3",
                                "valueField":"total"
                            },
                            "guides": [],
                            "valueAxes": [
                                {
                                    "id": "ValueAxis-1",
                                    "position": "top",
                                    "axisAlpha": 0
                                }
                            ],
                            "allLabels": [],
                            "balloon": {},
                            "dataProvider": dataProvider,
                            "export": {
                                "enabled": false
                            },
                            "titles": [
                                {
                                    "text": "Quantité des déchets "+t+" autorisée à importer des zones franches ",
                                    "color":"#003399",
                                    "size": 20
                                }
                            ]
                        });


                    }
                }else{
                    $(data).each(function (idx, el) {
                        dataProvider.push({
                            "nom"      : el[0],
                            "elimine": el[1],
                            "saisie": el[2],
                            "code": el[3],
                            "type": el[4],
                            "total": el[2] - el[1],
                            "qtesaisie": "Quantité saisie",
                            "qteElimine": "Quantité éliminé"
                        });
                    });
                    if (chart=="2"){
                        var tab1='';
                        var tr1='';
                        var tr2='';
                        var title='';

                        if(typeDechet==1){
                            title='dangereux';
                        }else{
                            title='non dangereux';
                        }
                        $(zonne).each(function(ind,ell){
                            var nom = ell;
                            $(dataProvider).each(function(ind,el){
                                if(nom === el.nom)
                                    tr1+="<td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.saisie+"</td><td>"+el.elimine+"</td><td>"+el.total+"</td></tr>";
                            })
                            if(tr1!=''){
                                tr2+='<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"><table class="table monTable table-bordered"> ' +
                                    '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">'+nom+'</th></tr><tr class="bg-vert text-white"><th width="20%">Code</th><th>Type de déchet</th><th>Quantité saisie</th> <th>Quantité éliminé</th><th>Reste</th></tr>' +
                                    ' </thead> <tbody>'+tr1+' </tbody> </table> </div> </div>';
                                tr1='';
                            }
                        })
                        tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                            '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Quantité des déchets '+title+' autorisée à importer des zones franches</p> '+tr2+'</div>';
                        $("#resultat").html(tab1);
                    }
                }
            }
            else{
                var dataProvider = [];
                $(data).each(function(idx,el){

                    dataProvider.push({
                        "nom"      : el[0],
                        "elimine"  : el[1],
                        "saisie"   : el[2],
                        "trans"    : el[3],
                        "code"     : el[4],
                        "type"     : el[5],
                        "total"    : el[2]-el[1],
                        "qtesaisie": "Quantité saisie",
                        "qteElimine": "Quantité éliminé"
                    });
                });
                var trans = data[0].slice(3, -2);
                var zone = data[0].slice(0,-5);
                if(chart=="1"){
                    var chart = AmCharts.makeChart("resultat", {
                        "type": "serial",
                        "theme": "none",
                        "hideCredits":true,
                        "legend": {
                            "horizontalGap": 10,
                            "maxColumns": 1,
                            "position": "right",
                            "useGraphSettings": true,
                            "markerSize": 10
                        },
                        "colors": ["#80cbc4","#00897b","#004d40"],
                        "dataProvider": dataProvider,
                        "valueAxes": [{
                            "stackType": "regular",
                            "axisAlpha": 0.3,
                            "gridAlpha": 0
                        }],
                        "graphs": [{
                            "balloonText": "<b>[[title]] : <span style='font-size:14px'>[[value]]</span></b><br><span style='font-size:14px'><b>[[category]]</b></span>",
                            "fillAlphas": 0.8,
                            "labelText": "[[value]]",
                            "lineAlpha": 0.3,
                            "title": "Quantité saisie",
                            "type": "column",
                            "color": "#000000",
                            "valueField": "saisie"
                        }, {
                            "balloonText": "<b>[[title]] : <span style='font-size:14px'>[[value]]</span></b><br><span style='font-size:14px'><b>[[category]]</b></span>",
                            "fillAlphas": 0.8,
                            "labelText": "[[value]]",
                            "lineAlpha": 0.3,
                            "title": "Quantité éliminée",
                            "type": "column",
                            "color": "#000000",
                            "valueField": "elimine"
                        }],
                        "categoryField": "nom",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "axisAlpha": 0,
                            "gridAlpha": 0,
                            "position": "left"
                        },

                        "export": {
                            "enabled": false
                        },
                        "titles": [
                            {
                                "text": "Quantité des déchets "+title+" autorisée à importer des zones franches par "+trans+" et par "+zone,
                                "color":"#003399",
                                "size": 20
                            }
                        ]
                    });
                }
                else if (chart=="2"){

                    var tr1='';
                    var title='';
                    if(typeDechet==1){
                        title='dangereux';
                    }else{
                        title='non dangereux';
                    }
                    $(dataProvider).each(function(ind,el){
                        tr1+="<tr><td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.saisie+"</td><td>"+el.elimine+"</td><td>"+el.total+"</td></tr>";
                    })
                    var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                        '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Quantité des déchets '+title+' autorisée à importer des zones franches par '+trans+' et par '+zone+' </p><div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                        '' +
                        '<table class="table table-bordered table-striped table-hover">' +
                        '<thead class="bg-vert text-white"> <tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">Société :'+trans+'</th></tr><tr hidden style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">Zonne franche : '+zone+'</th></tr> <tr><th>Code</th><th>Type de déchet</th><th>Quantité saisie</th> <th>Quantité éliminé</th><th>Reste</th> </tr>' +
                        ' </thead> <tbody>'+tr1+' </tbody> </table> </div> </div></div>';
                    $("#resultat").html(tab1);
                }
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

    function fun_changes1(id,val){

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
        getNombreStatZF();

    }
    function fun_changes2(id,val){

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
        getNombreSocieteZF();

    }
    function fun_changes3(id,val,etat){

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
        afficheZon(etat);

    }

    function goToStat(url,type,btn){
        $.ajax({
            type : "GET",
            url :url,
            data:{
                "type":type
            },
            success : function(data) {
                $("#contenu").html(data);
                $("a").removeClass("active");
                $(btn).addClass("active");
            },
            error : function(response) {
                alert("error")
            }
        });
    }

</script>

<%-----------------------------------------------Pays etranger-------------------------------------------------------%>
<script>
    function getNombrePaysET(){
        var pays =$("#pays").val();

        if(pays=="" || pays==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un pays étranger',
                'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getNombrePaysET",
            type:"GET",

            data:{
                "pays":pays
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            $(".pie1").hide();
            var pays = data[0].slice(0,-3);
            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "pays"  : el[0],
                    "code"  : el[1],
                    "type"  : el[2],
                    "total" : el[3]
                });
            });
            var chart = $("#affiche_shart").val();

            if(chart=="1"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "serial",
                    "theme": "none",
                    "hideCredits":true,
                    "marginRight": 70,
                    "colors": ["#80cbc4","#00897b","#004d40"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre des autorisations délivrées",

                    }],
                    "startDuration": 1,
                    "graphs": [  {
                        "balloonText": "[[title]]:[[value]]",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "title": "Total",
                        "type": "column",
                        "valueField": "total"
                    }],
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "code",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": false
                    },
                    "legend": {
                        "useGraphSettings": false,
                    },
                    "titles": [
                        {
                            "text": "Nombre des autorisations délivrées pour importation des déchets non dangereux du pays "+pays,
                            "color":"#003399",
                            "size": 20
                        }
                    ]
                });
            }else if (chart=="2"){
                var tr = "";
                $(dataProvider).each(function(ind,el){
                    tr+="<tr><td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.total+"</td></tr>";
                })
                var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des autorisations délivrées pour importation des déchets non dangereux du pays '+pays+'</p>' +
                    '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead> <tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="5" class="text-center">'+pays+'</th></tr> <tr class="bg-vert text-white"> <th style="width: 20%">Code</th><th>Type</th><th>Total</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat").html(tab1);
            }

        }).fail(function(){
            alert("error");
        })
    }

    function fun_changesET1(id,val){

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
        getNombrePaysET();

    }

    function affichePaysXD(){
        $.ajax({
            url:"/api/pays",
            type:"GET",
            data:{
            },
            success:function(data) {
                getNombrePaysTypeXD(data);
            },
            error:function() {
                alert("error");
            }
        });
    }

    function getNombrePaysTypeXD(paysXD){
        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }
        $(".pie1").hide();
        $.ajax({
            url:"/api/statistique/getNombrePaysTypeXD",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){
            if(data.length===0){
                Swal.fire("Aucun résultat","Aucun résultat ne corréspond à vos critères de recherche","warning");
                return false;
            }
            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "pays"  : el[0],
                    "code"  : el[1],
                    "type"  : el[2],
                    "total" : el[3],
                    "classification":el[4]
                });
            });
            var chart = $("#affiche_shart").val();

            if(chart=="1"){
                var chart = AmCharts.makeChart("resultat", {
                    "type": "serial",
                    "theme": "none",
                    "hideCredits":true,
                    "marginRight": 70,
                    "colors": ["#80cbc4","#00897b","#004d40"],
                    "dataProvider": dataProvider,
                    "valueAxes": [{
                        "axisAlpha": 0,
                        "position": "left",
                        "title": "Nombre des autorisations délivrées",

                    }],
                    "startDuration": 1,
                    "graphs": [  {
                        "balloonText": "[[title]]:[[value]]",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "title": "Total",
                        "type": "column",
                        "valueField": "total"
                    }],
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "code",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "labelRotation": 45
                    },
                    "export": {
                        "enabled": false
                    },
                    "legend": {
                        "useGraphSettings": false,
                    },
                    "titles": [
                        {
                            "text": "Nombre des autorisations délivrées pour exportation des déchets aux pays Etrangers Par chaque Pays et Type des déchets",
                            "color":"#003399",
                            "size": 20
                        }
                    ]
                });
            }
            else if (chart=="2"){

                var tab1='';
                var tr1='';
                var tr2='';
                var c=data[0].slice(4);

                $(paysXD).each(function(ind,ell){
                    var nom = ell;
                    $(dataProvider).each(function(ind,el){
                        if(nom === el.pays)
                            tr1+="<td>"+el.code+"</td><td>"+el.type+"</td><td>"+el.total+"</td></tr>";
                    })
                    if(tr1!=''){
                        tr2+='<div class="row justify-content-center mt-4"><div class="col-md-8 col-sm-12"><table class="table table-bordered"> ' +
                            '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="3" class="text-center">Pays : '+nom+'</th></tr><tr hidden><th class="text-left"> Type de déchet : '+c+'</th></tr><tr class="bg-vert text-white"><th style="width: 20%">Code</th><th>Type de déchet</th><th>Total</th></tr>' +
                            ' </thead> <tbody>'+tr1+' </tbody> </table> </div> </div>';
                        tr1='';
                    }
                })
                tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                    '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Nombre des autorisations délivrées pour exportation des déchets aux pays Etrangers Par chaque Pays et Type des déchets </p> '+tr2+'</div>';
                $("#resultat").html(tab1);
            }

        }).fail(function(){
            alert("error");
        })
    }

    function fun_changesXD1(id,val){

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
        affichePaysXD();

    }
</script>

<%--/////////////////////////////////////////////////////Information général///////////////////////////////////////////////////--%>

<script>
    function getSocieteImportatriceZF() {
        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getSocieteImportatriceJsp",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){

            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "nom"   : el[0],
                    "type"  : el[1],
                });
            });

            $("#affiche_shart").val();
            var t ="";
            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }
            var tr = "";
            $(dataProvider).each(function(ind,el){
                tr+="<tr><td>"+el.nom+"</td></tr>";
            })
            var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Sociétés importatrices des déchets '+t+' des Zones Franches </p>' +
                '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                '<thead class="bg-vert text-white"> <tr> <th>Sociétés importatrices</th></tr>' +
                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

            $("#resultat").html(tab1);

        }).fail(function(){
            alert("error");
        })
    }

    function getSocieteExportateurXD() {
        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getSocieteExportateurJsp",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){

            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "nom"   : el[0],
                    "type"  : el[1],
                });
            });

            $("#affiche_shart").val();
            var t ="";
            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }
            var tr = "";
            $(dataProvider).each(function(ind,el){
                tr+="<tr><td>"+el.nom+"</td></tr>";
            })
            var tab1 = '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Sociétés des pays exportateurs des déchets '+t+' au Maroc</p>' +
                '<div class="row justify-content-center mt-4"> <div class="col-md-12 col-sm-12"> ' +
                '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                '<thead class="bg-vert text-white"> <tr> <th>Sociétés des pays exportateurs</th></tr>' +
                ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

            $("#resultat").html(tab1);

        }).fail(function(){
            alert("error");
        })
    }

    function afficheZonProducteur(){
        $.ajax({
            url:"/api/zonne",
            type:"GET",
            data:{
            },
            success:function(data) {
                getProducteurZF(data);
            },
            error:function() {
                alert("error");
            }
        });
    }

    function getProducteurZF(zonne) {
        var typeDechet =$("#typeDechet").val();

        if(typeDechet==0 || typeDechet==null){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>!',
                'S\'il vous plaît Choisir un type de déchet',
                'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getProducteurZFJsp",
            type:"GET",

            data:{
                "typeDechet":typeDechet
            }
        }).done(function(data){

            var dataProvider = [];
            $(data).each(function(idx,el){

                dataProvider.push({
                    "producteur"   : el[0],
                    "adresse"      : el[1],
                    "tel"          : el[2],
                    "zonne"  : el[3]
                });
            });

            $("#affiche_shart").val();
            var tr1='';
            var tr2='';
            var tab1='';
            var t ="";
            if(typeDechet==1){
                t="dangereux";
            }else{
                t="non dangereux";
            }
            $(zonne).each(function(ind,ell){
                var nom = ell;
                $(dataProvider).each(function(ind,el){
                    if(nom === el.zonne)
                        tr1+="<td>"+el.producteur+"</td><td>"+el.adresse+"</td><td>"+el.tel+"</td></tr>";
                })
                if(tr1!=''){
                    tr2+='<div class="row justify-content-center mt-4"><div class="col-md-10 col-sm-12"><table class="table monTable table-bordered"> ' +
                        '<thead><tr style="background-color: #c6ecc6; color: #0b2e13; font-weight: bold"><th rowspan="1" colspan="3" class="text-center">Zonne franche : '+nom+'</th></tr><tr class="bg-vert text-white"><th>Producteur</th><th>Adresse</th><th>Téléphone</th></tr>' +
                        ' </thead> <tbody>'+tr1+' </tbody> </table> </div> </div>';
                    tr1='';
                }
            })
            tab1 += '<ul id="chart-selector"> <button class="btn btn-outline-success" onclick="tableToExcel(\'tab_stat\', \'Statistique des autorisations\')"><span style="color:#1b5e20"><i class="fa fa-file-excel"></i> Exporter EXCEL</span></button> </ul>' +
                '<div  id="tab_stat"><p class="text-center" style="color: #003399; font-size: 20px; font-family: sans-serif !important; font-weight: bold">Producteurs des déchets '+t+' aux Zones Franches </p> '+tr2+'</div>';
            $("#resultat").html(tab1);

        }).fail(function(){
            alert("error");
        })
    }

    function getStatutDossier() {
        var type= $("#type").val();
        var statut_select=$("#statut_select").val();

        if(type==0){
            Swal.fire(
                '<spring:message code="label.Avertissement"/>','Merci de choisir un type d\'autorisation', 'error');
            return false;
        }
        if(statut_select==0) {
            Swal.fire(
                '<spring:message code="label.Avertissement"/>', 'Merci de choisir une statut', 'error');
            return false;
        }
        $.ajax({
            url:"/api/statistique/getStatutDossierJsp",
            type:"GET",

            data:{
                "type":type,
                "statut_select":statut_select
            }
        }).done(function(data){
            if(data[0]==null || data.length===0){
                Swal.fire(
                    '<spring:message code="label.AucunResultat"/>','<spring:message code="label.Aucunresultatnecorrespondavoscriterederecherche"/>', 'error');
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
                    "hideCredits":true,
                    "colors": ["#00ffbf","#00ffff","#00bfff","#0080ff"],
                    "labelRadius": -35,
                    "labelText": "[[percents]]%",
                    "dataProvider": dataProvider,
                    "valueField": "nbr",
                    "titleField": "etat",



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
                    "hideCredits":true,
                    "marginRight": 70,
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
                    "maxSelectedSeries": 10,
                    "mouseWheelScrollEnabled": false,
                    "chartScrollbar": {
                        "graphType": "column",
                        "resizeEnabled": false,
                        "scrollbarHeight": 21,
                        "scrollDuration": 0,
                        "updateOnReleaseOnly": true
                    },
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
                    tr+="<tr><td>"+el.etat+"</td><td>"+el.nbr+"</td></tr>";
                })

                var tab1 = '<div class="row justify-content-center mt-4"> <div class="col-md-10 col-sm-12"> ' +
                    '<table class="table table-bordered table-striped table-hover" id="tab_stat"> ' +
                    '<thead class="bg-vert text-white"> <tr> <th>Etat</th> <th>Nombre d\'autorisations</th> </tr>' +
                    ' </thead> <tbody>'+tr+' </tbody> </table> </div> </div>';

                $("#resultat").html(tab1);
            }


        }).fail(function(){
            alert("error");
        })
    }

    function fun_changesStatut(id,val){

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
        getStatutDossier();

    }

    function goToLien_menu(url,id){

        $.ajax({
            type: "GET",
            enctype: 'multipart/form-data',
            url : "/api/isAccessible/"+id,
            data: {},
            success : function(response) {
                if(response==="non"){
                    swal("Avertissement ! ","vous n'avez pas le droit d'accès de cette lien","warning");
                }
                else{
                    window.location.href=url;
                }
            },
            error : function() {
                alert("error");
            }
        });
    }
</script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="//www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<script src="/assets/js/Loginstatistique.js"></script>
