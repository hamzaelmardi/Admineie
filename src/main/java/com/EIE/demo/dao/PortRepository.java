package com.EIE.demo.dao;

import com.EIE.demo.model.Port;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PortRepository extends JpaRepository<Port,Integer> {
}
