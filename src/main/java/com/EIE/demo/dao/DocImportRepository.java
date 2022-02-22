package com.EIE.demo.dao;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.EIE.demo.model.DocImport;

public interface DocImportRepository extends JpaRepository<DocImport, Integer> {

	
	@Query("from DocImport  where deleteDateTime is null order by id_docImport DESC  ")
	public List<DocImport> getAllDocImport();
	
	@Query(" from  DocImport   where deleteDateTime is null order by id_docImport DESC  ")
	public DocImport[] getAllDocImportDoc();
	
	@Query(" from  DocImport d left join d.classification c  where c.id_classification=:classId and d.typeaut=:type and d.deleteDateTime is null order by d.id_docImport ASC  ")
	public DocImport[] getAllDocImportDocByType(@Param("classId") int classId,@Param("type") String type);

	@Query("from DocImport d  where d.typeaut=:typex and d.deleteDateTime is null order by d.id_docImport ASC  ")
	public List<DocImport> getAllDocImportByTypeAutor(@Param("typex") String type);

	@Query("from DocImport n where n.deleteDateTime is null order by n.id_docImport ASC")
	public Page<DocImport> getDocImportByaction(Pageable p);

	@Query("from DocImport d  where d.typeaut=:type and d.deleteDateTime is null order by d.id_docImport ASC ")
	public DocImport[] getAllDocImportByType(String type);
	

	
}


