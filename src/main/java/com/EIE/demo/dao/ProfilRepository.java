package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.Profil;

public interface ProfilRepository extends JpaRepository<Profil, Integer> {

	@Query("from Profil  where deleteDateTime is null order by profilId DESC  ")
	public List<Profil> getAllProfil();

	@Query("from Profil fp  where fp.nom=:a1 and fp.deleteDateTime is null order by fp.profilId DESC  ")
	public Profil siExisteProfil(@Param("a1") String a1);
	
	@Query("select g from Profil g where g.deleteDateTime is null order by g.profilId DESC ")
	public Page<Profil> getAllProfils(Pageable page);

}
