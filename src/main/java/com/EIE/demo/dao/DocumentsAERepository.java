package com.EIE.demo.dao;

import com.EIE.demo.model.DocumentsAE;
import com.EIE.demo.model.Population;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DocumentsAERepository extends JpaRepository<DocumentsAE, Integer> {

}


