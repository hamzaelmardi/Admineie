package com.EIE.demo.dataService;

import com.EIE.demo.model.Compte;
import com.EIE.demo.model.StatutProjet;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.net.UnknownHostException;
import java.util.Date;

public interface SecurityService {
    String findLoggedInUsername();

    public String  autologin(String username, String password);
    public void addAudit(String action_ar, String action_fr, String num_aut, String id, Object oldData, Object newdata,String table) throws JsonProcessingException;
    public void addAuditAutorisation(String action, String num_aut, String type_aut, StatutProjet idStatut, Compte compte) throws JsonProcessingException, UnknownHostException;





}
