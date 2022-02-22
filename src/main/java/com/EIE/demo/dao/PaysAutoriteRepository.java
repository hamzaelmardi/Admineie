package com.EIE.demo.dao;

import com.EIE.demo.model.PaysAutorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PaysAutoriteRepository extends JpaRepository<PaysAutorite, Integer> {

    @Query("Select p from PaysAutorite p where p.deleteDateTime is null and p.id_paysautorite=:id")
    PaysAutorite getPaysAutoriteById(int id);
}
