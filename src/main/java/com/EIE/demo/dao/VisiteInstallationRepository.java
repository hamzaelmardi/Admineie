package com.EIE.demo.dao;

import com.EIE.demo.model.VisiteInstallation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VisiteInstallationRepository extends JpaRepository<VisiteInstallation, Integer> {

    @Query("from VisiteInstallation  where id_visite_installation=:id and deleteDateTime is null order by  id_visite_installation DESC")
    VisiteInstallation getById(int id);

    @Query(nativeQuery = true,value = "select v.id_visite_installation,v.date_visite,v.nomsite_fr,v.object  from visite v where v.delete_date_time is null")
    List<Object> findDataForCalendar();
}

