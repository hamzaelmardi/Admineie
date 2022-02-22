package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.EIE.demo.model.Code;
import com.EIE.demo.model.Secteur;

public interface SecteurRepository extends JpaRepository<Secteur, Integer> {

	
	@Query("from Secteur  where deleteDateTime is null order by id_secteur DESC  ")
	public List<Secteur> getAllSecteur();
	

	
}


