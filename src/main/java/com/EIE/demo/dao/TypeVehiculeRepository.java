package com.EIE.demo.dao;

import com.EIE.demo.model.TypeVehicule;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TypeVehiculeRepository extends JpaRepository<TypeVehicule, Integer> {

    @Query("select n from TypeVehicule n where n.deleteDateTime is null order by n.id_type_vehicule desc ")
    TypeVehicule[] getAllTypeVehiculeTab();
}


