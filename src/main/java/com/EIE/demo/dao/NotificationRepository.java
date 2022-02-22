package com.EIE.demo.dao;

import java.sql.Date;
import java.util.List;

import com.EIE.demo.model.*;
import org.hibernate.query.NativeQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NotificationRepository extends JpaRepository<Notification, Integer> {


	@Query("from Notification  where deleteDateTime is null order by id_notification DESC  ")
	public List<Notification> getAllNotification();


	@Query("select n from  Notification n left join n.compte ct where n.deleteDateTime is null and ct.compteId=:compteId order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompte(Pageable page,@Param("compteId") int compteId );

	@Query("select n from  Notification n left join n.compte ct left join n.zonneFranche zf  where zf.id_zonnefranche is null and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByEtatZF(Pageable page,@Param("compteId") int compteId );

	@Query("select n from  Notification n left join n.compte ct left join n.zonneFranche zf where zf.id_zonnefranche is null and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByNotEtatZF(Pageable page,@Param("compteId") int compteId );

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet != 29 and n.zf_et=:statut order by id_notification DESC  ")
	public Page<Notification> getAllNotificationByNotEtatZF(Pageable page,@Param("statut") String statut );

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in (:ids) and n.zf_et=:statut order by n.id_notification ASC  ")
	public Page<Notification> getAllNotificationByNotEtatZFnotinID(Pageable page,@Param("statut") String statut,List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in (:ids) and n.zf_et=:statut order by n.id_notification desc  ")
	public Page<Notification> getAllNotificationByByNbr_Desc(Pageable page,@Param("statut") String statut,List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.zf_et=:type and n.statut.id_statut_projet!=29 and n.statut.id_statut_projet=:statut order by n.id_notification ASC  ")
	public Page<Notification> getAllNotificationByNotEtatZFbyStatut(Pageable page,@Param("type") String type, @Param("statut") int statut);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.zf_et=:type and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut order by n.id_notification ASC  ")
	public Page<Notification> getAllNotificationByNotEtatZFbyStatutnotinID(Pageable page,@Param("type") String type, @Param("statut") int statut,List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.zf_et=:type and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut order by n.id_notification ASC  ")
	public Page<Notification> getAllNotificationByNotEtatZFbyStatutnotinID_desc(Pageable page,@Param("type") String type, @Param("statut") int statut,List<Integer> ids);

	@Query("select n from Notification n  where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type and n.region.regionId=:regionId  order by n.id_notification ASC")
	public Page<Notification> getAllNotificationByRegion(Pageable page,@Param("type") String type,int regionId, List<Integer> ids);

	@Query("select n from Notification n  where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type and n.region.regionId=:regionId  order by n.id_notification desc")
	public Page<Notification> getAllNotificationByRegion_desc(Pageable page,@Param("type") String type,int regionId,List<Integer> ids);

	@Query("select n from Notification n where n.deleteDateTime is NULL and n.compteAffecte.compteId=:cpt and n.zf_et=:type order by n.id_notification asc")
	public Page<Notification> getAllNotificationByAffectation(Pageable page,@Param("type") String type,int cpt);

	@Query("select n from Notification n where n.deleteDateTime is NULL and n.compteAffecte.compteId=:cpt and n.zf_et=:type and n.dateDepot between :d1 and :d2 order by n.id_notification asc")
	public Page<Notification> getAllNotificationByAffectation_search_d(Pageable p,String type, java.sql.Date d1,java.sql.Date d2,int cpt);

	@Query("select n from Notification n where n.deleteDateTime is NULL and n.compteAffecte.compteId=:cpt and n.zf_et=:type and n.dateValidation between :d1 and :d2 order by n.id_notification asc")
	public Page<Notification> getAllNotificationByAffectation_search_v(Pageable p,String type, java.sql.Date d1,java.sql.Date d2,int cpt);

	@Query("select n from Notification n where n.deleteDateTime is NULL and n.compteAffecte.compteId=:cpt and n.zf_et=:type order by n.id_notification desc")
	public Page<Notification> getAllNotificationByAffectation_desc(Pageable page,@Param("type") String type,int cpt);

	@Query("select n from  Notification n left join n.compte ct left join n.pays zf  where zf.paysId is null and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByEtatET(Pageable page,@Param("compteId") int compteId );

	@Query("select n from  Notification n left join n.compte ct left join n.pays zf where zf.paysId is null and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByNotEtatET(Pageable page,@Param("compteId") int compteId );

	@Query("from Notification fp  where fp.num_notification=:a1 and fp.deleteDateTime is null order by fp.id_notification DESC  ")
	public Notification siExiste (@Param("a1") String a1);

	@Query("from Notification fp  where fp.passwordAutorite=:a1 and fp.autorite.email=:a2 and fp.deleteDateTime is null")
	public Notification siExisteEmailAutorite (@Param("a1") String a1,@Param("a2") String a2);

	@Query("from Notification fp  where fp.num_notification=:a1 and fp.zf_et=:zf_et and fp.deleteDateTime is null order by fp.id_notification DESC  ")
	public Notification siExisteZFET (@Param("a1") String a1,@Param("zf_et") String zf_et);

	@Query("from Notification  where deleteDateTime is null and id_notification=:idnotif order by id_notification DESC  ")
	public Notification getbyid(@Param("idnotif") int idnotif);

	@Query("select n from  Notification n left join n.compte ct left join n.pays zf where n.zf_et=:zf_et and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet!=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByEtat(Pageable page,@Param("compteId") int compteId,@Param("zf_et") String zf_et );

	@Query("select n from  Notification n left join n.compte ct left join n.pays zf where n.zf_et=:zf_et and n.deleteDateTime is null and ct.compteId=:compteId and n.statut.id_statut_projet=29 order by n.id_notification DESC  ")
	public Page<Notification> getAllNotificationByCompteByEtatNum(Pageable page,@Param("compteId") int compteId,@Param("zf_et") String zf_et );

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and n.zf_et=:zf_et and st.id_statut_projet not in(:ids) ")
    public int getCountNotif(String zf_et,List<Integer> ids);
//******
	@Query("Select count(n), n.zf_et from Notification n where n.deleteDateTime is null and n.zf_et in(:type) and n.dateDepot between :d1 and :d2 group by n.zf_et")
	Object[] getStatByDateDepot(java.sql.Date d1, java.sql.Date d2, List<String> type);
	@Query("Select count(n), n.zf_et from Notification n where n.deleteDateTime is null and n.zf_et in(:type) and n.dateValidation between :d1 and :d2 group by n.zf_et")
	Object[] getStatByDateValidation(java.sql.Date d1, java.sql.Date d2, List<String> type);
//******
	@Query("select count(n) from Notification n where n.deleteDateTime is null and n.dateDepot between :d1 and :d2 ")
	Object getAllType(java.sql.Date d1, java.sql.Date d2);
	@Query("select count(n) from Notification n where n.deleteDateTime is null and n.dateValidation between :d1 and :d2 ")
	Object getAllType1(java.sql.Date d1, java.sql.Date d2);

	@Query("from Notification n left join n.compte c where n.deleteDateTime is null and n.num_notification=:id and c.compteId=:compt_id and n.zf_et=:type")
    Notification getnotificationByUserType(String id, String type, int compt_id);

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and st.id_statut_projet not in (:ids)")
	public int getnotification(List<Integer> ids);

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and st.id_statut_projet not in (:ids) and n.zf_et='ZF'")
	public int getnotificationZF(List<Integer> ids);

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and st.id_statut_projet not in (:ids) and n.zf_et='ET'")
	public int getnotificationET(List<Integer> ids);

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and st.id_statut_projet not in (:ids) and n.zf_et='XD'")
	public int getnotificationXD(List<Integer> ids);

	@Query("select count(n) from Notification n left join n.statut st where n.deleteDateTime is null and st.id_statut_projet not in (:ids) and n.zf_et='TR'")
	public int getnotificationTR(List<Integer> ids);

	@Query(nativeQuery = true,value="select * from  notification as n left join  statut_projet as s on s.id_statut_projet=n.id_statut  where DATEDIFF(DAY,GETDATE(),n.datef)<=:nbrJour and DATEDIFF(DAY,GETDATE(),n.datef)>=0  and s.id_statut_projet!='33'")
	Notification[] getnumnotification(String nbrJour);

	@Query("Select count(n.id_notification) from Notification n left join n.compte comp where n.deleteDateTime is null and comp.compteId=:id_compt and n.zf_et=:type")
    Integer getNombreNotificationByUser(int id_compt, String type);

	@Query("select n from Notification n left join n.compte cp left join  n.statut st where cp.compteId=:id_compt and n.deleteDateTime is null and n.zf_et=:type and st.id_statut_projet=29")
    Notification[] getNotificationNotDpotByUser(int id_compt,String type);
	//ayoub
	@Query(nativeQuery = true,value="Select n.num_notification,DATEDIFF(DAY,dated,datef) as Njour ,  n.date_depot,d.nom_fr as 'Code',z.nom_fr as 'Zonne',n.operation,n.quantite,n.dated,n.datef,s.nom_fr as 'NomS',t.name_fr NomSo,t.adresse_fr,t.tel,t.fax   from notification as n left join statut_projet as s on n.id_statut=s.id_statut_projet left join compte as c on n.compte_id=c.compte_id  left join societe as t on t.societes_id=c.societes_id left join code as d on d.id_code=n.code_id left join zonnefranche as z on z.id_zonnefranche=n.idzonne_franche where s.type='ZF' and n.date_depot between :d1 and :d2 ")
	Object[] getByDateDepot(java.sql.Date d1, java.sql.Date d2);
	@Query(nativeQuery = true,value="Select n.num_notification,DATEDIFF(DAY,dated,datef) as Njour ,  n.date_depot,d.nom_fr,z.nom_fr,n.operation,n.quantite,n.dated,n.datef,s.nom_fr,t.name_fr,t.adresse_fr,t.tel,t.fax   from notification as n left join statut_projet as s on n.id_statut=s.id_statut_projet left join compte as c on n.compte_id=c.compte_id  left join societe as t on t.societes_id=c.societes_id left join code as d on d.id_code=n.code_id left join zonnefranche as z on z.id_zonnefranche=n.idzonne_franche where s.type='ZF' and n.dateValidation between :d1 and :d2 ")
	Object[] geByDateValidation(java.sql.Date d1, java.sql.Date d2);
	//ayoub
	@Query("select n from Notification n left join n.compte cp left join  n.statut st where cp.compteId=:id_compt and n.deleteDateTime is null and n.zf_et=:type order by n.id_notification desc")
	Notification[] getNotificationAllbyCompt(int id_compt,String type);
	@Query("select n from Notification n left join n.compte cp left join  n.statut st where cp.compteId=:id_compt and n.deleteDateTime is null and n.zf_et=:type and st.id_statut_projet!=29 order by n.id_notification desc")
	Notification[] getNotificationAllbyComptNotNum(int id_compt,String type);


	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:statut  and n.dateDepot between :d1 and :d2  order by id_notification DESC  ")
	public Page<Notification> getByDateDepotA(Pageable p,@Param("statut") String statut, java.sql.Date d1,java.sql.Date d2, List<Integer> ids);
	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:statut  and n.dateValidation between :d1 and :d2   order by id_notification DESC  ")
	public Page<Notification> geByDateValidationA(Pageable p,@Param("statut") String statut, java.sql.Date d1,java.sql.Date d2,List<Integer> ids);
	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:statut  and n.dateDepot between :d1 and :d2  and n.statut.id_statut_projet=:selst order by id_notification DESC  ")
	public Page<Notification> getByDateDepotAB(Pageable p,@Param("statut") String statut, java.sql.Date d1,java.sql.Date d2,int selst, List<Integer> ids);
	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:statut  and n.dateValidation between :d1 and :d2 and n.statut.id_statut_projet=:selst  order by id_notification DESC  ")
	public Page<Notification> geByDateValidationAB(Pageable p,@Param("statut") String statut, java.sql.Date d1,java.sql.Date d2,int selst, List<Integer> ids);

	@Query("select n from Notification n left join n.compte cpt where cpt.compteId=:id_compt and n.id_notification=:id and n.deleteDateTime is null ")
    Notification getNotificationByIdComptId(int id, int id_compt);

	@Query("Select count(n) ,s.nom_fr from Notification n  left join n.statut s where s.deleteDateTime is null and n.deleteDateTime is null and n.zf_et=:type and n.dateDepot between :d1 and :d2  and s.id_statut_projet in (:statut_select)  group by s.nom_fr")
	public Object[] getStatByDateDepot1(java.sql.Date d1, java.sql.Date d2, String type,int[] statut_select);
	@Query("Select count(n) ,s.nom_fr from Notification n left join n.statut s where s.deleteDateTime is null and n.deleteDateTime is null and n.zf_et=:type and n.dateValidation between :d1 and :d2 and s.id_statut_projet in (:statut_select)  group by s.nom_fr ")
	public Object []getStatByDateValidation1(java.sql.Date d1, java.sql.Date d2, String type,int[] statut_select);




	@Query(nativeQuery = true, value = "SELECT  (SELECT COUNT(*) FROM notification where delete_date_time is null) + (SELECT COUNT(*) FROM collectetransporteur where delete_date_time is null) + (SELECT COUNT(*) FROM installation where delete_date_time is null)")
	public Integer getCountAutorisation();

	@Query("from Notification n where n.deleteDateTime is null and n.id_notification=:id and n.zf_et=:type")
	Notification getnotificationByIdType(int id, String type);


	@Query(nativeQuery = true, value = "select DATENAME(m,n.date_validation), case when sum(CONVERT(INT,n.quantite)) is null then 0 else sum(CONVERT(INT,n.quantite)) end as q, case when sum(CONVERT(INT,n.quantite_reel)) is null then 0 else sum(CONVERT(INT,n.quantite_reel)) end as r from notification as n  where year(n.date_validation) in (:annee) group by DATENAME(m,n.date_validation)\n")
	public Object[] datenotif(Integer annee);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type  and n.dateDepot between :d1 and :d2 and n.region.regionId=:regionId order by id_notification DESC  ")
	public Page<Notification> getByDateDepotRegion(Pageable p, String type, Date d1, Date d2, int regionId, List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type  and n.dateValidation between :d1 and :d2 and n.region.regionId=:regionId order by id_notification DESC  ")
	public Page<Notification> geByDateValidationRegion(Pageable p, String type, Date d1, Date d2, int regionId, List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type  and n.dateDepot between :d1 and :d2  and n.statut.id_statut_projet=:selst and n.region.regionId=:regionId order by id_notification DESC  ")
	public Page<Notification> getByDateDepotABByRegion(Pageable p, String type, Date d1, Date d2, int selst, int regionId, List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.zf_et=:type  and n.dateValidation between :d1 and :d2 and n.statut.id_statut_projet=:selst and n.region.regionId=:regionId  order by id_notification DESC  ")
	public Page<Notification> geByDateValidationABByRegion(Pageable p, String type, Date d1, Date d2, int selst, int regionId, List<Integer> ids);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.zf_et=:type and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut and n.region.regionId=:regionId order by n.id_notification ASC  ")
	public Page<Notification> getAllNotificationByStatutByRegion(Pageable p, String type, int statut, List<Integer> ids, int regionId);

	@Query("select n from  Notification n   where  n.deleteDateTime is null and n.zf_et=:type and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut and n.region.regionId=:regionId order by n.id_notification desc  ")
	public Page<Notification> getAllNotificationByStatutByRegion_desc(Pageable p, String type, int statut, List<Integer> ids, int regionId);

	// ---------debut type des déchets dangereux et non dangereux d'une zonne franche----------------------
	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n where n.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93)")
	Object[] getnotificationByCodeDangereux(int dang);

	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n left join n.transporteur t where t.id_transporteurParam=:id_trans and n.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) ")
	Object[] getnotificationByTransporteurDangereux(int id_trans, int dang);

	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n left join n.transporteur_etranger t where t.id_TransporteurEtranger=:id_trans and n.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) ")
	Object[] getnotificationByTransporteurEtrangerDangereux(int id_trans, int dang);

	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n left join n.zonneFranche t where t.id_zonnefranche=:id_zone and n.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) ")
	Object[] getnotificationByZonneDangereux(int id_zone, int dang);

	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n left join n.transporteur t left join n.zonneFranche z where t.id_transporteurParam=:id_trans and z.id_zonnefranche=:id_zone and n.deleteDateTime is null and t.deleteDateTime is null and z.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) ")
	Object[] getnotificationByTransporteurZonneDangereux(int id_trans, int id_zone, int dang);

	@Query("select distinct n.code.nom_fr, n.code.nom_ar from Notification n left join n.transporteur_etranger t left join n.zonneFranche z where t.id_TransporteurEtranger=:id_trans and z.id_zonnefranche=:id_zone and n.deleteDateTime is null and t.deleteDateTime is null and z.deleteDateTime is null and n.classification.id_classification=:dang and n.zf_et='ZF' and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) ")
	Object[] getnotificationByTransporteurEtrangerZonneDangereux(int id_trans, int id_zone, int dang);

	// ----------------fin type des déchets dangereux et non dangereux d'une zonne franche-------------

	// --------------debut Nombre des types des déchets dangereux et non dangereux d'une zonne franche--------------

	@Query(nativeQuery = true, value = "select t.nom,z.nom_fr,count(n.id_notification) as total from notification n left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param where n.idzonne_franche=:id_zone and n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by t.nom, z.nom_fr")
	Object[] getNombrenotificationByZonneDangereux(int id_zone, int dang);


	@Query(nativeQuery = true, value = "select n.zf_et, count(n.id_notification) from notification n where n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by n.zf_et")
	Object[] getNombrenotificationByCodeDangereux(int dang);

	@Query(nativeQuery = true, value = "select n.zf_et, count(n.id_notification) from notification n left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param where n.idzonne_franche=:id_zone and nt.id_transporteur=:id_trans and n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by n.zf_et")
	Object[] getNombrenotificationByTransporteurZonneDangereux(int id_trans, int id_zone, int dang);

	@Query(nativeQuery = true, value = "select z.nom_fr,t.nom, count(n.id_notification) as total from notification n left join notif_tranport nt on n.id_notification=nt.id_notification left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param where nt.id_transporteur=:id_trans and n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.nom")
	Object[] getNombrenotificationByTransporteurDangereux(int id_trans, int dang);

	@Query(nativeQuery = true, value = "select n.zf_et, count(n.id_notification) as total from notification n left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger where n.idzonne_franche=:id_zone and nt.id_transporteur_etranger=:id_trans and n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by n.zf_et")
	Object[] getNombrenotificationByTransporteurEtrangerZonneDangereux(int id_trans, int id_zone, int dang);

	@Query(nativeQuery = true, value = "select z.nom_fr,t.raison_social, count(n.id_notification) as total from notification n left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger where nt.id_transporteur_etranger=:id_trans and n.delete_date_time is null and n.classification_id=:dang and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.raison_social")
	Object[] getNombrenotificationByTransporteurEtrangerDangereux(int id_trans, int dang);

	// --------------fin Nombre des types des déchets dangereux et non dangereux d'une zonne franche-----------------

	// --------------début	Nombre des sociétés importatrices des déchets dangereux et non dangereux d'une zonne franche-----------------

	@Query(nativeQuery = true, value = "select zz.nom_fr,(select count(nt.id_transporteur) from notification n left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param where zz.id_zonnefranche=n.idzonne_franche and n.delete_date_time is null and n.classification_id=1 and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93))from zonnefranche zz")
	Object[] getNombreSocieteDangereuxZF();

	@Query(nativeQuery = true, value = "select zz.nom_fr,(select count(t.id_transporteur_etranger) from notification n left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger where zz.id_zonnefranche=n.idzonne_franche and n.delete_date_time is null and n.classification_id=2 and n.zf_et='ZF' and n.id_statut in(54,64,65,63,66,67,68,93))from zonnefranche zz")
	Object[] getNombreSocieteNonDangereuxZF();
	// --------------fin Nombre des sociétés importatrices des déchets dangereux et non dangereux d'une zonne franche-----------------


	// -------------- début	Quantité des déchets Dangereux et non dangereux autorisée à importer des zones franches-----------------

	@Query(nativeQuery = true, value = "select case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code  left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z  on n.idzonne_franche=z.id_zonnefranche where n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=:dang and n.id_statut in(54,64,65,63,66,67,68,93) group by c.nom_fr, c.nom_ar")
	Object[] getQuantiteDangereuxZFBar(int dang);

	@Query(nativeQuery = true, value = "select z.nom_fr, case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code  left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z  on n.idzonne_franche=z.id_zonnefranche where n.delete_date_time is null and n.zf_et='ZF'  and n.classification_id=:dang and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, c.nom_fr, c.nom_ar")
	Object[] getQuantiteDangereuxZFTab(int dang);

	@Query(nativeQuery = true, value = "select z.nom_fr as 'zone', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie',  c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche where z.id_zonnefranche=:id_zone and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=:dang and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByZoneFranche(int dang, int id_zone);

	@Query(nativeQuery = true, value = "select z.nom_fr as 'zone', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', t.raison_social as 'trans', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche where t.id_transporteur_etranger=:id_trans and z.id_zonnefranche=:id_zone and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=2 and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.raison_social, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByZoneFrancheTransporteurEtranger(int id_zone, int id_trans);

	@Query(nativeQuery = true, value = "select t.raison_social as 'trans', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche where t.id_transporteur_etranger=:id_trans and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=2 and n.id_statut in(54,64,65,63,66,67,68,93) group by t.raison_social, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByTransporteurEtrangerBar(int id_trans);

	@Query(nativeQuery = true, value = "select z.nom_fr, t.raison_social as 'trans', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join notification_transporteur_etranger nt on n.id_notification=nt.id_notification left join transporteur_etranger t on nt.id_transporteur_etranger=t.id_transporteur_etranger left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche where t.id_transporteur_etranger=:id_trans and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=2 and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.raison_social, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByTransporteurEtrangerTab(int id_trans);

	@Query(nativeQuery = true, value = "select z.nom_fr as 'zone', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', t.nom as 'trans', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement left join zonnefranche z on n.idzonne_franche=z.id_zonnefranche where z.id_zonnefranche=:id_zone and nt.id_transporteur=:id_trans and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=1 and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.nom, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByZoneFrancheTransporteurParam(int id_zone, int id_trans);

	@Query(nativeQuery = true, value = "select t.nom as 'trans', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join zonnefranche z on z.id_zonnefranche=n.idzonne_franche left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement where nt.id_transporteur=:id_trans and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=1 and n.id_statut in(54,64,65,63,66,67,68,93) group by t.nom, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByTransporteurParamBar(int id_trans);

	@Query(nativeQuery = true, value = "select z.nom_fr as 'zone', t.nom as 'trans', case when sum(CAST (replace(dm.quantite,'','') AS INT)) is null then 0 else sum(CAST (replace(dm.quantite,'','') AS INT)) end as 'quantité éliminée', sum(CAST (replace(n.quantite,'','') AS INT)) as 'quantité saisie', c.nom_fr as 'code',c.nom_ar as 'type' from notification n left join code c on n.code_id=c.id_code left join zonnefranche z on z.id_zonnefranche=n.idzonne_franche left join notif_tranport nt on n.id_notification=nt.id_notification left join transporteurparam t on nt.id_transporteur=t.id_transporteur_param left join notification_detail_doc_mouvement ndm on ndm.id_notification=n.id_notification left join detail_document_mouvement dm on dm.id_doc_mouvement=ndm.id_doc_mouvement where nt.id_transporteur=:id_trans and n.delete_date_time is null and n.zf_et='ZF' and n.classification_id=1 and n.id_statut in(54,64,65,63,66,67,68,93) group by z.nom_fr, t.nom, c.nom_fr, c.nom_ar")
	Object[] getQuantiteByTransporteurParamTab(int id_trans);

	@Query("select z.nom_fr from ZonneFranche z where deleteDateTime is null")
	String[] getZF();
	// -------------- début	Quantité des déchets Dangereux et non dangereux autorisée à importer des zones franches-----------------

	@Query(nativeQuery = true, value = "select distinct n.zf_et, p.nom_fr from notification n left join pays p on p.pays_id=n.id_pays where n.delete_date_time is null and n.zf_et='ET'")
	Object[] getnotificationByETPays();

	// -------------------------------------------- début Exportation des déchets---------------------------------------
	@Query("select p.nom_fr from Pays p where p.deleteDateTime is null")
	String[] getXD();
}
