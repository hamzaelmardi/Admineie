package com.EIE.demo.web;

import java.io.ByteArrayInputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.EIE.demo.dao.CompteRepository;
import com.EIE.demo.dao.PrRoleRepository;
import com.EIE.demo.dao.ProfilRepository;
import com.EIE.demo.dao.RegionRepository;
import com.EIE.demo.dao.RoleRepository;
import com.EIE.demo.dao.UserRepository;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.Notification;
import com.EIE.demo.model.Profil;
import com.EIE.demo.model.ProfilRole;
import com.EIE.demo.model.Region;
import com.EIE.demo.model.Role;
import com.EIE.demo.model.User;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller

public class NotificationControler {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PrRoleRepository profilRoleRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private RegionRepository regionRepository;

	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private ProfilRepository profilRepository;

	@Autowired
	private SecurityService secure;
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	WebService web;

	ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private PasswordEncoder passwordEncoder;


	@RequestMapping(value = "/api/addNumNotification", method = RequestMethod.GET)
	public ModelAndView addNotification(@RequestBody Notification nt) {
		Compte ct=web.getCompteConnected();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		return new ModelAndView("notification/notification", model);
	}


	@RequestMapping(value = "/api/test/{idNotif}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generatePDF(@PathVariable int idNotif) throws Exception{

		HttpHeaders headers = new HttpHeaders();
		Notification ns=web.getNotiifcationById(idNotif);
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_notification()+".pdf");

		ByteArrayInputStream bis;
		//Notification n= notifRepo.getOnebb(ns.getIdnotifs());
		if (ns.getZf_et().equals("ZF")) {
			bis = GeneratePDFDocuments.generateDocumentDeNotification(ns);
		}
		else{
			bis = GeneratePDFDocuments.generateDocumentDeNotification2(ns);
		}


		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));


	}


	@GetMapping("/api/okPDF/{idNotif}")
	public ResponseEntity<InputStreamResource> generatePDF2(@PathVariable int idNotif) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		ByteArrayInputStream bis;
		Notification ns = web.getNotiifcationById(idNotif);
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		headers.add("Content-Disposition", "attachment; filename=mouvement_"+ns.getNum_notification()+".pdf");
		if (ns.getZf_et().equals("ZF")) {
			bis = GeneratePDFDocuments.generateDocumentDeMouvement2(ns);
		}
		else{
			bis = GeneratePDFDocuments.generateDocumentDeMouvement(ns);
		}
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}
	
}
