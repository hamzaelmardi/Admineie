package com.EIE.demo.dao;

import com.EIE.demo.model.Notification;
import com.EIE.demo.model.Pays;
import com.EIE.demo.model.StatutProjet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public
interface StatistiqueRepository extends JpaRepository<Notification, Integer> {

    @Query(nativeQuery = true, value = "select distinct t.raison_social, n.zf_et from notification n left join notification_transporteur_etranger nt on nt.id_notification=n.id_notification left join transporteur_etranger t on t.id_transporteur_etranger=nt.id_transporteur_etranger where n.zf_et='ZF' and n.classification_id=2")
    Object[] getSocieteImportatriceNonDang();

    @Query(nativeQuery = true, value = "select distinct t.nom, n.zf_et from notification n left join notif_tranport nt on nt.id_notification=n.id_notification left join transporteurparam t on t.id_transporteur_param=nt.id_transporteur where n.zf_et='ZF' and n.classification_id=1")
    Object[] getSocieteImportatriceDang();

    @Query(nativeQuery = true, value = "select distinct t.raison_social, n.zf_et from notification n left join notification_transporteur_etranger nt on nt.id_notification=n.id_notification left join transporteur_etranger t on t.id_transporteur_etranger=nt.id_transporteur_etranger where n.zf_et='XD' and n.classification_id=2")
    Object[] getSocieteExportateurNonDang();

    @Query(nativeQuery = true, value = "select distinct t.nom, n.zf_et from notification n left join notif_tranport nt on nt.id_notification=n.id_notification left join transporteurparam t on t.id_transporteur_param=nt.id_transporteur where n.zf_et='XD' and n.classification_id=1")
    Object[] getSocieteExportateurDang();

    @Query(nativeQuery = true, value = "select p.nom_fr as 'producteur',p.adresse_fr, p.tel, z.nom_fr as 'zonne' from notification n left join zonnefranche z on z.id_zonnefranche=n.idzonne_franche left join producteur p on p.id_producteur=n.idproducteur where n.zf_et='ZF' and n.classification_id=:dang")
    Object[] getProducteursZF(int dang);

    @Query("Select count(n) ,s.nom_fr from Notification n  left join n.statut s where s.deleteDateTime is null and n.deleteDateTime is null and n.zf_et=:type and s.id_statut_projet=:statut_select group by s.nom_fr")
    public Object[] getStatutDossiers(String type, int statut_select);

    @Query("Select count(n) ,s.nom_fr from CollecteTransporteur n  left join n.statut s where s.deleteDateTime is null and n.deleteDateTime is null and s.id_statut_projet=:statut_select group by s.nom_fr")
    public Object[] getStatutDossiersCT(int statut_select);

    @Query("Select count(n) ,s.nom_fr from Installation n  left join n.statut s where s.deleteDateTime is null and n.deleteDateTime is null and s.id_statut_projet=:statut_select group by s.nom_fr")
    public Object[] getStatutDossiersIT(int statut_select);

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet in(33,37,38,39,40,54,63,64,65,67,68,93) order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeZF();

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet in(33,37,38,39,40,54) order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeET();

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet in(33,37,38,39,40,83,84,85,86) order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeXD();

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet in(33,37,38,39,40,54) order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeTR();

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet not in(21,50,22) and type='CT' order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeCT();

    @Query("from StatutProjet where deleteDateTime is null and id_statut_projet not in(51) and type='IT' order by id_statut_projet ASC")
    public List<StatutProjet> getAllStatutByTypeIT();



    @Query(nativeQuery = true, value = "select count(n.id_notification) as 'nombre',s.nom_fr, n.zf_et from Notification n  left join statut_projet s on s.id_statut_projet=n.id_statut where (s.id_statut_projet=39 or s.id_statut_projet=27 or s.id_statut_projet=45) and DATEDIFF(day,getdate(),n.date_avis_departement)>30 and s.delete_date_time is null and n.delete_date_time is null group by s.nom_fr, n.zf_et")
    public Object[] getAvisdepartementsconcernes();

    @Query(nativeQuery = true, value = "select distinct c.nom_fr, c.nom_ar from notification n left join code c on n.code_id=c.id_code where n.id_statut=54 and n.delete_date_time is null and n.zf_et='ET'")
    Object[] getnotificationByETtypes();

    @Query(nativeQuery = true, value = "select c.nom_fr, c.nom_ar, count(n.id_notification) as 'nombre' from notification n left join code c on n.code_id=c.id_code where n.delete_date_time is null and n.zf_et='ET' and n.id_statut=54 group by c.nom_fr, c.nom_ar")
    Object[] getnotificationByETNombre();

    @Query(nativeQuery = true, value = "select p.nom_fr as 'pays', c.nom_fr as 'code', c.nom_ar as 'type', count(n.id_notification) as 'total' from notification n left join code c on c.id_code=n.code_id left join pays p on p.pays_id=n.id_pays where p.pays_id=:id_pays and n.delete_date_time is null and n.zf_et='ET' and n.id_statut=54 group by p.nom_fr, c.nom_fr, c.nom_ar")
    Object[] getNombrePaysParCode(int id_pays);

    @Query("select distinct n.pays from Notification n where n.deleteDateTime is null and n.zf_et='ET' and n.statut.id_statut_projet=54")
    List<Pays> getPaysNotificationsET();

    @Query(nativeQuery = true, value = "select distinct c.nom_fr, c.nom_ar from notification n left join code c on n.code_id=c.id_code where n.delete_date_time is null and n.zf_et='XD' and n.id_statut=84")
    Object[] getnotificationByXDtypes();

    @Query(nativeQuery = true, value = "select distinct p.nom_fr as 'pays', c.nom_fr as 'code', c.nom_ar as 'type' from notification n left join pays p on p.pays_id=n.id_pays left join code c on n.code_id=c.id_code where n.delete_date_time is null and n.zf_et='XD' and n.id_statut=84")
    Object[] getnotificationByXDPays();

    @Query(nativeQuery = true, value = "select c.nom_fr as 'code', c.nom_ar as 'type', count(n.id_notification) from notification n left join code c on n.code_id=c.id_code where n.delete_date_time is null and n.zf_et='XD' and n.id_statut=84 group by c.nom_fr, c.nom_ar")
    Object[] getnotificationByNombreXDCode();

    @Query(nativeQuery = true, value = "select distinct p.nom_fr, n.zf_et from notification n left join pays p on p.pays_id=n.id_pays where n.id_statut=84 and n.delete_date_time is null and n.zf_et='XD' and n.classification_id=2")
    Object[] getnotificationByPaysMarocXD();

    @Query(nativeQuery = true, value = "select p.nom_fr as 'pays', c.nom_fr as 'code', c.nom_ar as 'type', count(n.id_notification) as 'total', l.nom_fr from notification n left join code c on c.id_code=n.code_id left join pays p on p.pays_id=n.id_pays left join classification l on l.id_classification=n.classification_id where l.id_classification=:dang and n.delete_date_time is null and n.zf_et='XD' and n.id_statut=84 group by p.nom_fr, c.nom_fr, c.nom_ar, l.nom_fr")
    Object[]  getnotificationNombrePaysTypeXD(int dang);

    @Query(nativeQuery = true, value = "select p.nom_fr as 'pays', c.nom_fr as 'code', c.nom_ar as 'type', sum(CAST (replace(n.quantite,'','') AS INT)) from notification n left join pays p on p.pays_id=n.id_pays left join code c on n.code_id=c.id_code where n.delete_date_time is null and n.zf_et='XD' and n.id_statut=84 group by p.nom_fr, c.nom_fr, c.nom_ar")
    Object[] getnotificationQuantitePaysExport();


    ///////////////////////////////Collecte//////////////////////////////////////

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr, count(c.num_demande) from collectetransporteur c left join region r on r.region_id=c.region_id where c.region_id is not null and c.delete_date_time is null and c.region_id=:id_reg and c.id_statut=56 group by c.raison,r.nom_fr")
    Object[] getCountCollectByRegion(int id_reg);

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr, count(c.num_demande) from collectetransporteur c left join region r on r.region_id=c.region_id where c.region_id is not null and c.delete_date_time is null and c.id_statut=56 group by c.raison,r.nom_fr")
    Object[] getCountCollectByAll();

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr as 'region', p.nom_fr as 'prefecture', count(c.num_demande) from collectetransporteur c left join prefecture p on p.id_prefecture=c.prefecture_id left join region r on r.region_id=c.region_id where c.region_id is not null and c.region_id=:id_reg and c.id_statut=56 and c.prefecture_id=:id_pref and c.delete_date_time is null group by c.raison, r.nom_fr, p.nom_fr")
    Object[] getCountCollectByVille(int id_reg, int id_pref);

    @Query(nativeQuery = true, value = "select co.nom_fr, co.nom_ar, COUNT(c.num_demande) from code co left join codelist cl on co.id_code=cl.id_code left join collectetransporteur c on cl.id_collecte=c.id_collecte where LEN(c.num_demande) > 0 and co.id_classification=1 and c.id_statut=56 group by co.nom_fr, co.nom_ar")
    Object[] getCountCollecteByCode();

    @Query(nativeQuery = true, value = "select ct.email, c.raison, count(c.id_collecte) as 'nombre déchets' from collectetransporteur c left join compte ct on ct.compte_id=c.id_compte where c.type_renouvellement=3 and c.id_statut=56 group by ct.email, c.raison")
    Object[] getCountDemandeAjout();

    @Query(nativeQuery = true, value = "select ct.email, c.raison, count(cv.id_vehicule) as 'nombre vehicules' from collectetransporteur c left join compte ct on ct.compte_id=c.id_compte left join collect_vehicules cv on cv.id_collecte=c.id_collecte left join vehicules v on v.id_vehicule=cv.id_vehicule where  c.id_statut=56 group by ct.email, c.raison")
    Object[] getCountVehicules();

    @Query(nativeQuery = true, value = "select c.raison as 'societe', co.nom_fr, co.nom_ar from collectetransporteur c left join codelist cl on cl.id_collecte=c.id_collecte left join code co on co.id_code=cl.id_code where c.delete_date_time is null and c.id_statut=56")
    Object[] getCodeTypeBySociete();

    @Query("select distinct c.raison from CollecteTransporteur c where c.deleteDateTime is null")
    String[] getSocietesCollecte();

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr from collectetransporteur c left join region r on r.region_id=c.region_id where c.delete_date_time is null and c.region_id=:id_reg and c.id_statut=56")
    Object[] getCollectByRegion(int id_reg);

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr from collectetransporteur c left join region r on r.region_id=c.region_id where c.delete_date_time is null and c.id_statut=56")
    Object[] getCollectByAll();

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr as 'region', p.nom_fr as 'prefecture' from collectetransporteur c left join prefecture p on p.id_prefecture=c.prefecture_id left join region r on r.region_id=c.region_id where c.region_id=:id_reg and c.prefecture_id=:id_pref and c.id_statut=56 and c.delete_date_time is null")
    Object[] getCollectByVille(int id_reg, int id_pref);

    @Query(nativeQuery = true, value = "select distinct ct.email, c.raison from collectetransporteur c left join compte ct on ct.compte_id=c.id_compte where c.type_renouvellement=3 and c.id_statut=56")
    Object[] getSocieteDemandeAjout();

    @Query(nativeQuery = true, value = "select c.num_demande, FORMAT( c.datecoll2,'dd MMMM yyyy') from collectetransporteur c where c.id_statut=56")
    Object[] getDateExpiration();


    ///////////////////////////////Installation//////////////////////////////////////

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr, count(c.num_demande) as 'installation' from installation c left join region r on r.region_id=c.region_id where c.region_id is not null and c.delete_date_time is null and c.region_id=:id_reg group by c.raison,r.nom_fr")
    Object[] getCountInstallationByRegion(int id_reg);

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr, count(c.num_demande) as 'installation' from installation c left join region r on r.region_id=c.region_id where c.region_id is not null and c.delete_date_time is null group by c.raison,r.nom_fr")
    Object[] getCountInstallationByAll();

    @Query(nativeQuery = true, value = "select c.raison as 'societe',r.nom_fr as 'region', p.nom_fr as 'prefecture', count(c.num_demande) from installation c left join prefecture p on p.id_prefecture=c.prefecture_id left join region r on r.region_id=c.region_id where c.region_id is not null and c.region_id=:id_reg and c.prefecture_id=:id_pref and c.delete_date_time is null group by c.raison, r.nom_fr, p.nom_fr")
    Object[] getCountInstallationByVille(int id_reg, int id_pref);

    @Query(nativeQuery = true, value = "select co.nom_fr, co.nom_ar, COUNT(c.num_demande) from code co left join code_installation cl on co.id_code=cl.id_codes left join installation c on cl.id_installation=c.id_installation where LEN(c.num_demande) > 0 and co.id_classification=1 group by co.nom_fr, co.nom_ar")
    Object[] getCountInstallationByCode();

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr from installation c left join region r on r.region_id=c.region_id where c.delete_date_time is null and c.region_id=:id_reg")
    Object[] getInstallationByRegion(int id_reg);

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr from installation c left join region r on r.region_id=c.region_id where c.delete_date_time is null")
    Object[] getInstallationByAll();

    @Query(nativeQuery = true, value = "select distinct c.raison as 'societe',r.nom_fr as 'region', p.nom_fr as 'prefecture' from installation c left join prefecture p on p.id_prefecture=c.prefecture_id left join region r on r.region_id=c.region_id where c.region_id=:id_reg and c.prefecture_id=:id_pref and c.delete_date_time is null")
    Object[] getInstallationByVille(int id_reg, int id_pref);

    @Query(nativeQuery = true, value = "select c.raison as 'societe', co.nom_fr, co.nom_ar from installation c left join code_installation cl on cl.id_installation=c.id_installation left join code co on co.id_code=cl.id_codes where co.id_classification=1 and c.delete_date_time is null")
    Object[] getCodeTypeBySocieteInstall();

    @Query("select distinct c.raison from Installation c where c.deleteDateTime is null")
    String[] getSocietesInstallation();

    @Query(nativeQuery = true, value = " select c.num_demande, FORMAT(DATEADD(YEAR,5, c.date_validation),'dd MMMM yyyy') as 'Date' from installation c where c.id_statut=57 and c.delete_date_time is null")
    String[] getDateExpirationInstall();
}
