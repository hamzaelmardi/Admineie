package com.EIE.demo.dao;

import com.EIE.demo.model.DocumentDechetCT;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DocumentDechetCTRepository extends JpaRepository<DocumentDechetCT, Integer> {

    @Query("from DocumentDechetCT")
    public DocumentDechetCT getDocumentDechetCT();
}
