package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.UserRoleExist;

public interface UserRoleExistRepository extends JpaRepository<UserRoleExist, Integer> {

	@Query("SELECT detail from UserRoleExist detail  left join detail.role r where  detail.user.userId=:y")
	public List<UserRoleExist>  getListUserRoleExst(@Param("y") int y);
}
