package com.EIE.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.EIE.demo.model.DocumentInstalation;

public interface DocumentInstalationD extends JpaRepository<DocumentInstalation,Integer> {
    @Query("from DocumentInstalation")
    public DocumentInstalation getDocumentInstalationD();
}
