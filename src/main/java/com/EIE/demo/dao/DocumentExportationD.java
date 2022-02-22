package com.EIE.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.EIE.demo.model.DocumentExportaltion;


public interface DocumentExportationD extends JpaRepository<DocumentExportaltion,Integer> {
    @Query("from DocumentExportaltion")
    public DocumentExportaltion getDocumentExportationD();
}