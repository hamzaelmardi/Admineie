package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class RestFulParamControler {

	@Autowired
	RegionRepository fm;
	@Autowired
	public JavaMailSender emailSender;
	@Value("${urls}")
	private String urls;

	@Autowired
	CompteRepository cr;
	@Autowired
	CollecteRepository collecteRepository;
	@Autowired
	ProfilRepository profilRepository;
	@Autowired
	CodeRepository codeRepository;
	@Autowired
	DemandeInformationRepository infRep;
	@Autowired
	SecurityService secure;
	@Autowired
	NotificationRepository nr;
	@Autowired
	SecteurRepository str;

	@Autowired
	DocImportRepository docRep;

	@Autowired
	InstallationRepository installRep;
	@Autowired
	ImportateurRepository ir;
	@Autowired
	TransporteurRepository tr;
	@Autowired
	ProducteurRepository pr;
	@Autowired
	SocieteRepository st;

	@Autowired
	CategorieDechetRepository categorieDechetRepository;

	@Autowired
	private RegionRepository rep;
	@Autowired
	private ListDocNotifRepository listDocNotifRepository;

	ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping(value = "/listDocRest", method = RequestMethod.GET)
	public ResponseEntity<DocImport[]> listDocRest() {

		DocImport[] obj = docRep.getAllDocImportDoc();
		if (obj == null) {
			return new ResponseEntity<DocImport[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DocImport[]>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/OneCompte/{id}", method = RequestMethod.GET)
	public ResponseEntity<Compte> onecompte(@PathVariable int id) {

		Compte obj =cr.getOne(id);
		if (obj == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/listDocRestByType/{id}/{type}", method = RequestMethod.GET)
	public ResponseEntity<DocImport[]> listDocRestByType(@PathVariable int id, @PathVariable String type) {

		DocImport[] obj = docRep.getAllDocImportDocByType(id, type);
		if (obj == null) {
			return new ResponseEntity<DocImport[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DocImport[]>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/listDocNotifRest/{id}/{type}", method = RequestMethod.GET)
	public ResponseEntity<ListDocNotif[]> listDocNotifRest(@PathVariable int id, @PathVariable String type) {
		ListDocNotif[] obj = null;
		if (type.equals("IT")) {
			obj = listDocNotifRepository.ListDocInstallation(id);
		}

		else if (type.equals("CT")) {
			obj = listDocNotifRepository.ListDocCollectes(id);
		}
		else if (type.equals("EE") ||type.equals("NT") ||type.equals("AE") ) {
			obj = listDocNotifRepository.ListdocEIE(id);
		}
		else {
			obj = listDocNotifRepository.ListDocNotifs(id);
		}

		if (obj == null) {
			return new ResponseEntity<ListDocNotif[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<ListDocNotif[]>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/TransactionInTable/{operation}/{table}/{filter}", method = RequestMethod.GET)
	public ResponseEntity<Object[]> selectFromTable(@PathVariable String table, @PathVariable String filter,
			@PathVariable String operation) {
		if (operation.equals("select")) {
			operation = "select   " + table;
		} else {
			operation = "update " + table + "  set deleteDateTime=getDate()  ";
		}
		String filters = operation + " where " + filter;

		Object[] obj = rep.getAllObject(filters);
		if (obj == null) {
			return new ResponseEntity<Object[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Object[]>(obj, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListeNotificationByCompte/{page}/{size}/{compteId}/{type}/{zfet}", method = RequestMethod.GET)
	public ResponseEntity<Page<Notification>> getAllEtapeDossierRest(@PathVariable int page, @PathVariable String zfet,
			@PathVariable String type, @PathVariable int size, @PathVariable int compteId) {

		Page<Notification> etap = null;
		if (type.equals("d")) {


			etap = nr.getAllNotificationByCompteByEtat(new PageRequest(page, size), compteId, zfet);

		} else {

			etap = nr.getAllNotificationByCompteByEtatNum(new PageRequest(page, size), compteId, zfet);

		}

		if (etap.isEmpty()) {
			return new ResponseEntity<Page<Notification>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<Notification>>(etap, HttpStatus.OK);
	}

//	installation get by compte

	@RequestMapping(value = "/getListInstallationByCompte/{page}/{size}/{compteId}", method = RequestMethod.GET)
	public ResponseEntity<Page<Installation>> getListInstallationByCompte(@PathVariable int page,
			@PathVariable int size, @PathVariable int compteId) {

		Page<Installation> etap = installRep.getAllInstallationByCompte(new PageRequest(page, size), compteId);

		if (etap.isEmpty()) {
			return new ResponseEntity<Page<Installation>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<Installation>>(etap, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getListPorfil/{page}/{size}", method = RequestMethod.GET)
	public ResponseEntity<List<Profil>> listProil(@PathVariable int page,
			@PathVariable int size) {

		List<Profil> etap = profilRepository.getAllProfils(new PageRequest(page, size)).getContent();

		if (etap.isEmpty()) {
			return new ResponseEntity<List<Profil>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Profil>>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListCollecteByCompte/{page}/{size}/{compteId}", method = RequestMethod.GET)
	public ResponseEntity<Page<CollecteTransporteur>> getListCollecteByCompte(@PathVariable int page,
			@PathVariable int size, @PathVariable int compteId) {

		Page<CollecteTransporteur> etap = collecteRepository.getAllCollecteByCompte(new PageRequest(page, size),compteId);

		if (etap.isEmpty()) {
			return new ResponseEntity<Page<CollecteTransporteur>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<CollecteTransporteur>>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListCodeTab", method = RequestMethod.GET)
	public ResponseEntity<Code[]> getListCodeTab() {
		Code[] etap = codeRepository.getAllCodeTable();
		if (etap.length == 0) {
			return new ResponseEntity<Code[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Code[]>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListCategorieDechet", method = RequestMethod.GET)
	public ResponseEntity<CategorieDechet[]> getListCategorieDechet() {
		CategorieDechet[] categorieDechets = categorieDechetRepository.getAllCategorieDechet();
		return new ResponseEntity<CategorieDechet[]>(categorieDechets, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListCodeTabByClassif/{classification}", method = RequestMethod.GET)
	public ResponseEntity<Code[]> getListCodeTab(@PathVariable int classification) {
		Code[] etap = codeRepository.getAllCodeTable(classification);
		if (etap.length == 0) {
			return new ResponseEntity<Code[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Code[]>(etap, HttpStatus.OK);
	}


	@RequestMapping(value = "/getListeDemandeInformationByCompte/{page}/{size}/{compteId}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Page<DemandeInformation>> getListeDemandeInformationByCompte(@PathVariable int page,
			@PathVariable int size, @PathVariable int compteId,@PathVariable String type) {

//		Page<DemandeInformation> etaps = infRep.getAllDemandeInformationByCompte(new PageRequest(page, size), compteId);
		List<Integer> inte = new ArrayList<Integer>();
		/*inte.add(11);
		inte.add(12);*/
		inte.add(9999999);
		Page<DemandeInformation> etap = null;
		List<String> tt = new ArrayList<>();
		tt.add("EE");
		tt.add("RS");
		if(!type.equals("EE") && !type.equals("RS"))
			etap = infRep.getdemandeByEatStatutNotIn(new PageRequest(page, size), compteId, inte, type);
		else
			etap = infRep.getdemandeByEatStatutNotIn2(new PageRequest(page, size), compteId, inte,tt);


		if (etap.isEmpty()) {
			return new ResponseEntity<Page<DemandeInformation>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<DemandeInformation>>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListeDemandeInformationByCompteStatut/{page}/{size}/{compteId}/{statut}", method = RequestMethod.GET)
	public ResponseEntity<Page<DemandeInformation>> getListeDemandeInformationByCompteStatut(@PathVariable int page,
			@PathVariable int size, @PathVariable int compteId, @PathVariable int statut) {
		List<Integer> inte = new ArrayList<Integer>();
		inte.add(11);
		inte.add(12);
		inte.add(13);
		inte.add(47);
		Page<DemandeInformation> etap = infRep.getdemandeByEatStatutIn(new PageRequest(page, size), compteId, inte);

		if (etap.isEmpty()) {
			return new ResponseEntity<Page<DemandeInformation>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<DemandeInformation>>(etap, HttpStatus.OK);
	}

	/*@RequestMapping(value = "/getListColAncienne/{id}/{idCompte}", method = RequestMethod.GET)
	public ResponseEntity<Object[]> getListColAncienne(@PathVariable int id,@PathVariable int idCompte) {
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		Object[] listColAncienne = collecteRepository.getAlllCollecteAncienne(id,idCompte);
		if (listColAncienne.length == 0) {
			return new ResponseEntity<Object[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Object[]>(listColAncienne, HttpStatus.OK);
	}*/

	@RequestMapping(value = "/getListColAncienne/{id}/{idCompte}", method = RequestMethod.GET)
		public ResponseEntity<CollecteTransporteur[]> getListColAncienne(@PathVariable int id,@PathVariable int idCompte) {
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		CollecteTransporteur[] listColAncienne = collecteRepository.getAlllCollecteAncienne(id,idCompte);
		return new ResponseEntity<CollecteTransporteur[]>(listColAncienne, HttpStatus.OK);
	}


}
