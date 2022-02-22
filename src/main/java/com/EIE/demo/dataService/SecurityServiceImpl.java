package com.EIE.demo.dataService;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import com.EIE.demo.dao.AuditAutorisationRepository;
import com.EIE.demo.model.AuditAutorisation;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.StatutProjet;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.EIE.demo.CustomUserDetailsService;
import com.EIE.demo.dao.AuditRepository;
import com.EIE.demo.model.Audit;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JSR310Module;



@Service
public class SecurityServiceImpl implements SecurityService{
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private CustomUserDetailsService userDetailsService;
    @Autowired
	private AuditRepository auditRepository;

    @Autowired
    private AuditAutorisationRepository auditAutorisationRepository;
    
    @Autowired
	private WebService web;
    
    @Autowired
	private PasswordEncoder passwordEncoder;

    private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);

    @Override
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (userDetails instanceof UserDetails) {
            return ((UserDetails)userDetails).getUsername();
        }

        return null; 
    }
    
//    audit 
    @Override
    public void addAudit(String action_ar, String action_fr, String num_aut, String id, Object oldData, Object newdata,
			String table) throws JsonProcessingException {
		ObjectMapper ow = new ObjectMapper();
		ow.registerModule(new JSR310Module());
		ow.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, true);
		String newjson = ow.writeValueAsString(newdata);
		String oldjson = ow.writeValueAsString(oldData);

		Audit audit = new Audit();
		
       
		java.sql.Date sql= new java.sql.Date(new Date().getTime());
		audit.setDateTime(sql);
		audit.setAction_ar(action_ar);
		audit.setAction_fr(action_fr);
		audit.setNum_auto(num_aut);
		audit.setId_en(id);
		
		audit.setNewData(newjson);
		audit.setOldData(oldjson);
		audit.setTables(table);

		audit.setCompte(web.getCompteConnected());
		auditRepository.save(audit);
	}

    @Override
    public void addAuditAutorisation(String action, String num_aut, String type_aut, StatutProjet idStatut, Compte compte) throws JsonProcessingException, UnknownHostException {
        ObjectMapper ow = new ObjectMapper();
        ow.registerModule(new JSR310Module());
        ow.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, true);


        AuditAutorisation audit = new AuditAutorisation();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Timestamp sqlTS = new java.sql.Timestamp(utilDate.getTime());
        InetAddress inetadr = InetAddress.getLocalHost();
        String adresseIPLocale = (String) inetadr.getHostAddress();
        audit.setDateAction(sqlTS);
        audit.setAction(action);
        audit.setNum_aut(num_aut);
        audit.setAdresseIp(adresseIPLocale);
        audit.setLocalisation("Maroc");
        audit.setType_aut(type_aut);
        audit.setStatut(idStatut);
        audit.setEtat(1);
        audit.setCompte(compte);
        auditAutorisationRepository.save(audit);
    }


    @Override
    public String autologin(String username, String password) {
    	
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());
       
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();  
        
       
        if(encoder.matches(usernamePasswordAuthenticationToken.getCredentials().toString(), userDetails.getPassword())) {
            

	 authenticationManager.authenticate(usernamePasswordAuthenticationToken);

     if (usernamePasswordAuthenticationToken.isAuthenticated()) {
         SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
         logger.debug(String.format("Auto login %s successfully!", username));
         
         return "oui";
     }
     else {
     	 return "non";
     }
}
else {
	return "non";
}

       
    }
}
