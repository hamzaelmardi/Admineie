package com.EIE.demo.dao;

import com.EIE.demo.model.CaracteristquePhysique;
import com.EIE.demo.model.Population;
import com.EIE.demo.model.Unite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PopulationRepository extends JpaRepository<Population, Integer> {

    @Query("from Population  where id_population=:id and deleteDateTime is null order by  id_population DESC")
    Population getById(String id);
}


