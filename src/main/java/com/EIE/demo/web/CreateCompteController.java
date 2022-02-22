package com.EIE.demo.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.EIE.demo.model.Compte;
import com.fasterxml.jackson.core.JsonProcessingException;




@Controller
public class CreateCompteController {
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private ProfilRepository profilRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private PosteRepository posteRepository;
	@Autowired
	WebService web;



	@RequestMapping(value = "/api/getFormToAdd", method = RequestMethod.GET)
	public ModelAndView getForm5() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", compteRepository.getAllCompte());
		model.put("profiless", profilRepository.getAllProfil());
		model.put("postes", posteRepository.getAllPoste());
		model.put("regionss", regionRepository.getAllRegion());
		model.put("user",web.getCompteConnected());
		return new ModelAndView("compte2/AjouterCompte", model);

	}


	@RequestMapping(value = "/api/getAccount5/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getAccount5(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", compteRepository.getAllCompteByRegion());
		model.put("profiless", profilRepository.getAllProfil());
		model.put("regionss", regionRepository.getAllRegion());
		model.put("postes", posteRepository.getAllPoste());
		Page<Compte> h = compteRepository.getAllCompteByRegionPage(new PageRequest(page, size));
		if (h != null) {

			List<Compte> searchResult = h.getContent();
			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		model.put("user",web.getCompteConnected());
		return new ModelAndView("compte2/listeCompte", model);

	}


	/*@RequestMapping(value = "/api/addAccount5", method = RequestMethod.POST)
	public   ModelAndView changerStatut5(@RequestBody Compte compte) throws JsonProcessingException {
		if(compte.getPassword().length()>5){
			String passWordCrypt= passwordEncoder.encode(compte.getPassword());
			compte.setPassword(passWordCrypt);
		}
		else{
			Compte c = compteRepository.getOne(compte.getCompteId());
			compte.setPassword(c.getPassword());
		}
		Map<String, Object> model = new HashMap<String, Object>();
		compteRepository.save(compte);
		model.put("listF", compteRepository.getAllCompte());
		model.put("profiless", profilRepository.getAllProfil());
		model.put("regionss", regionRepository.getAllRegion());
		return new ModelAndView("compte2/listeCompte", model);

	}*/

	@RequestMapping(value = "/api/addCompteAdmin", method = RequestMethod.POST)
	public   ModelAndView changerStatut5(@RequestBody Compte compte) throws JsonProcessingException {

		if(compte.getCompteId()!=0) {
			String pass=compteRepository.getOne(compte.getCompteId()).getPassword();
			if(!compte.getPassword().equals("ABCDEFGHPOIYTREZDF")){
				compte.setChequer("no");
				String passWordCrypt= passwordEncoder.encode(compte.getPassword());
				compte.setPassword(passWordCrypt);
			}
			else {
				if(compte!=null) {
					compte.setPassword(pass);
				}
			}
		}
		else {
			String passWordCrypt = passwordEncoder.encode(compte.getPassword());
			compte.setPassword(passWordCrypt);
			compte.setChequer("no");
		}
		compteRepository.save(compte);
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("listF", compteRepository.getAllCompte());
		model.put("profiless", profilRepository.getAllProfil());
		model.put("regionss", regionRepository.getAllRegion());
		model.put("postes", posteRepository.getAllPoste());
		return new ModelAndView("compte2/listeCompte", model);

	}

	@RequestMapping(value = "/api/updateCompte5/{id}", method = RequestMethod.GET)
	public   ModelAndView updateCompte5(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("Compte", compteRepository.getOne(id));
		model.put("profiless", profilRepository.getAllProfil());
		model.put("regionss", regionRepository.getAllRegion());
		model.put("modifier","modifier");
		model.put("postes", posteRepository.getAllPoste());
		return new ModelAndView("compte2/AjouterCompte", model);

	}
	@RequestMapping(value = "/api/deleteCompte5/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deleteCompte5(@PathVariable int id) throws JsonProcessingException {
		Compte sr=compteRepository.getOne(id);

		sr.setDeleteDateTime(new Date());

		compteRepository.save(sr);



	}

	@RequestMapping(value = "/checkEmaill", method = RequestMethod.GET)
	public @ResponseBody String checkEmaill(@RequestParam String val) {
		String check = "non";
		Compte fm = compteRepository.siExiste(val);
		if (fm == null) {
			check = "non";
		} else {
			check = "oui";
		}

		return check;

	}

	@RequestMapping(value = "/api/getAccountByProfil/{id}/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getAccountByprofil(@PathVariable int id, @PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", compteRepository.getAllCompteByIdProfilPage(id, new PageRequest(page, size)));
		model.put("profiless", profilRepository.getAllProfil());
		model.put("Idrefence", id);
		model.put("regionss", regionRepository.getAllRegion());
		Page<Compte> h = null;
		if(id==0){
			h = compteRepository.getAllCompteByRegionPage(new PageRequest(page, size));
		}
		else {
			h = compteRepository.getAllCompteByIdProfilPage(id, new PageRequest(page, size));
		}
		if (h != null) {

			List<Compte> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		/*if (id==0) {
			model.put("listF", compteRepository.getAllCompte());
			model.put("profiless", profilRepository.getAllProfil());
			model.put("regionss", regionRepository.getAllRegion());
		} else {*/

		/*}*/
			return new ModelAndView("compte2/listeCompte", model);

		}

}
