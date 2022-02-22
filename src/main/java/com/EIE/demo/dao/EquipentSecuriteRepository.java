package com.EIE.demo.dao;

import com.EIE.demo.model.EquipementSecurite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EquipentSecuriteRepository extends JpaRepository<EquipementSecurite, Integer> {

    @Query("Select n from EquipementSecurite n where n.deleteDateTime is null order by n.id_equipement desc ")
    public EquipementSecurite[] getAllEquipementTab();
}


