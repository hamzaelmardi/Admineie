package com.EIE.demo.dao;

import com.EIE.demo.model.Code;
import com.EIE.demo.model.Comite;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CodeRepository extends JpaRepository<Code, Integer> {

	
	@Query("from Code  where deleteDateTime is null order by id_code DESC  ")
	public List<Code> getAllCode();

	@Query("from Code c  where c.codeparentt.numeroCode='01 01' and c.deleteDateTime is null order by c.id_code DESC")
	public Code[] getAllCode1();


	@Query("from Code where id_code=:id_code   ")
	public Code getCodeById (@Param("id_code") int id_code);

	@Query("select co from Code co left join co.classification cls where co.deleteDateTime is null and cls.id_classification=:classification order by co.id_code DESC  ")
	public Code[] getAllCodeTable(int classification);

	@Query("select co from Code co left join co.classification cls where co.classification.id_classification=1 and co.deleteDateTime is null order by co.id_code ASC  ")
	public Code[] getAllCodeTable();

	@Query("select n from  Code n where n.codeparentt.numeroCode='01 01' and n.deleteDateTime is null order by n.id_code DESC")
	public Page<Code> getcodeByaction(Pageable p);
	
	@Query("select n from  Code n where n.codeparentt.id_codeparentt=:idParent and n.deleteDateTime is null order by n.id_code ASC")
	public Page<Code> getcodeByactionByCategorie(Pageable p, int idParent);
	
	@Query("select co from Code co  where co.deleteDateTime is null and co.codeparentt.id_codeparentt=:idParent and co.classification.id_classification=:classification order by co.id_code ASC ")
	public Code[] getAllCodeByParentTable(int idParent,int classification);

	@Query("from Code c  where c.deleteDateTime is null  and c.nom_fr like %:txt% order by c.id_code DESC  ")
	public List<Code> getCodeBy(String txt);
	
}


