package com.EIE.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.ProfilRole;

public interface PrRoleRepository extends JpaRepository<ProfilRole, Integer> {

	@Query("from ProfilRole pr left join pr.role rt where pr.role.roleId=:id and pr.profil.profilId=:ids")
	public ProfilRole getAllProfilRole(@Param(value = "id") int id, @Param(value = "ids") int ids);

	@Query("from ProfilRole pr left join pr.role")
	public List<ProfilRole> getAllProfilRoles();

	@Query("from ProfilRole pr where pr.profil.profilId=:ids")
	public List<ProfilRole> getAllProfilRoles(@Param(value = "ids") int ids);

	@Query("select pr.role.roleId from ProfilRole pr where pr.profil.profilId=:ids")
	public List<Integer> getAllRoleByProfil(@Param(value = "ids") int ids);

	@Query("from ProfilRole pr where pr.profil.profilId in(:ids)")
	public List<ProfilRole> getAllProfilsRoles(@Param(value = "ids") int[] ids);

}
