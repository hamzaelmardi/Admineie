package com.EIE.demo.dao;

import com.EIE.demo.model.Vehicules;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VehiculeRepository extends JpaRepository<Vehicules, Integer> {

    @Query("from Vehicules where deleteDateTime is null order by id_vehicule DESC  ")
    public List<Vehicules> getAllVehicules();

    @Query("Select n from Vehicules n where n.deleteDateTime is null and n.id_vehicule=:id")
    Vehicules getVehiculeById(int id);
}


