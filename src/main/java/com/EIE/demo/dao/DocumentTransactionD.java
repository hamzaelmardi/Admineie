package com.EIE.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


import com.EIE.demo.model.DocumentTransaction;

public interface DocumentTransactionD extends JpaRepository<DocumentTransaction,Integer> {
    @Query("from DocumentTransaction")
    public DocumentTransaction getDocumentTransactionD();
}