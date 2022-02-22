package com.EIE.demo.dao;

import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Installation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InstallationDechetRepository extends JpaRepository<Installation, Integer> {

    @Query("from Installation  where deleteDateTime is null order by id_installation DESC  ")
    public List<Installation> getAllInstallation();

    @Query("from Installation  where id_installation=:id and deleteDateTime is null order by  id_installation DESC")
    Installation getById(int id);

    @Query("from Installation  where deleteDateTime is null and  id_installation=:id  ")
    Installation getid(int id);


    @Query("select it from Installation it where it.deleteDateTime is NULL and it.compteAffecte.compteId=:cpt  order by it.id_installation asc")
    public Page<Installation> getInstallationByAffectation(Pageable page, int cpt);

    @Query("select it from Installation it where it.deleteDateTime is NULL and it.compteAffecte.compteId=:cpt and it.dateDepot between :d1 and :d2  order by it.id_installation asc")
    public Page<Installation> getInstallationByAffectation_search_d(Pageable p, java.sql.Date d1,java.sql.Date d2, int cpt);

    @Query("select it from Installation it where it.deleteDateTime is NULL and it.compteAffecte.compteId=:cpt and it.dateValidation between :d1 and :d2 order by it.id_installation asc")
    public Page<Installation> getInstallationByAffectation_search_v(Pageable p, java.sql.Date d1,java.sql.Date d2, int cpt);

    @Query("select it from Installation it where it.deleteDateTime is NULL and it.compteAffecte.compteId=:cpt  order by it.id_installation desc")
    public Page<Installation> getInstallationByAffectation_desc(Pageable page, int cpt);

    @Query("select Count(s) from Installation s left join s.statut st where s.deleteDateTime is null and st.id_statut_projet not in(:ids)")
    public int getCountInst(List<Integer> ids);
    @Query("select n from Installation n where n.deleteDateTime is null order by n.id_installation DESC  ")
	public Page<Installation> getAllInstallationDechet(PageRequest pageRequest);

    @Query("select n from Installation n where n.deleteDateTime is null and n.statut.id_statut_projet <> 51 order by n.id_installation asc  ")
    public Page<Installation> getAllInstallationDechetNotBrouillon(PageRequest pageRequest);

    @Query("select n from Installation n where n.deleteDateTime is null and n.statut.id_statut_projet <> 51 order by n.id_installation DESC  ")
    public Page<Installation> getAllInstallationDechetNotBrouillon_desc(PageRequest pageRequest);

    @Query("select n from Installation n where n.deleteDateTime is null and n.region.regionId=:regionId order by n.id_installation DESC  ")
    public Page<Installation> getAllInstallationDechetByRegion(Pageable p,int regionId);

    @Query("select n from Installation n where n.deleteDateTime is null and n.region.regionId=:regionId and n.statut.id_statut_projet <> 51 order by n.id_installation asc  ")
    public Page<Installation> getAllInstallationDechetByRegionNotBrouillon(Pageable p,int regionId);

    @Query("select n from Installation n where n.deleteDateTime is null and n.region.regionId=:regionId and n.statut.id_statut_projet <> 51 order by n.id_installation DESC  ")
    public Page<Installation> getAllInstallationDechetByRegionNotBrouillon_desc(Pageable p,int regionId);

    @Query("select n from Installation n where n.deleteDateTime is null and n.visite.id_visite_installation=:idvisite order by n.id_installation DESC  ")
    public Installation getAllInstallationByIdVisite(int idvisite);

    @Query("select n from  Installation n   where  n.deleteDateTime is null and n.statut.id_statut_projet=:statut order by n.id_installation asc  ")
    public Page<Installation> getAllInstallationDechetbyStatut(Pageable page, @Param("statut") int statut );

    @Query("select n from  Installation n   where  n.deleteDateTime is null and n.statut.id_statut_projet=:statut order by n.id_installation DESC  ")
    public Page<Installation> getAllInstallationDechetbyStatut_desc(Pageable page, @Param("statut") int statut );

    @Query("select n from  Installation n   where  n.deleteDateTime is null and n.statut.id_statut_projet=:statut and n.region.regionId=:regionId order by n.id_installation asc  ")
    public Page<Installation> getAllInstallationDechetbyStatutByRegion(Pageable page, @Param("statut") int statut,int regionId );

    @Query("select n from  Installation n   where  n.deleteDateTime is null and n.statut.id_statut_projet=:statut and n.region.regionId=:regionId order by n.id_installation DESC  ")
    public Page<Installation> getAllInstallationDechetbyStatutByRegion_desc(Pageable page, @Param("statut") int statut,int regionId );

    @Query("select n from  Installation n left join n.compte ct where  n.deleteDateTime is null and ct.compteId=:iduser and n.id_installation=:id  order by n.id_installation DESC  ")
    Installation getInstallationById(int id, int iduser);

    @Query("select i from Installation i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2 order by i.id_installation DESC")
    public Page<Installation> getByDateDepotA(Pageable p, java.sql.Date d1,java.sql.Date d2);

    @Query("select i from Installation i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2 and i.region.regionId=:regionId order by i.id_installation DESC")
    public Page<Installation> getByDateDepotAByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int regionId);

    @Query("select i from Installation i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 order by i.id_installation DESC")
    public Page<Installation> geByDateValidationA(Pageable p, java.sql.Date d1,java.sql.Date d2);

    @Query("select i from Installation i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.region.regionId=:regionId order by i.id_installation DESC")
    public Page<Installation> geByDateValidationAByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int regionId);

    @Query("select i from  Installation i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2  and i.statut.id_statut_projet=:selst order by i.id_installation DESC")
    public Page<Installation> getByDateDepotAB(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst);

    @Query("select i from  Installation i where i.deleteDateTime is null  and i.dateDepot between :d1 and :d2  and i.statut.id_statut_projet=:selst and i.region.regionId=:regionId order by i.id_installation DESC")
    public Page<Installation> getByDateDepotABByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst,int regionId);

    @Query("select i from  Installation i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.statut.id_statut_projet=:selst order by i.id_installation DESC")
    public Page<Installation> geByDateValidationAB(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst);

    @Query("select i from  Installation i where i.deleteDateTime is null and i.dateValidation between :d1 and :d2 and i.statut.id_statut_projet=:selst and i.region.regionId=:regionId order by i.id_installation DESC")
    public Page<Installation> geByDateValidationABByRegion(Pageable p, java.sql.Date d1,java.sql.Date d2,int selst,int regionId);


}
