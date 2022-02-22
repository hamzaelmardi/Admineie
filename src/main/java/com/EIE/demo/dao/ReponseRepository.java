package com.EIE.demo.dao;

import com.EIE.demo.model.Reponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ReponseRepository extends JpaRepository<Reponse, Integer> {

    @Query("from Reponse where id_reponse=:id")
    Reponse getReponseById(int id);
}


