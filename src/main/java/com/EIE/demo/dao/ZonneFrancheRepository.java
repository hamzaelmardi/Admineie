package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.EIE.demo.model.ZonneFranche;

public interface ZonneFrancheRepository extends JpaRepository<ZonneFranche, Integer> {

	@Query("from ZonneFranche  where deleteDateTime is null order by id_zonnefranche DESC  ")
	public List<ZonneFranche> getAllZonneFranche();
	

	
}


