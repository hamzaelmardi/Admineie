package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.apache.el.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.UnknownHostException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.TimeUnit;

@Controller

public class UserControler {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private SecteurRepository secteurRepository;
	@Autowired
	private CompteAffecteRepository cptAffecteRepository;

	@Autowired
	private SecteurRepository secteurRep;

	@Autowired
	private CommuneRepository communeRep;
	@Autowired
	private SecurityService webs;

	@Autowired
	private DemandeInformationRepository dmRep;

	@Autowired
	private PrRoleRepository profilRoleRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private NotificationRepository notifRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private StatutProjetRepository statutProjetRep;
	@Autowired
	private ProfilRepository profilRepository;
	@Autowired
	private WebService web;

	@Autowired
	private SecurityService secure;
	@Autowired
	FileStorageService fileStorageService;

	@Autowired
	StatutProjetRepository stRep;

	@Autowired
	PrefectureRepository prefectureRep;

	@Autowired
	private ClassificationRepository classificationRepository;

	@Autowired
	DocImportRepository docImportRepository;

	@Autowired
	ReunionRepository reunionRepository;

	@Autowired
	DemandeInformationRepository demandeInformationRepository;

	ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private CollecteRepository collecteRepository;
	@Autowired
	private AuditRepository auditRepository;
	@Value("${url}")
	private String urlRest;

	@Value("${urls}")
	private String url;

	@Autowired
	TransporteurParamRepository transporteurParamRepository;

	@Autowired
	TransporteurEtrangerRepository transporteurEtrangerRepository;

	@Autowired
	StatutProjetRepository statutProjetRepository;
	@Autowired
	private InstallationDechetRepository installationDechetRepository;

	@Autowired
	private VehiculeRepository vehiculeRepository;

	@Autowired
	AuditAutorisationRepository auditAutorisationRepository;

	@Autowired
	ListDocNotifRepository listDocNotifRepository;

	@Autowired
	PosteRepository posteRepository;

	@Autowired
	AffectationRepository affectationRepository;

	@Autowired
	CodeRepository codeRepository;

	@Autowired
	DeclarationTransporteurRepository declarationTransporteurRepository;
	@Autowired
	InstallationAutoriseRepository installationAutoriseRepository;

	@RequestMapping(value = { "/*" }, method = RequestMethod.GET)
	public String index(HttpServletRequest request, HttpSession session, Principal principal) {

		return (principal != null) ? "accueil" : "login2";
	}

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String indexS(HttpServletRequest request, HttpSession session, Principal principal) {

		return "login2";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "login2";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String getPages(@RequestParam(value = "error", required = false) String error, Principal principal) {

		return "login2";
	}

	@RequestMapping(value = "/api/getParamPage", method = RequestMethod.GET)
	public ModelAndView getParamPage() {
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("paramPage", model);
	}


	//----------Audit------------
		@RequestMapping(value = "/api/AuditSearch/{page}/{size}", method = RequestMethod.GET)
		public ModelAndView Audit1(@PathVariable int page,@PathVariable int size,@RequestParam String action ,@RequestParam Integer id_user,@RequestParam String date) throws ParseException, java.text.ParseException {
			Map<String,Object> model = new HashMap<String,Object>();

			model.put("ct", id_user);
			model.put("action", action);


			if(id_user==0) {
                id_user=null;
			}
			if(action.equals("0")) {
				action=null;
			}

			java.sql.Date sql=null;
			if(!date.equals("") && date!="0") {
				SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		        Date utiDate = dateFormater.parse(date);
		        sql = new java.sql.Date(utiDate.getTime());
                model.put("date", date);
			}
			else {
				model.put("date", 0);
			}
			model.put("compte", compteRepository.getAllCompte());
			Page<Audit> h = auditRepository.getauditByaction(new PageRequest(page, size),action, id_user,sql);


			model.put("notif", h);
			if (h != null) {

				List<Audit> searchResult = h.getContent();

				model.put("notif", searchResult);
				model.put("total", h.getTotalElements());

				model.put("number", h.getNumber());
				model.put("page", 0);
				model.put("totalPage", h.getTotalPages());
				model.put("size", h.getSize());


			} else {
				model.put("totalPage", 0);
			}

			model.put("user",web.getCompteConnected());

			return new ModelAndView("Audit/AuditSearch",model);
		}

		@RequestMapping(value = "/api/AuditSearchPage/{page}/{size}/{action}/{id_user}/{date}", method = RequestMethod.GET)
		public ModelAndView Audit1s(@PathVariable int page,@PathVariable int size,@PathVariable String action ,@PathVariable Integer id_user,@PathVariable String date) throws ParseException, java.text.ParseException {
			Map<String,Object> model = new HashMap<String,Object>();

			model.put("ct", id_user);
			model.put("action", action);

			if(id_user==0) {
                id_user=null;
			}
			if(action.equals("0")) {
				action=null;
			}

			java.sql.Date sql=null;
			if(!date.equals("") && !date.equals("0")) {
				SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd");
		        Date utiDate = dateFormater.parse(date);
		        sql = new java.sql.Date(utiDate.getTime());
                model.put("date", date);


			}
			else {
				model.put("date", 0);
			}
			model.put("compte", compteRepository.getAllCompte());
			Page<Audit> h = auditRepository.getauditByaction(new PageRequest(page, size),action,id_user,sql);


			model.put("notif", h);
			if (h != null) {

				List<Audit> searchResult = h.getContent();

				model.put("notif", searchResult);
				model.put("total", h.getTotalElements());

				model.put("number", h.getNumber());
				model.put("page", 0);
				model.put("totalPage", h.getTotalPages());
				model.put("size", h.getSize());


			} else {
				model.put("totalPage", 0);
			}
			model.put("user", web.getCompteConnected());

			return new ModelAndView("Audit/AuditSearch",model);
		}

	@RequestMapping(value = "/api/Audit/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView Audit(@PathVariable int page,@PathVariable int size) {

		Map<String,Object> model = new HashMap<String,Object>();
		model.put("compte", compteRepository.getAllCompte());
		Page<Audit> h = auditRepository.getauditByaction(new PageRequest(page, size));


		if (h != null) {

			List<Audit> searchResult = h.getContent();

			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("Audit/Audit",model);
	}



	@RequestMapping(value = "/api/statistique/{type}", method = RequestMethod.GET)
	public ModelAndView getStatistique(@PathVariable String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		int n = notifRepository.getCountAutorisation();
		int region = demandeInformationRepository.getCountEnvirennmentByRegion();
		int reunion = reunionRepository.getCountReunion();
		int projetexamine = demandeInformationRepository.getNombreProjetExamine();
		model.put("nombre", n);
		model.put("type",type);
		model.put("nombreRegion", region);
		model.put("nombrereunion", reunion);
		model.put("projetexamine", projetexamine);
		return new ModelAndView("statistique/statistique", model);
	}

	@RequestMapping(value = "/api/zonne", method = RequestMethod.GET)
	public @ResponseBody String[] getZonne(){
		String[] n = notifRepository.getZF();
		return n;
	}

	@RequestMapping(value = "/api/statistiquee", method = RequestMethod.GET)
	public ModelAndView getStatistiquee() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(48);
		ids.add(50);
		ids.add(51);
		ids.add(29);
		ids.add(91);
		model.put("nbr_CT",collecteRepository.getCountCollect(ids));
		model.put("nbr_INST",installationDechetRepository.getCountInst(ids));
		model.put("nbr_EE",demandeInformationRepository.getTotalEE());
		model.put("nbr_NT",demandeInformationRepository.getTotalNT());
		model.put("nbr_AE",demandeInformationRepository.getTotalAE());
		model.put("nbr_ZF",notifRepository.getnotificationZF(ids));
		model.put("nbr_ET",notifRepository.getnotificationET(ids));
		model.put("nbr_XD",notifRepository.getnotificationXD(ids));
		model.put("nbr_TR",notifRepository.getnotificationTR(ids));
		Compte c = web.getCompteConnected();
		model.put("auto",c.getAuto_nv());
		return new ModelAndView("statistique/index", model);
	}


	@RequestMapping(value = "/api/statistique/autorisation_octroyees", method = RequestMethod.GET)
	public ModelAndView getAutorisationoctroyees(@RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("regions", regionRepository.getAllRegion());
		model.put("type",type);
		return new ModelAndView("statistique/autorisationOctroyees", model);
	}

	@RequestMapping(value = "/api/statistique/typeDechetDangereux/{type}", method = RequestMethod.GET)
	public ModelAndView typeDechetDangereux(@PathVariable String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type",type);
		return new ModelAndView("statistique/TypeDechetDangereux", model);
	}

	@RequestMapping(value = "/api/statistique/typeDechetDangereux", method = RequestMethod.GET)
	public @ResponseBody ModelAndView typeDechetDangereuxx(@RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type",type);
		model.put("zonne",notifRepository.getZF());
		return new ModelAndView("statistique/zonneFranche", model);
	}

	@RequestMapping(value = "/api/statistique/getCodeTypeDangereux",method = RequestMethod.GET)
	public @ResponseBody Object[] getCodeTypeDangereux(@RequestParam int typeDechet, @RequestParam int transporteur, @RequestParam int zonneFranche) throws Exception {

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();
			if(transporteur==0 && zonneFranche!=0){
				addList.addAll(Arrays.asList(notifRepository.getnotificationByZonneDangereux(zonneFranche, typeDechet)));
			}
			if( zonneFranche==0 && transporteur==0 ){
				addList.addAll(Arrays.asList(notifRepository.getnotificationByCodeDangereux(typeDechet)));
			}
			if(typeDechet==1){
				if( zonneFranche!=0 && transporteur!=0 ){
					addList.addAll(Arrays.asList(notifRepository.getnotificationByTransporteurZonneDangereux(transporteur, zonneFranche, typeDechet)));
				}
				if(zonneFranche==0 && transporteur!=0){
					addList.addAll(Arrays.asList(notifRepository.getnotificationByTransporteurDangereux(transporteur, typeDechet)));
				}
			}
			else{
				if( zonneFranche!=0 && transporteur!=0 ){
					addList.addAll(Arrays.asList(notifRepository.getnotificationByTransporteurEtrangerZonneDangereux(transporteur, zonneFranche, typeDechet)));
				}
				if(zonneFranche==0 && transporteur!=0){
					addList.addAll(Arrays.asList(notifRepository.getnotificationByTransporteurEtrangerDangereux(transporteur, typeDechet)));
				}
		}

		res=addList.toArray();
		return res;
	}

	@RequestMapping(value = "/api/statistique/getNombreTypeDangereux",method = RequestMethod.GET)
	public @ResponseBody Object[] getNombreTypeDangereux(@RequestParam int typeDechet, @RequestParam int transporteur, @RequestParam int zonneFranche) throws Exception {

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();
			if(transporteur==0 && zonneFranche!=0){
				addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByZonneDangereux(zonneFranche, typeDechet)));
			}
			if( zonneFranche==0 && transporteur==0 ){
				addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByCodeDangereux(typeDechet)));
			}
			if(typeDechet==1){
				if( zonneFranche!=0 && transporteur!=0 ){
					addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByTransporteurZonneDangereux(transporteur, zonneFranche, typeDechet)));
				}
				if(zonneFranche==0 && transporteur!=0){
					addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByTransporteurDangereux(transporteur, typeDechet)));
				}
			}
			else{
				if( zonneFranche!=0 && transporteur!=0 ){
					addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByTransporteurEtrangerZonneDangereux(transporteur, zonneFranche, typeDechet)));
				}
				if(zonneFranche==0 && transporteur!=0){
					addList.addAll(Arrays.asList(notifRepository.getNombrenotificationByTransporteurEtrangerDangereux(transporteur, typeDechet)));
				}
		}
		res=addList.toArray();
		return res;
	}


	@RequestMapping(value = "/api/statistique/getNombreSociete",method = RequestMethod.GET)
	public @ResponseBody Object[] getNombreSociete(@RequestParam int typeDechet) throws Exception {

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();
		if(typeDechet==1){
			addList.addAll(Arrays.asList(notifRepository.getNombreSocieteDangereuxZF()));
		}
		else{
			addList.addAll(Arrays.asList(notifRepository.getNombreSocieteNonDangereuxZF()));
		}
		res=addList.toArray();
		return res;
	}

	@RequestMapping(value = "/api/statistique/getQuantiteTypeDangereux",method = RequestMethod.GET)
	public @ResponseBody Object[] getQuantiteTypeDangereux(@RequestParam int typeDechet, @RequestParam int transporteur, @RequestParam int zonneFranche, @RequestParam String etat) throws Exception {

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();
		if(transporteur==0 && zonneFranche!=0){
			addList.addAll(Arrays.asList(notifRepository.getQuantiteByZoneFranche(typeDechet, zonneFranche )));
		}
		if(zonneFranche==0 && transporteur==0) {
			if (etat.equals("bar")) {
				addList.addAll(Arrays.asList(notifRepository.getQuantiteDangereuxZFBar(typeDechet)));
			} else if (!etat.equals("bar")) {
				addList.addAll(Arrays.asList(notifRepository.getQuantiteDangereuxZFTab(typeDechet)));
			}
		}
		if(typeDechet==1){
			if( zonneFranche!=0 && transporteur!=0 ){
				addList.addAll(Arrays.asList(notifRepository.getQuantiteByZoneFrancheTransporteurParam(zonneFranche, transporteur)));
			}
			if(zonneFranche==0 && transporteur!=0) {
				if (etat.equals("bar")) {
					addList.addAll(Arrays.asList(notifRepository.getQuantiteByTransporteurParamBar(transporteur)));
				} else if (!etat.equals("bar")) {
					addList.addAll(Arrays.asList(notifRepository.getQuantiteByTransporteurParamTab(transporteur)));
				}
			}
		}
		else{
			if( zonneFranche!=0 && transporteur!=0 ){
				addList.addAll(Arrays.asList(notifRepository.getQuantiteByZoneFrancheTransporteurEtranger(zonneFranche, transporteur)));
			}
			if(zonneFranche==0 && transporteur!=0){
				if (etat.equals("bar")) {
					addList.addAll(Arrays.asList(notifRepository.getQuantiteByTransporteurEtrangerBar(transporteur)));
				} else if (!etat.equals("bar")) {
					addList.addAll(Arrays.asList(notifRepository.getQuantiteByTransporteurEtrangerTab(transporteur)));
				}
			}
		}
		res=addList.toArray();
		return res;
	}


	/*///////////////////////////////Pays etranger////////////////////////////////////*/

	@RequestMapping(value = "/api/statistique/jspPaysExportateur", method = RequestMethod.GET)
	public @ResponseBody ModelAndView jspPaysExportateur(@RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type",type);
		return new ModelAndView("statistique/paysExportateurJsp", model);
	}

	@RequestMapping(value = "/api/statistique/getCodePaysET",method = RequestMethod.GET)
	public @ResponseBody Object[] getCodePaysET() throws Exception {

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();

		addList.addAll(Arrays.asList(notifRepository.getnotificationByETPays()));

		res=addList.toArray();
		return res;
	}


	/*////////////////////////////////////////////Exportation des déchet/////////////////////////////////////////////////*/

	@RequestMapping(value = "/api/statistique/nombreXDByPaysAndTypeExportJsp", method = RequestMethod.GET)
	public @ResponseBody ModelAndView nombreXDByPaysAndTypeExportJsp(@RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type",type);
		return new ModelAndView("statistique/exportationDechet", model);
	}

	@RequestMapping(value = "/api/statistique/environnement/{type}", method = RequestMethod.GET)
	public ModelAndView getEnvironnement(@PathVariable String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("regions", regionRepository.getAllRegion());
		model.put("type",type);
		return new ModelAndView("statistique/environnement", model);
	}

	@RequestMapping(value = "/api/statistique/reunionstatistique", method = RequestMethod.GET)
	public ModelAndView getReunionStatistique(@RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("type",type);
		return new ModelAndView("statistique/reunionStatistique", model);
	}

	@RequestMapping(value = "/api/recap_autorisation/{type}/{id_notif}", method = RequestMethod.GET)
	public ModelAndView getRecapAutorisation(@PathVariable int id_notif, @PathVariable String type){
		Map<String, Object> model = new HashMap<>();
		model.put("type", type);
		Notification notification = notifRepository.getOne(id_notif);
		model.put("notification", notification);
		model.put("declaration",declarationTransporteurRepository.getDeclarationTransByNotification(id_notif));
		model.put("user",web.getCompteConnected());
		model.put("url_Admin",urlRest);
		ListDocNotif[] l = listDocNotifRepository.ListDocNotifs(notification.getId_notification());
		model.put("doc",l);
		return new ModelAndView("autorisation/recap_autorisation", model);
	}

	@RequestMapping(value = "/api/recap_evaluation/{type}/{id_demande}", method = RequestMethod.GET)
	public ModelAndView getRecapEvaluation(@PathVariable int id_demande, @PathVariable String type){
		Map<String, Object> model = new HashMap<>();
		model.put("type", type);
		DemandeInformation demandeInformation = demandeInformationRepository.getOne(id_demande);
		model.put("demandeInformation", demandeInformation);
		model.put("user", web.getCompteConnected());
		model.put("url_Admin",urlRest);
		ListDocNotif[] l = listDocNotifRepository.ListdocEIE(demandeInformation.getId_demande_information());
		model.put("doc",l);
		return new ModelAndView("eie/recap_eie", model);
	}

	@RequestMapping(value = "/api/recap_installation/{id_inst}", method = RequestMethod.GET)
	public ModelAndView getRecapInstallation(@PathVariable int id_inst){
		Map<String, Object> model = new HashMap<>();
		Installation inst = installationDechetRepository.getOne(id_inst);
		model.put("inst", inst);
		model.put("user", web.getCompteConnected());
		model.put("url_Admin",urlRest);
		model.put("url_Public",url);
		ListDocNotif[] l = listDocNotifRepository.ListDocInstallation(inst.getId_installation());
		model.put("doc",l);
		return new ModelAndView("installation/recap_installation", model);
	}

	@RequestMapping(value = "/api/recap_collecte/{id_coll}", method = RequestMethod.GET)
	public ModelAndView getRecapCollecte(@PathVariable int id_coll){
		Map<String, Object> model = new HashMap<>();
		CollecteTransporteur ct = collecteRepository.getById(id_coll);
		List<Vehicules> v = ct.getVehicules();
		model.put("vehicules", v);
		model.put("collecte", ct);
		model.put("user", web.getCompteConnected());
		model.put("url_Admin",urlRest);
		model.put("url_Public",url);
		ListDocNotif[] l = listDocNotifRepository.ListDocCollectes(ct.getId_collecte());
		model.put("doc",l);
		return new ModelAndView("collecte/recap_collecte", model);
	}
//19//
	@RequestMapping(value = "/api/getListeAutorisation/{type}/{page}/{size}/{statut}", method = RequestMethod.GET)
	public ModelAndView getListeAutorisation(@PathVariable String type,@PathVariable int statut,@PathVariable int page,@PathVariable int size) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Notification> h=null;
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(29);ids.add(48);ids.add(91);
		Compte ct=web.getCompteConnected();
		String x =ct.getTyperegion();
		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			/*h=notifRepository.getAllNotificationByNotEtatZF(new PageRequest(page, size), type);*/
			h=notifRepository.getAllNotificationByRegion(new PageRequest(page, size),type,regionId,ids);
		}
		else if(statut==0 && x.equals("2")){
			h=notifRepository.getAllNotificationByNotEtatZFnotinID(new PageRequest(page, size),type,ids);
		}
		else if(statut!=0 && x.equals("2")){
			/*h=notifRepository.getAllNotificationByNotEtatZFbyStatut(new PageRequest(page, size), type, statut);*/
			h=notifRepository.getAllNotificationByNotEtatZFbyStatutnotinID(new PageRequest(page, size), type, statut,ids);
		}
		else if(statut!=0 && x.equals("1")){
			int regionId=ct.getRegion().getRegionId();
			h=notifRepository.getAllNotificationByStatutByRegion(new PageRequest(page, size), type, statut,ids,regionId);
		}

		if(ct.getPoste()!=null){
			if(ct.getPoste().getId_Poste()==1) {
				h=notifRepository.getAllNotificationByAffectation(new PageRequest(page, size),type,ct.getCompteId());
			}
		}

		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
			model.put("ar", sp.getNom_ar());
		}else{
			model.put("sp", "Tous");
			model.put("ar", "الجميع");
		}


			model.put("statutEnc", statut);
			List<Notification> searchResult = h.getContent();
			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", page);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		model.put("user", web.getCompteConnected());
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));

		model.put("statNow",statut);
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("ZF");
		model.put("statut", s);
		model.put("type", type);
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("autorisation/autorisation", model);
	}

	@RequestMapping(value = "/api/getListComptes/{page}/{size}/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView getListComptes(@PathVariable int page,@PathVariable int size,@PathVariable String type,@PathVariable int id) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Compte> h=null;
		if(type.equals("CT")){
			CollecteTransporteur nt = collecteRepository.getbyid(id);
			model.put("nt", nt);
			model.put("type", "CT");
		}
		else if(type.equals("ZF") || type.equals("TR") || type.equals("XD") || type.equals("ET")){
			Notification nt = notifRepository.getbyid(id);
			model.put("nt", nt);
			model.put("type", nt.getZf_et());
		}
		else if(type.equals("IT")){
			Installation nt = installationDechetRepository.getid(id);
			model.put("nt", nt);
			model.put("type", "IT");
		}
		else{
			DemandeInformation nt = demandeInformationRepository.getById(id);
			model.put("nt", nt);
			model.put("type", nt.getType());
		}
		Compte ct=web.getCompteConnected();
		String x =ct.getTyperegion();
		if(x.equals("1")){
			h=compteRepository.getAllCompteNotScieteByRegionPagination(new PageRequest(page, size),ct.getCompteId(),ct.getAuto_nv());
		}
		else if(x.equals("2")){
			h=compteRepository.getAllCompteNotScietePagination(new PageRequest(page, size),ct.getAuto_nv());
		}
		List<Compte> searchResult = h.getContent();
		model.put("listeCompte",searchResult);
		model.put("total", h.getTotalElements());
		model.put("number", h.getNumber());
		model.put("pagee", page);
		model.put("totalPagee", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("user", ct);


		return new ModelAndView("compte/listComptesPagination", model);
	}

	@RequestMapping(value = "/api/getAllComptes/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView getListComptes(@PathVariable int id,@PathVariable String type) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Compte> h=null;
		Compte ct=web.getCompteConnected();
		if(type.equals("CT")){
			CollecteTransporteur nt = collecteRepository.getbyid(id);
			model.put("nt", nt);
			model.put("type", "CT");
		}
		else if(type.equals("ZF")){
			Notification nt = notifRepository.getbyid(id);
			model.put("nt", nt);
			model.put("type", nt.getZf_et());
		}
		else if(type.equals("IT")){
			Installation nt = installationDechetRepository.getid(id);
			model.put("nt", nt);
			model.put("type", "IT");
		}
		else{
			DemandeInformation nt = demandeInformationRepository.getById(id);
			model.put("nt", nt);
			model.put("type", nt.getType());
		}
		String x =ct.getTyperegion();
		if(x.equals("1")){
			h=compteRepository.getAllCompteNotScieteByRegionPagination(new PageRequest(0, 6),ct.getCompteId(),ct.getAuto_nv());
		}
		else if(x.equals("2")){
			h=compteRepository.getAllCompteNotScietePagination(new PageRequest(0, 6),ct.getAuto_nv());
		}
		List<Compte> searchResult = h.getContent();
		model.put("listeCompte",searchResult);
		model.put("total", h.getTotalElements());
		model.put("number", h.getNumber());
		model.put("pagee", 0);
		model.put("totalPagee", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("user", ct);

		return new ModelAndView("compte/listComptesPagination", model);
	}
	@RequestMapping(value = "/api/getListeAutorisationDesc/{type}/{page}/{size}/{statut}/{order}", method = RequestMethod.GET)
	public ModelAndView getListeAutorisationDesc(@PathVariable String type,@PathVariable int statut,@PathVariable int page,@PathVariable int size,@PathVariable String order) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Notification> h=null;
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(29);ids.add(48);ids.add(91);
		Compte ct=web.getCompteConnected();
		String x =ct.getTyperegion();
		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = notifRepository.getAllNotificationByRegion_desc(new PageRequest(page, size), type, regionId,ids);
			}
			else{
				h = notifRepository.getAllNotificationByRegion(new PageRequest(page, size), type, regionId,ids);
			}
		}
		else if(statut==0 && x.equals("2")){
			if(Objects.equals(order, "desc")){
				h=notifRepository.getAllNotificationByByNbr_Desc(new PageRequest(page, size),type,ids);
			}
			else{
				h=notifRepository.getAllNotificationByNotEtatZFnotinID(new PageRequest(page, size),type,ids);
			}
		}
		else if(statut!=0 && x.equals("2")){
			if(Objects.equals(order, "desc")) {
				h = notifRepository.getAllNotificationByNotEtatZFbyStatutnotinID_desc(new PageRequest(page, size), type, statut, ids);
			}
			else{
				h = notifRepository.getAllNotificationByNotEtatZFbyStatutnotinID(new PageRequest(page, size), type, statut, ids);
			}
		}
		else if(statut!=0 && x.equals("1")){
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = notifRepository.getAllNotificationByStatutByRegion_desc(new PageRequest(page, size), type, statut, ids, regionId);
			}
			else{
				h=notifRepository.getAllNotificationByStatutByRegion(new PageRequest(page, size), type, statut,ids,regionId);
			}
		}

		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1){
			if(Objects.equals(order, "desc")) {
				h=notifRepository.getAllNotificationByAffectation_desc(new PageRequest(page, size),type,ct.getCompteId());
			}
			else{
				h=notifRepository.getAllNotificationByAffectation(new PageRequest(page, size),type,ct.getCompteId());
			}
		}

		List<Notification> searchResult = h.getContent();
		model.put("notif", searchResult);
		model.put("total", h.getTotalElements());
		model.put("number", h.getNumber());
		model.put("page", page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());

		model.put("user", web.getCompteConnected());
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));

		model.put("statNow",statut);
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("ZF");
		model.put("statut", s);
		model.put("type", type);
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("autorisation/autorisationDesc", model);
	}

	@RequestMapping(value = "/api/getListeAutorisationSearch/{type}/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getListeAutorisationSearch(@PathVariable("type") String type,@PathVariable("page") int page,@PathVariable("size") int size,@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("inlineRadioOptions") String inlineRadioOptions,@RequestParam("selst") int selst) {

	Map<String, Object> model = new HashMap<String, Object>();
	model.put("iniline",inlineRadioOptions);
	java.sql.Date d1 = java.sql.Date.valueOf(date1);
	java.sql.Date d2 = java.sql.Date.valueOf(date2);
		model.put("date1",d1);
		model.put("date2",d2);
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(29);ids.add(48);ids.add(91);
	Compte ct = web.getCompteConnected();
	String x=ct.getTyperegion();
	model.put("statutEnc", selst);
	Page<Notification> h=null;
	if(selst==0){
	if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
		int regionId=ct.getRegion().getRegionId();
		h=notifRepository.getByDateDepotRegion(new PageRequest(page, size), type,d1,d2,regionId,ids);
	}
	else if(inlineRadioOptions.equals("date_depot") && x.equals("2")) {
			h=notifRepository.getByDateDepotA(new PageRequest(page, size), type,d1,d2,ids);
		}
	else if(inlineRadioOptions.equals("date_validation") && x.equals("1")) {
		int regionId=ct.getRegion().getRegionId();
		h=notifRepository.geByDateValidationRegion(new PageRequest(page, size), type,d1,d2,regionId,ids);
	}
	else if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
			h=notifRepository.geByDateValidationA(new PageRequest(page, size), type,d1,d2,ids);
		}
	}
	else if(selst!=0){
	if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
		int regionId=ct.getRegion().getRegionId();
		h=notifRepository.getByDateDepotABByRegion(new PageRequest(page, size), type,d1,d2,selst,regionId,ids);
	}
	else if(inlineRadioOptions.equals("date_depot") && x.equals("2")) {
			h=notifRepository.getByDateDepotAB(new PageRequest(page, size), type,d1,d2,selst,ids);
		}
	else if(inlineRadioOptions.equals("date_validation") && x.equals("1") ) {
		int regionId=ct.getRegion().getRegionId();
		h=notifRepository.geByDateValidationABByRegion(new PageRequest(page, size), type,d1,d2,selst,regionId,ids);
	   }
	else if(inlineRadioOptions.equals("date_validation") && x.equals("2") ) {
		h=notifRepository.geByDateValidationAB(new PageRequest(page, size), type,d1,d2,selst,ids);
	}
	}
		StatutProjet sp = statutProjetRepository.getOne(selst);
		if(selst!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			if (inlineRadioOptions.equals("date_validation") && x.equals("1")){
				h = notifRepository.getAllNotificationByAffectation_search_v(new PageRequest(page, size), type, d1, d2, ct.getCompteId());
			}
			else {
				h = notifRepository.getAllNotificationByAffectation_search_d(new PageRequest(page, size), type, d1, d2, ct.getCompteId());
			}
		}

	List<Notification> searchResult = h.getContent();
	model.put("notif", searchResult);
	model.put("total", h.getTotalElements());

	model.put("number", h.getNumber());
	model.put("page", page);
	model.put("totalPage", h.getTotalPages());
	model.put("size", h.getSize());
	model.put("user", web.getCompteConnected());
	model.put("type", type);
	List<StatutProjet> s = statutProjetRepository.getAllStatutByType("ZF");
	model.put("statut", s);

		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

	return new ModelAndView("autorisation/autorisationTr", model);
	}

//*************************fin******************************
	public static int getDifferenceDays(Date d1, Date d2) {
		int diff = (int) (d2.getTime() - d1.getTime());
		return (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	}

	@RequestMapping(value = "/api/getListeInstallation/{page}/{size}/{statut}", method = RequestMethod.GET)
	public ModelAndView getListeInstallation(@PathVariable int statut,@PathVariable int page,@PathVariable int size) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Installation> h=null;
		Compte ct=web.getCompteConnected();
		String x=ct.getTyperegion();

		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			//h=installationDechetRepository.getAllInstallationDechetByRegion(new PageRequest(page, size),regionId);
			h=installationDechetRepository.getAllInstallationDechetByRegionNotBrouillon(new PageRequest(page, size),regionId);
		}
		else if(statut==0) {
			//h=installationDechetRepository.getAllInstallationDechet(new PageRequest(page, size));
			h=installationDechetRepository.getAllInstallationDechetNotBrouillon(new PageRequest(page, size));

		}
		else if(statut!=0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			h=installationDechetRepository.getAllInstallationDechetbyStatutByRegion(new PageRequest(page, size), statut,regionId);

		}
		else if(statut!=0 && x.equals("2")) {
			h=installationDechetRepository.getAllInstallationDechetbyStatut(new PageRequest(page, size), statut);

		}
		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
			model.put("ar", sp.getNom_ar());
		}else{
			model.put("sp", "Tous");
			model.put("ar", "جميع");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			h=installationDechetRepository.getInstallationByAffectation(new PageRequest(page, size),ct.getCompteId());
		}

		model.put("statutEnc", statut);

		List<Installation> searchResult = h.getContent();

		String isAffecte ="non";
		model.put("statutEnc", statut);
		model.put("install", searchResult);
		model.put("total", h.getTotalElements());
		//model.put("statutEnc", 0);
		model.put("number", h.getNumber());
		model.put("page", page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("url_Admin",urlRest);
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("user", web.getCompteConnected());
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("IT");
		model.put("statut", s);
		model.put("statNow",statut);

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("installation/intallationDechet", model);
	}

	@RequestMapping(value = "/api/getListeInstallationDesc/{page}/{size}/{statut}/{order}", method = RequestMethod.GET)
	public ModelAndView getListeInstallationDesc(@PathVariable int statut,@PathVariable int page,@PathVariable int size,@PathVariable String order) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<Installation> h=null;
		Compte ct=web.getCompteConnected();
		String x=ct.getTyperegion();

		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = installationDechetRepository.getAllInstallationDechetByRegionNotBrouillon_desc(new PageRequest(page, size), regionId);
			}
			else{
				h = installationDechetRepository.getAllInstallationDechetByRegionNotBrouillon(new PageRequest(page, size), regionId);
			}
		}
		else if(statut==0) {
			if(Objects.equals(order, "desc")) {
				h = installationDechetRepository.getAllInstallationDechetNotBrouillon_desc(new PageRequest(page, size));
			}
			else{
				h = installationDechetRepository.getAllInstallationDechetNotBrouillon(new PageRequest(page, size));
			}

		}
		else if(statut!=0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = installationDechetRepository.getAllInstallationDechetbyStatutByRegion_desc(new PageRequest(page, size), statut, regionId);
			}
			else{
				h = installationDechetRepository.getAllInstallationDechetbyStatutByRegion(new PageRequest(page, size), statut, regionId);
			}

		}
		else if(statut!=0 && x.equals("2")) {
			if(Objects.equals(order, "desc")) {
				h = installationDechetRepository.getAllInstallationDechetbyStatut_desc(new PageRequest(page, size), statut);
			}
			else{
				h = installationDechetRepository.getAllInstallationDechetbyStatut(new PageRequest(page, size), statut);
			}

		}
		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			if(Objects.equals(order, "desc")) {
				h=installationDechetRepository.getInstallationByAffectation_desc(new PageRequest(page, size),ct.getCompteId());
			}
			else{
				h=installationDechetRepository.getInstallationByAffectation(new PageRequest(page, size),ct.getCompteId());
			}
		}

		model.put("statutEnc", statut);

		List<Installation> searchResult = h.getContent();

		model.put("statutEnc", statut);
		model.put("install", searchResult);
		model.put("total", h.getTotalElements());
		//model.put("statutEnc", 0);
		model.put("number", h.getNumber());
		model.put("page", page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("url_Admin",urlRest);
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("user", web.getCompteConnected());
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("IT");
		model.put("statut", s);
		model.put("statNow",statut);

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("installation/installationDesc", model);
	}

	@RequestMapping(value = "/api/getListeInstallationSearch/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getListeInstallationSearch(@PathVariable("page") int page,@PathVariable("size") int size,@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("inlineRadioOptions") String inlineRadioOptions,@RequestParam("selst") int selst) {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("iniline",inlineRadioOptions);
		java.sql.Date d1 = java.sql.Date.valueOf(date1);
		java.sql.Date d2 = java.sql.Date.valueOf(date2);
		model.put("date1",d1);
		model.put("date2",d2);
		Compte ct = web.getCompteConnected();
		String x= ct.getTyperegion();
		model.put("statutEnc", selst);
		Page<Installation> h=null;
		if(selst==0){
			if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
				int regionId =ct.getRegion().getRegionId();
				h=installationDechetRepository.getByDateDepotAByRegion(new PageRequest(page, size),d1,d2,regionId);
			}
			else if(inlineRadioOptions.equals("date_depot") && x.equals("2")) {
				h=installationDechetRepository.getByDateDepotA(new PageRequest(page, size),d1,d2);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("1")) {
				int regionId =ct.getRegion().getRegionId();
				h=installationDechetRepository.geByDateValidationAByRegion(new PageRequest(page, size),d1,d2,regionId);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
				h=installationDechetRepository.geByDateValidationA(new PageRequest(page, size),d1,d2);
			}
		}


		else if(selst!=0){
			if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
				int regionId =ct.getRegion().getRegionId();
				h=installationDechetRepository.getByDateDepotABByRegion(new PageRequest(page, size),d1,d2,selst,regionId);
			}
			else if(inlineRadioOptions.equals("date_depot")) {
				h=installationDechetRepository.getByDateDepotAB(new PageRequest(page, size),d1,d2,selst);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("1")) {
				int regionId =ct.getRegion().getRegionId();
				h=installationDechetRepository.geByDateValidationABByRegion(new PageRequest(page, size),d1,d2,selst,regionId);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
				h=installationDechetRepository.geByDateValidationAB(new PageRequest(page, size),d1,d2,selst);
			}
		}
			StatutProjet sp = statutProjetRepository.getOne(selst);
			if(selst!=0) {
				model.put("sp", sp.getNom_fr());
			}else{
				model.put("sp", "Tous");
			}

			if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
				if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
					h = installationDechetRepository.getInstallationByAffectation_search_v(new PageRequest(page, size), d1, d2, ct.getCompteId());
				}
				else{
					h = installationDechetRepository.getInstallationByAffectation_search_d(new PageRequest(page, size), d1, d2, ct.getCompteId());
				}
			}

			List<Installation> searchResult = h.getContent();

			model.put("install", searchResult);
			model.put("total", h.getTotalElements());
			model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
			if(x.equals("1")){
				model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
			}
			else if(x.equals("2")){
				model.put("listeCompte", compteRepository.getAllCompteNotSciete());
			}
			model.put("number", h.getNumber());
			model.put("page", page);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());
			model.put("user", web.getCompteConnected());
			List<StatutProjet> s = statutProjetRepository.getAllStatutByType("IT");
			model.put("statut", s);

			String isAccessible ="non";
			List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

			if(integerList.contains(1003)){
				isAccessible = "oui";
			}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("installation/installationTr", model);
	}


	@RequestMapping(value = "/api/getListeCollecte/{page}/{size}/{statut}", method = RequestMethod.GET)
	public ModelAndView getListeCollecte(@PathVariable int statut,@PathVariable int page,@PathVariable int size) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<CollecteTransporteur> h=null;
		Compte ct = web.getCompteConnected();
		String x=ct.getTyperegion();
		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			h=collecteRepository.getAllListCollecteByRegion(new PageRequest(page, size),regionId);
		}
		else if(statut==0 && x.equals("2")) {
			h=collecteRepository.getAllListCollecte(new PageRequest(page, size));
		}
		else if(statut!=0 && x.equals("1")){
			int regionId=ct.getRegion().getRegionId();
			h=collecteRepository.getAllCollecteTransporteurbyStatutByRegion(new PageRequest(page, size), statut,regionId);

		}
		else if(statut!=0 && x.equals("2")){
			h=collecteRepository.getAllCollecteTransporteurbyStatut(new PageRequest(page, size), statut);

		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			h=collecteRepository.getCollecteByAffectation(new PageRequest(page, size),ct.getCompteId());
		}

		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}
		model.put("statutEnc", statut);

		List<CollecteTransporteur> searchResult = h.getContent();

		model.put("statutEnc", statut);
		model.put("collect", searchResult);
		model.put("total", h.getTotalElements());
		model.put("number", h.getNumber());
		model.put("page", page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("url",urlRest);
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("statNow",statut);
		model.put("user", ct);
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("CT");
		model.put("statu", s);

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("collecte/collecteTransport", model);
	}

	@RequestMapping(value = "/api/getListeCollecteDesc/{page}/{size}/{statut}/{order}", method = RequestMethod.GET)
	public ModelAndView getListeCollecteDesc(@PathVariable int statut,@PathVariable int page,@PathVariable int size,@PathVariable String order) {

		Map<String, Object> model = new HashMap<String, Object>();
		Page<CollecteTransporteur> h=null;
		Compte ct = web.getCompteConnected();
		String x=ct.getTyperegion();
		if(statut==0 && x.equals("1")) {
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = collecteRepository.getAllListCollecteByRegion_desc(new PageRequest(page, size), regionId);
			}
			else{
				h = collecteRepository.getAllListCollecteByRegion(new PageRequest(page, size), regionId);
			}
		}
		else if(statut==0 && x.equals("2")) {
			if(Objects.equals(order, "desc")) {
				h = collecteRepository.getAllListCollecte_desc(new PageRequest(page, size));
			}
			else{
				h = collecteRepository.getAllListCollecte(new PageRequest(page, size));
			}
		}
		else if(statut!=0 && x.equals("1")){
			int regionId=ct.getRegion().getRegionId();
			if(Objects.equals(order, "desc")) {
				h = collecteRepository.getAllCollecteTransporteurbyStatutByRegion_desc(new PageRequest(page, size), statut, regionId);
			}
			else{
				h = collecteRepository.getAllCollecteTransporteurbyStatutByRegion(new PageRequest(page, size), statut, regionId);
			}

		}
		else if(statut!=0 && x.equals("2")){
			if(Objects.equals(order, "desc")) {
				h = collecteRepository.getAllCollecteTransporteurbyStatut_desc(new PageRequest(page, size), statut);
			}
			else{
				h = collecteRepository.getAllCollecteTransporteurbyStatut(new PageRequest(page, size), statut);
			}


		}
		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}
		model.put("statutEnc", statut);

		List<CollecteTransporteur> searchResult = h.getContent();

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			if(Objects.equals(order, "desc")) {
				h = collecteRepository.getCollecteByAffectation_desc(new PageRequest(page, size), ct.getCompteId());
			}
			else{
				h = collecteRepository.getCollecteByAffectation(new PageRequest(page, size), ct.getCompteId());
			}
		}

		model.put("statutEnc", statut);
		model.put("collect", searchResult);
		model.put("total", h.getTotalElements());
		model.put("number", h.getNumber());
		model.put("page", page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("url",urlRest);
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("statNow",statut);
		model.put("user", web.getCompteConnected());
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("CT");
		model.put("statu", s);

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("collecte/collecteTr", model);
	}

	@RequestMapping(value = "/api/getListeCollecteSearch/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getListeCollecteSearch(@PathVariable("page") int page,@PathVariable("size") int size,@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("inlineRadioOptions") String inlineRadioOptions,@RequestParam("selst") int selst) {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("radio",inlineRadioOptions);
		java.sql.Date d1 = java.sql.Date.valueOf(date1);
		java.sql.Date d2 = java.sql.Date.valueOf(date2);
		model.put("date1",d1);
		model.put("date2",d2);
		model.put("statutEnc", selst);
		Compte ct = web.getCompteConnected();

		String x= ct.getTyperegion();
		Page<CollecteTransporteur> h=null;
		if(selst==0){
			if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
				int regionId= ct.getRegion().getRegionId();
				h=collecteRepository.getByDateDepotAByRegion(new PageRequest(page, size),d1,d2,regionId);
			}
			else if(inlineRadioOptions.equals("date_depot") && x.equals("2")) {
				h=collecteRepository.getByDateDepotA(new PageRequest(page, size),d1,d2);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("1")) {
				int regionId= ct.getRegion().getRegionId();
				h=collecteRepository.geByDateValidationAByRegion(new PageRequest(page, size),d1,d2,regionId);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
				h=collecteRepository.geByDateValidationA(new PageRequest(page, size),d1,d2);
			}
		}
		else if(selst!=0){
			if(inlineRadioOptions.equals("date_depot") && x.equals("1")) {
				int regionId=ct.getRegion().getRegionId();
				h=collecteRepository.getByDateDepotABByRegion(new PageRequest(page, size),d1,d2,selst,regionId);
			}
			else if(inlineRadioOptions.equals("date_depot") && x.equals("2")) {
				h=collecteRepository.getByDateDepotAB(new PageRequest(page, size),d1,d2,selst);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("1")) {
				int regionId=ct.getRegion().getRegionId();
				h=collecteRepository.geByDateValidationABByRegion(new PageRequest(page, size),d1,d2,selst,regionId);
			}
			else if(inlineRadioOptions.equals("date_validation") && x.equals("2")) {
				h=collecteRepository.geByDateValidationAB(new PageRequest(page, size),d1,d2,selst);
			}
		}
		StatutProjet sp = statutProjetRepository.getOne(selst);
		if(selst!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			if (inlineRadioOptions.equals("date_validation") && x.equals("1")){
				h=collecteRepository.getCollecteByAffectation_search_v(new PageRequest(page, size),d1,d2,ct.getCompteId());
			}
			else {
				h=collecteRepository.getCollecteByAffectation_search_d(new PageRequest(page, size),d1,d2,ct.getCompteId());
			}
		}

		List<CollecteTransporteur> searchResult = h.getContent();
		model.put("url",urlRest);
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		model.put("collect", searchResult);
		model.put("total", h.getTotalElements());

		model.put("number", h.getNumber());
		model.put("page",page);
		model.put("totalPage", h.getTotalPages());
		model.put("size", h.getSize());
		model.put("user", web.getCompteConnected());
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("CT");
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("statu", s);

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("collecte/collecteTr", model);
	}

	@RequestMapping(value = "/api/getOneCollecte", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOneCollecte(@RequestParam String id)
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  collecteRepository.getbyid(id_collect);
		List<Vehicules> gt=v.getVehicules();
		map.put("vehicules",v.getVehicules());
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/getOneCode", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOneCode(@RequestParam String id)
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_collect = Integer.parseInt(id);
		CollecteTransporteur v =  collecteRepository.getbyid(id_collect);
		List<Code> gt=v.getCode();
		map.put("code",v.getCode());
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/getCompteAffecte", method = RequestMethod.GET)
	public @ResponseBody Map<String,Object> getCompteAffecte()
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException{
		Map<String,Object> map = new HashMap<>();

		//int id_notif = Integer.parseInt(id);

		//Notification v =  notifRepository.getbyidcompte(id_notif);
		List<Compte> gt=compteRepository.getAllCompte();
		map.put("compte",gt);
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/getOneCodeInstall", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOneCodeInstall(@RequestParam String id)
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_install = Integer.parseInt(id);
		Installation v =  installationDechetRepository.getid(id_install);
		List<Code> gt=v.getCode();
		map.put("typeIT",v.getType());
		map.put("code",v.getCode());
		map.put("url_Admin",urlRest);
		return map;
	}

	@RequestMapping(value = "/api/getParamCommune/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamCommune(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", communeRep.getAllPrefecture());
		Page<Commune> h = communeRep.getCommunePage(new PageRequest(page, size));
		if (h != null) {
			List<Commune> searchResult = h.getContent();
			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("param/commune", model);
	}

	@RequestMapping(value = "/api/getParamInstallation/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamInstallation(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		Page<InstallationAutorise> h = installationAutoriseRepository.getInstallationPage(new PageRequest(page, size));
		if (h != null) {
			List<InstallationAutorise> searchResult = h.getContent();
			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("param/installationAutorise", model);
	}

	@RequestMapping(value = "/api/getParamPrefecture/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamPrefecture(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", prefectureRep.getAllPrefecture());
		Page<Prefecture> h = prefectureRep.getPrefecturePage(new PageRequest(page, size));
		if (h != null) {
			List<Prefecture> searchResult = h.getContent();
			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		model.put("commune", communeRep.getAllCommune());
		return new ModelAndView("param/prefecture", model);
	}
	@RequestMapping(value = "/api/getParamStock", method = RequestMethod.GET)
	public ModelAndView getParamStock() {
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("paramStock", model);
	}

	@RequestMapping(value = "/getProfilDetails", method = RequestMethod.GET)
	public ModelAndView getProfilDetails(@RequestParam int val) {
		Map<String, Object> model = new HashMap<String, Object>();

		List<ProfilRole> rtf = profilRoleRepository.getAllProfilRoles(val);

		//model.put("roles", rt);
		model.put("profilId", val);

		return new ModelAndView("compte/droitTr", model);
	}

	@RequestMapping(value = "/api/getCompte", method = RequestMethod.GET)
	public ModelAndView getCompte() {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Profil> pr = profilRepository.getAllProfil();

		model.put("profil", pr);
		List<Compte> rt = compteRepository.getAllCompte();

		model.put("comptes", rt);

		return new ModelAndView("compte/compte", model);
	}



	@RequestMapping(value = "/api/getOneCompte", method = RequestMethod.GET)
	public ModelAndView getOneCompte() {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Profil> pr = profilRepository.getAllProfil();

		model.put("profil", pr);
		List<Compte> rt = compteRepository.getAllCompte();

		model.put("comptes", rt);

		return new ModelAndView("compte/compte", model);
	}

	@RequestMapping(value = "/api/getOneCompteId", method = RequestMethod.GET)
	public ModelAndView getOneCompteId(@RequestParam int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Profil> pr = profilRepository.getAllProfil();

		model.put("profil", pr);
		Compte cpt = compteRepository.getOne(id);
		model.put("cpt", cpt);
		List<Compte> rt = compteRepository.getAllCompte();

		model.put("comptes", rt);

		return new ModelAndView("compte/compte", model);
	}

	@RequestMapping(value = "/addCompte", method = RequestMethod.POST)
	public ModelAndView addCompte(@RequestBody Compte cmt) {
		Map<String, Object> model = new HashMap<String, Object>();
		int id = cmt.getCompteId();
		cmt.setPassword(passwordEncoder.encode(cmt.getPassword()));
		compteRepository.save(cmt);

		List<Profil> pr = profilRepository.getAllProfil();

		model.put("profil", pr);
		List<Compte> rt = compteRepository.getAllCompte();

		model.put("comptes", rt);

		return new ModelAndView("compte/compte", model);
	}

	@RequestMapping(value = "/deleteCompte", method = RequestMethod.POST)
	public @ResponseBody String addCompte(@RequestParam int id) {

		Compte cmt = compteRepository.getOne(id);
		cmt.setDeleted("oui");
		cmt.setDeleteDateTime(new Date());
		compteRepository.save(cmt);

		return "ok";
	}

	@RequestMapping(value = "/api/getDroit", method = RequestMethod.GET)
	public ModelAndView getDroit() {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Role> roles = roleRepository.getAllRole();
		model.put("roles", roles);

		return new ModelAndView("compte/droit", model);
	}

	@RequestMapping(value = "/api/getListe", method = RequestMethod.GET)
	public ModelAndView getListe() {
		Map<String, Object> model = new HashMap<String, Object>();

		List<Profil> roles = profilRepository.getAllProfil();
		model.put("roles", roles);

		return new ModelAndView("compte/droitexiste", model);
	}

	@RequestMapping(value = "/addProfil", method = RequestMethod.POST)
	public ModelAndView addProfil(@RequestBody Profil profil) {

		Map<String, Object> model = new HashMap<String, Object>();

		profilRepository.save(profil);
		List<Role> roles = roleRepository.getAllRole();

		int pr = profil.getProfilId();
		List<ProfilRole> prfs = new ArrayList<ProfilRole>();
		for (Role r : roles) {
			ProfilRole prf = new ProfilRole();
			prf.setValider("non");
			prf.setAnnuler("non");
			prf.setModifier("non");
			prf.setProfil(profil);
			prf.setRole(r);
			profilRoleRepository.save(prf);
			ProfilRole prt = profilRoleRepository.getAllProfilRole(r.getRoleId(), pr);
			prfs.add(prt);
		}

		model.put("profilId", pr);
		model.put("roles", prfs);

		return new ModelAndView("compte/droitTr", model);
	}

	@RequestMapping(value = "/getParam", method = RequestMethod.GET)
	public String getParam() {
		return "paramPage";
	}

	@RequestMapping(value = "/checkUser", method = RequestMethod.GET)
	public @ResponseBody String check(Principal p) {
		String n = p.getName();
		User user = userRepository.ifExistsEmails(n);
		String h = null;
		if (user != null) {
			h = "oui";
			return h;
		} else {
			h = "non";
			return "h";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username/password");
		}

		if (logout != null) {
			model.addObject("message", "Logged out");
		}
		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginMe(Model model, @RequestParam(required = false) String j_name,
			@RequestParam(required = false) String j_pass) {
		if (j_name != null) {
			String s = secure.autologin(j_name, j_pass);
			if (s.equals("oui")) {
				Compte ct=web.getCompteConnected();
				if(ct.getChequer().equals("no")){
					return "redirect:/checkCompte/AH6543YLOK"+ct.getCompteId()+"GDTGD1213F";
				}else{
					if(ct.getSt()!=null) {
						return "redirect:/logout";
					}
					else {
						return "redirect:/api/getMenu?lang=fr";
					}
				}
			} else {
				return "redirect:/index";
			}
		} else {
			return "redirect:/index";
		}
	}



	@RequestMapping(value = "/api/getMenu", method = RequestMethod.GET)
	public ModelAndView getMenu(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Principal principal, String dateF)  {
		String v = principal.getName();
		Compte u = compteRepository.siExiste(v);

		Map<String, Object> model = new HashMap<String, Object>();

		model.put("user", u);
//		pour eliminer le calcul  de brouillons-demande-num...
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(48);
		ids.add(50);
		ids.add(51);
		/*statistique*/
		model.put("nbr_ZF",notifRepository.getCountNotif("ZF",ids));
		model.put("nbr_ET",notifRepository.getCountNotif("ET",ids));
		model.put("nbr_CT",collecteRepository.getCountCollect(ids));
		model.put("nbr_INST",installationDechetRepository.getCountInst(ids));
		model.put("nbr_XD",notifRepository.getCountNotif("XD",ids));
		model.put("nbr_TR",notifRepository.getCountNotif("TR",ids));
		model.put("nbr_notif",notifRepository.getnotification(ids));

		model.put("nbr_EE", demandeInformationRepository.count_EE());
		model.put("nbr_RS", demandeInformationRepository.count_RS());
		model.put("nbr_NT", demandeInformationRepository.count_NT());
		model.put("nbr_AE", demandeInformationRepository.count_AE());

		Compte c = web.getCompteConnected();
		model.put("auto",c.getAuto_nv());

		return new ModelAndView("acceuil/acceuil", model);

	}
	@RequestMapping(value = "/api/getNoti", method = RequestMethod.POST)
	public ModelAndView getMenu()  {
		Map<String, Object> model = new HashMap<String, Object>();
		Notification[] t = notifRepository.getnumnotification("15");
		model.put("num_notif",t);
		return new ModelAndView("noti/noti", model);
	}
	@RequestMapping(value = "/checkCode", method = RequestMethod.GET)
	public @ResponseBody String checkCode(@RequestParam String val) {
		String check = "non";
		Region fm = regionRepository.siExiste(val);
		if (fm == null) {
			check = "non";
		} else {
			check = "oui";
		}

		return check;

	}

	@RequestMapping(value = "/checkEmail", method = RequestMethod.GET)
	public @ResponseBody String checkEmail(@RequestParam String val) {
		String check = "non";
		Compte fm = compteRepository.siExiste(val);
		if (fm == null) {
			check = "non";
		} else {
			check = "oui";
		}

		return check;

	}

	@RequestMapping(value = "/checkProfil", method = RequestMethod.GET)
	public @ResponseBody String checkProfil(@RequestParam String val) {
		String check = "non";
		Profil fm = profilRepository.siExisteProfil(val);
		if (fm == null) {
			check = "non";
		} else {
			check = "oui";
		}

		return check;

	}

	// pour supprimer une famille
	@RequestMapping(value = "/deleteRegion", method = RequestMethod.POST)
	public @ResponseBody String deleteFamille(@RequestParam int id) {

		Region fm = regionRepository.getOne(id);
		fm.setDeleteDateTime(new Date());
		regionRepository.save(fm);
		return "oui";

	}

//pour enregistrer une nouvelle famille

	@RequestMapping(value = "/api/dowload_uploaded/{filename:.+}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Resource> serveFile(@PathVariable String filename) {
		Resource file = fileStorageService.loadFileAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}
	//a confirmer avec amal !!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping(value = "/dowload_uploaded/{filename:.+}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Resource> serveFiles(@PathVariable String filename) {
		Resource file = fileStorageService.loadFileAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}

	/*@RequestMapping(value = "/DownloadFile/{id}/{type}/{etat}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Resource> DownloadFile(@PathVariable int id,@PathVariable String type,@PathVariable int etat) {
		Notification nt = notifRepository.getnotificationByIdType(id,type);
		String filename="";
		if(etat==1) {
			filename = nt.getUrl_doc_signer();
			filename = filename.replace("/assets/myFile/", "");
		}
		else if(etat==2) {
			filename = nt.getUrl_lettre();
			filename = filename.replace("/assets/myFile/", "");
		}
		else{
			filename = nt.getUrl_lettre_conforme();
			filename = filename.replace("/assets/myFile/", "");
		}
		Resource file = fileStorageService.loadFileAsResource(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}*/



	@RequestMapping(value = "/addProfilInfo", method = RequestMethod.POST)

	public @ResponseBody String addRoleToDirection(@RequestParam int profilId, @RequestParam String action,
			@RequestParam int roleId) {
		ProfilRole prt = profilRoleRepository.getAllProfilRole(roleId, profilId);
		if (prt != null) {
			prt.setAnnuler("oui");
			prt.setValider("oui");
			prt.setModifier("oui");
			prt.setTous("oui");
			profilRoleRepository.save(prt);
		}

		return "";
	}

	@RequestMapping(value = "/deleteProfilInfo", method = RequestMethod.POST)

	public @ResponseBody String deleteProfilInfo(@RequestParam int profilId, @RequestParam String action,
			@RequestParam int roleId) {
		ProfilRole prt = profilRoleRepository.getAllProfilRole(roleId, profilId);
		if (prt != null) {
			prt.setAnnuler("non");
			prt.setValider("non");
			prt.setModifier("non");
			prt.setTous("non");
			profilRoleRepository.save(prt);
		}

		return "";
	}

	@RequestMapping(value = "/addAction", method = RequestMethod.POST)

	public @ResponseBody String addAction(@RequestParam int profilId, @RequestParam String action,
			@RequestParam int roleId) {
		ProfilRole prt = profilRoleRepository.getAllProfilRole(roleId, profilId);
		if (prt != null) {
			if (action.equals("annuler")) {
				prt.setAnnuler("oui");
			}
			if (action.equals("valider")) {
				prt.setValider("oui");
			}
			if (action.equals("modifier")) {
				prt.setModifier("oui");


			}

			profilRoleRepository.save(prt);
		}

		return "";
	}

	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)

	public @ResponseBody String deleteAction(@RequestParam int profilId, @RequestParam String action,
			@RequestParam int roleId) {
		ProfilRole prt = profilRoleRepository.getAllProfilRole(roleId, profilId);
		if (prt != null) {
			if (action.equals("annuler")) {
				prt.setAnnuler("non");
			}
			if (action.equals("valider")) {
				prt.setValider("non");
			}
			if (action.equals("modifier")) {
				prt.setModifier("non");
			}

			profilRoleRepository.save(prt);
		}

		return "";
	}

//	add doc pv+liste presence

	@RequestMapping(value = "/api/addDoc/{id}/{check}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void addDoc(@PathVariable int id,@PathVariable int check, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		web.addDocInfo(fileToUpload, id,check);
	}

	@RequestMapping(value = "/api/addDocRegion/{id}/{idRegion}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void addDocRegion(@PathVariable int id,@PathVariable int idRegion, @RequestParam MultipartFile[] fileToUpload)
			throws JsonParseException, JsonMappingException, IOException, MessagingException {
		web.addDocInfoRegion(fileToUpload, id,idRegion);
	}

	@RequestMapping(value = "/api/changerStatut/{iddemande}/{type}", method = RequestMethod.POST)
	public  String changerStatut(@PathVariable int iddemande,@RequestParam int etat,@RequestParam String cause, @PathVariable String type) throws UnknownHostException, JsonProcessingException {
		DemandeInformation dr=dmRep.getOne(iddemande);
		dr.setCommentaire(cause);
		dr.setStatut(stRep.getOne(etat));
		if(!dr.getType().equals("NT"))
			dr.setDateValidation(new Date());



		Compte cpt = web.getCompteConnected();
		if(dr.getCompteAffecte()==null || cpt.getCompteId()!=dr.getCompteAffecte().getCompteId()) {
				List<Affectation> aff = affectationRepository.SiExiste(iddemande);
				for (Affectation c : aff) {
					c.setEtat("non");
				}
				Affectation af = new Affectation();
				af.setDateAffectation(new Date());
				af.setEtat("oui");
				af.setCompte(cpt);
				af.setDemandeInformation(dr);
				affectationRepository.save(af);
		}

		dmRep.save(dr);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dr.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(dr.getStatut().getId_statut_projet()==5){
			webs.addAuditAutorisation("En attente de signature", dr.getNum_demande(), dr.getType(), dr.getStatut(), dr.getCompte());
		}
		else if(dr.getStatut().getId_statut_projet()==10){
			webs.addAuditAutorisation("Document à amélioré", dr.getNum_demande(), dr.getType(), dr.getStatut(), dr.getCompte());
		}
		else{
			webs.addAuditAutorisation("Vérification des documents définitifs", dr.getNum_demande(), dr.getType(), dr.getStatut(), dr.getCompte());
		}

		return "redirect:/api/getEie/"+type+"/0/6/0";
	}


	@RequestMapping(value = "/api/addSecteur", method = RequestMethod.POST)
	public   ModelAndView changerStatut(@RequestBody Secteur secteur) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (secteur.getId_secteur()!= 0) {
			int idd = secteur.getId_secteur();

			old = secteurRepository.getOne(idd);

			action = "modifier";
		}
		webs.addAudit("", action, "",secteur.getId_secteur()+ "", old, secteur, "Secteur");
		secteurRep.save(secteur);
		model.put("listF", secteurRepository.getAllSecteur());

		return new ModelAndView("param/secteur", model);

	}

	@RequestMapping(value = "/api/addPoste", method = RequestMethod.POST)
	public   ModelAndView addPoste(@RequestBody Poste poste) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (poste.getId_Poste()!= 0) {
			int idd = poste.getId_Poste();

			old = posteRepository.getOne(idd);

			action = "modifier";
		}
		webs.addAudit("", action, "",poste.getId_Poste()+ "", old, poste, "Poste");
		posteRepository.save(poste);
		model.put("listF", posteRepository.getAllPoste());

		return new ModelAndView("param/Poste", model);

	}


	@RequestMapping(value = "/api/updateSecteur/{id}", method = RequestMethod.GET)
	public   ModelAndView updateSecteur(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("secteur", secteurRep.getOne(id));

		return new ModelAndView("param/secteur", model);

	}

	@RequestMapping(value = "/api/updatePoste/{id}", method = RequestMethod.GET)
	public ModelAndView updatePoste(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("poste", posteRepository.getOne(id));

		return new ModelAndView("param/Poste", model);

	}

//	 add categorie


	@RequestMapping(value = "/api/addCategorie", method = RequestMethod.POST)
	public   ModelAndView addCategorie(@RequestBody Categorie cat) {
		Map<String, Object> model = new HashMap<String, Object>();
//		secteurRep.save(cat);
		model.put("listF", secteurRepository.getAllSecteur());

		return new ModelAndView("param/categorie", model);

	}

	@RequestMapping(value = "/api/updateCategorie/{id}", method = RequestMethod.GET)
	public   ModelAndView updateCategorie(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("cat", secteurRep.getOne(id));

		return new ModelAndView("param/categorie", model);

	}


	@RequestMapping(value = "/api/deleteSecteur/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deleteSecteur(@PathVariable int id) throws JsonProcessingException {
		Secteur sr=secteurRep.getOne(id);
		Secteur oldsr = sr;
		sr.setDeleteDateTime(new Date());

		secteurRep.save(sr);

		webs.addAudit("", "supprimer", "",sr.getId_secteur() + "", oldsr, sr, "Secteur");

	}

	@RequestMapping(value = "/api/deletePoste/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deletePoste(@PathVariable int id) throws JsonProcessingException {
		Poste sr=posteRepository.getOne(id);
		Poste oldsr = sr;
		sr.setDeleteDateTime(new Date());

		posteRepository.save(sr);

		webs.addAudit("", "supprimer", "",sr.getId_Poste() + "", oldsr, sr, "Poste");

	}


//	add commune

	@RequestMapping(value = "/api/addCommune", method = RequestMethod.POST)
	public ModelAndView changerStatut(@RequestBody Commune Commune) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (Commune.getId_commune()!= 0) {
			int idd = Commune.getId_commune();
			old =communeRep.getOne(idd);
			action = "modifier";
		}
		webs.addAudit("", action, "",Commune.getId_commune() + "", old, Commune, "Commune");
		communeRep.save(Commune);
		model.put("listF", communeRep.getAllPrefecture());
		return new ModelAndView("param/commune", model);
	}

	@RequestMapping(value = "/api/updateCommune/{id}", method = RequestMethod.GET)
	public   ModelAndView updateCommune(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("Commune", communeRep.getOne(id));
		return new ModelAndView("param/commune", model);
	}

	@RequestMapping(value = "/api/deleteCommune/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deleteCommune(@PathVariable int id) throws JsonProcessingException {
		Commune sr=communeRep.getOne(id);
		Commune oldsr = sr;
		sr.setDeleteDateTime(new Date());
		communeRep.save(sr);
		webs.addAudit("", "supprimer", "",sr.getId_commune() + "", oldsr, sr, "Commune");
	}

	@RequestMapping(value = "/api/getCommuneSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListeCommuneSearch(@PathVariable("type") String type) {


		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",communeRep.getCommuneBy(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/communetr", model);
	}


	//	add installation autorisée

	@RequestMapping(value = "/api/addInstallation", method = RequestMethod.POST)
	public ModelAndView changerStatutInstallation(@RequestBody InstallationAutorise installationAutorise) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (installationAutorise.getId_installation_autorise()!= 0) {
			int idd = installationAutorise.getId_installation_autorise();
			old =installationAutoriseRepository.getOne(idd);
			action = "modifier";
		}
		webs.addAudit("", action, "",installationAutorise.getId_installation_autorise() + "", old, installationAutorise, "installationAutorise");
		installationAutoriseRepository.save(installationAutorise);
		return new ModelAndView("param/installationAutorise", model);
	}

	@RequestMapping(value = "/api/updateInstallation/{id}", method = RequestMethod.GET)
	public ModelAndView updateInstallation(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("installationAutorise", installationAutoriseRepository.getOne(id));
		return new ModelAndView("param/installationAutorise", model);
	}

	@RequestMapping(value = "/api/deleteInstallation/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deleteInstallation(@PathVariable int id) throws JsonProcessingException {
		InstallationAutorise sr=installationAutoriseRepository.getOne(id);
		InstallationAutorise oldsr = sr;
		sr.setDeleteDateTime(new Date());
		installationAutoriseRepository.save(sr);
		webs.addAudit("", "supprimer", "",sr.getId_installation_autorise() + "", oldsr, sr, "installationAutorise");
	}

//	add prefecture

	@RequestMapping(value = "/api/addPrefecture/{commune}", method = RequestMethod.POST)
	public   ModelAndView changerStatut(@RequestBody Prefecture prefecture, @PathVariable int[] commune) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;


		List<Commune> communes = new ArrayList<Commune>();
		if(commune[0] == 0){

		}else{
			for(int i=0; i < commune.length; i++){
				communes.add(communeRep.getCommuneById(commune[i]));
			}
		}
		String action = "ajouter";
		if (prefecture.getId_prefecture()!= 0) {
			int idd = prefecture.getId_prefecture();

			old =prefectureRep.getOne(idd);

			action = "modifier";
		}
		webs.addAudit("", action, "",prefecture.getId_prefecture() + "", old, prefecture, "Prefecture");
		prefecture.setCommune(communes);
		prefectureRep.save(prefecture);
		model.put("listF", prefectureRep.getAllPrefecture());
		model.put("commune", communeRep.getAllCommune());
		return new ModelAndView("param/prefecture", model);

	}

	@RequestMapping(value = "/api/updatePrefecture/{id}", method = RequestMethod.GET)
	public   ModelAndView updatePrefecture(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("prefecture", prefectureRep.getOne(id));
		model.put("commune", communeRep.getAllCommune());
		return new ModelAndView("param/prefecture", model);

	}

	@RequestMapping(value = "/api/deletePrefecture/{id}", method = RequestMethod.POST)
	public   @ResponseBody void deletePrefecture(@PathVariable int id) throws JsonProcessingException {
		Prefecture sr=prefectureRep.getOne(id);
		Prefecture oldsr = sr;
		sr.setDeleteDateTime(new Date());
		prefectureRep.save(sr);
		webs.addAudit("", "supprimer", "",sr.getId_prefecture()+ "", oldsr, sr, "Prefecture");

	}

	@RequestMapping(value = "/api/getParam/{typ}", method = RequestMethod.GET)
	public ModelAndView getParamZF(@PathVariable String typ) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", docImportRepository.getAllDocImportByTypeAutor(typ));
		model.put("color", typ);
		model.put("classfication", classificationRepository.getAllClassification());
		return new ModelAndView("param/doc", model);
	}
	@RequestMapping(value = "/api/getParamm/{profil}", method = RequestMethod.GET)
	public ModelAndView getParamProfil(@PathVariable String profil) {
		Map<String, Object> model = new HashMap<String, Object>();
		if(profil.equals("list")){
			model.put("listF",compteRepository.getAllCompte());
		}
		else {
			model.put("listF", compteRepository.getAllCompteByProfil(profil));
			model.put("color", profil);
		}
		return new ModelAndView("compte2/listeCompte", model);
	}

	@RequestMapping(value = "/api/getParame/{typ}", method = RequestMethod.GET)
	public ModelAndView getParame(@PathVariable String typ) {
		Map<String, Object> model = new HashMap<String, Object>();
		if (typ.equals("list")) {
			model.put("listF", statutProjetRepository.findAll());
			return new ModelAndView("param/statutProjet", model);
		} else {
			model.put("listF", statutProjetRepository.getAllStatutByType(typ));
			model.put("color", typ);
			return new ModelAndView("param/statutProjet", model);
		}
	}

	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView getPageError() {
		Map<String, Object> model = new HashMap<String, Object>();
			return new ModelAndView("error", model);
	}
	//***** affecter*****//
	/*@RequestMapping(value = "/api/affectNotif", method = RequestMethod.POST)
	public   @ResponseBody void affectNotif(@RequestParam int notif,@RequestParam int cpt,@RequestParam String type) throws JsonProcessingException {
		CompteAffecte sr=new CompteAffecte();

		sr.setDate_Affecte(new Date());
		if(cptAffecteRepository.siExiste(notif)==null) {
			type="A";
		}
		else {
			type="R";
		}
		sr.setType_A(type);
		sr.setCompte(compteRepository.getOne(cpt));
		sr.setNotification(notifRepository.getOne(notif));
		cptAffecteRepository.save(sr);


	}*/

	@RequestMapping(value = "/api/affectNotif", method = RequestMethod.POST)
	public   @ResponseBody void affectNotif(@RequestParam int id,@RequestParam int cpt,@RequestParam String type) throws JsonProcessingException {

			List<Affectation> a = affectationRepository.SiExiste(id);
			for(Affectation c : a){
					c.setEtat("non");
			}

		Affectation af =new Affectation();

		af.setDateAffectation(new Date());
		af.setEtat("oui");
		af.setCompte(compteRepository.getOne(cpt));
		if(type.equals("ZF") || type.equals("ET") || type.equals("XD")  || type.equals("TR") ){
			af.setNotification(notifRepository.getOne(id));
			Notification nt = notifRepository.getOne(id);
			nt.setCompteAffecte(compteRepository.getOne(cpt));
			notifRepository.save(nt);

		}
		else if(type.equals("CT")) {
			af.setCollecte(collecteRepository.getOne(id));
			CollecteTransporteur nt = collecteRepository.getOne(id);
			nt.setCompteAffecte(compteRepository.getOne(cpt));
			collecteRepository.save(nt);

		}
		else if(type.equals("IT")){
			af.setInstallation(installationDechetRepository.getOne(id));
			Installation nt = installationDechetRepository.getOne(id);
			nt.setCompteAffecte(compteRepository.getOne(cpt));
			installationDechetRepository.save(nt);

		}
		else{
			af.setDemandeInformation(demandeInformationRepository.getOne(id));
			DemandeInformation nt = demandeInformationRepository.getOne(id);
			nt.setCompteAffecte(compteRepository.getOne(cpt));
			demandeInformationRepository.save(nt);
		}
		affectationRepository.save(af);

	}

	@RequestMapping(value = "/api/getStatutBytype/{type}", method = RequestMethod.POST)
	public ModelAndView getStatutBytype(@PathVariable("type") String type) {

		Map<String,Object> model = new HashMap<String,Object>();
		List<StatutProjet> statuts;
//		List<Prefecture> prefecture = webt.getAllPrefectureByRegion(id);
		if(type.equals("IT")){
			 statuts=statutProjetRepository.getAllStatutByType2("IT");
		}
		if(type.equals("CT")){
			 statuts=statutProjetRepository.getAllStatutByType2("CT");
		}
		else {
			 statuts=statutProjetRepository.getAllStatutByType2("ZF");
		}

		model.put("statuts",statuts);
		return new ModelAndView("ayoub/select",model);
	}

	@RequestMapping(value = "/api/getTransporteurByClassification/{id_dang}", method = RequestMethod.POST)
	public ModelAndView getTransporteurByClassification(@PathVariable int id_dang) {

		Map<String, Object> model = new HashMap<String, Object>();
		if (id_dang == 1){
			List<TransporteurParam> transporteurParams = transporteurParamRepository.getAllTransporteurParamByClassification(id_dang);
			model.put("transporteurParams",transporteurParams);
		}else if (id_dang == 2){
			List<TransporteurEtranger> transporteurEtrangers = transporteurParamRepository.getAllTransporteurEtrangerByClassification(id_dang);
			model.put("transporteurEtrangers",transporteurEtrangers);
		}
		List<ZonneFranche> zonneFranches = transporteurParamRepository.getAllZonneFrancheByClassification(id_dang);
		model.put("zonneFranche", zonneFranches);
		model.put("classification",id_dang);

		return new ModelAndView("ayoub/select2",model);
	}

	@RequestMapping(value = "/api/collectePV_comission/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void collectePV_comission(@PathVariable int id,@RequestParam MultipartFile[] fileToUpload_pv) {
		CollecteTransporteur c = collecteRepository.getbyid(id);
		if(fileToUpload_pv.length>0){
			String fileName = fileStorageService.storeFile(fileToUpload_pv[0]);
			String cc = "/assets/myFile/" + fileName;
			c.setUrl_pv_commission(cc);
		}
		collecteRepository.save(c);

	}

	@RequestMapping(value = "/api/HistoriqueAffectation/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView HistoriqueAffectation(@PathVariable int id,@PathVariable String type) {

		Map<String,Object> model = new HashMap<String,Object>();

		List<Affectation> affectationList = affectationRepository.SiExiste(id);
		if(affectationList!=null && affectationList.size()>0){
			Affectation lastAffecte = affectationList.get(affectationList.size()-1);
			model.put("lastAffecte",lastAffecte);
		}
		model.put("affectationList",affectationList);
		model.put("type",type);

		return new ModelAndView("droitAcces/HistoriqueAffectation",model);
	}



}
