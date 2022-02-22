package com.EIE.demo.dao;


import com.EIE.demo.model.Code;
import com.EIE.demo.model.Codeparentt;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CodeparenttRepository extends JpaRepository<Codeparentt, Integer> {

	@Query("from Codeparentt  where deleteDateTime is null order by id_codeparentt ASC  ")
	public List<Codeparentt> getAllCodeparentt();
	
	@Query("from Codeparentt  where deleteDateTime is null order by id_codeparentt ASC  ")
	public Codeparentt[] getAllCodeparentt2();

	
}


