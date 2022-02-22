package com.EIE.demo.dao;

import com.EIE.demo.model.Installation;
import com.EIE.demo.model.Notification;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

public interface InstallationRepository extends JpaRepository<Installation, Integer> {

	@Query("select n from  Installation n left join n.compte ct where   n.deleteDateTime is null and ct.compteId=:compteId  order by n.id_installation DESC  ")
	public Page<Installation> getAllInstallationByCompte(Pageable page,@Param("compteId") int compteId );

	@Query("select count(i),s.nom_fr from Installation i left join i.statut s where s.deleteDateTime is null and i.deleteDateTime is null and i.dateDepot between :d1 and :d2 group by s.nom_fr")
    Object[] getStatByDate(Date d1, Date d2);

	@Query("from Installation ins left join ins.compte comp where ins.deleteDateTime is null and ins.id_installation=:id and comp.compteId=:compt_id")
    Installation getInstallationByCompte(int id, int compt_id);

	@Query("from Installation ins left join ins.compte comp where ins.id_installation=:id and comp.compteId=:compt_id")
	Installation getInstallationByCompte_deleted(int id, int compt_id);

	@Query(nativeQuery = true,value = "SELECT * from installation where  DATEDIFF(day,GETDATE(),date_validation) between 0 and (select nbr_jour from validation_date_auth where type='IT' and validation_date_auth.delete_date_time is null) and delete_date_time is null and id_statut=17 and id_compte=:compt_id and num_demande=:id")
	Installation getInstallationByNumDemande(String id, int compt_id);


	@Query("select count(i.id_installation),'IT'  from Installation i left join i.statut s where s.deleteDateTime is null and i.deleteDateTime is null and i.dateDepot between :d1 and :d2 ")
    Object getStatByDateDepot(Date d1, Date d2);

	@Query("select count(i.id_installation),'IT' from Installation i left join i.statut s where s.deleteDateTime is null and i.deleteDateTime is null and i.dateValidation between :d1 and :d2 ")
	 Object getStatByDateValidation(Date d1, Date d2);

	@Query("from Installation fp  where fp.num_demande=:a1 and fp.deleteDateTime is null order by fp.id_installation DESC  ")
	public Installation siExiste (@Param("a1") String a1);

	@Query("Select count(ins.id_installation) from Installation ins left join ins.compte comp where ins.deleteDateTime is null and comp.compteId=:id_compt")
    Integer getNombreInstallationByUser(int id_compt);

	@Query(nativeQuery = true,value = "SELECT count(id_installation) from installation where  DATEDIFF(day,GETDATE(),date_validation) between 0 and (select nbr_jour from validation_date_auth where type='IT' and validation_date_auth.delete_date_time is null) and delete_date_time is null and id_statut=17 and id_compte=:id_compt and id_installation not in(select id_install_originale from installation cc where delete_date_time is null and id_compte=:id_compt)")
	Integer getNombreIntallationRenouvableByUser(int id_compt);

	@Query(nativeQuery = true,value = "SELECT * from installation where  DATEDIFF(day,GETDATE(),date_validation) between 0 and (select nbr_jour from validation_date_auth where type='IT' and validation_date_auth.delete_date_time is null) and delete_date_time is null and id_statut=17 and id_compte=:compt_id")
	Installation[] getAllInstallRenouvByCompte(int compt_id);

	@Query("select n from Installation n left join n.compte cp left join  n.statut st where cp.compteId=:id_compt and n.deleteDateTime is null order by n.id_installation desc")
	Installation[] getInstalationAllbyComptNotNum(int id_compt);

	@Query("from Installation ins left join ins.compte comp where ins.deleteDateTime is null and comp.compteId=:id_compt and ins.num_demande=:num")
	Installation getOneInstallationByComptAndNumero(String num, int id_compt);

	@Query("from  Installation n left join n.compte ct where n.deleteDateTime is null and ct.compteId=:iduser and n.id_installation=:id  order by n.id_installation DESC  ")
	Installation getInstallationById(int id, int iduser);

	@Query("select i From Installation i where i.id_installation = (select max(ii.id_installation) from Installation ii left join ii.compte comp where ii.deleteDateTime is null and comp.compteId=:id_compt) ")
	Installation getOneInstallByUser(int id_compt);
	/////*******
	@Query("select count(i.id_installation),s.nom_fr  from Installation i left join i.statut s where s.deleteDateTime is null and i.deleteDateTime is null and i.dateDepot between :d1 and :d2 and s.id_statut_projet in (:statut_select) group by s.nom_fr")
    Object getStatByDateDepot1(Date d1, Date d2,int[] statut_select);

	@Query("select count(i.id_installation),s.nom_fr from Installation i left join i.statut s where s.deleteDateTime is null and i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and s.id_statut_projet in (:statut_select) group by s.nom_fr")
	 Object getStatByDateValidation1(Date d1, Date d2,int[] statut_select);

	@Query("Select v.id_visite_installation,v.date_visite,ins.num_demande,ins.projet,ins.operation,'bg-primary_1','Installation' from Installation ins join ins.visite v where ins.deleteDateTime is null and v.deleteDateTime is null ")
    List<Object> findDataForCalendar();

	@Query("select ins from Installation ins join ins.visite v where v.id_visite_installation=:id and v.deleteDateTime is null and ins.deleteDateTime is null")
	Installation getInstallationByVisite(int id);

}


