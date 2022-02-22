package com.EIE.demo.dao;

import com.EIE.demo.model.RegionDoc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface RegionDocRepository extends JpaRepository<RegionDoc, Integer> {

    @Query("select rd from DemandeInformation d left join d.regiondoc rd left join rd.region r where r.regionId=:idRegion and d.id_demande_information=:id")
    RegionDoc[] getByIdRegion(int idRegion,int id);

}
