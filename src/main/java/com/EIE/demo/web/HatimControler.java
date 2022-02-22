package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.supercsv.cellprocessor.ParseInt;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.ZoneId;
import java.util.*;

@Controller

public class HatimControler {

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EieDreRepository eieDreRepository;
	@Autowired
	public JavaMailSender emailSender;
	@Value("${urls}")
	private String urls;
	@Value("${fromusermail}")
	private String fromusermail;
	@Value("${fromuser}")
	private String fromuser;
	@Value("${supportmail}")
	private String supportmail;
	@Value("${support}")
	private String support;

	@Autowired
	private PrRoleRepository profilRoleRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private CategorieRepository categorieRepository;
	@Autowired
	private PrefectureRepository prefectureRepository;
	@Autowired
	private DeclarationTransporteurRepository declarationTransporteurRepository;
	@Autowired
	private CommuneRepository communeRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private ProfilRepository profilRepository;
	@Autowired
	private EquipentSecuriteRepository equipentSecuriteRepository;
	@Autowired
	private AutorisationParamRepository autRepository;
	@Autowired
	private CollecteRepository collecteRepository;
	@Autowired
	private DemandeInformationRepository demadeInfoRepository;
	@Autowired
	private ComiteRepository comiteRepository;
	@Autowired
	private StatutProjetRepository statutProjRep;
	@Autowired
	private VehiculeRepository vehiculeRepository;
	@Autowired
	private QuestionRepository questionsRep;
	@Autowired
	private ReponseRepository repRep;
	@Autowired
	private EvaluationParamRepository evaluationParamRepository;
	@Autowired
	private ContactMessageRepository contactMessageRepository;
	@Autowired
	private Visites_AERepository visites_aeRepository;
	@Autowired
	private ListDocNotifRepository listDocNotifRepository;
	@Autowired
	private NotificationRepository notificationRepository;
	@Autowired
	private InstallationRepository installationRepository;
	@Autowired
	private ReunionRepository reunionRepository;
	@Autowired
	private SecurityService secure;
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	WebService web;

	@Autowired
	private SecurityService webs;

	@Autowired
	private AuditAutorisationRepository auditAutorisationRepository;

	@Autowired
	TransporteurParamRepository transporteurParamRepository;
	@Autowired
	MoyenTransportRepository moyenTransportRepository;
	@Autowired
	DocumentsAERepository documentsAERepository;
	@Autowired
	ClassificationRepository classificationRepository;
	@Autowired
	LieuEliminationRepository lieuEliminationRepository;

	@Autowired
	DocImportRepository docImportRepository;

	@Autowired
	AffectationRepository affectationRepository;

	ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	private PasswordEncoder passwordEncoder;


	@Autowired
	SousCategorieRepository sousCategorieRepository;
	@Autowired
	InstallationAutoriseRepository installationAutoriseRepository;


	@RequestMapping(value = "/api/listRensignement/{statut}/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView stockage_affich(@PathVariable int page,@PathVariable int size,@PathVariable int statut) {
		Compte ct = web.getCompteConnected();

		Map<String, Object> model = new HashMap<String, Object>();

		Page<DemandeInformation> h = demadeInfoRepository.getdemandeByEat(new PageRequest(page, size), statut);

		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();

			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("eie/listRensignement", model);
	}

	@RequestMapping(value = "/api/listMessage/{statut}", method = RequestMethod.GET)
	public ModelAndView getMessages(@PathVariable String statut) {
		Map<String, Object> model = new HashMap<>();
		if (statut.equals("1")) {
			model.put("contact", contactMessageRepository.getAllMessageReponse1());
		} else if (statut.equals("2")) {
			model.put("contact", contactMessageRepository.getAllMessageReponse2());
		}

		return new ModelAndView("eie/listMessage", model);
	}

	@RequestMapping(value = "/contact/{id}", method = RequestMethod.GET)
	public ModelAndView getContactById(@PathVariable int id) throws Exception {
		Map<String, Object> model = new HashMap<>();

		if (id != 0) {
			model.put("message", contactMessageRepository.getMessageById(id));
		} else {
			model.put("message", "");
		}

		model.put("disabled", id == 0 ? "" : "disabled");
		return new ModelAndView("eie/detailMessage", model);
	}

	@RequestMapping(value = "/api/addReponse/{id}", method = RequestMethod.POST)
	public String addReponse(@PathVariable int id, @RequestParam String reponse)
			throws MessagingException, UnsupportedEncodingException {
		Map<String, Object> model = new HashMap<>();
		ContactMessage contact = contactMessageRepository.getOne(id);
		contact.setReponse(reponse);
		contactMessageRepository.save(contact);

		/* envoi de mail */
		// ------------- Send email -----------------------------------

		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;
		messageEmail.setTo(InternetAddress.parse(contact.getEmail()));
		to_send = true;

		messageEmail.setSubject(contact.getSujet());
		messageEmail.setText(contact.getReponse(), true);
		messageEmail.setFrom(fromusermail, fromuser);

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}

		return "redirect:/api/listMessage/1";
	}

	@RequestMapping(value = "/api/addCNEE/{id}/{msg}/{niveau}", method = RequestMethod.GET)
	public  ModelAndView addCNEE(@PathVariable int id, @PathVariable String msg, @PathVariable String niveau) throws UnknownHostException, JsonProcessingException {
		Compte ct = web.getCompteConnected();
		DemandeInformation d = demadeInfoRepository.getOne(id);
		d.setCommentaire_avis(msg);
		d.setNiveauExamen(niveau);
		demadeInfoRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		webs.addAuditAutorisation("Examiner par CNEE", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		Map<String, Object> model = new HashMap<String, Object>();

		Page<DemandeInformation> h = demadeInfoRepository.getdemandeByEat(new PageRequest(0, 100), 11);

		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();

			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("eie/listRensignement", model);
	}

	@RequestMapping(value = "/api/AvisProjRensignement/{idd}/{msg}", method = RequestMethod.GET)
	public ModelAndView AvisProjRensignement(@PathVariable int idd, @PathVariable String msg) throws UnknownHostException, JsonProcessingException {
		Compte ct = web.getCompteConnected();
		DemandeInformation d = demadeInfoRepository.getOne(idd);
		StatutProjet s = statutProjRep.getOne(13);
		d.setStatut(s);
		d.setCommentaire_avis(msg);
		demadeInfoRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		webs.addAuditAutorisation("Non Conforme", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());


		Map<String, Object> model = new HashMap<String, Object>();

		Page<DemandeInformation> h = demadeInfoRepository.getdemandeByEat(new PageRequest(0, 100), 11);

		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();

			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());
		} else {
			model.put("totalPage", 0);
		}
		model.put("user", ct);
		return new ModelAndView("eie/listRensignement", model);
	}

	@RequestMapping(value = "/api/deleteEieDre/{id}", method = RequestMethod.GET)
	public ModelAndView deleteEieDre(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		EieDre d = eieDreRepository.getOne(id);
		d.setDeleteDateTime(new Date());
		eieDreRepository.save(d);
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
		model.put("user", ct);
		return new ModelAndView("eie/listDre", model);
	}

	@RequestMapping(value = "/api/updateEieDre/{id}", method = RequestMethod.GET)
	public ModelAndView updateEieDre(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		model.put("user", ct);
		model.put("eie", eieDreRepository.getOne(id));
		model.put("regions", regionRepository.getAllRegion());
		model.put("provinces", prefectureRepository.getAllPrefecture());
		model.put("communes", communeRepository.getAllPrefecture());
		return new ModelAndView("eie/addDre", model);
	}

//	ajout de questions dans lespace dashboard
	@RequestMapping(value = "/api/savequestion", method = RequestMethod.POST)
	public String saveQuestion(@RequestParam String idq, @RequestParam String type,@RequestParam String quest_ar, @RequestParam String eva,
			@RequestParam String aut, @RequestParam String question, @RequestParam String reponse,@RequestParam int nbr) {
		Compte ct = web.getCompteConnected();
		Reponse rp = new Reponse();
		Questions qt = new Questions();
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		String moi_j = month < 10 ? "0" + month : month + "";
		int heirs = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);

		rp.setDate_pub(day + "-" + moi_j + "-" + year);
		rp.setHeur_pub(heirs + " : " + min);

		if (!idq.equals("")) {
			qt = questionsRep.getQuestionById(Integer.parseInt(idq));
		}

		if (!aut.equals("")) {
			Integer a = Integer.parseInt(aut);
			AutorisationParam pt = autRepository.getOne(a);
			qt.setAutorisation(pt);
			qt.setEveluation(null);
		}
		if (!eva.equals("")) {
			Integer e = Integer.parseInt(eva);
			EvaluationParam even = evaluationParamRepository.getOne(e);
			qt.setEveluation(even);
			qt.setAutorisation(null);
		}

		rp.setCompte(ct);
		rp.setDescription(reponse);
		repRep.save(rp);
		List<Reponse> rt = new ArrayList<Reponse>();
		rt.add(rp);
		qt.setDescription_ar(quest_ar);
		qt.setType(type);
		qt.setCompte(ct);
		qt.setDescription(question);
		qt.setReponses(rt);
		qt.setNbr(nbr);
		questionsRep.save(qt);

		return "redirect:/api/listQuestions";

	}

	@RequestMapping(value = "/api/listQuestions", method = RequestMethod.GET)
	public ModelAndView listQuestions() {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		model.put("user", ct);
		List<Questions> q = questionsRep.getAllQuestionByNumero(new PageRequest(0, 100)).getContent();
		model.put("question", q);
		return new ModelAndView("question/question", model);
	}

	@RequestMapping(value = "/api/addquestion", method = RequestMethod.GET)
	public ModelAndView addquestion() {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		model.put("user", ct);
		List<EvaluationParam> eva = evaluationParamRepository.getAllCategorie();
		List<AutorisationParam> aut = autRepository.getAllCategorie();
		model.put("eval", eva);
		model.put("autoris", aut);

		return new ModelAndView("question/ajouterQuestion", model);

	}

	@RequestMapping(value = "/api/deleteQuestion/{id}", method = RequestMethod.GET)
	public ModelAndView deleteQuestion(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		Questions q = questionsRep.getQuestionById(id);
		q.setDeleteDateTime(new Date());
		questionsRep.save(q);
		model.put("user", ct);
		List<Questions> question = questionsRep.getAllQuestion(new PageRequest(0, 100)).getContent();
		model.put("question", question);
		return new ModelAndView("question/question", model);
	}

	@RequestMapping(value = "/api/updateQuestion/{id}", method = RequestMethod.GET)
	public ModelAndView updateQuestion(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();
		model.put("user", ct);
		Questions question = questionsRep.getQuestionById(id);
		model.put("question", question);
		List<EvaluationParam> eva = evaluationParamRepository.getAllCategorie();
		List<AutorisationParam> aut = autRepository.getAllCategorie();
		model.put("eval", eva);
		model.put("autoris", aut);
		return new ModelAndView("question/ajouterQuestion", model);
	}

	@GetMapping("/generate_word_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_vord_collecte(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=collecte-transport.docx");
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		ByteArrayInputStream bis = MonDocument.generateInvitationWord(ct);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/generate_pdf_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_pdf_collecte(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=Récépissé.pdf");
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		ByteArrayInputStream bis = GeneratePDFDocuments.generateDocumentDeCollecte(ct);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/acceuilStat/{type}")
	public ModelAndView acceuilStat(@PathVariable String type) throws Exception {

		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		return new ModelAndView("loginStatistique/statistique",model);
	}
	@RequestMapping(value = "/api/statistique/acceuilStatByDate",method = RequestMethod.GET)
	   public @ResponseBody Object[] acceuilStat(@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("type_date") String type_date,@RequestParam(value="type[]") String[] type) throws Exception {

	   java.sql.Date d1 = java.sql.Date.valueOf(date1);
	   java.sql.Date d2 = java.sql.Date.valueOf(date2);

	   Object[] res = null;
	   List<String> list = Arrays.asList(type);
	   List<Object> addList = new ArrayList<Object>();


	   if(list.contains("CT")){
	   if(type_date.equals("date_depot")) {
	   addList.add(collecteRepository.getStatByDateDepot(d1,d2)) ;
	   }
	   else {
	   addList.add(collecteRepository.getStatByDateValidation(d1,d2)) ;
	   }
	   }

	   if(list.contains("IT")) {
	   if (type_date.equals("date_depot")) {
	   addList.add(installationRepository.getStatByDateDepot(d1, d2));
	   }
	   else {
	   addList.add(installationRepository.getStatByDateValidation(d1, d2));
	   }
	   }

	   if(list.contains("ZF") ||list.contains("XD")  || list.contains("ET") ||list.contains("TR")) {
	   if (type_date.equals("date_depot")) {
		   addList.addAll(Arrays.asList(notificationRepository.getStatByDateDepot(d1, d2,list)));


	   } else if (type_date.equals("date_validation")) {
		   addList.addAll(Arrays.asList(notificationRepository.getStatByDateValidation(d1, d2,list)));
	   }
	//
	   }
	   res=addList.toArray();

	   return res;

	   }

	@RequestMapping(value = "/api/acceuilStatReunion",method = RequestMethod.GET)
	public @ResponseBody Object[] acceuilStatReunion(@RequestParam(value="annee[]") Integer[] annee) throws Exception {

		Object[] res = null;
		List<Integer> list = Arrays.asList(annee);
		List<Object> addList = new ArrayList<Object>();

		addList.addAll(Arrays.asList(reunionRepository.nombreReunion(list)));
		res=addList.toArray();
		return res;
	}

	@GetMapping("/api/down_sign_doc/{id}")
	public ModelAndView down_sign_doc(@PathVariable int id){
		Map<String,Object> model = new HashMap<String,Object>();
		DemandeInformation dm = demadeInfoRepository.getById(id);
		model.put("dmd",dm);
		model.put("user",web.getCompteConnected());
		return new ModelAndView("eie/down_sign_doc",model);
	}

	@GetMapping("/api/down_sign_doc_AE/{id}")
	public ModelAndView down_sign_doc_AE(@PathVariable int id){
		Map<String,Object> model = new HashMap<String,Object>();
		DemandeInformation dm = demadeInfoRepository.getById(id);
		model.put("dmd",dm);
		model.put("user",web.getCompteConnected());
		return new ModelAndView("eie/down_sign_docAE",model);
	}

	@RequestMapping(value = "/api/setdemandeDocumentSigner/{id}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void setdemandeDocumentSigner(@PathVariable int id, @RequestParam MultipartFile fileToUpload)
			throws IOException, MessagingException {
		DemandeInformation dm = demadeInfoRepository.getById(id);
		String fileName = fileStorageService.storeFile(fileToUpload);
		String cc = "/assets/myFile/" + fileName;
		dm.setUrl_document_signee(cc);
		dm.setStatut(statutProjRep.getOne(6));
		demadeInfoRepository.save(dm);
	}

	@RequestMapping(value = "/api/setdemandeDocument_decision/{id}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody void setdemandeDocument_decision(@PathVariable int id, @RequestParam MultipartFile fileToUpload)
			throws IOException, MessagingException {
		DemandeInformation dm = demadeInfoRepository.getById(id);
		String fileName = fileStorageService.storeFile(fileToUpload);
		String cc = "/assets/myFile/" + fileName;
		dm.setUrl_decision(cc);
		dm.setStatut(statutProjRep.getOne(6));
		demadeInfoRepository.save(dm);
	}

	@RequestMapping(value = "/api/down_sign_docNotif/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_sign_docNotif(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_sign_docNotif",map);
	}

	@RequestMapping(value = "/api/down_sign_lettreNotif/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_sign_lettreNotif(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_sign_lettreNotif",map);
	}

	@RequestMapping(value = "/api/down_lettre/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_lettre(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_lettre",map);
	}

	@RequestMapping(value = "/api/down_lettre_attachement/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_lettre_attachement(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_lettre_attachement",map);
	}

	@RequestMapping(value = "/api/down_lettre_conforme/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_lettre_conforme(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_lettre_conforme",map);
	}

	@RequestMapping(value = "/api/down_lettre_nonconforme/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_lettre_nonconforme(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_lettre_nonconforme",map);
	}

	@RequestMapping(value = "/api/down_dmd_lettre/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView down_dmd_lettre(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("notification",n);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/down_dmd_lettre",map);
	}

	@RequestMapping(value = "/api/certificatElimination/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView CertificatElimination(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		int total=0;
		for(DetailDocumentMouvement d : n.getDocMouvement()){
			total +=Integer.parseInt(d.getQuantite());
		}
		int ecarte = 0;
		ecarte=Integer.parseInt(n.getQuantite())-total;
		map.put("notification",n);
		map.put("type",type);
		map.put("total",total);
		map.put("ecarte",ecarte);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/certificat_elimination",map);
	}

	@RequestMapping(value = "/api/documentdemouvement/{type}/{id}", method = RequestMethod.GET)
	public ModelAndView documentdemouvement(@PathVariable int id,@PathVariable String type){
		Notification n = notificationRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("notification",n);
		map.put("type",type);
		map.put("user",web.getCompteConnected());
		return new ModelAndView("autorisation/documentmouvement",map);
	}

	@RequestMapping(value = "/api/down_sign_docCollecte/{id}", method = RequestMethod.GET)
	public ModelAndView down_sign_docNotif(@PathVariable int id){
		CollecteTransporteur c = collecteRepository.getbyid(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user",web.getCompteConnected());
		map.put("collecte",c);
		return new ModelAndView("collecte/down_sign_docCollecte",map);
	}

	@RequestMapping(value = "/api/down_sign_docInstall/{id}", method = RequestMethod.GET)
	public ModelAndView down_sign_docInstall(@PathVariable int id){
		Installation ins = installationRepository.getOne(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user",web.getCompteConnected());
		map.put("installlation",ins);
		return new ModelAndView("installation/down_sign_docInstall",map);
	}

	@RequestMapping(value = "/api/setAutorisationLettreAttachement/{id}/{type}", method = RequestMethod.POST)
	public String setAutorisationLettreAttachement(@PathVariable int id,@PathVariable String type,@RequestParam int etat,
										@RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
										@RequestParam(value = "date1", defaultValue = "", required = false) String date1,
										@RequestParam(value = "comment", defaultValue = "", required = false) String comment) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("XD")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setDateValidation(date11);
			n.setUrl_lettre(cc);
			n.setStatut(statutProjRep.getOne(etat));
			int s = n.getStatut().getId_statut_projet();
			if (s == 85) {

			}
			else if (s == 86) {
				n.setCommentaire(comment);
			}
			notificationRepository.save(n);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =n.getImportateur().getMail();
			if(mail!=null){
				messageEmail.setTo(n.getImportateur().getMail());
			}else{
			}
			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+n.getNum_notification());
			String type1="";
			if(n.getZf_et().equals("ZF")){
				type1="Importation des déchets d'une zone franche";
			}else if(n.getZf_et().equals("ET")){
				type1="Importation des déchets non dangereux d'un pays etranger";
			}else if(n.getZf_et().equals("XD")){
				type1="Exportation des déchets dangereux";
			}else if(n.getZf_et().equals("TR")){
				type1="Transit des déchets";
			}
			messageEmail.setText("<h3>"+type1+"</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+n.getNum_notification()+"</b> (information ci-après): " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+n.getNum_notification()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+n.getClassification().getNom_fr()+"</div>\n"+
					"<div><b>Code: </b>"+n.getCode().getNom_fr()+"</div>\n"+
					"<div><b>Type de déchet: </b>"+n.getCode().getNom_ar()+"</div>\n" +
					"<div><b>Date de dépôt: </b>"+dateFormat.format(n.getDateDepot())+"</div>"+
					"<div><b>Statut: "+n.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}


			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());


		}
		return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
	}

	@RequestMapping(value = "/api/setAutorisationLettreConforme/{id}/{type}", method = RequestMethod.POST)
	public String setAutorisationLettreConforme(@PathVariable int id,@PathVariable String type,
							   @RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
							   @RequestParam(value = "date1", defaultValue = "", required = false) String date1) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("XD")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setDateValidation(date11);
			StatutProjet st = statutProjRep.getById(84);
			n.setStatut(st);
			n.setUrl_lettre_conforme(cc);
			notificationRepository.save(n);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =n.getImportateur().getMail();
			if(mail!=null){
				messageEmail.setTo(n.getImportateur().getMail());
			}else{
			}
			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+n.getNum_notification());
			String type1="";
			if(n.getZf_et().equals("ZF")){
				type1="Importation des déchets d'une zone franche";
			}else if(n.getZf_et().equals("ET")){
				type1="Importation des déchets non dangereux d'un pays etranger";
			}else if(n.getZf_et().equals("XD")){
				type1="Exportation des déchets dangereux";
			}else if(n.getZf_et().equals("TR")){
				type1="Transit des déchets";
			}
			messageEmail.setText("<h3>"+type1+"</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+n.getNum_notification()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+n.getNum_notification()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+n.getClassification().getNom_fr()+"</div>\n"+
					"<div><b>Code: </b>"+n.getCode().getNom_fr()+"</div>\n"+
					"<div><b>Type de déchet: </b>"+n.getCode().getNom_ar()+"</div>\n" +
					"<div><b>Date de dépôt: </b>"+dateFormat.format(n.getDateDepot())+"</div>"+
					"<div><b>Statut: "+n.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}


			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());


		}
		return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
	}

	@RequestMapping(value = "/api/setAutorisationLettreNonConforme/{id}/{type}", method = RequestMethod.POST)
	public String setAutorisationLettreNonConforme(@PathVariable int id,@PathVariable String type,
												@RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
												@RequestParam(value = "date1", defaultValue = "", required = false) String date1) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("XD")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setDateValidation(date11);
			StatutProjet st = statutProjRep.getById(86);
			n.setStatut(st);
			n.setUrl_lettre_nonconforme(cc);
			notificationRepository.save(n);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =n.getImportateur().getMail();
			if(mail!=null){
				messageEmail.setTo(InternetAddress.parse(n.getImportateur().getMail()));
			}else{
			}
			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+n.getNum_notification());

			messageEmail.setText("<h3>Exportation des déchets dangereux</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+n.getNum_notification()+"</b> (information ci-après): " +
					"<p></p>"+
					"<hr style='width:75%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+n.getNum_notification()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+n.getClassification().getNom_fr()+"</div>\n"+
					"<div><b>Code: </b>"+n.getCode().getNom_fr()+"</div>\n"+
					"<div><b>Type de déchet: </b>"+n.getCode().getNom_ar()+"</div>\n" +
					"<div><b>Date de dépôt: </b>"+dateFormat.format(n.getDateDepot())+"</div>"+
					"<div><b>Statut: "+n.getStatut().getNom_fr()+"</b></div>", true);

			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}


			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());


		}
		return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
	}


	@RequestMapping(value = "/api/setAutorisationLettreDoc/{id}/{type}", method = RequestMethod.POST)
	public String setAutorisationLettreDoc(@PathVariable int id,@PathVariable String type,
												   @RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
												   @RequestParam(value = "date1", defaultValue = "", required = false) String date1) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("TR")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setDateValidation(date11);
			StatutProjet st = statutProjRep.getById(54);
			n.setStatut(st);
			n.setUrl_doc_signer(cc);
			notificationRepository.save(n);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =n.getImportateur().getMail();
			if(mail!=null){
				messageEmail.setTo(InternetAddress.parse(n.getImportateur().getMail()));
			}else{
			}
			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+n.getNum_notification());
			String type1="";
			if(n.getZf_et().equals("ZF")){
				type1="Importation des déchets d'une zone franche";
			}else if(n.getZf_et().equals("ET")){
				type1="Importation des déchets non dangereux d'un pays etranger";
			}else if(n.getZf_et().equals("XD")){
				type1="Exportation des déchets dangereux";
			}else if(n.getZf_et().equals("TR")){
				type1="Transit des déchets";
			}
			messageEmail.setText("<h3>"+type1+"</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+n.getNum_notification()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+n.getNum_notification()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+n.getClassification().getNom_fr()+"</div>\n"+
					"<div><b>Code: </b>"+n.getCode().getNom_fr()+"</div>\n"+
					"<div><b>Type de déchet: </b>"+n.getCode().getNom_ar()+"</div>\n" +
					"<div><b>Date de dépôt: </b>"+dateFormat.format(n.getDateDepot())+"</div>"+
					"<div><b>Statut: "+n.getStatut().getNom_fr()+"</b></div>", true);

			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}


			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());


		}
		return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
	}


	@RequestMapping(value = "/api/setCorrespondance/{id}/{type}", method = RequestMethod.GET)
	public @ResponseBody void setCorrespondance(@PathVariable int id,@PathVariable String type,
										   @RequestParam(value = "numerCorrespondance", defaultValue = "", required = false) String numerCorrespondance, @RequestParam(value = "dateCoresspondance", defaultValue = "", required = false) String dateCoresspondance) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = sdf.parse(dateCoresspondance);

		if (type.equals("TR")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateCoresspondance(date11);
			n.setNumerCorrespondance(numerCorrespondance);
			notificationRepository.save(n);
		}
	}


	@RequestMapping(value = "/api/setAutorisationLettre/{id}/{type}", method = RequestMethod.POST)
	public String setAutorisationLettre(@PathVariable int id,@PathVariable String type,
							   @RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
							   @RequestParam(value = "date1", defaultValue = "", required = false) String date1
								) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("XD")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setStatut(statutProjRep.getById(83));
			n.setDateValidation(date11);
			n.setUrl_lettre(cc);

			String passWord = DefaultPasswordGenerator.generate(10);
			n.setPasswordAutorite(passWord);
			notificationRepository.save(n);

			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String[] to = {n.getAutorite().getEmail(), n.getImportateur().getMail()};
			messageEmail.setTo(to);
			to_send = true;

			messageEmail.setSubject("Exportation des déchets Numéro " +n.getNum_notification());
			messageEmail.setText("<card><card-header><h4><u>" +
					"Numéro de notification</u></h4></card-header>\n" +
					"<card-body><b>Numéro de notification: </b>"+ n.getNum_notification()+"\n" +
					"<br><b>Classification des déchets: </b>"+ n.getClassification().getNom_fr()+"\n" +
					"<br><b>Code: </b>"+ n.getCode().getNom_fr()+"\n" +
					"<br><b>Type de déchet: </b>"+ n.getCode().getNom_ar()+"\n" +
					"<br><b>Pays Destinataire: </b>"+ n.getPays().getNom_fr()+"\n" +
					"<br><b>Quantité totale prévue: </b>"+ n.getQuantite()+"\n" +
					"<br><b>Unité: </b>"+ n.getUnite().getNom_fr()+"</card-body></card>\n" +
					"<hr>" +
					"<card><card-header><h4><u>Exportateur - Notifiant</u></h4></card-header>\n" +
					"<card-body><b>Nom de la société: </b>"+ n.getImportateur().getNom_fr()+"\n" +
					"<br><b>Personne à contacter: </b>"+ n.getImportateur().getContact_fr()+"\n" +
					"<br><b>Adresse: </b>"+ n.getImportateur().getAdresse_fr()+"\n" +
					"<br><b>Téléphone: </b>"+ n.getImportateur().getTel()+"\n" +
					"<br><b>Région: </b>"+ n.getRegion().getNom_fr()+"\n" +
					"<br><b>Préfecture: </b>"+ n.getPrefecture().getNom_fr()+"</card-body></card>\n" +
					"<hr>"+
					"<card><card-header><h4><u>Importateur - Destinataire</u></h4></card-header>\n" +
					"<card-body><b>Nom de l'importateur destinataire: </b>"+ n.getNom()+"\n" +
					"<br><b>Télécopie: </b>"+ n.getTelecopie()+"\n" +
					"<br><b>Personne à contacter: </b>"+ n.getPersonne()+"\n" +
					"<br><b>Téléphone: </b>"+ n.getTel()+"\n" +
					"<br><b>courrier électronique: </b>"+ n.getCourrier()+"\n" +
					"<br><b>Adresse: </b>"+ n.getAdresse()+"</card-body></card>\n" +
					"<br><br><br><b>Votre Password: </b>"+ n.getPasswordAutorite()+"\n" +
					"<br><b>Votre Identifiant: </b>"+ n.getAutorite().getEmail()+"</card-body></card>\n" +
					"<br>Pour consulter les documents accompagnant la demande d'avis merci de cliquer  <a href='" + urls + "/PageConnexion'> ICI </a>", true);

			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}


			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());


		}
		return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
	}


	@RequestMapping(value = "/api/setAutorisationDocumentSigner/{id}/{type}", method = RequestMethod.POST)
	public String addEtatFinal(@PathVariable int id,@PathVariable String type,
							   @RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
							   @RequestParam(value = "date1", defaultValue = "", required = false) String date1, @RequestParam(value = "date2", defaultValue = "", required = false) String date2) throws Exception {
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = dateFormat.parse(date1);
		if (type.equals("CT")) {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			java.sql.Date date22 = new java.sql.Date(dateFormat.parse(date2).getTime());
			CollecteTransporteur ct = collecteRepository.getbyid(id);
			ct.setUrl_doc_signer(cc);
			ct.setDatecoll1(date11);
			ct.setDatecoll2(date22);
			ct.setDateValidation(ct.getDatecoll1());
			ct.setStatut(statutProjRep.getOne(56));

			TransporteurParam transporteurParam = new TransporteurParam();
			transporteurParam.setNom(ct.getRaison());
			transporteurParam.setIdentifiant(ct.getIdfiscale());
			transporteurParam.setAdresse(ct.getDemandeurAdresse());
			transporteurParam.setTel(ct.getDemandeurTel());
			transporteurParam.setFax(ct.getDemandeurFax());

			List<Code> codes = new ArrayList<Code>();
			List<Code> c = new ArrayList<Code>();
			codes = ct.getCode();
			for (int i = 0; i < codes.size(); i++) {
				c.add(codes.get(i));
			}
			transporteurParam.setCode(c);

			List<Vehicules> vehicules = new ArrayList<Vehicules>();
			List<MoyenTransport> moyenTransports = new ArrayList<MoyenTransport>();
			vehicules = ct.getVehicules();
			for (Vehicules v : vehicules) {
				MoyenTransport moyenTransport = new MoyenTransport();
				moyenTransport.setNom_ar(v.getNum_mat_enrg_auto() + "-" + v.getNum_mat_enrg_voit() + "-" + v.getNum_mat_id_prefect());
				moyenTransport.setNom_fr(v.getNum_chassis());
				moyenTransportRepository.save(moyenTransport);
				moyenTransports.add(moyenTransport);
			}

			transporteurParam.setMoyenTransport(moyenTransports);
			transporteurParamRepository.save(transporteurParam);
			collecteRepository.save(ct);

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;

			messageEmail.setTo(ct.getDemandeurEmail());
			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+ct.getNum_demande());

			messageEmail.setText("<h3>Collecte/Transport des déchets</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+ct.getNum_demande()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+ct.getNum_demande()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+ct.getRaison()+"</div>\n"+
					"<div><b>Date de dépôt: </b>"+dateFormat.format(ct.getDateDepot())+"</div>"+
					"<div><b>Statut: "+ct.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ct.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			if(ct.getStatut().getId_statut_projet()==56){
				webs.addAuditAutorisation("Document Signé", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());
			}
			else{
				webs.addAuditAutorisation("attente de signature", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());
			}
			return "redirect:/api/getListeCollecte/0/6/0";
		}
		else if(type.equals("IT")){
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			Installation ins = installationRepository.getOne(id);
			ins.setUrl_doc_signer(cc);
			ins.setDateValidation(date11);
			ins.setStatut(statutProjRep.getOne(57));
			int s = ins.getStatut().getId_statut_projet();
			if (s == 57) {
				LieuElimination lieuElimination = new LieuElimination();
				lieuElimination.setNom_fr(ins.getRaison());
				lieuElimination.setNom_ar(ins.getRaison());
				lieuElimination.setClassification(classificationRepository.getOne(1));
				lieuElimination.setDateD(dateFormat.format(ins.getDateValidation()));
				lieuElimination.setTel(ins.getTel());
				lieuEliminationRepository.save(lieuElimination);

				InstallationAutorise installationAutorise = new InstallationAutorise();
				installationAutorise.setRaison(ins.getRaison());
				installationAutorise.setTel(ins.getTel());
				installationAutorise.setFax(ins.getFax());
				installationAutorise.setPrefecture(ins.getPrefecture());
				Date d = ins.getDateValidation();
				Calendar cal = Calendar.getInstance();
				cal.setTime(d);
				cal.add(Calendar.YEAR, 5);
				Date modifiedDate = cal.getTime();
				String date = dateFormat.format(modifiedDate);
				installationAutorise.setDate_delivrance(ins.getDateValidation());
				installationAutorise.setDate_prorogation(ins.getDateValidation());
				installationAutorise.setDate_fin(modifiedDate);



				installationAutoriseRepository.save(installationAutorise);
			}
			installationRepository.save(ins);

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;

			messageEmail.setTo(ins.getEmail());
			to_send = true;
			messageEmail.setSubject("État d'avancement de votre demande numéro "+ins.getNum_demande());

			messageEmail.setText("<h3>Installation de traitement des déchets</h3>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+ins.getNum_demande()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+ins.getNum_demande()+"</div>\n" +
					"<div><b>Raison sociale: </b>"+ins.getRaison()+"</div>\n"+
					"<div><b>Date de dépôt: </b>"+dateFormat.format(ins.getDateDepot())+"</div>"+
					"<div><b>Statut: "+ins.getStatut().getNom_fr()+"</b></div>", true);

			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ins.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des document", ins.getNum_demande(), "IT", ins.getStatut(), web.getCompteConnected());
			return "redirect:/api/getListeInstallation/0/6/0";
		}
		else {
			java.sql.Date date11 = new java.sql.Date(parsed.getTime());
			java.sql.Date date22 = new java.sql.Date(dateFormat.parse(date2).getTime());
			Notification n = notificationRepository.getnotificationByIdType(id, type);
			n.setDateD(date1);
			n.setDateF(date2);
			n.setDateValidation(date11);
			StatutProjet st = statutProjRep.getById(54);
			n.setStatut(st);
			n.setUrl_doc_signer(cc);
			notificationRepository.save(n);

			if(!type.equals("XD")){
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

				MimeMessage mimeMessage = emailSender.createMimeMessage();
				boolean multipart = true;
				MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

				boolean to_send = false;
				String mail =n.getImportateur().getMail();
				if(mail!=null){
					messageEmail.setTo(n.getImportateur().getMail());
				}else{
				}
				to_send = true;

				messageEmail.setSubject("État d'avancement de votre demande numéro "+n.getNum_notification());
				String type1="";
				if(n.getZf_et().equals("ZF")){
					type1="Importation des déchets d'une zone franche";
				}else if(n.getZf_et().equals("ET")){
					type1="Importation des déchets non dangereux d'un pays etranger";
				}else if(n.getZf_et().equals("XD")){
					type1="Exportation des déchets dangereux";
				}else if(n.getZf_et().equals("TR")){
					type1="Transit des déchets";
				}
				messageEmail.setText("<h3>"+type1+"</h3>\n" +
						"Des changements ont été apporté à votre demande numéro <b>"+n.getNum_notification()+"</b> (information ci-après):\n\n " +
						"<p></p>"+
						"<hr style='width:55%; float:left'>"+
						"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+n.getNum_notification()+"</div>\n" +
						"<div><b>Classification des déchets: </b>"+n.getClassification().getNom_fr()+"</div>\n"+
						"<div><b>Code: </b>"+n.getCode().getNom_fr()+"</div>\n"+
						"<div><b>Type de déchet: </b>"+n.getCode().getNom_ar()+"</div>\n" +
						"<div><b>Date de dépôt: </b>"+dateFormat.format(n.getDateDepot())+"</div>"+
						"<div><b>Statut: "+n.getStatut().getNom_fr()+"</b></div>", true);

				messageEmail.setFrom(fromusermail, fromuser);

				if (to_send)
					try {
						emailSender.send(mimeMessage);
					} catch (Exception ex) {
						System.out.println(ex.getMessage());
					}
			}
			if(type.equals("XD")) {
				HttpHeaders headers = new HttpHeaders();
				headers.add("Content-Disposition", "attachment; filename=DocumentTransaction.pdf");

				MimeMessage mimeMessage = emailSender.createMimeMessage();
				boolean multipart = true;
				MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

				boolean to_send = false;

				messageEmail.setTo(InternetAddress.parse(n.getAutorite().getEmail()));
				to_send = true;

				messageEmail.setSubject("Transaction Des déchets Numéro "+n.getNum_notification());
				messageEmail.setText("Pour la consultation des documents merci de cliquer  <a href='" + urls + "/mail_files/" + id + "/" + type + "'> ICI </a>", true);

				messageEmail.setFrom(fromusermail, fromuser);

				if (to_send)
					try {
						emailSender.send(mimeMessage);
					} catch (Exception ex) {
						System.out.println(ex.getMessage());
					}
			}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Signature des documents", n.getNum_notification(), n.getZf_et(), n.getStatut(),web.getCompteConnected());
			return "redirect:/api/getListeAutorisation/" + type + "/0/6/0";
		}
	}

	@RequestMapping(value = "/api/addCategorieToDemande/{id_dmd}/{id_cat}", method = RequestMethod.POST)
	public ModelAndView addCategorieToDemande(@PathVariable int id_dmd,@PathVariable int[] id_cat){
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		List<Categorie> lc = new ArrayList<Categorie>();
		for (int tmp : id_cat) {
			lc.add(categorieRepository.getOne(tmp));
		}
		d.setCategories(lc);
		demadeInfoRepository.save(d);
		List<SousCategorie> sousCategories = sousCategorieRepository.listSousCategorieById(id_cat);
		map.put("souscategorie", sousCategories);
		map.put("demande", d);
		return new ModelAndView("eie/souscategorie", map);
	}

	@RequestMapping(value = "/api/addQarar/{id}", method = RequestMethod.POST)
	public  @ResponseBody String addQarar(@PathVariable int id,@RequestParam String qarar,@RequestParam String tatmim){
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		ct.setQarar(qarar);
		ct.setTatmim(tatmim);
		collecteRepository.save(ct);

		return "ok";
	}


	@RequestMapping(value = "/api/addRapportAEToDemande/{id_dmd}", method = RequestMethod.GET)
	public ModelAndView addRapportAEToDemande(@PathVariable int id_dmd){
		Map<String,Object> map = new HashMap<String,Object>();
		List<ListDocNotif> docNotifs = listDocNotifRepository.ListdocEE(id_dmd);
		map.put("docNotifs",docNotifs);
		map.put("url",urls);
		return new ModelAndView("eie/modal_rapportAE", map);
	}

	@RequestMapping(value = "/api/addSousCategorieToDemande/{id_dmd}/{id_souscat}", method = RequestMethod.POST)
	public void addSousCategorieToDemande(@PathVariable int id_dmd,@PathVariable int[] id_souscat){
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		List<SousCategorie> lc = new ArrayList<SousCategorie>();
		for (int tmp : id_souscat) {
			lc.add(sousCategorieRepository.getOne(tmp));
		}
		d.setSousCategories(lc);
		demadeInfoRepository.save(d);
	}

	@RequestMapping(value = "/api/validationDocumentEIE/{id_dmd}/{type}", method = RequestMethod.GET)
	public ModelAndView validationDocumentEIE(@PathVariable int id_dmd,@PathVariable String type){
		DemandeInformation d = demadeInfoRepository.getDemandeInformationByIdType(id_dmd,type);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("demande",d);
		map.put("type",type);
		if(!type.equals("AE")){
			map.put("doc",listDocNotifRepository.ListdocEIE(id_dmd));
		}
		List<Categorie> categories = categorieRepository.getAllCategorie();
		List<SousCategorie> sousCategories = new ArrayList<SousCategorie>();
		for (Categorie cc : d.getCategories()) {
			for (SousCategorie c :cc.getSousCategories()){
				sousCategories.add(c);
			}
		}

		map.put("souscategories", sousCategories);
		map.put("categories", categories);
		return new ModelAndView("eie/validationDoc",map);
	}

	@RequestMapping(value = "/api/changerStatut1/{id_dmd}/{id_statut}", method = RequestMethod.POST)
	public @ResponseBody String changerStatut(@PathVariable int id_dmd,@PathVariable int id_statut) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);

		d.setStatut(statutProjRep.getOne(id_statut));
		Compte cpt = web.getCompteConnected();

		if(d.getCompteAffecte()==null || cpt.getCompteId()!=d.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(id_dmd);
			for (Affectation c : aff) {
				c.setEtat("non");
			}

			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setDemandeInformation(d);
			affectationRepository.save(af);
			d.setCompteAffecte(cpt);
		}

		if(id_statut==59){

			MimeMessage mimeMessage = emailSender.createMimeMessage();

			boolean multipart = true;

			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;

			messageEmail.setTo(InternetAddress.parse(d.getEmail()));
			to_send = true;
			messageEmail.setSubject("Document Incomplet");
			messageEmail.setText("<p>La demande numéro "+d.getNum_demande()+" à été déposé avec success</p><br>" +
					"<p>Compléter les Document</p>", true);
			messageEmail.setFrom(fromusermail,fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
		}
		if (d.getType().equals("NT") && id_statut == 58) {
			d.setDateValidation(new Date());
			Calendar c = Calendar.getInstance();
			c.add(Calendar.DATE, 5);
			d.setDateFinValidation(c.getTime());
		}
		demadeInfoRepository.save(d);


		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if (d.getStatut().getId_statut_projet() == 58){
			webs.addAuditAutorisation("Validation des Documents", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande de complément", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		return String.valueOf(d.getId_demande_information());
	}

	@RequestMapping(value = "/api/changerStatut2/{id}/{id_statut}/{comment}", method = RequestMethod.POST)
	public @ResponseBody int changerStatut2(@PathVariable int id,@PathVariable int id_statut,@PathVariable String comment) throws UnknownHostException, JsonProcessingException {
		Notification n = notificationRepository.getOne(id);
		n.setStatut(statutProjRep.getOne(id_statut));
		n.setCommentaire(comment);
		notificationRepository.save(n);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(n.getStatut().getId_statut_projet()==64) {
			webs.addAuditAutorisation("certificat valide", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());
		}else{
			webs.addAuditAutorisation("certificat non valide", n.getNum_notification(), n.getZf_et(), n.getStatut(), web.getCompteConnected());
		}
		return 0;
	}
	@RequestMapping(value = "/api/addconsultationPublic/{id_dmd}", method = RequestMethod.POST)
	public @ResponseBody String changerStatut(@PathVariable int id_dmd,@RequestParam String consulattion){
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		d.setConsultationPublic(consulattion);
		demadeInfoRepository.save(d);
		return String.valueOf(d.getId_demande_information());
	}

	@RequestMapping(value = "/api/save_addPVReunion/{id_dmd}/{id_reunion}/{id_statut}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody String changerStatut(@PathVariable int id_dmd,@PathVariable int id_reunion,@PathVariable int id_statut,@RequestParam String comment,@RequestParam String periode,@RequestParam String date_debut,@RequestParam String date_fin,
											  @RequestParam MultipartFile[] fileToUpload_pv,@RequestParam MultipartFile[] fileToUpload_presence) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {

		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		Reunion r = reunionRepository.getOne(id_reunion);
		r.setCommentaire(comment);
		r.setStatut(statutProjRep.getOne(id_statut));
		if(id_statut==4 || id_statut==9){
			r.setReporte("oui");
		}
		if(!periode.equals("0")){
			r.setPeriode_send_rapport(periode);
		}

		if(fileToUpload_pv.length>0){
			String file_pv = fileStorageService.storeFile(fileToUpload_pv[0]);
			String cc_pv = "/assets/myFile/" + file_pv;
			r.setUrl_pv(cc_pv);
		}

		if(fileToUpload_presence.length>0){
			String file_presence = fileStorageService.storeFile(fileToUpload_presence[0]);
			String cc_presence = "/assets/myFile/" + file_presence;
			r.setUrl_presence(cc_presence);
		}
		reunionRepository.save(r);
		if(!d.getType().equals("AE")){
			d.setStatut(r.getStatut());
		}else if(d.getType().equals("AE") && d.getStatut().getId_statut_projet()==74 && id_statut==7){
			d.setStatut(statutProjRep.getOne(75));// la fin du WF délibéré
		}
		else if (id_statut==78){
			d.setStatut(statutProjRep.getOne(71));// attente du suivie d'audit
		}
		else
		{
			//d.setStatut(statutProjRep.getOne(71));// attente du suivie d'audit
			d.setStatut(r.getStatut());
		}
		if(id_statut==12){

				d.setDate_debut_AE(String.valueOf(new Date()));
				MimeMessage mimeMessage = emailSender.createMimeMessage();

				boolean multipart = true;

				MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

				boolean to_send = false;

				messageEmail.setTo(InternetAddress.parse(d.getEmail()));
				to_send = true;
				messageEmail.setSubject("La demende à été conforme");
				messageEmail.setText("Bonjour Mr/Mme :"+
						"<p>La demande numéro "+d.getNum_demande()+" à été conforme</p><br>" +
						"<p>Compléter les Document</p>", true);
				messageEmail.setFrom(fromusermail,fromuser);

				if (to_send)
					try {
						emailSender.send(mimeMessage);
					} catch (Exception ex) {
						System.out.println(ex.getMessage());
					}
			}
		if(!date_debut.equals("0")){
			d.setDate_debut_AE(date_debut);
		}
		if(!date_fin.equals("0")){
			d.setDate_fin_AE(date_fin);
		}

		Compte cpt = web.getCompteConnected();
		if(d.getCompteAffecte()==null || cpt.getCompteId()!=d.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(id_dmd);
			for(Affectation c : aff){
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setDemandeInformation(d);
			affectationRepository.save(af);
			d.setCompteAffecte(cpt);

		}

		demadeInfoRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(id_statut==76) {
			if(cpt.getPoste().getId_Poste()==3) {
				Affectation af = new Affectation();
				af.setDateAffectation(new Date());
				af.setEtat("oui");
				af.setCompte(cpt);
				af.setDemandeInformation(d);
				affectationRepository.save(af);
			}
			webs.addAuditAutorisation("Recevable", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else if(id_statut==77){
			webs.addAuditAutorisation("Non Recevable", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else if(id_statut==78){
			webs.addAuditAutorisation("Valide", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else if(id_statut==12){
			webs.addAuditAutorisation("Confrorme", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else if(id_statut==82){
			webs.addAuditAutorisation("Non Conforme", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Non Valide", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		return String.valueOf(d.getId_demande_information());
	}

	@RequestMapping(value = "/api/reporterReunion/{id_dmd}", method = RequestMethod.GET)
	public ModelAndView reporterReunion(@PathVariable int id_dmd){
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		Reunion r =null;
		if(d.getReunions().size()>0)
			r = d.getReunions().get(d.getReunions().size()-1);
		map.put("demande",d);
		map.put("reunion",r);
		map.put("oui", comiteRepository.getAllComiteByPermanentOUI());
		map.put("non", comiteRepository.getAllComiteByPermanentNON());
		return new ModelAndView("eie/reporterReunion",map);
	}

	@RequestMapping(value = "/api/reporterReunion/{id_dmd}/{id_reunion}/{oui}/{non}/{exam}/{date}", method = RequestMethod.POST)
	public @ResponseBody String reporterReunion(@PathVariable int id_dmd,@PathVariable int id_reunion,@PathVariable String exam,@PathVariable int[] oui,@PathVariable int[] non,@PathVariable String date) throws MessagingException, UnsupportedEncodingException {
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		Reunion r = reunionRepository.getOne(id_reunion);
		r.setDate_reunion(date);
		r.setExamen(exam);
		List<Comite> lc = new ArrayList<Comite>();
		for (int tmp : oui) {
			if(tmp>0){
				Comite c = comiteRepository.getOne(tmp);
				lc.add(c);
			}
		}
		for (int tmp : non) {
			if(tmp>0){
				Comite c = comiteRepository.getOne(tmp);
				lc.add(c);
			}
		}
		if(lc.size()>0)
			r.setComite(lc);

		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");
		boolean to_send = false;
		for (Comite tmp : lc){
			messageEmail.setTo(InternetAddress.parse(tmp.getEmail()));
			to_send = true;

			messageEmail.setSubject("Programmation de réunion");
			messageEmail.setText(" Merci de lire le document", true);

			if(exam.equals("examen")){
				FileSystemResource file = new FileSystemResource(new File("src/main/webapp/WEB-INF/views/pages/eie/examen.docx"));
				messageEmail.addAttachment("examen.docx", file);
			}
			else {
				FileSystemResource file = new FileSystemResource(new File("src/main/webapp/WEB-INF/views/pages/eie/reexamen.docx"));
				messageEmail.addAttachment("reexamen.docx", file);
			}
			messageEmail.setFrom(fromusermail,fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
		}
		reunionRepository.save(r);
		demadeInfoRepository.save(d);
		return String.valueOf(d.getId_demande_information());
	}

	@RequestMapping(value = "/api/getfileByIdDemande/{id}/{type}", method = RequestMethod.POST)
	public ModelAndView getfileByIdDemande(@PathVariable int id,@PathVariable String type){
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation d = demadeInfoRepository.getOne(id);
		ListDocNotif[] l = listDocNotifRepository.ListdocEIE(id);
		Reunion r = null;
		if(d.getReunions().size()>0)
			r = d.getReunions().get(d.getReunions().size()-1);

		map.put("doc",l);
		map.put("demande",d);
		map.put("reunion",r);

		map.put("type",type);
		if(type.equals("sendfile")){
			return new ModelAndView("user_select/auto_load_filesModal",map);
		}

		return new ModelAndView("user_select/auto_load_filesModal",map);
	}

	@RequestMapping(value = "/api/getOneDeclarationTransporteur/{id_notif}", method = RequestMethod.POST)
	public @ResponseBody Map getOneDeclarationTransporteur(@PathVariable int id_notif){
		Map<String,Object> map = new HashMap<String,Object>();
		DeclarationTransporteur d = declarationTransporteurRepository.getlastDeclarationByNotificationId(id_notif);
		map.put("declaration",d);
		return map;
	}

	@RequestMapping(value = "/api/ConfirmeRensignement/{idd}/{msg}/{id_statut}/{id_cnee}", method = RequestMethod.POST)
	public ModelAndView ConfirmeRensignement(@PathVariable int idd, @PathVariable String msg, @PathVariable int id_statut, @PathVariable int id_cnee) throws UnknownHostException, JsonProcessingException {
		Compte ct = web.getCompteConnected();
		DemandeInformation d = demadeInfoRepository.getOne(idd);
		//StatutProjet s = statutProjRep.getOne(12);
		//d.setStatut(s);

		if(id_statut==1){
			StatutProjet s = statutProjRep.getOne(11);
			d.setStatut(s);

		}else{
			if(id_cnee==1){
				StatutProjet s = statutProjRep.getOne(12);
				d.setStatut(s);
				d.setNiveauExamen("CNEE");
			}else{
				StatutProjet s = statutProjRep.getOne(13);
				d.setStatut(s);
				d.setNiveauExamen("CRUI");
			}
			d.setStatut_RC("oui");
			d.setDate_RC(new Date());
		}

		d.setCommentaire_avis(msg);
		demadeInfoRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(d.getStatut().getId_statut_projet()==12) {
			webs.addAuditAutorisation("EIE à examiner par CNEE", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}else if(d.getStatut().getId_statut_projet()==13){
			webs.addAuditAutorisation("EIE à examiner par CRUI", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}else if (d.getStatut().getId_statut_projet()==11){
			webs.addAuditAutorisation("Projets non assujettis", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}


		Map<String, Object> model = new HashMap<String, Object>();

		Page<DemandeInformation> h = demadeInfoRepository.getdemandeByEat(new PageRequest(0, 100), 11);

		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();

			model.put("notif", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("user", ct);
		return new ModelAndView("eie/listRensignement", model);
	}


	@RequestMapping(value = "/api/updateDeclarationTransporteur/{id}/{id_statut}", method = RequestMethod.POST)
	public @ResponseBody String updateDeclarationTransporteur(@PathVariable int id,@PathVariable int id_statut,@RequestParam String msg) throws UnknownHostException, JsonProcessingException {
		DeclarationTransporteur d = declarationTransporteurRepository.getOne(id);
		Notification n = notificationRepository.getOne(d.getNotification().getId_notification());
		if(id_statut==1){
			StatutProjet s = statutProjRep.getOne(67);
			n.setStatut(s);
			d.setEtat("1");
		}else if(id_statut==2){
			StatutProjet s = statutProjRep.getOne(68);
			n.setStatut(s);
			d.setEtat("2");
			d.setCommentaire(msg);
		}

		notificationRepository.save(n);
		d.setDateModification(new Date());
		declarationTransporteurRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(n.getStatut().getId_statut_projet()==67) {
			webs.addAuditAutorisation("Transporteur Valide", n.getNum_notification(), n.getZf_et(), n.getStatut(),web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Transporteur non Valide", n.getNum_notification(), n.getZf_et(), n.getStatut(),web.getCompteConnected());
		}
		return "ok";
	}


	@RequestMapping(value = "/api/updateStatut/{id}/{id_statut}/{type}", method = RequestMethod.GET)
	public @ResponseBody String updateStatut(@PathVariable int id,@PathVariable int id_statut,@PathVariable String type) throws UnknownHostException, JsonProcessingException {
		Notification n = notificationRepository.getOne(id);
		StatutProjet s = statutProjRep.getOne(id_statut);
		n.setStatut(s);
		notificationRepository.save(n);
		return "ok";
	}


	@RequestMapping(value = "/api/fun_save_document/{id}", method = RequestMethod.POST)
	public @ResponseBody String fun_save_document(@PathVariable int id,@RequestParam String date1) throws ParseException, UnknownHostException, JsonProcessingException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		d.setDateDebutUtilisation(sd.parse(date1));
		d.setStatut(statutProjRep.getOne(6));
		demadeInfoRepository.save(d);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		webs.addAuditAutorisation("Signé les Documents", d.getNum_demande(), d.getType(), d.getStatut(),web.getCompteConnected());
		return "ok";
	}

	@RequestMapping(value = "/api/fun_save_document_decision/{id}", method = RequestMethod.POST)
	public @ResponseBody String fun_save_document_decision(@PathVariable int id,@RequestParam String date1) throws ParseException, UnknownHostException, JsonProcessingException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		d.setDate_DC(sd.parse(date1));
		d.setStatut(statutProjRep.getOne(6));
		demadeInfoRepository.save(d);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		webs.addAuditAutorisation("Signé les Documents", d.getNum_demande(), d.getType(), d.getStatut(),web.getCompteConnected());
		return "ok";
	}


	@RequestMapping(value = "/api/planifier_visite/{id}", method = RequestMethod.GET)
	public ModelAndView fun_save_document(@PathVariable int id) throws ParseException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",web.getCompteConnected());
		model.put("type",d.getType());
		model.put("demande",d);
		return new ModelAndView("eie/planifier_visite",model);
	}

	@RequestMapping(value = "/api/PV_visite/{id}", method = RequestMethod.GET)
	public ModelAndView PV_visite(@PathVariable int id) throws ParseException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("user",web.getCompteConnected());
		model.put("type",d.getType());
		model.put("demande",d);
		return new ModelAndView("eie/attacherPV_visite",model);
	}

	@RequestMapping(value = "/api/demande_visite", method = RequestMethod.POST)
	public String fun_save_document(@Valid DemandeInformation dmd) throws ParseException, UnknownHostException, JsonProcessingException {
		DemandeInformation d = demadeInfoRepository.getOne(dmd.getId_demande_information());
		d.setVisite_adresse(dmd.getVisite_adresse());
		d.setVisite_date(dmd.getVisite_date());
		d.setVisite_object(dmd.getVisite_object());
		d.setDateFinValidation(null);
		d.setStatut(statutProjRep.getOne(69));
		demadeInfoRepository.save(d);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		webs.addAuditAutorisation("Planification de la Visite", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());

		return "redirect:/api/getEie/"+d.getType()+"/0/6/0";
	}

	@RequestMapping(value = "/api/demandePV_visite/{id}/{id_statut}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String fun_save_document(@PathVariable int id_statut,@RequestParam String comment,
									@PathVariable int id,@RequestParam MultipartFile[] fileToUpload_pv) throws ParseException, UnknownHostException, JsonProcessingException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		d.setStatut(statutProjRep.getOne(id_statut));
		d.setCommentaire(comment);
		if(fileToUpload_pv.length>0){
			String file_pv = fileStorageService.storeFile(fileToUpload_pv[0]);
			String cc_pv = "/assets/myFile/" + file_pv;
			d.setVisite_url(cc_pv);
		}
		demadeInfoRepository.save(d);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(d.getStatut().getId_statut_projet()==58){
			webs.addAuditAutorisation("Demande Conforme", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande Non Confrome", d.getNum_demande(), d.getType(), d.getStatut(), web.getCompteConnected());
		}
		return "redirect:/api/getEie/"+d.getType()+"/0/6/0";
	}

	@RequestMapping(value = "/api/addcommentAE/{id}", method = RequestMethod.POST)
	public @ResponseBody String addcommentAE(@PathVariable int id,@RequestParam String com) throws ParseException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		d.setCommentaire_url_file_AE(com);
		demadeInfoRepository.save(d);
		return "save";
	}

	@RequestMapping(value = "/api/addDocumentAE/{id}", method = RequestMethod.POST)
	public ModelAndView addDocumentAE(@PathVariable int id,@RequestParam String name) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user",web.getCompteConnected());
		DemandeInformation d = demadeInfoRepository.getOne(id);
		List<DocumentsAE> ld = new ArrayList<DocumentsAE>();
		if(d.getDocuments_AE().size()>0)
			ld.addAll(d.getDocuments_AE());
		DocumentsAE doc = new DocumentsAE();
		doc.setNom_fr(name);
		doc = documentsAERepository.save(doc);
		ld.add(doc);
		d.setDocuments_AE(ld);
		d = demadeInfoRepository.save(d);

		List<Affectation> aff = affectationRepository.SiExiste(id);
		for(Affectation c : aff){
			c.setEtat("non");
		}
		Compte cpt = web.getCompteConnected();

			if(cpt.getPoste().getId_Poste()!=3) {
				Affectation af = new Affectation();
				af.setDateAffectation(new Date());
				af.setEtat("oui");
				af.setCompte(cpt);
				af.setDemandeInformation(d);
				affectationRepository.save(af);
			}
		map.put("demande",d);
		return new ModelAndView("user_modal/auto_load_document_AE",map);
	}


	@RequestMapping(value = "/api/delete_doc_AE/{id}/{id_dmd}", method = RequestMethod.POST)
	public ModelAndView delete_doc_AE(@PathVariable int id,@PathVariable int id_dmd) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user",web.getCompteConnected());
		DocumentsAE doc = documentsAERepository.getOne(id);
		DemandeInformation d = demadeInfoRepository.getOne(id_dmd);
		List<DocumentsAE> ld = d.getDocuments_AE();

		ld.remove(doc);
		d.setDocuments_AE(ld);
		d = demadeInfoRepository.save(d);
		documentsAERepository.delete(doc);

		map.put("demande",d);
		return new ModelAndView("user_modal/auto_load_document_AE",map);
	}


	@RequestMapping(value = "/api/ajouterReunion_AE/{id}/{type}", method = RequestMethod.GET)
	public ModelAndView ajouterReunion_AE(@PathVariable int id,@PathVariable String type) throws ParseException {
		DemandeInformation d = demadeInfoRepository.getOne(id);
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("demande",d);
		model.put("reunion_type",type);
		model.put("type",d.getType());
		List<Comite> comiteOui = comiteRepository.getAllComiteByPermanentOUI();
		List<Comite> comiteNon = comiteRepository.getAllComiteByPermanentNON();
		List<Categorie> categories = categorieRepository.getAllCategorie();
		model.put("categories", categories);
		model.put("oui", comiteOui);
		model.put("non", comiteNon);
		Reunion r= null;
		if(d.getReunions().size()>0) {
			r= d.getReunions().get(d.getReunions().size()-1);
		}else{
			r= new Reunion();
		}
		model.put("reunion",r);
		return new ModelAndView("eie/nouvelleReunion",model);
	}


	@RequestMapping(value = "/api/showListRaportAE/{id}", method = RequestMethod.GET)
	public ModelAndView showListRaportAE(@PathVariable int id) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user",web.getCompteConnected());

		DemandeInformation d = demadeInfoRepository.getOne(id);


		map.put("demande",d);
		map.put("type",d.getType());

		return new ModelAndView("eie/RapportRecus",map);
	}

	@RequestMapping(value = "/api/validationDocumentAE/{id}", method = RequestMethod.GET)
	public ModelAndView validationDocumentAE(@PathVariable int id) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user",web.getCompteConnected());
		DemandeInformation d = demadeInfoRepository.getOne(id);
		map.put("demande",d);
		map.put("type",d.getType());
		ListDocNotif[] ld = listDocNotifRepository.ListdocEIE(id);
		map.put("doc",ld);

		return new ModelAndView("eie/validationDoc_AE",map);
	}

	@RequestMapping(value = "/api/changer_statut_docAE/{id}/{send}", method = RequestMethod.POST )
	public @ResponseBody String changer_statut_docAE(@PathVariable int id,@PathVariable String send) throws ParseException {

		DocumentsAE ae = documentsAERepository.getOne(id);
		ae.setStatut(send);
		documentsAERepository.save(ae);
		return String.valueOf(ae.getId_documents_ae());
	}

	@RequestMapping(value = "/api/updCommentDocAE/{id}", method = RequestMethod.POST)
	public @ResponseBody String update_comment_docAE(@PathVariable int id,@RequestParam String com) throws ParseException {
		DocumentsAE ae = documentsAERepository.getOne(id);
		ae.setCommentaire(com);
		documentsAERepository.save(ae);
		return String.valueOf(ae.getId_documents_ae());
	}

	@RequestMapping(value = "/api/updCommentFILEAE/{id}", method = RequestMethod.POST)
	public @ResponseBody String updCommentFILEAE(@PathVariable int id,@RequestParam String com) throws ParseException {
		DemandeInformation ae = demadeInfoRepository.getOne(id);
		ae.setCommentaire_url_file_AE(com);
		demadeInfoRepository.save(ae);
		return String.valueOf(ae.getId_demande_information());
	}

	@RequestMapping(value = "/api/changer_statut_listdocAE/{id}/{send}", method = RequestMethod.POST )
	public @ResponseBody String changer_statut_listdocAE(@PathVariable int id,@PathVariable String send) throws ParseException {
		ListDocNotif l = listDocNotifRepository.getOne(id);
		l.setNom_ar(send);
		listDocNotifRepository.save(l);
		return String.valueOf(l.getId_listDocNotif());
	}

	@RequestMapping(value = "/api/updCommentlistdocAE/{id}", method = RequestMethod.POST)
	public @ResponseBody String updCommentlistdocAE(@PathVariable int id,@RequestParam String com) throws ParseException {
		ListDocNotif l = listDocNotifRepository.getOne(id);
		l.setNom_fr(com);
		listDocNotifRepository.save(l);
		return String.valueOf(l.getId_listDocNotif());
	}

	@RequestMapping(value = "/api/getVisites_AE/{id}", method = RequestMethod.GET)
	public ModelAndView getVisites_AE(@PathVariable int id) throws ParseException {
		DemandeInformation l = demadeInfoRepository.getOne(id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("demande",l);
		map.put("type",l.getType());
		return new ModelAndView("eie/Gestion_visites",map);
	}

	@RequestMapping(value = "/api/add_Visite_AE/{id}", method = RequestMethod.POST)
	public  ModelAndView add_Visite_AE(@PathVariable int id,@RequestParam String date,@RequestParam String obj,
									   @RequestParam String site ) throws ParseException {
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation l = demadeInfoRepository.getById(id);
		Visites_AE v = new Visites_AE();
		v.setVisite_date(date);
		SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
		v.setDate_visite(sm.parse(date));
		v.setVisite_site(site);
		v.setVisite_objet(obj);
		v = visites_aeRepository.save(v);
		List<Visites_AE> lv = l.getVisites();
		lv.add(v);
		l.setVisites(lv);


		Compte cpt = web.getCompteConnected();

		if(l.getCompteAffecte()==null || cpt.getCompteId()!=l.getCompteAffecte().getCompteId()) {

			List<Affectation> aff = affectationRepository.SiExiste(id);
			for(Affectation c : aff){
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setDemandeInformation(l);
			affectationRepository.save(af);
			l.setCompteAffecte(cpt);
		}

		demadeInfoRepository.save(l);

		map.put("demande",l);
		return new ModelAndView("user_modal/auto_load_tableau_visite_AE",map);
	}


	@RequestMapping(value = "/api/save_file_visite_ae/{id}/{id_dmd}", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public ModelAndView save_file_visite_ae(@PathVariable int id,@PathVariable int id_dmd, @RequestParam MultipartFile fileToUpload)
			throws IOException, MessagingException {
		Visites_AE v = visites_aeRepository.getOne(id);
		String fileName = fileStorageService.storeFile(fileToUpload);
		String cc = "/dowload_uploaded/" + fileName;
		v.setVisite_url(cc);
		visites_aeRepository.save(v);
		Map<String,Object> map = new HashMap<String,Object>();
		DemandeInformation l = demadeInfoRepository.getById(id_dmd);
		map.put("demande",l);
		return new ModelAndView("user_modal/auto_load_tableau_visite_AE",map);
	}



	//*****************guide*******
	@RequestMapping(value = "/guide",method = RequestMethod.GET)
	public ModelAndView guideList() throws Exception {
		Map<String,Object> map = new HashMap<>();

		//map.put("user",compteRepository.getCompteConnected());
		return new ModelAndView("aide/guide",map);
	}
	@RequestMapping(value = "/getAccordionDocument/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionDocument(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("doc",docImportRepository.getAllDocImportByType(type));
		model.put("Admin_url",urls);
		model.put("show","accordion");
		return new ModelAndView("user_select/mesDocument",model);
	}

	@RequestMapping(value = "/getAccordionImage/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionImage(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		model.put("Admin_url",urls);
		model.put("show","accordion");
		return new ModelAndView("user_select/mesImages",model);
	}

	@RequestMapping(value = "/getAccordionVideo/{type}", method = RequestMethod.GET)
	public ModelAndView getAccordionVideo(@PathVariable String type) {
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("type",type);
		model.put("Admin_url",urls);
		model.put("show","accordion");
		return new ModelAndView("aide/mesVideos",model);
	}


	@RequestMapping(value = "/sendError")
	public  ResponseEntity<Void> SendErrorMail(@RequestParam String errorMessage,@RequestParam String errorUrl,@RequestParam int errorStatutCode) throws MessagingException, UnsupportedEncodingException {

		Compte ct = web.getCompteConnected();

		if(errorStatutCode==404){
			errorMessage="Page Not Found";
		}
		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;
		messageEmail.setTo(InternetAddress.parse(supportmail));
		to_send = true;

		messageEmail.setSubject("Error");
		messageEmail.setText(" <table width = \"100%\" cellpadding=\"10\" border = \"1\">\n" +
				"         <tr valign = \"top\">\n" +
				"            <td width = \"11%\"><b>Error Name:</b></td>\n" +
				"            <td>"+errorMessage+"</td>\n" +
				"         </tr>\n" +
				"            \n" +
				"         <tr valign = \"top\">\n" +
				"            <td><b>Page Url:</b></td>\n" +
				"            <td>"+errorUrl+"</td>\n" +
				"         </tr>\n" +
				"            \n" +
				"         <tr valign = \"top\">\n" +
				"            <td><b>Status code:</b></td>\n" +
				"            <td>"+errorStatutCode+"</td>\n" +
				"         </tr>\n" +
				"         <tr valign = \"top\">\n" +
				"            <td><b>L'erreur a été trouvé par:</b></td>\n" +
				"            <td>"+ct.getNom()+" / "+ct.getEmailRecup()+" \t@Admin</td>\n" +
				"         </tr>\n" +
				"            \n" +
				"      </table>", true);

		messageEmail.setFrom(fromusermail, support);

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		HttpHeaders headers = new HttpHeaders();
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


}
