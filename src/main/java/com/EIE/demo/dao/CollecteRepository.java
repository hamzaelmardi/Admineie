package com.EIE.demo.dao;

import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Installation;
import com.EIE.demo.model.Notification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

public interface CollecteRepository extends JpaRepository<CollecteTransporteur, Integer> {

	@Query("select n from  CollecteTransporteur n left join n.compte ct where   n.deleteDateTime is null and ct.compteId=:compteId  order by n.id_collecte DESC  ")
	public Page<CollecteTransporteur> getAllCollecteByCompte(Pageable page, @Param("compteId") int compteId);

	@Query("from CollecteTransporteur  where deleteDateTime is null order by id_collecte DESC  ")
	public List<CollecteTransporteur> getAllCollecteTransporteur();

	@Query("select n from  CollecteTransporteur n left join n.compte ct where   n.deleteDateTime is null and ct.compteId=:iduser and n.id_collecte=:id  order by n.id_collecte DESC  ")
	CollecteTransporteur getCollecteById(int id, int iduser);
	@Query("select n from  CollecteTransporteur n left join n.compte ct where  ct.compteId=:iduser and n.id_collecte=:id  order by n.id_collecte DESC  ")
	CollecteTransporteur getCollecteById_deleted(int id, int iduser);


	@Query("select  ct from CollecteTransporteur ct left join ct.code where ct.id_collecte=:id and ct.deleteDateTime is null order by  ct.id_collecte DESC")
	CollecteTransporteur getById(int id);

	@Query("from CollecteTransporteur  where deleteDateTime is null and  id_collecte=:id  ")
	CollecteTransporteur getbyid(int id);

	@Query("select count(c) from CollecteTransporteur c left join c.statut st where c.deleteDateTime is null and st.id_statut_projet not in(:ids)")
    public int getCountCollect(List<Integer> ids);

	@Query("select count(c),s.nom_fr from CollecteTransporteur c left join c.statut s where s.deleteDateTime is null and c.deleteDateTime is null and c.dateDepot between :d1 and :d2 group by s.nom_fr")
    Object[] getStatByDate(Date d1, Date d2);

	@Query("from CollecteTransporteur c left join c.compte comp where c.deleteDateTime is null and c.num_demande=:id and comp.compteId=:compt_id")
    CollecteTransporteur getCollecteByNumDemande(String id, int compt_id);

	@Query("select n from  CollecteTransporteur n  where   n.deleteDateTime is null and n.statut.id_statut_projet<>50  order by n.id_collecte asc  ")
	public Page<CollecteTransporteur> getAllListCollecte(PageRequest pageRequest);

	@Query("select n from  CollecteTransporteur n  where   n.deleteDateTime is null and n.statut.id_statut_projet<>50  order by n.id_collecte DESC  ")
	public Page<CollecteTransporteur> getAllListCollecte_desc(PageRequest pageRequest);

	@Query("select n from  CollecteTransporteur n  where   n.deleteDateTime is null and n.region.regionId=:regionId order by n.id_collecte DESC  ")
	public Page<CollecteTransporteur> getAllListCollecteByRegion(Pageable p,int regionId);

	@Query("select n from  CollecteTransporteur n  where   n.deleteDateTime is null and n.region.regionId=:regionId order by n.id_collecte asc")
	public Page<CollecteTransporteur> getAllListCollecteByRegion_desc(Pageable p,int regionId);

	@Query("select count(c),'CT' from CollecteTransporteur c left join c.statut s where s.deleteDateTime is null and c.deleteDateTime is null and c.dateDepot between :d1 and :d2 ")
    Object getStatByDateDepot(Date d1, Date d2);
	@Query("select count(c),'CT' from CollecteTransporteur c left join c.statut s where s.deleteDateTime is null and c.deleteDateTime is null and c.dateValidation between :d1 and :d2 ")
	Object getStatByDateValidation(Date d1, Date d2);


	@Query("from CollecteTransporteur fp  where fp.num_demande=:a1 and fp.deleteDateTime is null order by fp.id_collecte DESC  ")
	public CollecteTransporteur siExiste (@Param("a1") String a1);

	@Query("select count(c.id_collecte) from CollecteTransporteur c left join c.compte comp where c.deleteDateTime is null and comp.compteId=:id_compt ")
	Integer getNombreCollecteByUser(int id_compt);

	@Query(nativeQuery = true,value = "SELECT count(id_collecte) from collectetransporteur where  DATEDIFF(day,GETDATE(),datecoll2) between 0 and (select nbr_jour from validation_date_auth where type='CT') and delete_date_time is null and id_statut=56 and id_compte=:id_compt and id_collecte not in(select id_collecte_originale from collectetransporteur cc where delete_date_time is null and id_compte=:id_compt)")
	Integer getNombreCollecteRenouvableByUser(int id_compt);

	@Query(nativeQuery = true , value = "SELECT * from collectetransporteur where  DATEDIFF(day,GETDATE(),datecoll2) between 0 and (select nbr_jour from validation_date_auth where validation_date_auth.type='CT' and validation_date_auth.delete_date_time is null ) and delete_date_time is null and id_statut=25 and id_compte=:compt_id")
	CollecteTransporteur[] getAllCollecteRenouvByCompte( int compt_id);

	@Query(nativeQuery = true , value = "SELECT * from collectetransporteur where  DATEDIFF(day,GETDATE(),datecoll2) between 0 and (select nbr_jour from validation_date_auth where validation_date_auth.type='CT' and validation_date_auth.delete_date_time is null ) and delete_date_time is null and id_statut=25 and id_compte=:compt_id and num_demande=:id")
	CollecteTransporteur getOneCollecteRenouvByCompteandNum( String id , int compt_id);

	@Query("select c From CollecteTransporteur c where c.id_collecte = (select max(cc.id_collecte) from CollecteTransporteur cc left join cc.compte comp where cc.deleteDateTime is null and comp.compteId=:id_compt) ")
    CollecteTransporteur getOneCollecteByUser(int id_compt);

	@Query("select c From CollecteTransporteur c where c.id_collecte = (select min(cc.id_collecte) from CollecteTransporteur cc left join cc.compte comp where cc.deleteDateTime is null and comp.compteId=:id_compt) ")
	CollecteTransporteur getOneCollecteByUserFirst(int id_compt);

	@Query("select ct from CollecteTransporteur ct where ct.deleteDateTime is NULL and ct.compteAffecte.compteId=:cpt  order by ct.id_collecte asc")
	public Page<CollecteTransporteur> getCollecteByAffectation(Pageable page, int cpt);

	@Query("select ct from CollecteTransporteur ct where ct.deleteDateTime is NULL and ct.compteAffecte.compteId=:cpt and ct.dateDepot between :d1 and :d2 order by ct.id_collecte asc")
	public Page<CollecteTransporteur> getCollecteByAffectation_search_d(Pageable p, java.sql.Date d1,java.sql.Date d2, int cpt);

	@Query("select ct from CollecteTransporteur ct where ct.deleteDateTime is NULL and ct.compteAffecte.compteId=:cpt and ct.dateValidation between :d1 and :d2  order by ct.id_collecte asc")
	public Page<CollecteTransporteur> getCollecteByAffectation_search_v(Pageable p, java.sql.Date d1,java.sql.Date d2, int cpt);

	@Query("select ct from CollecteTransporteur ct where ct.deleteDateTime is NULL and ct.compteAffecte.compteId=:cpt  order by ct.id_collecte desc")
	public Page<CollecteTransporteur> getCollecteByAffectation_desc(Pageable page, int cpt);

	@Query("select c from  CollecteTransporteur c  where c.deleteDateTime is null  and c.statut.id_statut_projet=:statut order by c.dateDepot asc  ")
	public Page<CollecteTransporteur> getAllCollecteTransporteurbyStatut(Pageable page, @Param("statut") int statut );

	@Query("select c from  CollecteTransporteur c  where c.deleteDateTime is null  and c.statut.id_statut_projet=:statut order by c.dateDepot DESC  ")
	public Page<CollecteTransporteur> getAllCollecteTransporteurbyStatut_desc(Pageable page, @Param("statut") int statut );

	@Query("select c from  CollecteTransporteur c  where c.deleteDateTime is null  and c.statut.id_statut_projet=:statut and c.region.regionId=:regionId order by c.dateDepot asc  ")
	public Page<CollecteTransporteur> getAllCollecteTransporteurbyStatutByRegion(Pageable page, @Param("statut") int statut ,int regionId );

	@Query("select c from  CollecteTransporteur c  where c.deleteDateTime is null  and c.statut.id_statut_projet=:statut and c.region.regionId=:regionId order by c.dateDepot DESC  ")
	public Page<CollecteTransporteur> getAllCollecteTransporteurbyStatutByRegion_desc(Pageable page, @Param("statut") int statut ,int regionId );

	@Query("select i from CollecteTransporteur i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2 order by i.id_collecte DESC")
	public Page<CollecteTransporteur> getByDateDepotA(Pageable p, java.sql.Date d1,java.sql.Date d2);

	@Query("select i from CollecteTransporteur i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2 and i.region.regionId=:regionId order by i.id_collecte DESC")
	public Page<CollecteTransporteur> getByDateDepotAByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int regionId);

	@Query("select i from CollecteTransporteur i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 order by i.id_collecte DESC")
	public Page<CollecteTransporteur> geByDateValidationA(Pageable p, java.sql.Date d1,java.sql.Date d2);

	@Query("select i from CollecteTransporteur i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.region.regionId=:regionId order by i.id_collecte DESC")
	public Page<CollecteTransporteur> geByDateValidationAByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int regionId);

	@Query("select i from  CollecteTransporteur i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2  and i.statut.id_statut_projet=:selst order by i.id_collecte DESC")
	public Page<CollecteTransporteur> getByDateDepotAB(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst);

	@Query("select i from  CollecteTransporteur i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2  and i.statut.id_statut_projet=:selst and i.region.regionId=:regionId order by i.id_collecte DESC")
	public Page<CollecteTransporteur> getByDateDepotABByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst,int regionId);

	@Query("select i from  CollecteTransporteur i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.statut.id_statut_projet=:selst order by i.id_collecte DESC")
	public Page<CollecteTransporteur> geByDateValidationAB(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst);

	@Query("select i from  CollecteTransporteur i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.statut.id_statut_projet=:selst and i.region.regionId=:regionId order by i.id_collecte DESC")
	public Page<CollecteTransporteur> geByDateValidationABByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst,int regionId);
//*********************************
	@Query("select count(c),s.nom_fr from CollecteTransporteur c left join c.statut s where s.deleteDateTime is null and c.deleteDateTime is null  and c.dateDepot between :d1 and :d2 and s.id_statut_projet in (:statut_select) group by s.nom_fr")
    Object getStatByDateDepot1(Date d1, Date d2,int[] statut_select);

	@Query("select count(c),s.nom_fr from CollecteTransporteur c left join c.statut s where s.deleteDateTime is null and c.deleteDateTime is null  and c.dateValidation between :d1 and :d2 and s.id_statut_projet in (:statut_select) group by s.nom_fr")
	Object getStatByDateValidation1(Date d1, Date d2,int[] statut_select);

/*	@Query("select ct.num_demande,ct.id_collecte,ct.dateAvenant from CollecteTransporteur ct where ct.id_collecte!=:id and id_collecte.compte.compteId=:id_compte and ct.deleteDateTime is NULL order by ct.id_collecte asc")
	public Object[] getAlllCollecteAncienne(int id,int id_compte);*/

	@Query("from CollecteTransporteur ct where ct.id_collecte!=:id and id_collecte.compte.compteId=:id_compte and ct.deleteDateTime is NULL order by ct.id_collecte asc")
	public CollecteTransporteur[] getAlllCollecteAncienne(int id,int id_compte);

	@Query("select n from CollecteTransporteur n left join n.compte cpt where cpt.compteId=:id_compt and n.deleteDateTime is null ")
	CollecteTransporteur getCollecteTransporteurByIdComptIdCT(int id_compt);

	@Query("select n.statut.id_statut_projet from CollecteTransporteur n left join n.compte cpt where n.typeRenouvellement.id_type_renouvellement=3 and cpt.compteId=:id_compt and n.deleteDateTime is null ")
	List<Integer> getListStatutAvenant(int id_compt);

	@Query("from  CollecteTransporteur n left join n.compte ct where   n.deleteDateTime is null and ct.compteId=:iduser order by n.id_collecte asc  ")
	List<CollecteTransporteur> getCollecteByCompte(int iduser);

	@Query("select cr.id_reunion, cr.date_reunion, c.num_demande, c.demandeur_Nom, c.raison, 'bg-primary_2','Collecte' from CollecteTransporteur c join c.reunions cr where c.deleteDateTime is null and cr.deleteDateTime is null")
	List<Object> findDataForCalendarCollecte();

	@Query("Select c from CollecteTransporteur c left join c.reunions r where c.deleteDateTime is null and r.deleteDateTime is null and r.id_reunion=:id")
	CollecteTransporteur getCollecteByReunion1(int id);

}
