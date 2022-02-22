package com.EIE.demo.dao;

import com.EIE.demo.model.Affectation;
import com.EIE.demo.model.Audit;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.util.List;

public interface AffectationRepository extends JpaRepository<Affectation, Integer> {

	
	@Query("select n from  Affectation n  order by n.affectationId DESC  ")
	public List<Affectation> getAllAffectations();

	@Query("select n from  Affectation n  where n.etat='oui' order by n.affectationId DESC  ")
	public List<Affectation> getAllAffectationActive();

	@Query("select n from  Affectation n  where n.compte.compteId=:ct order by n.affectationId DESC  ")
	public List<Affectation> getAllAffectationByCompte(int ct);

	@Query("select n from  Affectation n  where n.compte.poste.id_Poste=:posteId and n.compte.compteId=:cpt and n.etat='oui' order by n.affectationId DESC  ")
	public List<Affectation> getAllAffectationByPoste(int posteId,int cpt);

	@Query("select n from  Affectation n  where n.notification.id_notification=:id or n.collecte.id_collecte=:id or n.installation.id_installation=:id or n.demandeInformation.id_demande_information=:id")
	public List<Affectation> SiExiste(int id);

	@Query("select n from  Affectation n  where n.notification.id_notification=:notif and n.etat='oui'")
	public List<Affectation> getAffectaionEnCours(int notif);

}


