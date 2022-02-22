package com.EIE.demo.dao;

import com.EIE.demo.model.CategorieDechet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CategorieDechetRepository extends JpaRepository<CategorieDechet, Integer> {

	@Query("from CategorieDechet  where deleteDateTime is null   ")
	public CategorieDechet[] getAllCategorieDechet();

}


