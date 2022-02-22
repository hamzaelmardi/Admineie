package com.EIE.demo.dao;

import com.EIE.demo.model.Societe;
import com.EIE.demo.model.Type;
import com.EIE.demo.model.Unite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UniteRepository extends JpaRepository<Unite, Integer> {

    @Query("from Unite  where unite_id=:id and deleteDateTime is null order by  unite_id DESC")
    Unite getById(String id);
}


