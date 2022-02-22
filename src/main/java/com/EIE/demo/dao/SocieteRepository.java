package com.EIE.demo.dao;

import com.EIE.demo.model.Compte;
import org.springframework.data.jpa.repository.JpaRepository;

import com.EIE.demo.model.Secteur;
import com.EIE.demo.model.Societe;
import org.springframework.data.jpa.repository.Query;

public interface SocieteRepository extends JpaRepository<Societe, Integer> {


    @Query("from Societe  where societesId=:id and deleteDateTime is null order by  societesId DESC")
    Societe getById(int id);
	

	
}


