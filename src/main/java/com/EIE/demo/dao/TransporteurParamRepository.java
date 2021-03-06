package com.EIE.demo.dao;



import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Region;
import com.EIE.demo.model.TransporteurParam;
import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Region;
import com.EIE.demo.model.TransporteurParam;
import com.EIE.demo.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TransporteurParamRepository extends JpaRepository<TransporteurParam, Integer> {

    @Query("from TransporteurParam  where deleteDateTime is null order by id_transporteurParam DESC")
    public List<TransporteurParam> getAllTransporteurParam();
    @Query("select n from TransporteurParam n where n.deleteDateTime is null")
    public Page<TransporteurParam> getTransporteurPage(Pageable p);
    @Query("Select t from TransporteurParam  t left join t.code c where t.deleteDateTime is null and c.deleteDateTime is null and c.id_code=:code")
    TransporteurParam[] getTransporteurByCode(int code);
    @Query("from TransporteurParam  where deleteDateTime is null order by id_transporteurParam DESC")
    public TransporteurParam[] getAllTransporteurParam2();

    @Query("select distinct e from TransporteurParam e left join e.code c where e.deleteDateTime is null and c.deleteDateTime is null and e.nom like %?1% or c.nom_ar like %?1% or c.nom_fr like %?1%  order by e.id_transporteurParam DESC")
    public TransporteurParam[] Search(String txt);

    @Query("select t From TransporteurParam t left join t.code c where t.deleteDateTime is null and c.id_code=:id_code and t.id_transporteurParam not in (:l_ids) ")
    List<TransporteurParam> getTransporteurByCodeNotIn(int id_code, List<Integer> l_ids);


    @Query("from TransporteurParam t  where t.deleteDateTime is null  and t.nom like %:txt% order by t.id_transporteurParam DESC  ")
    public List<TransporteurParam> getTransporteurBy(String txt);

    @Query("from TransporteurParam  where deleteDateTime is null and  id_transporteurParam=:id_trans  ")
    TransporteurParam getbyid(int id_trans);

    @Query("select DISTINCT t from Notification n left join n.transporteur t where n.classification.id_classification=:id_dang and n.zf_et='ZF' and t.deleteDateTime is null and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93)")
    public List<TransporteurParam> getAllTransporteurParamByClassification(int id_dang);

    @Query("select DISTINCT t from Notification n left join n.transporteur_etranger t where n.classification.id_classification=:id_dang and n.zf_et='ZF' and t.deleteDateTime is null and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) and t.deleteDateTime is null")
    public List<TransporteurEtranger> getAllTransporteurEtrangerByClassification(int id_dang);

    @Query("select distinct z from Notification n left join n.zonneFranche z where n.classification.id_classification=:id_dang and n.zf_et='ZF' and z.deleteDateTime is null and n.statut.id_statut_projet in(54,64,65,63,66,67,68,93) and z.deleteDateTime is null")
    public List<ZonneFranche> getAllZonneFrancheByClassification(int id_dang);
}
