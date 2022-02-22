package com.EIE.demo.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {

	@Query(" SELECT fp  from User fp where deleteDateTime is null order by userId DESC  ")
	public Page<User> getAllUser(PageRequest page);

	@Query(" SELECT fp  from User fp where deleteDateTime is null and email=:x ")
	public User ifExistsEmails(@Param("x") String x);

}
