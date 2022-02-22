package com.EIE.demo.dao;

import com.EIE.demo.model.Audit;
import com.EIE.demo.model.Visites_AE;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;

public interface Visites_AERepository extends JpaRepository<Visites_AE, Integer> {
	
}


