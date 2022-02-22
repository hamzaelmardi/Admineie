package com.EIE.demo.dao;

import com.EIE.demo.model.Compte;
import org.hibernate.query.NativeQuery;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CompteRepository extends JpaRepository<Compte, Integer> {

	@Query("from Compte  where deleteDateTime is null order by compteId DESC  ")
	public List<Compte> getAllCompte ();

	@Query("from Compte  where st.societesId is null and deleteDateTime is null order by compteId DESC  ")
	public List<Compte> getAllCompteByRegion ();

	@Query("select c from Compte c where c.st.societesId is null and c.deleteDateTime is null order by c.compteId DESC  ")
	public Page<Compte> getAllCompteByRegionPage (Pageable page);

	@Query("from Compte  where deleteDateTime is null and st.societesId is null order by compteId DESC  ")
	public List<Compte> getAllCompteNotSciete ();

	@Query("select c from Compte c where c.deleteDateTime is null and c.st.societesId is null and c.auto_nv=:auto order by c.compteId DESC  ")
	public Page<Compte> getAllCompteNotScietePagination (Pageable page,String auto);

	@Query("from Compte  where deleteDateTime is null and st.societesId is null and region.regionId=:regionId order by compteId DESC  ")
	public List<Compte> getAllCompteNotScieteByRegion (int regionId);

	@Query("select c from Compte c where c.deleteDateTime is null and c.st.societesId is null and c.region.regionId=:regionId and c.auto_nv=:auto order by c.compteId DESC  ")
	public Page<Compte> getAllCompteNotScieteByRegionPagination (Pageable page,int regionId,String auto);

	@Query("from Compte fp  where fp.email=:a1 and fp.deleteDateTime is null order by fp.compteId DESC  ")
	public Compte siExiste (@Param("a1") String a1);

	@Query("from Compte fp  where fp.emailRecup=:a1 and fp.deleteDateTime is null order by fp.compteId DESC  ")
	public Compte siExisteemailrecup (@Param("a1") String a1);
	//**********check_auto*******
	@Query(nativeQuery = true, value = "select c.* from compte  c where c.compte_id = (select n.compte_id from notification n join statut_projet st on st.id_statut_projet=n.id_statut where n.num_notification=:a1 and st.nom_fr=:a2 and n.compte_id=:a3 ) or c.compte_id in (select ct.id_compte from collectetransporteur ct join statut_projet st on st.id_statut_projet=ct.id_statut where ct.num_demande=:a1 and st.nom_fr=:a2  and ct.id_compte=:a3) or c.compte_id in (select it.id_compte from installation it join statut_projet st on st.id_statut_projet=it.id_statut where it.num_demande=:a1 and st.nom_fr=:a2  and it.id_compte=:a3) or  c.compte_id in (select di.id_compte from demande_infromation di join statut_projet st on st.id_statut_projet=di.id_statut where di.num_demande=:a1 and st.nom_fr=:a2 and di.id_compte=:a3)")
	public Compte sicheckauto (@Param("a1") String numero,@Param("a2") String statut,@Param("a3") int id );

	@Query("from Compte fp  where fp.st.societesId is null and fp.profil.profilId=:id1 and fp.deleteDateTime is null order by fp.compteId DESC")
	public Page<Compte> getAllCompteByIdProfilPage(@Param("id1") int id, Pageable page);

	@Query("from Compte fp  where fp.profil.profilId=:id1 and fp.deleteDateTime is null order by fp.compteId DESC")
	public List<Compte> getAllCompteByIdProfil(@Param("id1") int id);

	@Query("from Compte d  where d.profil.nom=:nom and d.deleteDateTime is null order by d.compteId DESC  ")
	public List<Compte> getAllCompteByProfil(@Param("nom") String nom);

	@Query("from Compte  where deleteDateTime is null and st.societesId=:id   ")
	public Compte getCompteBysociet (@Param("id") int id);

	@Query("from Compte  where deleteDateTime is null and password=:passe")
	Compte getpasse(String passe);
	@Query("from Compte  where deleteDateTime is null and password=:passe_2 and compteId=:id")
	Compte getcomptebyidpasse(int id, String passe_2);

	@Query("from Compte  where deleteDateTime is null and compteId=:id")
	Compte getcomptebyidpasse2(int id);

	@Query("from Compte fp  where fp.emailRecup=:a1  and fp.compteId<>:a2  and fp.deleteDateTime is null order by fp.compteId DESC  ")
	public Compte siExisteemailrecupmonprofil (@Param("a1") String a1,@Param("a2") int a2);

}


