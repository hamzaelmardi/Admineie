package com.EIE.demo.dao;

import com.EIE.demo.model.Code;
import com.EIE.demo.model.NatureActivite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface NatureActiviteRepository extends JpaRepository<NatureActivite, Integer> {

    @Query("from NatureActivite  where deleteDateTime is null order by id_natureActivite DESC  ")
    public List<NatureActivite> getAllNatureActivite();
}
