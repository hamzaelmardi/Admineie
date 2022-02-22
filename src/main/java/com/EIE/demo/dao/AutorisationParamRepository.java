package com.EIE.demo.dao;

import com.EIE.demo.model.AutorisationParam;
import com.EIE.demo.model.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AutorisationParamRepository extends JpaRepository<AutorisationParam, Integer> {

	
	@Query("from AutorisationParam  where deleteDateTime is null   ")
	public List<AutorisationParam> getAllCategorie();

	@Query("from AutorisationParam  where deleteDateTime is null and  id_autorisation=:id  ")
    Categorie getbyid(int id);

	@Query("from AutorisationParam  where deleteDateTime is null ")
    AutorisationParam[] getAutorisationParamTab();
}


