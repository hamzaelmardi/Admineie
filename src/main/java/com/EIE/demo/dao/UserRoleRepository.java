package com.EIE.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.EIE.demo.model.UserRole;

public interface UserRoleRepository extends JpaRepository<UserRole, Integer> {

	

}
