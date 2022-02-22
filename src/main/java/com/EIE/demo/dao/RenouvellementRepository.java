package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.Code;
import com.EIE.demo.model.Renouvellement;

public interface RenouvellementRepository extends JpaRepository<Renouvellement, Integer> {
	@Query("from Renouvellement  where deleteDateTime is null order by id_renouvellement DESC  ")
	public List<Renouvellement> getAllRenouvellement();
	
	@Query("select n from  Renouvellement n")
	public Page<Renouvellement> getrenouvellementByaction(Pageable  p);

//	
//	public Page<Renouvellement> getrenouvellementByaction(Pageable p);
     
}
