package com.EIE.demo.dao;

import com.EIE.demo.model.TypeConteneurs;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TypeConteneurRepository extends JpaRepository<TypeConteneurs, Integer> {

    @Query("select n from TypeConteneurs n where n.deleteDateTime is null order by  n.id_type_conteneur desc")
    TypeConteneurs[] getAllTypeConteneursTab();
}


