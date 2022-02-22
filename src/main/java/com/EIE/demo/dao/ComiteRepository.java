package com.EIE.demo.dao;

import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Comite;
import com.EIE.demo.model.ListDocNotif;
import com.EIE.demo.model.Region;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ComiteRepository extends JpaRepository<Comite, Integer> {

    @Query("from Comite  where deleteDateTime is null order by comiteId DESC")
    public List<Comite> getAllComite();

    @Query("select c from Comite c  where c.comiteId=:comiteId   ")
    public List<Comite> getComiteById (@Param("comiteId") int comiteId);

    @Query("select c from Comite c  where c.comiteId=:comiteId   ")
    public Comite getComitesById (@Param("comiteId") int comiteId);


    @Query("select c from Comite c left join c.region r  where (c.type='1'and c.permanent=:permanent ) or (r.regionId in (:reg) and c.permanent=:permanent)  ")
    public List<Comite> getComitePermanent (@Param("reg") List<Integer> reg,@Param("permanent") String permanent);

    @Query("select c from  Comite c  where c.deleteDateTime is null and c.permanent='oui' ")
    public List<Comite> getAllComiteByPermanentOUI();

    @Query("select c from  Comite c  where c.deleteDateTime is null and c.permanent='non' ")
    public List<Comite> getAllComiteByPermanentNON();

    @Query("from Comite c  where c.deleteDateTime is null  and (c.nomComite_ar like %:txt% or c.nomComite_fr like %:txt% )order by c.comiteId DESC  ")
    public List<Comite> getComiteBy(String txt);

}
