package com.EIE.demo.dao;

import com.EIE.demo.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

public interface ReunionRepository extends JpaRepository<Reunion,Integer> {


   /* @Query(nativeQuery = true,value = "select r.id_reunion,r.date_reunion,d.num_demande,d.intitule_projet,d.petitionaire  from reunion r inner join demande_infromation d on d.id_demande_information = r.demande_information_id where r.delete_date_time is null and ( r.reporte is null or r.reporte not like 'oui' )")
    List<Object> findDataForCalendar();*/

    @Query("select r.id_reunion,r.date_reunion,d.num_demande,d.intitule_projet,d.petitionaire,'bg-info2','Reunion'  from DemandeInformation d Left join d.reunions r where r.deleteDateTime is null and ( r.reporte is null or r.reporte not like 'oui' )")
    List<Object> findDataForCalendar();


    @Query("from Reunion  where id_reunion=:id and deleteDateTime is null order by  id_reunion DESC")
    Reunion getById(int id);

    @Query("select r from DemandeInformation  d left join d.reunions r where d.id_demande_information=:id and r.reporte is null and r.deleteDateTime is null order by  r.id_reunion DESC")
    Reunion getByProjet(int id);


    @Query("select count(id_reunion) from Reunion  where date_reunion=:date and deleteDateTime is null and ( reporte is null or reporte not like 'oui' )")
    int checkdatereunion(String date);

    @Query("from Reunion where id_reunion=:id_reunion   ")
    public Reunion getReunionById (@Param("id_reunion") int id_reunion);

    @Query("from Reunion")
    public List<Reunion> getAllReunion();

    /*@Query("select c from  CollecteTransporteur c left join c.reunions r where c.deleteDateTime is null and r.id_reunion=:id_reunion order by c.id_collecte DESC  ")
    public List<CollecteTransporteur> getAllCollecteByReunion(@Param("id_reunion") int id_reunion );*/

    @Query("select DATENAME(m,rr.date_reunion), (select  count (*)  from Reunion as r where DATENAME(m,r.date_reunion)=DATENAME(m,rr.date_reunion) and r.examen='examen' and year(r.date_reunion) in :annee) ,(select  count (*)  from Reunion as r  where DATENAME(m,r.date_reunion)=DATENAME(m,rr.date_reunion) and r.examen='reexamen' and year(r.date_reunion) in :annee) from Reunion as rr where year(rr.date_reunion) in :annee group by DATENAME(m,rr.date_reunion)")
    public Object[] dateReunion(List<Integer> annee);

    @Query(value ="select (select count(*) from demande_infromation d left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.examen='examen' and d.type='EE'  and year(r.date_reunion) in :annee)as examen, (select count(*) from demande_infromation d left join demande_reunion dr on dr.id_demande_information=d.id_demande_information left join reunion r on r.id_reunion=dr.id_reunion where r.examen='reexamen' and d.type='EE' and year(r.date_reunion) in :annee)as reexamen", nativeQuery = true)
    public Object[] nombreReunion(List<Integer> annee);

    @Query("select count(r.id_reunion) from Reunion r where r.deleteDateTime is null")
    public int getCountReunion();

}
