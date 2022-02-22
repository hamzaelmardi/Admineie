package com.EIE.demo.dao;

import com.EIE.demo.model.StatutProjet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StatutProjetRepository extends JpaRepository<StatutProjet, Integer> {

	@Query("from StatutProjet  where id_statut_projet=:id and deleteDateTime is null order by  id_statut_projet DESC")
	StatutProjet getById(int id);

	@Query("from StatutProjet where deleteDateTime is null order by id_statut_projet DESC")
	public List<StatutProjet> getAllStatutProjet();
	@Query("select n from StatutProjet n")
	Page<StatutProjet> getstatutprojetByaction(Pageable p);

	//@Query("from StatutProjet where deleteDateTime is null and type=:type  and id_statut_projet=id_statut_projet order by id_statut_projet DESC")
	//public List<StatutProjet> getAllStatutByTypeA(String type);

	@Query("from StatutProjet where deleteDateTime is null and type=:type and id_statut_projet != '21' and id_statut_projet != '22' and id_statut_projet != '24' and id_statut_projet != '29' and id_statut_projet != '47' order by id_statut_projet ASC")
	public List<StatutProjet> getAllStatutByType(String type);
	@Query("from StatutProjet where deleteDateTime is null and type in (:type) order by id_statut_projet ASC")
	public List<StatutProjet> getAllStatutByType1(String[] type);
	@Query("from StatutProjet where deleteDateTime is null and type=:type order by id_statut_projet ASC")
	public List<StatutProjet> getAllStatutByType2(String type);
	@Query("select distinct a.type from StatutProjet a ")
	public List<StatutProjet> getAllType();

	@Query("select distinct a.nom_fr from StatutProjet a ")
	public String[] getAllStatutNames();


}


