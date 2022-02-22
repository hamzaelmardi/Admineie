package com.EIE.demo.dao;

import com.EIE.demo.model.StatutInstalation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface StatutInstallationRepository extends JpaRepository<StatutInstalation, Integer> {

    @Query("from StatutInstalation  where id_statut_installation=:id and deleteDateTime is null order by  id_statut_installation DESC")
    StatutInstalation getById(int id);

    @Query("from StatutInstalation  where deleteDateTime is null order by id_statut_installation DESC  ")
    public List<StatutInstalation> getAllStatut();
}

