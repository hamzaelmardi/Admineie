package com.EIE.demo.dao;

import com.EIE.demo.model.Categorie;
import com.EIE.demo.model.DeclarationTransporteur;
import com.EIE.demo.model.DocumentImportationDechet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DocumentImortationDechet extends JpaRepository<DocumentImportationDechet,Integer> {
    @Query("from DocumentImportationDechet")
    public DocumentImportationDechet getDocumentImortationDechet();

}
