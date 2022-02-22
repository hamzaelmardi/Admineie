package com.EIE.demo.dao;

import com.EIE.demo.model.StatutCollecteTransport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StatutCollecteRepository extends JpaRepository<StatutCollecteTransport, Integer> {
}
