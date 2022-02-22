package com.EIE.demo.dao;

import com.EIE.demo.model.AuditAutorisation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface AuditAutorisationRepository extends JpaRepository<AuditAutorisation, Integer> {

    @Query("select n from  AuditAutorisation n where n.etat=1 and n.type_aut=:type order by n.auditAutorisationId DESC ")
    public Page<AuditAutorisation> getauditAutorisationByaction(Pageable page, String type);

    @Query("select n from  AuditAutorisation n where n.etat=0 and n.num_aut=:numero order by n.auditAutorisationId DESC ")
    public List<AuditAutorisation> getListAuditAutorisationByNumero(String numero);

    @Query("select n from  AuditAutorisation n where n.etat=1 and n.num_aut=:numero order by n.auditAutorisationId DESC ")
    public AuditAutorisation getAuditAutorisationByNumero(String numero);

    @Query("select n from  AuditAutorisation n where n.num_aut=:numero order by n.auditAutorisationId DESC ")
    public List<AuditAutorisation> getAuditAutorisationByNumero2(String numero);
}
