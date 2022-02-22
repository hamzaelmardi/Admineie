package com.EIE.demo.dao;

import com.EIE.demo.model.Departement;
import com.EIE.demo.model.Employe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EmployeRepo extends JpaRepository<Employe, Integer> {

    @Query("from Employe  where deleteDateTime is null order by empId DESC  ")
    public List<Employe> getAllEmploye();


  @Query("select e from Employe e left join e.departement d  where (e.deleteDateTime is null and d.deleteDateTime is null) and ( d.departementnom like %:txt% or e.nom like %:txt% or e.adresse like %:txt%) order by e.empId DESC  ")
   public List<Employe> getAllEmployebyname(String txt);

}
