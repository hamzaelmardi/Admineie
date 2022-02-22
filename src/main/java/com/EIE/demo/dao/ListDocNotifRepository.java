package com.EIE.demo.dao;

import com.EIE.demo.model.DocImport;
import com.EIE.demo.model.ListDocNotif;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ListDocNotifRepository extends JpaRepository<ListDocNotif, Integer> {
	@Query("select  fp from ListDocNotif fp  where fp.notif.id_notification=:id and fp.deleteDateTime is null   ")
	public List<ListDocNotif> ListDocNotif (@Param("id") int id);

	@Query("from ListDocNotif  where install.id_installation=:id and deleteDateTime is null")
	public List<ListDocNotif> ListDocInstall (@Param("id") int id);

	@Query("from ListDocNotif  where collecte.id_collecte=:id and deleteDateTime is null")
	public List<ListDocNotif> ListDocCollecte (@Param("id") int id);
	
	@Query("select  fp from ListDocNotif fp  where fp.notif.id_notification=:id and fp.deleteDateTime is null   ")
	public ListDocNotif[] ListDocNotifs (@Param("id") int id);
	
	@Query("select  fp from ListDocNotif fp  where fp.install.id_installation=:id and fp.deleteDateTime is null   ")
	public ListDocNotif[] ListDocInstallation (@Param("id") int id);
	
	@Query("select  fp from ListDocNotif fp  where fp.collecte.id_collecte=:id and fp.deleteDateTime is null   ")
	public ListDocNotif[] ListDocCollectes (@Param("id") int id);
	
	
	
	@Query("select  fp from ListDocNotif fp  where fp.notif.id_notification=:id and fp.docImport.id_docImport=:ids and fp.deleteDateTime is null   ")
	public ListDocNotif ListDocNotifImport (@Param("id") int id,@Param("ids") int ids);
	
	@Query("select  fp from ListDocNotif fp  where fp.install.id_installation=:id and fp.docImport.id_docImport=:ids and fp.deleteDateTime is null   ")
	public ListDocNotif ListDocInstallImport (@Param("id") int id,@Param("ids") int ids);

	@Query("select  fp from ListDocNotif fp  where fp.collecte.id_collecte=:id and fp.docImport.id_docImport=:ids and fp.deleteDateTime is null   ")
	public ListDocNotif ListDocCollectImport (@Param("id") int id,@Param("ids") int ids);

	@Query("select  fp from ListDocNotif fp  where fp.DemandeEIE.id_demande_information=:id and fp.docImport.id_docImport=:ids and fp.deleteDateTime is null   ")
	public ListDocNotif ListDocEEImport (@Param("id") int id,@Param("ids") int ids);
	
	
	@Query("select  fp from ListDocNotif fp  where fp.collecte.id_collecte=:id and fp.deleteDateTime is null   ")
	public ListDocNotif[] ListDocCollectese(@Param("id") int id);

	@Query("select  fp from ListDocNotif fp left join fp.DemandeEIE d where d.id_demande_information=:id and fp.docImport.id_docImport=:ids and fp.deleteDateTime is null   ")
	public ListDocNotif ListdocEIEImport(int id, int ids);

	@Query("select fp from ListDocNotif fp left join fp.DemandeEIE d where d.id_demande_information=:id and fp.deleteDateTime is null   ")
	public ListDocNotif[] ListdocEIE(int id);

	@Query("select  fp from ListDocNotif fp left join fp.DemandeEIE d where d.id_demande_information=:id and fp.deleteDateTime is null   ")
	public List<ListDocNotif> ListdocEE(int id);

	@Query("select  fp from ListDocNotif fp left join fp.DemandeEIE d where d.id_demande_information=:id and fp.deleteDateTime is null   ")
	public List<ListDocNotif> getAllListDocNotifByType(int id);
}


