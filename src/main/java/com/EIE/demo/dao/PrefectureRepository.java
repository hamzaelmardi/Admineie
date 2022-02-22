package com.EIE.demo.dao;

import com.EIE.demo.model.Prefecture;
import com.EIE.demo.model.Region;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PrefectureRepository extends JpaRepository<Prefecture, Integer> {

	
	@Query("from Prefecture  where deleteDateTime is null order by id_prefecture DESC  ")
	public List<Prefecture> getAllPrefecture();

	@Query("from Prefecture where id_prefecture=:id_prefecture   ")
	public Prefecture getPrefectureById (@Param("id_prefecture") int id_prefecture);

	@Query(nativeQuery = true, value = "select * from prefecture p where delete_date_time is null and p.id_prefecture in (select id_prefecture from region_prefecture where id_region =:id) order by id_prefecture desc")
	public List<Prefecture> getAllPrefecturebyRegionId(@Param("id") int id);

	@Query("Select p from Region r left join r.prefecture p where r.regionId in (:id) and p.deleteDateTime is null and r.deleteDateTime is null order by p.id_prefecture")
	public List<Prefecture> getAllPrefecturebyRegionId2(@Param("id") int[] id);

	@Query("select n from Prefecture n where n.deleteDateTime is null")
	public Page<Prefecture> getPrefecturePage(Pageable p);

	@Query("from Prefecture p  where p.deleteDateTime is null  and (p.nom_fr like %:txt% or p.nom_ar like %:txt%) order by p.id_prefecture DESC  ")
	public List<Prefecture> getPrefectureby(String txt);

}


