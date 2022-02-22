package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.EIE.demo.model.Compte;
import com.EIE.demo.model.Eliminateur;
import com.EIE.demo.model.Notification;
import com.EIE.demo.model.User;

public interface EliminateurRepository extends JpaRepository<Eliminateur, Integer> {

	
	

	
}


