package com.EIE.demo.dao;

import com.EIE.demo.model.Categorie;
import com.EIE.demo.model.EvaluationParam;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EvaluationParamRepository extends JpaRepository<EvaluationParam, Integer> {

	
	@Query("from EvaluationParam  where deleteDateTime is null   ")
	public List<EvaluationParam> getAllCategorie();

	@Query("from EvaluationParam  where deleteDateTime is null and  id_evaluation=:id  ")
    Categorie getbyid(int id);

	@Query("from EvaluationParam  where deleteDateTime is null   ")
    EvaluationParam[] getEvaluationParamTab();
}


