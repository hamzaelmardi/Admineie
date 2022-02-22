package com.EIE.demo.dao;

import com.EIE.demo.model.Categorie;
import com.EIE.demo.model.Pays;
import com.EIE.demo.model.Region;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PaysRepository extends JpaRepository<Pays, Integer> {

    @Query("from Pays  where deleteDateTime is null order by paysId DESC  ")
    public List<Pays> getAllpays();

    @Query("select n from Pays n where n.deleteDateTime is null ")
    public Page<Pays> getPaysPage(Pageable p);

    @Query("from Pays  where deleteDateTime is null and  paysId=:id  ")
    Pays getbyid(int id);
}
