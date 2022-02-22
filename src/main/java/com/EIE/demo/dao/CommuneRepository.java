package com.EIE.demo.dao;

import com.EIE.demo.model.Commune;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommuneRepository extends JpaRepository<Commune, Integer> {

	
	@Query("from Commune  where deleteDateTime is null order by id_commune DESC  ")
	public List<Commune> getAllPrefecture();

	@Query(nativeQuery = true, value = "select * from commune c where c.delete_date_time is null and c.id_commune in (select id_commune from commune_prefecture where id_prefectures =:id) order by c.id_commune desc")
	public List<Commune> getAllCommuneByProvinceId(@Param("id") int id);

	@Query("Select c from Prefecture p left join p.commune c where p.deleteDateTime is null and c.deleteDateTime is null and p.id_prefecture in (:id) order by c.id_commune desc")
	public List<Commune> getAllCommuneByProvinceId2(@Param("id") int[] id);

	@Query(nativeQuery = true, value = "select * from commune c where c.delete_date_time is null and c.id_commune in (select id_commune from commune_prefecture where id_prefectures =:id) order by c.id_commune desc")
	public Commune getAllCommuneByProvince(@Param("id") int id);

	@Query("from Commune where id_commune=:id_commune   ")
	public Commune getCommuneById (@Param("id_commune") int id_commune);

	@Query("from Commune  where deleteDateTime is null order by id_commune DESC  ")
	public List<Commune> getAllCommune();

	@Query("select n from Commune n where n.deleteDateTime is null")
	public Page<Commune> getCommunePage(Pageable p);


	@Query("from Commune c  where c.deleteDateTime is null  and (c.nom_fr like %:txt% or c.nom_ar like %:txt%)order by c.id_commune DESC  ")
	public List<Commune> getCommuneBy(String txt);
}


