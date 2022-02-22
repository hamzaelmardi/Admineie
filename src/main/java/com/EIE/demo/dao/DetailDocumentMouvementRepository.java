package com.EIE.demo.dao;

import com.EIE.demo.model.DetailDocumentMouvement;
import com.EIE.demo.model.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DetailDocumentMouvementRepository extends JpaRepository<DetailDocumentMouvement, Integer> {

}


