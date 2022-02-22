package com.EIE.demo.dao;

import com.EIE.demo.model.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface CategorieRepository extends JpaRepository<Categorie, Integer> {

	
	@Query("from Categorie  where deleteDateTime is null   ")
	public List<Categorie> getAllCategorie();

	@Query("from Categorie  where deleteDateTime is null and  id_categorie=:id  ")
    Categorie getbyid(int id);

	@Query("from Categorie where deleteDateTime is null order by id_categorie desc")
    Categorie[] getArrAllCategorie();
}


