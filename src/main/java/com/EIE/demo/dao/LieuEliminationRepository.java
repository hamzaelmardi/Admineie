package com.EIE.demo.dao;

import com.EIE.demo.model.LieuElimination;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface LieuEliminationRepository extends JpaRepository<LieuElimination, Integer> {

    @Query("from LieuElimination  where deleteDateTime is null order by id_lieuElimination DESC  ")
    public List<LieuElimination> getAllLieuElimination();

    @Query("from LieuElimination  where deleteDateTime is null order by id_lieuElimination DESC  ")
    LieuElimination[] getLieuEliminationArr();

    @Query("from LieuElimination t  where t.deleteDateTime is null  and (t.nom_fr like %:txt% or t.nom_ar like %:txt%) order by t.id_lieuElimination DESC  ")
    public List<LieuElimination> getLieuBy(String txt);
}
