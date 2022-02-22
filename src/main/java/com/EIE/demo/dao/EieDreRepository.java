package com.EIE.demo.dao;

import com.EIE.demo.model.EieDre;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EieDreRepository extends JpaRepository<EieDre, Integer> {

	
	@Query("from EieDre  where deleteDateTime is null order by id_eiedre DESC  ")
	public List<EieDre> getAllid_eiedre();

	@Query("select n from  EieDre n  where n.deleteDateTime is null order by id_eiedre DESC  ")
	public Page<EieDre> geteieDrePage(Pageable page);
}


