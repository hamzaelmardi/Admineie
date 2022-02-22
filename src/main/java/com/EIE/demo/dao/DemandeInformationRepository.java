package com.EIE.demo.dao;

import com.EIE.demo.dto.DemandeInformationDTO;
import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.DemandeInformation;
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

public interface DemandeInformationRepository extends JpaRepository<DemandeInformation, Integer> {


	@Query("from DemandeInformation  where deleteDateTime is null order by  id_demande_information DESC")
	public
	List<DemandeInformation> getAllDemandeInformation();

	@Query("select n from  DemandeInformation n left join n.compte ct where n.deleteDateTime is null and ct.compteId=:compteId order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getAllDemandeInformationByCompte(Pageable page, @Param("compteId") int compteId);

	@Query("select c From DemandeInformation c where c.id_demande_information = (select max(cc.id_demande_information) from DemandeInformation cc left join cc.compte comp where cc.deleteDateTime is null and comp.compteId=:id_compt) ")
	DemandeInformation getdemandeByUser(int id_compt);

	@Query("select n from  DemandeInformation n left join n.statut ct where n.deleteDateTime is null and ct.id_statut_projet=:compteId and n.type='RS' order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeByEat(Pageable page, @Param("compteId") int compteId);


	@Query("select n from  DemandeInformation n left join n.statut st left join n.compte ct where n.deleteDateTime is null and st.id_statut_projet=:statutId and ct.compteId=:compteId order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeByEatStatut(Pageable page, @Param("compteId") int compteId, @Param("statutId") int statutId);

	@Query("select n from  DemandeInformation n left join n.statut st left join n.compte ct where n.deleteDateTime is null and st.id_statut_projet not in(:statutId) and ct.compteId=:compteId and n.type=:type order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeByEatStatutNotIn(Pageable page, @Param("compteId") int compteId, @Param("statutId") List<Integer> statutId, @Param("type") String type);

	@Query("select n from  DemandeInformation n left join n.statut st left join n.compte ct where n.deleteDateTime is null and st.id_statut_projet not in(:statutId) and ct.compteId=:compteId and n.type in (:type) order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeByEatStatutNotIn2(Pageable page, @Param("compteId") int compteId, @Param("statutId") List<Integer> statutId, @Param("type") List<String> type);


	@Query("select n from  DemandeInformation n left join n.statut st  where n.deleteDateTime is null and st.id_statut_projet not in(:statutId)  order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeStatutNotIn(Pageable page, @Param("statutId") List<Integer> statutId);

	@Query("select n from  DemandeInformation n left join n.statut st left join n.compte ct where n.deleteDateTime is null and st.id_statut_projet  in(:statutId) and ct.compteId=:compteId and n.num_demande like 'RS%' order by n.id_demande_information DESC  ")
	public
	Page<DemandeInformation> getdemandeByEatStatutIn(Pageable page, @Param("compteId") int compteId, @Param("statutId") List<Integer> statutId);


	@Query("from DemandeInformation fp  where fp.num_demande=:a1 and fp.deleteDateTime is null order by fp.id_demande_information DESC")
	public
	DemandeInformation siExiste(@Param("a1") String a1);


	@Query("from DemandeInformation  where id_demande_information=:id and deleteDateTime is null order by  id_demande_information DESC")
	DemandeInformation getById(int id);

	@Query("select new com.EIE.demo.dto.DemandeInformationDTO(d.typeEnv, count(d.typeEnv)) from DemandeInformation d where d.deleteDateTime is null GROUP BY d.typeEnv")
	public
	List<DemandeInformationDTO> getCountDemandeInformation();

	@Query(value = " select type_env,count(id_demande_information)  from demande_infromation group by type_env ", nativeQuery = true)
	public
	Object[] getDemandeType();

	@Query("from DemandeInformation d left join d.compte c where d.deleteDateTime is null and c.compteId=:id_compt and d.num_demande=:id")
	DemandeInformation getDemandeInfoByNumByUser(String id, int id_compt);

	@Query("select count(d) from DemandeInformation d where d.type='EE' and d.num_demande like 'N-%'")
	Integer count_EE();

	@Query("select count(d) from DemandeInformation d where d.type='NT' and d.num_demande like 'NT-%'")
	Integer count_NT();

	@Query("select count(d) from DemandeInformation d where d.type='RS' and d.num_demande like 'RS-%'")
	Integer count_RS();

	@Query("select count(d) from DemandeInformation d where d.type='AE' and d.num_demande like 'AE-%'")
	Integer count_AE();

	@Query(value = "select cc.nom_fr, (select count(*) from demande_infromation as d left join categoires_demande as c on c.id_demande_information=d.id_demande_information left join categorie as t on t.id_categorie=c.id_categorie left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as r on dr.id_reunion=r.id_reunion where c.id_categorie=cc.id_categorie and r.examen='examen' and d.type='EE' and d.id_statut=6 and d.date_depot between :d1  and :d2) from categorie cc", nativeQuery = true)
	public
	Object[] geteieparcategorieDatedepot(Date d1, Date d2);

	@Query(value = "select cc.nom_fr, (select count(*) from demande_infromation as d left join categoires_demande as c on c.id_demande_information=d.id_demande_information left join categorie as t on t.id_categorie=c.id_categorie left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as r on dr.id_reunion=r.id_reunion where c.id_categorie=cc.id_categorie and r.examen='examen' and d.type='EE' and d.id_statut=6 and d.date_validation between :d1  and :d2) from categorie cc", nativeQuery = true)
	public
	Object[] geteieparcategorieDateValidation1(Date d1, Date d2);

	@Query(value = "select cc.nom_fr,(select count(*) from categoires_demande as c left join demande_infromation as d on d.id_demande_information=c.id_demande_information  where c.id_categorie=cc.id_categorie and d.id_statut='6' and d.date_validation  between :d1 and :d2 ) as nomberAAE, (select count(*) from categoires_demande as c left join demande_infromation as d on d.id_demande_information=c.id_demande_information  where c.id_categorie=cc.id_categorie and d.statut_RC='oui' and d.Date_RC  between :d1 and :d2 ) as nomberDAE from categorie as cc ", nativeQuery = true)
	public
	Object[] geteieparcategorieDateValidation11(Date d1, Date d2);

	@Query(value = "select year(re.date_reunion) as annee, count(*) AS 'projet examiné' from demande_infromation d left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion left join categoires_demande as c on c.id_demande_information=d.id_demande_information left join categorie as t on t.id_categorie=c.id_categorie where d.id_statut = '6' and d.type='EE' and re.examen='examen' and year(re.date_reunion)=:annee group by year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparTous(int annee);

	@Query(value = "select year(re.date_reunion) as annee, count(*) AS 'projet examiné' from demande_infromation d left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion left join categoires_demande as c on c.id_demande_information=d.id_demande_information left join categorie as t on t.id_categorie=c.id_categorie where d.id_statut = '6' and d.type='EE' and re.examen='examen' group by year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparTousAll();

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, year(re.date_reunion) as year, count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and year(re.date_reunion)=:annee and r.region_id=:region group by r.nom_fr, c.nom_fr, year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparRegion(int annee, int region);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and r.region_id=:region group by r.nom_fr, c.nom_fr", nativeQuery = true)
	public
	Object[] getEEparRegionAll(int region);

	@Query(value = "select c.nom_fr as categorie, r.nom_fr as region, year(re.date_reunion) as year, count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and year(re.date_reunion)=:annee and c.id_categorie=:categorie and r.nom_fr is not null group by c.nom_fr, r.nom_fr, year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparCategorie(int annee, int categorie);

	@Query(value = "select c.nom_fr as categorie, r.nom_fr as region,  count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and c.id_categorie=:categorie and r.nom_fr is not null group by c.nom_fr, r.nom_fr", nativeQuery = true)
	public
	Object[] getEEparCategorieAll(int categorie);

	@Query(value = "select c.nom_fr as categorie, r.nom_fr as region, year(re.date_reunion) as annee,  count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and year(re.date_reunion)=:annee and c.id_categorie=:categorie and r.region_id=:region and r.nom_fr is not null group by c.nom_fr, r.nom_fr, year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparCategorieAndRegion(int annee, int categorie, int region);

	@Query(value = "select c.nom_fr as categorie, r.nom_fr as region, year(re.date_reunion) as annee,  count(*) as 'projet examiné' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and re.examen='examen' and c.id_categorie=:categorie and r.region_id=:region and r.nom_fr is not null group by c.nom_fr, r.nom_fr, year(re.date_reunion)", nativeQuery = true)
	public
	Object[] getEEparCategorieAndRegionAll(int categorie, int region);

	@Query(value = "select count(*) as 'reunion' from demande_infromation d left join demande_reunion dr on d.id_demande_information=dr.id_demande_information left join reunion as re on dr.id_reunion=re.id_reunion  where d.id_statut = '6' and d.type='EE' and year(re.date_reunion) in :annee", nativeQuery = true)
	public
	Object[] getNombreReunionEE(List<Integer> annee);

	@Query(value = "select count(*) as total, year(d.date_debut_utilisation) as annee from demande_infromation d where d.type='EE' and d.id_statut=6 and d.delete_date_time is null and year(d.date_debut_utilisation) in :annee group by year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getCountEIESignee(List<Integer> annee);

	@Query(value = "select count(*) as total, year(d.date_debut_utilisation) as annee from demande_infromation d where d.type='NT' and d.id_statut=6 and d.delete_date_time is null and year(d.date_debut_utilisation) in :annee group by year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getCountNTSignee(List<Integer> annee);

	@Query(value = "select count(*) as total, year(d.date_dc) as annee from demande_infromation d where d.type='AE' and d.id_statut=6 and d.delete_date_time is null and year(d.date_dc) in :annee group by year(d.date_dc)", nativeQuery = true)
	public
	Object[] getCountAESignee(List<Integer> annee);

	@Query(value = "SELECT sum(d.montant_investissement) AS nomberdeEIE FROM demande_infromation AS d WHERE (d.id_statut = '6' and d.type='EE' and d.date_validation BETWEEN :d1 AND :d2)", nativeQuery = true)
	public
	Object[] getMontantInvestissement(Date d1, Date d2);

	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM demande_infromation where delete_date_time is null")
	public
	int getCountEnvirennmentByRegion();

	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM demande_infromation where id_statut!=47 and type='EE' and delete_date_time is null")
	public
	int getTotalEE();

	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM demande_infromation where id_statut!=47 and type='NT' and delete_date_time is null")
	public
	int getTotalNT();

	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM demande_infromation where id_statut!=47 and type='AE' and delete_date_time is null")
	public
	int getTotalAE();

	@Query("Select d From DemandeInformation d left join d.compte c where d.id_demande_information=:id_dmd and c.compteId=:id_compt and d.deleteDateTime is null")
	DemandeInformation getdemandeByComptId(int id_dmd, int id_compt);

	@Query("Select count(d.id_demande_information) from DemandeInformation d left join d.compte comp where d.deleteDateTime is null and comp.compteId=:id_compt and d.type=:type")
	Integer getNombreEEByUser(int id_compt, String type);

	@Query("from DemandeInformation n where n.deleteDateTime is null and n.id_demande_information=:id and n.type=:type")
	DemandeInformation getDemandeInformationByIdType(int id, String type);


	@Query("select n from  DemandeInformation n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.type=:type order by n.id_demande_information ASC  ")
	public
	Page<DemandeInformation> getAllDemandeInformationByType(Pageable page, @Param("type") String type, List<Integer> ids);

	@Query("select n from  DemandeInformation n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.type=:type order by n.id_demande_information desc  ")
	public
	Page<DemandeInformation> getAllDemandeInformationByType_desc(Pageable page, @Param("type") String type, List<Integer> ids);

	@Query("select n from  DemandeInformation n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut and n.type=:type order by n.id_demande_information ASC  ")
	public
	Page<DemandeInformation> getAllDemandeInformationByTypeStatut(Pageable page, @Param("type") String type, @Param("statut") int statut, List<Integer> ids);

	@Query("select n from  DemandeInformation n   where  n.deleteDateTime is null and n.statut.id_statut_projet not in(:ids) and n.statut.id_statut_projet=:statut and n.type=:type order by n.id_demande_information desc  ")
	public
	Page<DemandeInformation> getAllDemandeInformationByTypeStatut_desc(Pageable page, @Param("type") String type, @Param("statut") int statut, List<Integer> ids);

	@Query(nativeQuery = true, value = "select * from demande_infromation where  delete_date_time is null and type=:type and id_statut not in (:inte) and datediff(m,date_validation,date_fin_validation)<3")
	Page<DemandeInformation> getAllDemandeInformationValide3mois(Pageable page, String type, List<Integer> inte);

	@Query("Select d from DemandeInformation d left join d.reunions r where d.deleteDateTime is null  and r.deleteDateTime is null and r.id_reunion=:id")
	DemandeInformation getDemandeByReunion(int id);

	@Query("Select count(d.Montant_investissement) from DemandeInformation d where d.deleteDateTime is null")
	Integer getNombreProjetExamine();

	@Query("select di from DemandeInformation di where di.deleteDateTime is null and di.type=:type and di.compteAffecte.compteId=:cpt order by di.num_demande ASC")
	public
	Page<DemandeInformation> getDemandeInformationByAffectation(Pageable page, @Param("type") String type, int cpt);

	@Query("select di from DemandeInformation di where di.deleteDateTime is null and di.type=:type and di.compteAffecte.compteId=:cpt order by di.num_demande desc")
	public
	Page<DemandeInformation> getDemandeInformationByAffectation_desc(Pageable page, @Param("type") String type, int cpt);


	@Query(value = "select sum(d.montant_investissement) AS 'total', year(d.date_debut_utilisation) from demande_infromation d where d.id_statut = '6' and d.type='EE' and year(d.date_debut_utilisation)=:annee group by year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInparTous(int annee);

	@Query(value = "select sum(d.montant_investissement) AS 'total', year(d.date_debut_utilisation) from demande_infromation d where d.id_statut = '6' and d.type='EE' group by year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInAll();

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, year(d.date_debut_utilisation) as year, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and year(d.date_debut_utilisation)=:annee and r.region_id=:region group by r.nom_fr, c.nom_fr, year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInparRegion(int annee, int region);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and r.region_id=:region group by r.nom_fr, c.nom_fr", nativeQuery = true)
	public
	Object[] getMontantInparRegionAll(int region);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and c.id_categorie=:categorie group by r.nom_fr, c.nom_fr", nativeQuery = true)
	public
	Object[] getMontantInparCategorieAll(int categorie);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, year(d.date_debut_utilisation) as year, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and year(d.date_debut_utilisation)=:annee and c.id_categorie=:categorie group by r.nom_fr, c.nom_fr, year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInparCategorie(int annee, int categorie);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, year(d.date_debut_utilisation) as year, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and c.id_categorie=:categorie and r.region_id=:region group by r.nom_fr, c.nom_fr, year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInparRegionCategorieAll(int categorie, int region);

	@Query(value = "select r.nom_fr as region, c.nom_fr as categorie, year(d.date_debut_utilisation) as year, sum(d.montant_investissement) AS 'total' from demande_infromation d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join detail_region_region drr on d.id_detail=drr.id_detail left join region r on r.region_id=drr.id_region where d.id_statut = '6' and d.type='EE' and r.nom_fr is not null and year(d.date_debut_utilisation)=:annee and c.id_categorie=:categorie and r.region_id=:region group by r.nom_fr, c.nom_fr, year(d.date_debut_utilisation)", nativeQuery = true)
	public
	Object[] getMontantInparRegionCategorie(int annee, int categorie, int region);


	/*-------------------------------------Notice---------------------------------------------*/


	@Query(value = "select c.nom_fr as categorie, year(d.date_depot) as annee,  count(*) as 'projet présenté' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut!=47 and d.type='NT' and year(d.date_depot)=:annee and c.id_categorie=:categorie group by c.nom_fr, year(d.date_depot)", nativeQuery = true)
	public
	Object[] getNTProjetParCategorieAC(int annee, int categorie);

	@Query(value = "select c.nom_fr as categorie, count(*) as 'projet présenté' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut!=47 and d.type='NT' and c.id_categorie=:categorie group by c.nom_fr", nativeQuery = true)
	public
	Object[] getNTProjetParCategorieC(int categorie);

	@Query(value = "select year(d.date_depot) as annee, count(*) as 'projet présenté' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut!=47 and d.type='NT' and year(d.date_depot)=:annee and c.nom_fr is not null group by year(d.date_depot)",nativeQuery = true)
	public
	Object[] getNTProjetParCategorieA(int annee);

	@Query(value = "select year(d.date_depot) as annee, count(*) as 'projet présenté' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut!=47 and d.type='NT' and c.nom_fr is not null group by year(d.date_depot)", nativeQuery = true)
	public
	Object[] getNTProjetParCategorieAll();


	@Query(value = "select c.nom_fr as categorie, year(d.date_depot) as annee, sum(d.montant_investissement) as 'montant' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut=6 and d.type='NT' and year(d.date_depot)=:annee and c.id_categorie=:categorie group by c.nom_fr, year(d.date_depot)", nativeQuery = true)
	public
	Object[] getNTMontantParCategorieAC(int annee, int categorie);

	@Query(value = "select c.nom_fr as categorie, sum(d.montant_investissement) as 'montant' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut=6 and d.type='NT' and c.id_categorie=:categorie group by c.nom_fr", nativeQuery = true)
	public
	Object[] getNTMontantParCategorieC(int categorie);

	@Query(value = "select year(d.date_depot), sum(d.montant_investissement) as 'montant' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut=6 and d.type='NT' and year(d.date_depot)=:annee and c.nom_fr is not null group by year(d.date_depot)",nativeQuery = true)
	public
	Object[] getNTMontantParCategorieA(int annee);

	@Query(value = "select year(d.date_depot) as annee, sum(d.montant_investissement) as 'montant' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie where d.id_statut=6 and d.type='NT' and c.nom_fr is not null group by year(d.date_depot)", nativeQuery = true)
	public
	Object[] getNTMontantParCategorieAll();


	/*-------------------------------------audit---------------------------------------------*/


	@Query(value = "select c.nom_fr as categorie, year(r.date_reunion) as annee,  count(*) as 'etude' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.type='validation' and d.type='AE' and year(r.date_reunion)=:annee and c.id_categorie=:categorie group by c.nom_fr, year(r.date_reunion)", nativeQuery = true)
	public
	Object[] getAEProjetParCategorieAC(int annee, int categorie);

	@Query(value = "select c.nom_fr as categorie, count(*) as 'etude' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.type='validation' and d.type='AE' and c.id_categorie=:categorie group by c.nom_fr, year(r.date_reunion)", nativeQuery = true)
	public
	Object[] getAEProjetParCategorieC(int categorie);

	@Query(value = "select year(r.date_reunion) as annee,  count(*) as 'etude' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.type='validation' and d.type='AE' and year(r.date_reunion)=:annee group by year(r.date_reunion)",nativeQuery = true)
	public
	Object[] getAEProjetParCategorieA(int annee);

	@Query(value = "select year(r.date_reunion) as annee, count(*) as 'etude' from demande_infromation as d left join categoires_demande cd on d.id_demande_information=cd.id_demande_information left join categorie c on c.id_categorie=cd.id_categorie left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.type='validation' and d.type='AE' and c.nom_fr is not null group by year(r.date_reunion)", nativeQuery = true)
	public
	Object[] getAEProjetParCategorieAll();
}
