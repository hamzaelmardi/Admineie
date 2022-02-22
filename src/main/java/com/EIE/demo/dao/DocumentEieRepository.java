package com.EIE.demo.dao;

import com.EIE.demo.model.DocumentEIE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DocumentEieRepository extends JpaRepository<DocumentEIE , Integer> {
    @Query("from DocumentEIE")
    public DocumentEIE getDocumentEIE();
}
