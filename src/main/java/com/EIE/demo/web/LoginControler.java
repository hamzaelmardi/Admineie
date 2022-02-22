package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.EieDre;
import com.EIE.demo.model.Societe;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller

public class LoginControler {

	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EieDreRepository eieDreRepository;

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

	@Autowired
	public JavaMailSender emailSender;
	@Value("${url}")
	private String url;
	@Value("${fromusermail}")
	private String fromusermail;
	@Value("${fromuser}")
	private String fromuser;

	@RequestMapping(value = "/api/loginSociete", method = RequestMethod.GET)
	public ModelAndView addNotification(@RequestBody Societe se) {
		Compte ct=web.getCompteConnected();
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user",ct);
		return new ModelAndView("notification/notification", model);
	}
	
	
	@RequestMapping(value = "/api/addEieDre/{categorie}", method = RequestMethod.POST)
	public   ModelAndView changerStatut(@RequestBody EieDre eie,@PathVariable int categorie) {
		Map<String, Object> model = new HashMap<String, Object>();
		eieDreRepository.save(eie);
		model.put("listF", eieDreRepository.getAllid_eiedre());
		
		return new ModelAndView("eie/listDre", model);
		
	}
	
	
	@RequestMapping(value = "/api/updateDre/{id}", method = RequestMethod.GET)
	public   ModelAndView updateSecteur(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("dre", eieDreRepository.getOne(id));
		
		return new ModelAndView("eie/listDre", model);
		
	}

	@RequestMapping(value = "/api/addEieDre2", method = RequestMethod.POST)
	public ModelAndView postParamCode(@RequestBody EieDre eie){
		Map<String, Object> model = new HashMap<String, Object>();

		eieDreRepository.save(eie);


		Page<EieDre> h = eieDreRepository.geteieDrePage(new PageRequest(0, 100));
		if (h != null) {
			List<EieDre> searchResult = h.getContent();
			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());
		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("/eie/listDre", model);

	}

	@RequestMapping(value = "/NewPassword", method = RequestMethod.GET)
	public ModelAndView NewPassword() {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct=web.getCompteConnected();
		model.put("user",ct);
		return new ModelAndView("NewPassword", model);
	}


	@RequestMapping(value = "/checkCompte/{id}", method = RequestMethod.GET)
	public ModelAndView checkCompte(@PathVariable String id) {
		Map<String, Object> model = new HashMap<String, Object>();
		String b =id.substring(10);
		String a =b.substring(0,b.length() - 10);
		int idd=Integer.parseInt(a);
		model.put("id", idd);
		return new ModelAndView("CheckCompte", model);
	}

	@RequestMapping(value = "/UpdatePassworde/{id}", method = RequestMethod.POST)
	public @ResponseBody String UpdatePassword2(@PathVariable int id, @RequestParam String password) {
		String s = web.UpdatePassword2(id, password);
		Map<String, Object> model = new HashMap<String, Object>();
		return s;
	}

	@RequestMapping(value = "chackmail_reset1/{email}", method = RequestMethod.GET)
	public @ResponseBody int chackmail_reset1(@PathVariable String email) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {

		//Compte ct = web.chackmail2(email);
		Compte ct = web.chackmail(email);
		int r = 1;
		if (ct == null) {
			r = 0;
		}  else {
			MimeMessage mimeMessage = emailSender.createMimeMessage();

			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");
			boolean to_send = false;
			messageEmail.setTo(InternetAddress.parse(ct.getEmail()));
			to_send = true;
			messageEmail.setSubject("Reset mot de passe");
			messageEmail.setText("Bonjour M/Mme "+ct.getNom()+"<p>Il semble que vous ayez oublié votre mot de passe pour [Portail client], cliquez sur le lien ci-dessous pour réinitialiser votre mot de passe.</p><br>"+"" +
					"<p>Réinitialiser mon mot de passe <a href='"+url+"/getforget/AH6543YLOK"+ct.getCompteId()+"GDTGD1213F/"+ct.getPassword().replace("/","-")+"'>cliquer ici </a> </p><br>"+"" +
					"<p>Si vous n'avez pas oublié votre mot de passe, veuillez ignorer cet e-mail.</p>", true);

			messageEmail.setFrom(fromusermail,fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
		}
		return r;
	}

	@RequestMapping(value = "/getforget/{id}/{passe}", method = RequestMethod.GET)
	public ModelAndView getforget(@PathVariable String id, @PathVariable String passe) {
		Map<String, Object> model = new HashMap<String, Object>();
		String b =id.substring(10);
		String a =b.substring(0,b.length() - 10);
		int idd=Integer.parseInt(a);
		model.put("id", idd);
		model.put("passe", passe);
		return new ModelAndView("conf_forget", model);
	}

	@RequestMapping(value = "/UpdatePassword/{id}/{passe}", method = RequestMethod.POST)
	public @ResponseBody String UpdatePassword(@PathVariable int id, @PathVariable String passe, @RequestParam String password) {
		String s = web.UpdatePassword(id, passe, password);
		Map<String, Object> model = new HashMap<String, Object>();
		return s;
	}
}
