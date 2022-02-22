package com.EIE.demo.dao;

import com.EIE.demo.model.Code;
import com.EIE.demo.model.MoyenTransport;
import com.EIE.demo.model.Region;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MoyenTransportRepository extends JpaRepository<MoyenTransport, Integer> {

    @Query("from MoyenTransport  where deleteDateTime is null order by id_moyenTransport DESC")
    public List<MoyenTransport> getAllMoyenTransport();

    @Query("from MoyenTransport where id_moyenTransport=:id_moyenTransport   ")
    public MoyenTransport getMoyenTransportById (@Param("id_moyenTransport") int id_moyenTransport);

    @Query("select n from MoyenTransport n where n.deleteDateTime is null order by n.id_moyenTransport")
    public Page<MoyenTransport> getMoyenPage(Pageable p);

    @Query("from MoyenTransport m  where m.deleteDateTime is null  and m.nom_fr like %:txt% order by m.id_moyenTransport DESC  ")
    public List<MoyenTransport> getMoyentransBy(String txt);
}
