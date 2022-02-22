package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.Compte;
import com.EIE.demo.model.CompteAffecte;

public interface CompteAffecteRepository extends JpaRepository<CompteAffecte, Integer> {
	@Query("from CompteAffecte fp  where fp.notification.id_notification=:a1    ")
	public CompteAffecte siExiste (@Param("a1") int a1);
}


