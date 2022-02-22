package com.EIE.demo.dao;

import com.EIE.demo.model.Poste;
import com.EIE.demo.model.Secteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PosteRepository extends JpaRepository<Poste, Integer> {

	
	@Query("from Poste  where deleteDateTime is null order by id_Poste DESC  ")
	public List<Poste> getAllPoste();
	

	
}


