package com.EIE.demo.dao;

import com.EIE.demo.model.IncrementationFichier;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IncrementationFichierRepository extends JpaRepository<IncrementationFichier,Integer> {
}
