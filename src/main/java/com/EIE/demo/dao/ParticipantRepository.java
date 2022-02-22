package com.EIE.demo.dao;

import java.util.List;

import com.EIE.demo.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ParticipantRepository extends JpaRepository<Participant, Integer> {

	
	@Query("from Participant  where deleteDateTime is null order by id_participant DESC  ")
	public List<Participant> getAllParticipant();

	
	
}


