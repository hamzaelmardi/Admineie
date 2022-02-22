package com.EIE.demo.dao;

import com.EIE.demo.model.Prefecture;
import com.EIE.demo.model.SousCategorie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SousCategorieRepository  extends JpaRepository <SousCategorie, Integer> {

    //@Query("from SousCategorie s left join Categorie c where c.id_categorie in (:ids)")
  //  @Query(nativeQuery = true, value = "select * from souscategorie p where delete_date_time is null and p.id_souscategorie in (select id_souscat  from categorie_souscategorie where id_cat in(:ids))")

    @Query("Select p from Categorie r left join r.sousCategories p where r.id_categorie in (:ids) and p.deleteDateTime is null and r.deleteDateTime is null order by p.id_souscategorie")
    List<SousCategorie> listSousCategorieById(int[] ids);

}
