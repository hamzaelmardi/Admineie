package com.EIE.demo.dao;

import java.sql.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.Audit;
import com.EIE.demo.model.Classification;
import com.EIE.demo.model.DemandeInformation;
import com.EIE.demo.model.Classification;

public interface AuditRepository extends JpaRepository<Audit, Integer> {

	
	@Query("select n from  Audit n  left join n.compte compte where n.deleteDateTime is null  order by n.auditId DESC  ")
	public Page<Audit> getauditByaction(PageRequest page);
   @Query("select n from  Audit n left join n.compte compte where (:action is null or n.action_fr=:action ) and (:compteId is null or n.compte.compteId=:compteId) and (:date is null or n.DateTime=:date)  and n.deleteDateTime is null")
	public Page<Audit> getauditByaction(Pageable p,@Param("action") String action, @Param("compteId") Integer  compteId,@Param("date") Date date);

	

	

	
}


