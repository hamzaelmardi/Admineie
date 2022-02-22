package com.EIE.demo.dao;

import com.EIE.demo.model.CaracteristquePhysique;
import com.EIE.demo.model.Population;
import com.EIE.demo.model.Unite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CaracteristiquePhysiqueRepository extends JpaRepository<CaracteristquePhysique, Integer> {

    @Query("from CaracteristquePhysique  where id_classification=:id and deleteDateTime is null order by  id_classification DESC")
    CaracteristquePhysique getById(String id);
}


