package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.EIE.demo.model.Classification;
import com.EIE.demo.model.DocImport;
import com.EIE.demo.model.Classification;

public interface ClassificationRepository extends JpaRepository<Classification, Integer> {

	
	@Query("from Classification  where deleteDateTime is null order by id_classification DESC  ")
	public List<Classification> getAllClassification();
	

	
}


