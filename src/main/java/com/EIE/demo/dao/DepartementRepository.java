package com.EIE.demo.dao;

import com.EIE.demo.model.Departement;;
import com.EIE.demo.model.Employe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DepartementRepository  extends JpaRepository<Departement,Integer> {
    @Query("from Departement  where deleteDateTime is null order by departementid DESC  ")
    public List<Departement> getAllDepartement();
}
