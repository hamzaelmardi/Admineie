package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
public class RestFulQuestionReponseControler {

	@Autowired
	RegionRepository fm;
	@Autowired
	public JavaMailSender emailSender;
	@Value("${urls}")
	private String urls;

	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private DocumentDechetNdRepository documentDechetNdRepository;
	@Autowired
	private TransporteurEtrangerRepository transporteurEtrangerRepository;
	@Autowired
	private UniteRepository uniteRepository;
	@Autowired
	private DeclarationTransporteurRepository declarationTransporteurRepository;
	@Autowired
	private TransporteurParamRepository transportParamRepository;
	@Autowired
	private DetailDocumentMouvementRepository detailDocumentMouvementRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private CommuneRepository communeRepository;
	@Autowired
	private CategorieRepository categorieRepository;
	@Autowired
	private RapportsAERepository rapportsAERepository;
	@Autowired
	private ContactMessageRepository contactMessageRepository;
	@Autowired
	private ReponseRepository reponseRepository;
	@Autowired
	private AutorisationParamRepository autorisationParamRepository;
	@Autowired
	private EvaluationParamRepository evaluationParamRepository;
	@Autowired
	private StatutProjetRepository statutProjetRepository;
	@Autowired
	private QuestionRepository questionRepository;
	@Autowired
	private CollecteRepository collecteRepository;
	@Autowired
	private TypeVehiculeRepository typeVehiculeRepository;
	@Autowired
	private TypeConteneurRepository typeConteneurRepository;
	@Autowired
	private VehiculeRepository vehiculeRepository;
	@Autowired
	private InstallationRepository installationRepository;
	@Autowired
	private CodeRepository codeRepository;
	@Autowired
	private ListDocNotifRepository listDocNotifRepository;
	@Autowired
	private NotificationRepository notificationRepository;
	@Autowired
    private DemandeInformationRepository demandeInformationRepository;
	@Autowired
	LieuEliminationRepository lieuEliminationRepository;
	@Autowired
	PrefectureRepository prefectureRepository;
	@Autowired
	ListDocReunionRepository listDocReunionRepository;
	@Autowired
	DetailRegionRepository detailRegionRepository;
    @Autowired
	private EquipentSecuriteRepository equipentSecuriteRepository;
	ObjectMapper objectMapper = new ObjectMapper();
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	private InstallationDechetRepository installationDechetRepository;
	@Autowired
	private TransporteurParamRepository transporteurParamRepository;
	@Autowired
	private PortRepository portRepository;
	@Autowired
	PopulationRepository populationRepository;
	@Autowired
	ClassificationRepository classificationRepository;
	@Autowired
	DocumentsAERepository documentsAERepository;
	@Autowired
	AuditAutorisationRepository auditAutorisationRepository;

	@Autowired
	SecurityService webs;

	@Autowired
	CaracteristiquePhysiqueRepository caracteristiquePhysiqueRepository;
	@Autowired
	PaysAutoriteRepository paysAutoriteRepository;
	@Autowired
	PaysRepository paysRepository;
	@Autowired
	ProducteurRepository producteurRepository;

	@Autowired
	TypeRenouvellementRepository typeRenouvellementRepository;
	@Autowired
	CodeparenttRepository codeparenttRepository;
	@Autowired
	DocumentImortationDechet documentImortationDechetRepository;
	@Autowired
	InstallationAutoriseRepository installationAutoriseRepository;

	@RequestMapping(value = "/getListQuestions/{page}/{size}", method = RequestMethod.GET)
	public ResponseEntity<Page<Questions>> getAllQuestionRest(@PathVariable int page, @PathVariable int size) {

		Page<Questions> q = questionRepository.getAllQuestion1(new PageRequest(page, size));

		if (q.isEmpty()) {
			return new ResponseEntity<Page<Questions>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<Questions>>(q, HttpStatus.OK);
	}

	@RequestMapping(value = "/saveQuestion", method = RequestMethod.POST)
	public ResponseEntity<Void> addNewForumRest(@RequestBody Questions question, UriComponentsBuilder ucBuilder) throws JsonProcessingException {

		question=questionRepository.save(question);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveQuestion/{id}").buildAndExpand(question.getId_question()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/getquestionbyId/{id}", method = RequestMethod.GET)
	public ResponseEntity<Questions> getquestionbyId(@PathVariable int id) {
		Questions q = questionRepository.getQuestionById(id);
		if (q == null) {
			return new ResponseEntity<Questions>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Questions>(q, HttpStatus.OK);
	}


	@RequestMapping(value = "/getListParam", method = RequestMethod.GET)
	public ResponseEntity<AutorisationParam[]> getListParam() {
		AutorisationParam[] a = autorisationParamRepository.getAutorisationParamTab();
		if (a.length==0) {
			return new ResponseEntity<AutorisationParam[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<AutorisationParam[]>(a, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListEvaParam", method = RequestMethod.GET)
	public ResponseEntity<EvaluationParam[]> getListEvaParam() {
		EvaluationParam[] a = evaluationParamRepository.getEvaluationParamTab();
		if (a.length==0) {
			return new ResponseEntity<EvaluationParam[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<EvaluationParam[]>(a, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListReponseByIdQuestion/{page}/{size}/{id}", method = RequestMethod.GET)
	public ResponseEntity<Page<Reponse>> getListReponseByIdQuestion(@PathVariable int page, @PathVariable int size,@PathVariable int id) {

		List<Reponse> l = questionRepository.getQuestionById(id).getReponses();
		Page<Reponse> res= new PageImpl<>(l,new PageRequest(page,size, Sort.by("id_reponse").descending()),l.size());


		if (res.isEmpty()) {
			return new ResponseEntity<Page<Reponse>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<Reponse>>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/saveReponse/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveReponse(@PathVariable int id ,@RequestBody Reponse r, UriComponentsBuilder ucBuilder) throws JsonProcessingException {

		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int day = c.get(Calendar.DAY_OF_MONTH);
		String moi_j = month<10?"0"+month:month+"";

		int heirs = c.get(Calendar.HOUR_OF_DAY);
		int min = c.get(Calendar.MINUTE);

		r.setDate_pub(day + "-" + moi_j + "-" + year);
		r.setHeur_pub(heirs +" : "+min);

		Reponse res = reponseRepository.save(r);

		Questions q = questionRepository.getOne(id);
		List<Reponse> l = q.getReponses();
		if(!l.contains(res)){
			l.add(res);
			q.setReponses(l);
			questionRepository.save(q);
		}



		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveReponse/{id}").buildAndExpand(r.getId_reponse()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	// delete reponse
	@RequestMapping(value = "/deleteReponse/{idrep}/{idquest}", method = RequestMethod.GET)
	public ResponseEntity<Void> deleteReponse(@PathVariable int idrep, @PathVariable int idquest) {
		Questions q = questionRepository.getQuestionById(idquest);
		Reponse r = reponseRepository.getReponseById(idrep);

		List<Reponse> l = q.getReponses();
		l.remove(r);
		q.setReponses(l);
		questionRepository.save(q);

		r.setDeleteDateTime(new Date());
		reponseRepository.save(r);

		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	//update get reponse
	@RequestMapping(value = "/getReponseById/{id}", method = RequestMethod.GET)
	public ResponseEntity<Reponse> getReponseById(@PathVariable int id) {
		Reponse r = reponseRepository.getReponseById(id);
		if (r == null) {
			return new ResponseEntity<Reponse>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Reponse>(r, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListeMessageContact/{page}/{size}/{iduser}", method = RequestMethod.GET)
	public ResponseEntity<Page<ContactMessage>> getListeMessageContact(@PathVariable int page, @PathVariable int size, @PathVariable int iduser) {
		Page<ContactMessage> res  =contactMessageRepository.getListAllMessage(new PageRequest(page,size),iduser);

		if (res.isEmpty()) {
			return new ResponseEntity<Page<ContactMessage>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<ContactMessage>>(res, HttpStatus.OK);
	}


	@RequestMapping(value = "/saveMsgContact", method = RequestMethod.POST)
	public ResponseEntity<Void> saveMsgContact(@RequestBody ContactMessage msg, UriComponentsBuilder ucBuilder) throws JsonProcessingException {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int moiss = c.get(Calendar.MONTH)+1;
		int jours = c.get(Calendar.DAY_OF_MONTH);

		int heir = c.get(Calendar.HOUR_OF_DAY);
		int mini = c.get(Calendar.MINUTE);



		msg.setDate( (jours<10?"0"+jours:jours) +"/"+(moiss<10?"0"+moiss:moiss) + "/" + year );
		msg.setHeur((heir<10?"0"+heir:heir)+" : "+(mini<10?"0"+mini:mini));

		contactMessageRepository.save(msg);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveQuestion/{id}").buildAndExpand(msg.getId_message()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/getContactMessageById/{id}/{iduser}", method = RequestMethod.GET)
	public ResponseEntity<ContactMessage> getContactMessageById(@PathVariable int id,@PathVariable int iduser) {
		ContactMessage q = contactMessageRepository.getMessageContactById(id,iduser);
		if (q == null) {
			return new ResponseEntity<ContactMessage>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<ContactMessage>(q, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListQuestionsByAuto/{page}/{size}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Page<Questions>> getListQuestionsByAuto(@PathVariable int page, @PathVariable int size, @PathVariable String type) {

		Page<Questions> res ;
		if(type.equals("1")){
			res  =questionRepository.getAllQuestionAutorisation(new PageRequest(page,size));
		}else if(type.equals("2")){
			 res  =questionRepository.getAllQuestionEvaluation(new PageRequest(page,size));
		}else{
			 res  =questionRepository.getAllQuestion(new PageRequest(page,size));
		}

		if (res.isEmpty()) {
			return new ResponseEntity<Page<Questions>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Page<Questions>>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollecteByIdRest/{id}/{iduser}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollecteByIdRest(@PathVariable int id,@PathVariable int iduser) {
		CollecteTransporteur q = collecteRepository.getCollecteById(id,iduser);
		if (q == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(q, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollecteById2Rest/{id}/{iduser}/{typerenew}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollecteById2Rest(@PathVariable int id,@PathVariable int iduser,@PathVariable String typerenew) {

		CollecteTransporteur q = null;

		if(id>0 && typerenew.equals("N")){
			q = collecteRepository.getCollecteById(id,iduser);
		}else if (id>0 && typerenew.equals("R")){
			q = collecteRepository.getCollecteById_deleted(id,iduser);
		}
		else if (id>0 && typerenew.equals("AV")){
			q = collecteRepository.getCollecteById_deleted(id,iduser);
		}

		if (q == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(q, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallationByIdRest/{id}/{iduser}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallationByIdRest(@PathVariable int id,@PathVariable int iduser) {
		Installation q = installationRepository.getInstallationById(id,iduser);
		if (q == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(q, HttpStatus.OK);
	}


	@RequestMapping(value = "/getCollecteById_deletedRest/{id}/{iduser}/{typeRenouv}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollecteByIdRest(@PathVariable int id,@PathVariable int iduser,@PathVariable String typeRenouv) {
		CollecteTransporteur q = new CollecteTransporteur();
		if(typeRenouv.equals("R")){
			q = collecteRepository.getCollecteById_deleted(id,iduser);
		} else if(typeRenouv.equals("N")){
			q = collecteRepository.getCollecteById(id,iduser);
		}

		if (q == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(q, HttpStatus.OK);
	}





	@RequestMapping(value = "/getListEquipementSecurite", method = RequestMethod.GET)
	public ResponseEntity<EquipementSecurite[]> getListEquipementSecurite() {
		EquipementSecurite[] eq = equipentSecuriteRepository.getAllEquipementTab();
		if (eq == null) {
			return new ResponseEntity<EquipementSecurite[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<EquipementSecurite[]>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListTypeVehicule", method = RequestMethod.GET)
	public ResponseEntity<TypeVehicule[]> getListTypeVehicule() {
		TypeVehicule[] eq = typeVehiculeRepository.getAllTypeVehiculeTab();
		if (eq == null) {
			return new ResponseEntity<TypeVehicule[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<TypeVehicule[]>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListTypeConteneur", method = RequestMethod.GET)
	public ResponseEntity<TypeConteneurs[]> getListTypeConteneur() {
		TypeConteneurs[] eq = typeConteneurRepository.getAllTypeConteneursTab();
		if (eq == null) {
			return new ResponseEntity<TypeConteneurs[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<TypeConteneurs[]>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListAllRegion", method = RequestMethod.GET)
	public ResponseEntity<Region[]> getListAllRegion() {
		Region[] eq = regionRepository.getAllRegionsTab();
		if (eq == null) {
			return new ResponseEntity<Region[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Region[]>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListAllTransporteurParam", method = RequestMethod.GET)
	public ResponseEntity<TransporteurParam[]> getListAllTransporteurParam() {
		TransporteurParam[] eq = transportParamRepository.getAllTransporteurParam2();
		if (eq == null) {
			return new ResponseEntity<TransporteurParam[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<TransporteurParam[]>(eq, HttpStatus.OK);
	}
	//**********
	@RequestMapping(value = "/getListAllCode", method = RequestMethod.GET)
	public ResponseEntity<Code[]> getListAllCode() {
		 Code[] eq = codeRepository.getAllCode1();

		if (eq == null) {
			return new ResponseEntity<Code[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Code[]>(eq, HttpStatus.OK);
	}
	//***********

	//**********
		@RequestMapping(value = "/getListAllCodeParent", method = RequestMethod.GET)
		public ResponseEntity<Codeparentt[]> getListAllCodeParent() {
			Codeparentt[] eq = codeparenttRepository.getAllCodeparentt2();

			if (eq == null) {
				return new ResponseEntity<Codeparentt[]>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<Codeparentt[]>(eq, HttpStatus.OK);
		}
		//***********

	@RequestMapping(value = "/getListAllCode1/{id}", method = RequestMethod.GET)
	public ResponseEntity<Code[]> getListAllCode1(@PathVariable int id) {
		Code[] eq = codeRepository.getAllCodeTable(id);

		if (eq == null) {
			return new ResponseEntity<Code[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Code[]>(eq, HttpStatus.OK);
	}
	//**********

	//***********

		@RequestMapping(value = "/getListCodeByParent/{id}/{classification}", method = RequestMethod.GET)
		public ResponseEntity<Code[]> getListCodeByParent(@PathVariable int id,@PathVariable int classification) {
			Code[] eq = codeRepository.getAllCodeByParentTable(id,classification);

			if (eq == null) {
				return new ResponseEntity<Code[]>(HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<Code[]>(eq, HttpStatus.OK);
		}
		//**********

	@RequestMapping(value = "/getListAllQuestion/{type}", method = RequestMethod.GET)
	public ResponseEntity<Questions[]> getListAllQuestion(@PathVariable String type) {
		Questions[] eq = questionRepository.getAllQuestionAutorisationA(type);

		if (eq == null) {
			return new ResponseEntity<Questions[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Questions[]>(eq, HttpStatus.OK);
	}



	@RequestMapping(value = "/getVehiculeByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<Vehicules> getVehiculeByIdRest(@PathVariable int id) {
		Vehicules eq = vehiculeRepository.getVehiculeById(id);
		if (eq == null) {
			return new ResponseEntity<Vehicules>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Vehicules>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPaysAutoriteByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<PaysAutorite> getPaysAutoriteByIdRest(@PathVariable int id) {
		PaysAutorite eq = paysAutoriteRepository.getPaysAutoriteById(id);
		if (eq == null) {
			return new ResponseEntity<PaysAutorite>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<PaysAutorite>(eq, HttpStatus.OK);
	}


	@RequestMapping(value = "/deleteVehiculeRest/{id}/{id_coll}/{id_user}", method = RequestMethod.PUT)
	public void deleteVehiculeRest(@PathVariable int id,@PathVariable int id_coll,@PathVariable int id_user) {
		CollecteTransporteur c = collecteRepository.getCollecteById(id_coll,id_user);
		List<Vehicules> lv = c.getVehicules();
		lv.remove(vehiculeRepository.getOne(id));
		c.setNombre_vehicule(String.valueOf(lv.size()));
		c.setVehicules(lv);
		collecteRepository.save(c);
	}


	@RequestMapping(value = "/deletePaysautoriteRest/{id}/{id_notif}/{id_user}", method = RequestMethod.PUT)
	public void deletePaysautoriteRest(@PathVariable int id,@PathVariable int id_notif,@PathVariable int id_user) {
		Notification n = notificationRepository.getNotificationByIdComptId(id_notif,id_user);
		List<PaysAutorite> pv = n.getPaysAutorites();
		pv.remove(paysAutoriteRepository.getOne(id));
		n.setPaysAutorites(pv);
		notificationRepository.save(n);
	}

	@RequestMapping(value = "/saveVehiculeRest", method = RequestMethod.POST)
	public ResponseEntity<Void> saveVehiculeRest(MultipartFile file,MultipartFile file1, int id_collecte, String vehicule, UriComponentsBuilder ucBuilder) throws IOException {

		importHistorique imp = new importHistorique();
		ObjectMapper objectMapper = new ObjectMapper();
		Vehicules v = objectMapper.readValue(vehicule,Vehicules.class);
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			v.setDoc_assurance(cc);
		}else if(v.getId_vehicule()>0 && file==null){
			Vehicules t = vehiculeRepository.getVehiculeById(v.getId_vehicule());
			v.setDoc_assurance(t.getDoc_assurance());
		}
		if(file1!=null){
			String fileName1 = fileStorageService.storeFile(file1);
			String cc1 = "/assets/myFile/" + fileName1;
			v.setEquipementSecurite(cc1);
		}else if(v.getId_vehicule()>0 && file1==null){
			Vehicules t = vehiculeRepository.getVehiculeById(v.getId_vehicule());
			v.setEquipementSecurite(t.getEquipementSecurite());
		}
		CollecteTransporteur c = collecteRepository.getOne(id_collecte);
		List<Vehicules> lv = c.getVehicules();
		if (v.getId_vehicule()<=0){
			lv.add(v);
		}
		c.setVehicules(lv);
		c.setNombre_vehicule(String.valueOf(lv.size()));
		vehiculeRepository.save(v);
		collecteRepository.save(c);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveVehiculeRest/{id}").buildAndExpand(v.getId_vehicule()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}



	@RequestMapping(value = "/savePaysautoriteRest/{v}", method = RequestMethod.GET)
	public ResponseEntity<Void> savePaysautoriteRest(@PathVariable int v, UriComponentsBuilder ucBuilder) throws IOException {

		PaysAutorite pays1= new PaysAutorite();
		Pays p = paysRepository.getOne(v);
		pays1.setPays(p);
		paysAutoriteRepository.save(pays1);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/savePaysautoriteRest/{id}").buildAndExpand(pays1.getId_paysautorite()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/savePaysautoriteXDRest/{id_notif}/{idPays}", method = RequestMethod.POST)
	public ResponseEntity<Void> savePaysautoriteXDRest(MultipartFile file,@PathVariable int id_notif, int pays,String desc_autorite, @PathVariable int idPays, UriComponentsBuilder ucBuilder) throws IOException {
		PaysAutorite p;
		if(idPays==0) {
			 p= new PaysAutorite();
		}
		else{
			p = paysAutoriteRepository.getPaysAutoriteById(idPays);
		}
		Pays pays1=paysRepository.getOne(pays);
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			p.setUrl_autorite(cc);
			p.setPays(pays1);
			p.setDesc_autorite(desc_autorite);
		}else if(idPays>0 && file==null){
			p.setPays(pays1);
			p.setDesc_autorite(desc_autorite);
		}
		Notification n = notificationRepository.getOne(id_notif);
		List<PaysAutorite> pv = n.getPaysAutorites();
		if (p.getId_paysautorite()<=0){
			pv.add(p);
		}
		n.setPaysAutorites(pv);
		paysAutoriteRepository.save(p);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/savePaysautoriteRest/{id}").buildAndExpand(p.getId_paysautorite()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/saveTransporeuretrangerNational/{id_notif}/{id_trans}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveTransporeuretrangerNational(UriComponentsBuilder ucBuilder,@PathVariable int id_trans, @PathVariable int id_notif,MultipartFile file,String raison,String matricule,String type_vehicule,String adresse) throws IOException {

		TransporteurEtranger trans = null;
		String cc ="";

		if(id_trans==0){
			trans = new TransporteurEtranger();
			if(file!=null){
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
				trans.setId_TransporteurEtranger(id_trans);
			}
		}else if (id_trans>0){
			trans = transporteurEtrangerRepository.getOne(id_trans);

			if(file==null){
				cc = trans.getUrl_assurance();
			}else{
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
			}
		}

		trans.setRaison_social(raison);
		trans.setNum_matricule(matricule);
		trans.setTypeVehicule(type_vehicule);
		trans.setAdresse(adresse);
		trans.setType("tn");
		trans.setUrl_assurance(cc);
		trans = transporteurEtrangerRepository.save(trans);

		Notification n = notificationRepository.getbyid(id_notif);
		List<TransporteurEtranger> ltr = n.getTransporteur_etranger();
		Boolean find = false;
		for (TransporteurEtranger tmp:ltr) {
			if(tmp.getId_TransporteurEtranger()==trans.getId_TransporteurEtranger() && !find){
				find=true;
			}
		}
		if (!find){
			ltr.add(trans);
		}
		n.setTransporteur_etranger(ltr);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveTransporeuretrangerNational/{id}").buildAndExpand(trans.getId_TransporteurEtranger()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


	@RequestMapping(value = "/setcodeCollectRest/{id_coll}/{id_code}/{type}/{id_user}", method = RequestMethod.PUT)
	public ResponseEntity<Void> setcodeCollectRest(@PathVariable int id_coll, @PathVariable int id_code,
												 @PathVariable String type, @PathVariable int id_user, UriComponentsBuilder ucBuilder) throws IOException {

		CollecteTransporteur c = collecteRepository.getOne(id_coll);
		List<Code> l = c.getCode();
		Code code = codeRepository.getCodeById(id_code);

		if(type.equals("add") && !l.contains(code)){
			l.add(code);
		}else if(type.equals("delete")){
			l.remove(l.indexOf(codeRepository.getCodeById(id_code)));
		}
		c.setCode(l);
		collecteRepository.save(c);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/setcodeCollectRest/{id}").buildAndExpand(code.getId_code()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/deleteCodeTmpRest/{id_coll}/{id_code}/{type}/{id_user}", method = RequestMethod.PUT)
	public ResponseEntity<Void> deleteCodeTmp(@PathVariable int id_coll, @PathVariable int id_code,
												   @PathVariable String type, @PathVariable int id_user, UriComponentsBuilder ucBuilder) throws IOException {

		CollecteTransporteur c = collecteRepository.getCollecteById(id_coll,id_user);
		List<Code> l = c.getCode();
		List<Code> tmp = c.getCodeTmp();
		List<Code> tmp2 = c.getCodeTmp2();
		Code code = codeRepository.getCodeById(id_code);

		tmp2.add(codeRepository.getCodeById(id_code));
		l.remove(l.indexOf(codeRepository.getCodeById(id_code)));
		tmp.remove(tmp.indexOf(codeRepository.getCodeById(id_code)));

		c.setCode(l);
		c.setCodeTmp(tmp);
		collecteRepository.save(c);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/setcodeCollectRest/{id}").buildAndExpand(code.getId_code()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/deleteCodeTmp_instRest/{id_inst}/{id_code}/{type}/{id_user}", method = RequestMethod.PUT)
	public ResponseEntity<Void> deleteCodeTmp_inst(@PathVariable int id_inst, @PathVariable int id_code,
											  @PathVariable String type, @PathVariable int id_user, UriComponentsBuilder ucBuilder) throws IOException {

		Installation i = installationRepository.getInstallationById(id_inst,id_user);
		List<Code> l = i.getCode();
		List<Code> tmp = i.getCodeTmp();
		Code code = codeRepository.getCodeById(id_code);

		if(i.getType().equals("3") || i.getType().equals("1")){
			l.add(code);
			tmp.remove(tmp.indexOf(codeRepository.getCodeById(id_code)));
		}
		else{
			tmp.remove(tmp.indexOf(codeRepository.getCodeById(id_code)));
			l.remove(l.indexOf(codeRepository.getCodeById(id_code)));
		}

		i.setCode(l);
		i.setCodeTmp(tmp);
		installationRepository.save(i);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/setcodeCollectRest/{id}").buildAndExpand(code.getId_code()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/setcodeInstallationRest/{id_ins}/{id_code}/{type}/{id_user}", method = RequestMethod.PUT)
	public ResponseEntity<Void> setcodeInstallationRest(@PathVariable int id_ins, @PathVariable int id_code,
												   @PathVariable String type, @PathVariable int id_user, UriComponentsBuilder ucBuilder) throws IOException {

		Installation i = installationDechetRepository.getInstallationById(id_ins,id_user);
		List<Code> c = i.getCode();
		Code code = codeRepository.getCodeById(id_code);

		if(type.equals("add") && !c.contains(code)){
			c.add(code);
		}else if(type.equals("delete")){
			c.remove(c.indexOf(codeRepository.getCodeById(id_code)));
		}
		i.setCode(c);
		installationDechetRepository.save(i);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/setcodeInstallationRest/{id}").buildAndExpand(code.getId_code()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/deleteAllCodeByInstall/{id_ins}/{id_user}", method = RequestMethod.PUT)
	public ResponseEntity<Void> deleteAllByCodeInstall(@PathVariable int id_ins,@PathVariable int id_user, UriComponentsBuilder ucBuilder) throws IOException {

		Installation i = installationDechetRepository.getInstallationById(id_ins,id_user);
		List<Code> c = i.getCode();
		List<Code> cc = i.getCode();
		c.removeAll(cc);
		i.setCode(c);
		installationDechetRepository.save(i);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/setcodeInstallationRest/{id}").buildAndExpand(i.getId_installation()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/getCollecteByNumDemandeRest/{id}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollecteByNumDemandeRest(@PathVariable String id,@PathVariable int compt_id) {
		CollecteTransporteur eq = collecteRepository.getCollecteByNumDemande(id,compt_id);
		if (eq == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(eq, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollecteByNumDemande2Rest/{id}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollecteByNumDemande2Rest(@PathVariable int id,@PathVariable int compt_id) {
		CollecteTransporteur tmp = collecteRepository.getCollecteById(id,compt_id);
		CollecteTransporteur cloned = null;
		if(tmp!=null){

			cloned = org.apache.commons.lang3.SerializationUtils.clone(tmp);
			cloned.setId_collecte(0);
			cloned.setId_collecteOriginale(tmp.getId_collecte());
			cloned.setStatut(statutProjetRepository.getById(19));
			cloned.setDeleteDateTime(new Date());

			List<Code> ls = new ArrayList<Code>();
			ls.addAll(tmp.getCode());
			cloned.setCode(ls);

			List<Reunion> r = new ArrayList<Reunion>();
			r.addAll(tmp.getReunions());
			cloned.setReunions(r);

			List<Vehicules> lv = new ArrayList<Vehicules>();
			lv.addAll(tmp.getVehicules());
			cloned.setVehicules(lv);
			cloned.setRegion(tmp.getRegion());
			cloned.setPrefecture(tmp.getPrefecture());
			cloned.setDatecoll2(null);
			cloned.setCompteAffecte(null);


			collecteRepository.save(cloned);

			ListDocNotif[] l = listDocNotifRepository.ListDocCollectese(tmp.getId_collecte());
			for (ListDocNotif tmp_doc : l) {
				tmp_doc.setCollecte(cloned);
				listDocNotifRepository.save(tmp_doc);
			}
		}

		if (cloned == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(cloned, HttpStatus.OK);
	}

	@RequestMapping(value = "/getAvenant/{id}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getAvenant(@PathVariable int id,@PathVariable int compt_id) {
		CollecteTransporteur tmp = collecteRepository.getCollecteById(id,compt_id);
		CollecteTransporteur cloned = null;
		if(tmp!=null){

			cloned = org.apache.commons.lang3.SerializationUtils.clone(tmp);
			cloned.setId_collecte(0);
			cloned.setId_collecteOriginale(tmp.getId_collecte());
			cloned.setStatut(statutProjetRepository.getById(50));
			cloned.setDeleteDateTime(new Date());

			List<Code> ls = new ArrayList<Code>();
			ls.addAll(ls);
			cloned.setCode(ls);

			List<Reunion> r = new ArrayList<Reunion>();
			r.addAll(tmp.getReunions());
			cloned.setReunions(r);

			List<Vehicules> lv = new ArrayList<Vehicules>();
			lv.addAll(lv);
			cloned.setVehicules(lv);
			cloned.setDatecoll2(null);
			cloned.setRegion(tmp.getRegion());
			cloned.setPrefecture(tmp.getPrefecture());
			cloned.setDateAvenant(new Date());
			cloned.setCompteAffecte(null);
			cloned.setTypeRenouvellement(typeRenouvellementRepository.getOne(3));

			collecteRepository.save(cloned);
		}

		if (cloned == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(cloned, HttpStatus.OK);
	}


	@RequestMapping(value = "/getInstallByNumDemandeRest/{id}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallByNumDemandeRest(@PathVariable String id,@PathVariable int compt_id) {
		Installation tmp = installationRepository.getInstallationByNumDemande(id,compt_id);
		Installation cloned =null;
		if(tmp!=null){

			cloned = org.apache.commons.lang3.SerializationUtils.clone(tmp);
			cloned.setId_installation(0);
			cloned.setStatut(statutProjetRepository.getById(14));
			cloned.setId_installOriginale(tmp.getId_installation());
			cloned.setDeleteDateTime(new Date());

			List<Participant> r = new ArrayList<Participant>();
			r.addAll(tmp.getParticipant());
			cloned.setParticipant(r);
			cloned.setDateValidation(null);
			cloned.setRegion(tmp.getRegion());
			cloned.setPrefecture(tmp.getPrefecture());
			cloned.setCompteAffecte(null);
			installationRepository.save(cloned);

			ListDocNotif[] l = listDocNotifRepository.ListDocInstallation(tmp.getId_installation());
			for (ListDocNotif tmp_doc : l) {
				tmp_doc.setInstall(cloned);
				listDocNotifRepository.save(tmp_doc);
			}

		}

		if (cloned == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(cloned, HttpStatus.OK);
	}


	@RequestMapping(value = "/getNotificationByNumDemandeRest/{id}/{type}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotificationByNumDemandeRest(@PathVariable String id,@PathVariable String type,@PathVariable int compt_id) {
		Notification tmp = notificationRepository.getnotificationByUserType(id,type,compt_id);
		Notification cloned =null;
		if(tmp!=null && tmp.getStatut().getId_statut_projet()==38){

			cloned = org.apache.commons.lang3.SerializationUtils.clone(tmp);
			cloned.setId_notification(0);
			cloned.setId_notif_original(tmp.getId_notification());
			cloned.setStatut(statutProjetRepository.getById(33));
			cloned.setDeleteDateTime(new Date());
			cloned.setCompteAffecte(null);

			List<TransporteurParam> r = new ArrayList<TransporteurParam>();
			r.addAll(tmp.getTransporteur());
			cloned.setTransporteur(r);

			notificationRepository.save(cloned);
		}

		if (cloned == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(cloned, HttpStatus.OK);
	}


	@RequestMapping(value = "/getListCollectesRenouvByCompteRest/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur[]> getListCollectesRenouvByCompteRest(@PathVariable int compt_id) {

		CollecteTransporteur[] etap = collecteRepository.getAllCollecteRenouvByCompte(compt_id);

		if (etap.length==0) {
			return new ResponseEntity<CollecteTransporteur[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur[]>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNombreCollecteByUserRest/{id_compt}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Integer> getNombreCollecteByUserRest(@PathVariable int id_compt,@PathVariable String type) {
		Integer nbr = 0;
		if(type.equals("all"))
			nbr = collecteRepository.getNombreCollecteByUser(id_compt);
		if(type.equals("renouv"))
			nbr = collecteRepository.getNombreCollecteRenouvableByUser(id_compt);

		return new ResponseEntity<Integer>(nbr, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNombreInstaByUserRest/{id_compt}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Integer> getNombreInstaByUserRest(@PathVariable int id_compt,@PathVariable String type) {
		Integer nbr = 0;
		if(type.equals("all"))
			nbr = installationRepository.getNombreInstallationByUser(id_compt);
		if(type.equals("renouv"))
			nbr = installationRepository.getNombreIntallationRenouvableByUser(id_compt);

		return new ResponseEntity<Integer>(nbr, HttpStatus.OK);
	}

	@RequestMapping(value = "/getListInstallRenouvByCompteRest/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<Installation[]> getListInstallRenouvByCompteRest(@PathVariable int compt_id) {

		Installation[] etap = installationRepository.getAllInstallRenouvByCompte(compt_id);

		if (etap.length==0) {
			return new ResponseEntity<Installation[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation[]>(etap, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallByNumAndUserRest/{num}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallByNumAndUserRest(@PathVariable String num,@PathVariable int id_compt) {
		Installation ins = installationRepository.getOneInstallationByComptAndNumero(num,id_compt);
		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNombreNotifUserRest/{id_compt}/{all}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Integer> getNombreNotifUserRest(@PathVariable int id_compt,@PathVariable String all,@PathVariable String type) {
		Integer nbr = 0;
		if(all.equals("all"))
			nbr = notificationRepository.getNombreNotificationByUser(id_compt,type);

		return new ResponseEntity<Integer>(nbr, HttpStatus.OK);
	}

    @RequestMapping(value = "/getDemandeInfoByNumByUserRest/{id}/{id_compt}", method = RequestMethod.GET)
    public ResponseEntity<DemandeInformation> getDemandeInfoByNumByUserRest(@PathVariable String id,@PathVariable int id_compt) {

        DemandeInformation ins = demandeInformationRepository.getDemandeInfoByNumByUser(id,id_compt);
        if (ins == null) {
            return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<DemandeInformation>(ins, HttpStatus.OK);
    }


	@RequestMapping(value = "/getArrRegionRest", method = RequestMethod.GET)
	public ResponseEntity<Region[]> getArrRegionRest() {
		Region[] res = regionRepository.getArrAllRegion();

		if (res == null) {
			return new ResponseEntity<Region[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Region[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getArrCategorieRest", method = RequestMethod.GET)
	public ResponseEntity<Categorie[]> getArrCategorieRest() {
		Categorie[] res = categorieRepository.getArrAllCategorie();

		if (res == null) {
			return new ResponseEntity<Categorie[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Categorie[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollecteById_v2Rest/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur>getCollecteById_v2Rest(@PathVariable int id_compt) {

		CollecteTransporteur res = collecteRepository.getOneCollecteByUser(id_compt);
		if(res==null){
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getOneCollecteByUserFirst/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur>getOneCollecteByUserFirst(@PathVariable int id_compt) {

		CollecteTransporteur res = collecteRepository.getOneCollecteByUserFirst(id_compt);
		if(res==null){
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollecteeById/{id}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur>getCollecteeById(@PathVariable int id) {

		CollecteTransporteur res = collecteRepository.getbyid(id);
		if(res==null){
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(res, HttpStatus.OK);
	}
	@RequestMapping(value = "/getDemandeByUserRest/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation>getDemandeByUser(@PathVariable int id_compt) {

		DemandeInformation res = demandeInformationRepository.getdemandeByUser(id_compt);
		if(res==null){
			return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallById_v2Rest/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<Installation>getInstallById_v2Rest(@PathVariable int id_compt) {

		Installation ins = installationRepository.getOneInstallByUser(id_compt);
		if(ins.getStatut().getId_statut_projet()==51){
			ins = installationRepository.getOneInstallByUser(id_compt);
		}
		else if (ins.getStatut().getId_statut_projet()==15){
			ins = installationRepository.getOneInstallByUser(id_compt);
			ins.setStatut(statutProjetRepository.getOne(14));
			ins.setComplement("2");
			installationRepository.save(ins);
		}
		if(ins==null){
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotificationNotDepoRest/{id_compt}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Notification[]>getNotificationNotDepoRest(@PathVariable int id_compt,@PathVariable String type) {

		Notification[] res = notificationRepository.getNotificationNotDpotByUser(id_compt,type);
		if(res==null){
			return new ResponseEntity<Notification[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotificationAllRest/{id_compt}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Notification[]>getNotificationAllRest(@PathVariable int id_compt,@PathVariable String type) {

		Notification[] res = notificationRepository.getNotificationAllbyComptNotNum(id_compt,type);
		if(res==null){
			return new ResponseEntity<Notification[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallationAllRest/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<Installation[]>getInstallationAllRest(@PathVariable int id_compt) {

		Installation[] res = installationRepository.getInstalationAllbyComptNotNum(id_compt);
		if(res==null){
			return new ResponseEntity<Installation[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getLieuEliminationArrRest", method = RequestMethod.GET)
	public ResponseEntity<LieuElimination[]>getLieuEliminationArrRest() {

		LieuElimination[] res =lieuEliminationRepository.getLieuEliminationArr();
		if(res==null){
			return new ResponseEntity<LieuElimination[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<LieuElimination[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallationAutoriseArrRest", method = RequestMethod.GET)
	public ResponseEntity<InstallationAutorise[]>getInstallationAutoriseArrRest() {

		InstallationAutorise[] res =installationAutoriseRepository.getInstallationAutoriseArr();
		if(res==null){
			return new ResponseEntity<InstallationAutorise[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<InstallationAutorise[]>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/setFilQualifToInstallRest/{id_install}", method = RequestMethod.POST)
	public ResponseEntity<String> setFilQualifToInstallRest(MultipartFile file,@PathVariable int id_install) throws IOException {
		String res = "ko";

		if(file!=null){
			Installation ins = installationRepository.getOne(id_install);
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			ins.setQualification(cc);
			installationRepository.save(ins);
			res = "ok";
		}else{
			return new ResponseEntity<String>(res, HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<String>(res, HttpStatus.OK);

	}


	@RequestMapping(value = "²/setFilImpactToDemandeInfoRest/{id_demande}", method = RequestMethod.POST)
	public ResponseEntity<String> setFilImpactToDemandeInfoRest(MultipartFile file,@PathVariable int id_demande) throws IOException {

		if(file!=null){
			DemandeInformation d = demandeInformationRepository.getById(id_demande);
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			d.setImpacts(cc);
			demandeInformationRepository.save(d);
		}else{
			return new ResponseEntity<String>("ok", HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<String>("ok", HttpStatus.OK);

	}

	@RequestMapping(value = "/updateDetailRegionInstall/{id}/{region}/{prefecture}/{commune}/{type}", method = RequestMethod.GET)
	public ResponseEntity<String>updateDetailRegionInstall(@PathVariable int id,@PathVariable int[] region, @PathVariable int[] prefecture,@PathVariable int[] commune,@PathVariable String type) throws UnknownHostException, JsonProcessingException {

		List<Region> lr = new ArrayList<Region>();
		List<Prefecture> lp = new ArrayList<Prefecture>();
		List<Commune> lc = new ArrayList<Commune>();
		DetailRegion detail = new DetailRegion();

		for (int tmp_id : region) {
			if(tmp_id>0)
				lr.add(regionRepository.getOne(tmp_id));
		}
		for (int tmp_id : prefecture) {
			if(tmp_id>0)
				lp.add(prefectureRepository.getOne(tmp_id));
		}
		for (int tmp_id : commune) {
			if(tmp_id>0)
				lc.add(communeRepository.getOne(tmp_id));
		}

		DemandeInformation dm = demandeInformationRepository.getOne(id);
		if(lc.size()>0 || lp.size()>0 || lr.size()>0){
			if(lr.size()>0)
				detail.setRegion(lr);
			if(lp.size()>0)
				detail.setPrefectures(lp);
			if(lc.size()>0)
				detail.setCommunes(lc);

			detail = detailRegionRepository.save(detail);
			dm.setDetailRegion(detail);
		}

		if(type.equals("RS"))
			dm.setStatut(statutProjetRepository.getOne(11)); //Brouillon --> RS
		else if(type.equals("AE")){
			dm.setStatut(statutProjetRepository.getOne(1)); // --> AE en attente
		} else
			dm.setType(type);

		demandeInformationRepository.save(dm);
		if(type.equals("RS")) {
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dm.getNum_demande());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}

			webs.addAuditAutorisation("Dépôt de dossier", dm.getNum_demande(), dm.getType(), dm.getStatut(), dm.getCompte());
		}
		else{
			int cpt=0;
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dm.getNum_demande());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					if (a.getStatut().getNom_fr().equals("Brouillon")) {
						cpt++;
					}
					if (cpt >= 1) {
						break;
					}
					else {
						a.setEtat(0);
						auditAutorisationRepository.save(a);
					}
				}
			}
			if (cpt < 1) {
				if (dm.getStatut().getNom_fr().equals("Brouillon")) {
					webs.addAuditAutorisation("Enregistrement comme brouillon", dm.getNum_demande(), dm.getType(), dm.getStatut(), dm.getCompte());
				}else {
					webs.addAuditAutorisation("Demande de numéro de notification", dm.getNum_demande(), dm.getType(), dm.getStatut(), dm.getCompte());
				}
			}
		}

		String res = "ok";

		return new ResponseEntity<String>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getcountEIEByTypeRest/{type}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<Integer>getcountEIEByTypeRest(@PathVariable int id_compt,@PathVariable String type) {

		Integer res = 0;
		if(type.equals("EE")){
			res = demandeInformationRepository.count_EE();
		}else if(type.equals("RS")){
			res = demandeInformationRepository.count_RS();
		}else if(type.equals("NT")){
			res = demandeInformationRepository.count_NT();
		}else if(type.equals("AE")){
			res = demandeInformationRepository.count_AE();
		}
		return new ResponseEntity<Integer>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotificationByIdComptIdRest/{id}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotificationByIdComptIdRest(@PathVariable int id,@PathVariable int id_compt) throws IOException {

		Notification res = notificationRepository.getNotificationByIdComptId(id,id_compt);
		if(res==null){
			return new ResponseEntity<Notification>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotificationByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotificationByIdRest(@PathVariable int id) throws IOException {

		Notification res = notificationRepository.getbyid(id);
		if(res==null){
			return new ResponseEntity<Notification>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDemandeInformationByCompteIdRest/{id}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation> getDemandeInformationByCompteIdRest(@PathVariable int id,@PathVariable int id_compt) throws IOException {

		DemandeInformation res = demandeInformationRepository.getdemandeByComptId(id,id_compt);
		if(res==null){
			return new ResponseEntity<DemandeInformation>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/setAvisProjetDemandeInformationRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<String> setAvisProjetDemandeInformationRest(MultipartFile file,@PathVariable int id) throws IOException {
		String res = "ko";
		if(file!=null){
			DemandeInformation dmd = demandeInformationRepository.getOne(id);
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			dmd.setUrl_avis(cc);
			demandeInformationRepository.save(dmd);
			res = "ok";
		}else{
			return new ResponseEntity<String>(res, HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<String>(res, HttpStatus.OK);
	}


	@RequestMapping(value = "/saveProducteurNotificationRest/{id_notif}/{id_prod}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveProducteurNotificationR(UriComponentsBuilder ucBuilder,@PathVariable int id_prod, @PathVariable int id_notif,String nom_fr, String nom_ar, String contact_fr,String idf,String adresse_fr, String tel, String fax, String mail) throws IOException {

		Producteur producteur = null;

		if(id_prod==0){
			producteur = new Producteur();
				producteur.setId_producteur(id_prod);
		}else if (id_notif>0){
			producteur = producteurRepository.getOne(id_prod);
		}

		assert producteur != null;
		producteur.setNom_fr(nom_fr);
		producteur.setNom_ar(nom_ar);
		producteur.setContact_fr(contact_fr);
		producteur.setIdf(idf);
		producteur.setAdresse_fr(adresse_fr);
		producteur.setTel(tel);
		producteur.setFax(fax);
		producteur.setMail(mail);
		producteurRepository.save(producteur);

		Notification n = notificationRepository.getbyid(id_notif);
		List<Producteur> ltr = n.getProducteurs();
		Boolean find = false;
		for (Producteur tmp:ltr) {
			if(tmp.getId_producteur()==producteur.getId_producteur() && !find){
				find=true;
			}
		}
		if (!find){
			ltr.add(producteur);
		}
		n.setProducteurs(ltr);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveProducteurNotificationRest/{id_notif}").buildAndExpand(producteur.getId_producteur()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/saveTransporeuretrangerXD/{id_notif}/{id_trans}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveTransporeuretrangerXD(UriComponentsBuilder ucBuilder,@PathVariable int id_trans, @PathVariable int id_notif,MultipartFile file,String raison,String matricule,String type_vehicule,String adresse,String port[]) throws IOException {


		TransporteurEtranger trans = null;
		String cc ="";

		if(id_trans==0){
			trans = new TransporteurEtranger();
			if(file!=null){
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
				trans.setId_TransporteurEtranger(id_trans);
			}
		}else if (id_trans>0){
			trans = transporteurEtrangerRepository.getOne(id_trans);

			if(file==null){
				cc = trans.getUrl_assurance();
			}else{
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
			}
		}
		List<Port> l = new ArrayList<Port>();
		String x ="";
		for (String c :port){

			x = c.replace("\"","");
			x = x.replace("[","");
			x = x.replace("]","");
			if(!x.equals("")) {
				Port p = new Port();
				p.setNom_fr(x);
				portRepository.save(p);
				l.add(p);
			}
		}


		trans.setRaison_social(raison);
		trans.setNum_matricule(matricule);
		trans.setTypeVehicule(type_vehicule);
		trans.setAdresse(adresse);
		trans.setType("ti");
		trans.setPort(l);
		trans.setUrl_assurance(cc);
		trans = transporteurEtrangerRepository.save(trans);

		Notification n = notificationRepository.getbyid(id_notif);
		List<TransporteurEtranger> ltr = n.getTransporteur_etranger();
		Boolean find = false;
		for (TransporteurEtranger tmp:ltr) {
			if(tmp.getId_TransporteurEtranger()==trans.getId_TransporteurEtranger() && !find){
				find=true;
			}
		}
		if (!find){
			ltr.add(trans);
		}
		n.setTransporteur_etranger(ltr);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveTransporeuretranger/{id}").buildAndExpand(trans.getId_TransporteurEtranger()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/saveTransporeuretranger/{id_notif}/{id_trans}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveTransporeuretranger(UriComponentsBuilder ucBuilder,@PathVariable int id_trans, @PathVariable int id_notif,MultipartFile file,String raison,String matricule,String type_vehicule,String adresse) throws IOException {


		TransporteurEtranger trans = null;
		String cc ="";

		if(id_trans==0){
			trans = new TransporteurEtranger();
			if(file!=null){
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
				trans.setId_TransporteurEtranger(id_trans);
			}
		}else if (id_trans>0){
			trans = transporteurEtrangerRepository.getOne(id_trans);

			if(file==null){
				cc = trans.getUrl_assurance();
			}else{
				String fileName = fileStorageService.storeFile(file);
				cc = "/assets/myFile/" + fileName;
			}
		}
		List<Port> l = new ArrayList<Port>();
		String x ="";
		/*for (String c :port){

				x = c.replace("\"","");
				x = x.replace("[","");
				x = x.replace("]","");
				if(!x.equals("")) {
					Port p = new Port();
					p.setNom_fr(x);
					portRepository.save(p);
					l.add(p);
				}
			}*/


		trans.setRaison_social(raison);
		trans.setNum_matricule(matricule);
		trans.setTypeVehicule(type_vehicule);
		trans.setAdresse(adresse);
		trans.setType("ti");
		//trans.setPort(l);
		trans.setUrl_assurance(cc);
		trans = transporteurEtrangerRepository.save(trans);

		Notification n = notificationRepository.getbyid(id_notif);
		List<TransporteurEtranger> ltr = n.getTransporteur_etranger();
		Boolean find = false;
		for (TransporteurEtranger tmp:ltr) {
			if(tmp.getId_TransporteurEtranger()==trans.getId_TransporteurEtranger() && !find){
				find=true;
			}
		}
		if (!find){
			ltr.add(trans);
		}
		n.setTransporteur_etranger(ltr);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveTransporeuretranger/{id}").buildAndExpand(trans.getId_TransporteurEtranger()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


	@RequestMapping(value = "/savePortRest/{id_notif}/{id_port}", method = RequestMethod.POST)
	public ResponseEntity<Void> savePort(UriComponentsBuilder ucBuilder,@PathVariable int id_port, @PathVariable int id_notif,String nom_fr, int pays) throws IOException {

		Port port = null;

		if(id_port==0){
			port = new Port();
			port.setId_port(id_port);
		}else if (id_notif>0){
			port = portRepository.getOne(id_port);
		}

		Pays p=paysRepository.getOne(pays);
		port.setPays(p);
		port.setNom_fr(nom_fr);
		portRepository.save(port);

		Notification n = notificationRepository.getbyid(id_notif);
		List<Port> ltr = n.getPorts();
		Boolean find = false;
		for (Port tmp:ltr) {
			if(tmp.getId_port()==port.getId_port() && !find){
				find=true;
			}
		}
		if (!find){
			ltr.add(port);
		}
		n.setPorts(ltr);
		notificationRepository.save(n);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/savePort/{id}").buildAndExpand(n.getId_notification()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


	@RequestMapping(value = "/getTransporteurEtrangerByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<TransporteurEtranger> getTransporteurEtrangerByIdRest(@PathVariable int id) {
		TransporteurEtranger res=null;
		if(id>0){
			res = transporteurEtrangerRepository.getOne(id);
			if(res==null ){
				return new ResponseEntity<TransporteurEtranger>(res, HttpStatus.NO_CONTENT);
			}
			return new ResponseEntity<TransporteurEtranger>(res, HttpStatus.OK);
		}
		return new ResponseEntity<TransporteurEtranger>(res, HttpStatus.NO_CONTENT);
	}

	@RequestMapping(value = "/getProducteurByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<Producteur> getProducteurByIdRest(@PathVariable int id) {
		Producteur res = producteurRepository.getOne(id);
		if(res==null){
			return new ResponseEntity<Producteur>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Producteur>(res, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPaysAutoriteRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<PaysAutorite> getPaysAutoriteRest(@PathVariable int id) {
		PaysAutorite res = paysAutoriteRepository.getOne(id);
		if(res==null){
			return new ResponseEntity<PaysAutorite>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<PaysAutorite>(res, HttpStatus.OK);
	}


	@RequestMapping(value = "/deleteTransporteuretrangerRest/{id_trans}/{id_notif}", method = RequestMethod.GET)
	public void deleteTransporteurEtrangerByIdRest(@PathVariable int id_trans,@PathVariable int id_notif) {

		Notification n = notificationRepository.getbyid(id_notif);
		List<TransporteurEtranger> ltr = n.getTransporteur_etranger();
		TransporteurEtranger trans = transporteurEtrangerRepository.getOne(id_trans);
		ltr.remove(trans);
		n.setTransporteur_etranger(ltr);
		trans.setDeleteDateTime(new Date());

		notificationRepository.save(n);
		transporteurEtrangerRepository.save(trans);

	}


	@RequestMapping(value = "/deleteProducteurNotificationRest/{id_prod}/{id_notif}", method = RequestMethod.GET)
	public void deleteProducteurNotificationRest(@PathVariable int id_prod,@PathVariable int id_notif) {

		Notification n = notificationRepository.getbyid(id_notif);
		List<Producteur> ltr = n.getProducteurs();
		Producteur producteur = producteurRepository.getOne(id_prod);
		ltr.remove(producteur);
		n.setProducteurs(ltr);
		producteur.setDeleteDateTime(new Date());

		notificationRepository.save(n);
		producteurRepository.save(producteur);

	}

	@RequestMapping(value = "/deleteAutoriteNotifRest/{id_aut}/{id_notif}", method = RequestMethod.GET)
	public void deleteAutoriteNotifRest(@PathVariable int id_aut,@PathVariable int id_notif) {

		Notification n = notificationRepository.getbyid(id_notif);
		List<PaysAutorite> ltr = n.getPaysAutorites();
		PaysAutorite paysAutorite = paysAutoriteRepository.getOne(id_aut);
		ltr.remove(paysAutorite);
		n.setPaysAutorites(ltr);
		paysAutorite.setDeleteDateTime(new Date());

		notificationRepository.save(n);
		paysAutoriteRepository.save(paysAutorite);

	}

	@RequestMapping(value = "/deletePortRest/{id}/{id_trans}", method = RequestMethod.GET)
	public void deletePortByIdRest(@PathVariable int id, @PathVariable int id_trans) {
		TransporteurEtranger n = transporteurEtrangerRepository.getOne(id_trans);
		List<Port> ltr = n.getPort();
		Port p = portRepository.getOne(id);
		ltr.remove(p);
		n.setPort(ltr);
		portRepository.delete(p);
		transporteurEtrangerRepository.save(n);
	}

	@RequestMapping(value = "/deletePortNotifRest/{id}/{id_port}", method = RequestMethod.GET)
	public void deletePortNotifRest(@PathVariable int id, @PathVariable int id_port) {
		Notification n = notificationRepository.getbyid(id);
		List<Port> ltr = n.getPorts();
		Port p = portRepository.getOne(id_port);
		ltr.remove(p);
		n.setPorts(ltr);
		portRepository.delete(p);
		notificationRepository.save(n);
	}


	@RequestMapping(value = "/updateDemandeInformationRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> updateDemandeInformationRest(@PathVariable int id, @RequestBody DemandeInformation d,UriComponentsBuilder ucBuilder) throws UnknownHostException, JsonProcessingException {

		demandeInformationRepository.save(d);
		/*if(id>0){
			DemandeInformation d_tmp = demandeInformationRepository.getOne(id);
			d_tmp.setConsistance_proj(d.getConsistance_proj());
			d_tmp.setNature_projet(d.getNature_projet());
			d_tmp.setMontant_investissement(d.getMontant_investissement());
			d_tmp.setIntitule_projet(d.getIntitule_projet());
			d_tmp.setType(d.getType());
		}	*/
		int cpt=0;
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				if (a.getStatut().getNom_fr().equals("Brouillon")) {
					cpt++;
				}
				if (cpt >= 1) {
					break;
				}
				else {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
		}
		if (cpt < 1) {
			if (d.getStatut().getNom_fr().equals("Brouillon")) {
				webs.addAuditAutorisation("Enregistrement comme brouillon", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}else {
				webs.addAuditAutorisation("Demande de numéro de notification", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/createDeclarationTransporteurRest/{id_trans}/{id_notif}/{id_decl}").buildAndExpand("","","").toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/updateDemandeInformationEERest/{id}/{intitule_projet}/{montant_investissement}/{tronsfrontalier}/{interregion}", method = RequestMethod.GET)
	public ResponseEntity<String> updateDemandeInformationEERest(@PathVariable int id, @PathVariable String intitule_projet,@PathVariable double montant_investissement,@PathVariable String tronsfrontalier, @PathVariable String interregion) throws UnknownHostException, JsonProcessingException {
		DemandeInformation d = demandeInformationRepository.getOne(id);
		d.setMontant_investissement(montant_investissement);
		d.setIntitule_projet(intitule_projet);
		d.setTronsfrontalier(tronsfrontalier);
		d.setInterregion(interregion);
		//d.setType("EE");
		d=demandeInformationRepository.save(d);
		int cpt=0;
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				if (a.getStatut().getNom_fr().equals("Brouillon")) {
					cpt++;
				}
				if (cpt >= 1) {
					break;
				}
				else {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
		}
		if (cpt < 1) {
			if (d.getStatut().getNom_fr().equals("Brouillon")) {
				webs.addAuditAutorisation("Enregistrement comme brouillon", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}else {
				webs.addAuditAutorisation("Demande de numéro de notification", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}
		}
		return new ResponseEntity<String>(String.valueOf(d.getId_demande_information()), HttpStatus.OK);
	}

	@RequestMapping(value = "/updateDemandeInformationAERest/{id}/{intitule_projet}/{montant_investissement}/{nature_projet}", method = RequestMethod.GET)
	public ResponseEntity<String> updateDemandeInformationAERest(@PathVariable int id, @PathVariable String intitule_projet,@PathVariable double montant_investissement,@PathVariable String nature_projet) throws UnknownHostException, JsonProcessingException {

		DemandeInformation d = demandeInformationRepository.getOne(id);
		d.setMontant_investissement(montant_investissement);
		d.setIntitule_projet(intitule_projet);
		d.setNature_projet(nature_projet);
		//d.setType("AE");
		d=demandeInformationRepository.save(d);
		int cpt=0;
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				if (a.getStatut().getNom_fr().equals("Brouillon")) {
					cpt++;
				}
				if (cpt >= 1) {
					break;
				}
				else {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
		}
		if (cpt < 1) {
			if (d.getStatut().getNom_fr().equals("Brouillon")) {
				webs.addAuditAutorisation("Enregistrement comme brouillon", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}else {
				webs.addAuditAutorisation("Demande de numéro de notification", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());
			}
		}
		return new ResponseEntity<String>(String.valueOf(d.getId_demande_information()), HttpStatus.OK);
	}

	@RequestMapping(value = "/getNombreEIEByUserRest/{id_compt}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Integer> getNombreEEByUserRest(@PathVariable int id_compt,@PathVariable String type) {
		Integer nbr = 0;
		nbr = demandeInformationRepository.getNombreEEByUser(id_compt,type);
		return new ResponseEntity<Integer>(nbr, HttpStatus.OK);
	}
	@RequestMapping(value = "/getDocumentDechetNDRest", method = RequestMethod.GET)
	public ResponseEntity<DocumentDechetND> getDocumentDechetNDRest() {
		DocumentDechetND res = documentDechetNdRepository.getDocumentDechetND();
		if(res==null){
			return new ResponseEntity<DocumentDechetND>(res, HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DocumentDechetND>(res, HttpStatus.OK);
	}

	/*@RequestMapping(value = "/updateDemandeInformationRest/{id}/{intitule_projet}/{montant_investissement}/{tronsfrontalier}", method = RequestMethod.GET)
	public ResponseEntity<String> updateDemandeInformationRest(@PathVariable int id,@PathVariable String intitule_projet,@PathVariable int montant_investissement,@PathVariable String tronsfrontalier) {

		DemandeInformation d = demandeInformationRepository.getOne(id);
		d.setMontant_investissement(montant_investissement);
		d.setIntitule_projet(intitule_projet);
		d.setTronsfrontalier(tronsfrontalier);
		d=demandeInformationRepository.save(d);
		return new ResponseEntity<String>(String.valueOf(d.getId_demande_information()), HttpStatus.OK);
	}*/

	@RequestMapping(value = "/setFileToDemandeRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<String> setFileToDemandeRest(@PathVariable int id,MultipartFile file) throws UnknownHostException, JsonProcessingException {

		DemandeInformation d = demandeInformationRepository.getOne(id);

		List<ListDocReunion> ld = new ArrayList<>();
		ListDocReunion dd = new ListDocReunion();
		String fileName = fileStorageService.storeFile(file);
		String cc = "/assets/myFile/" + fileName;
		dd.setUrl_file(cc);
		dd=listDocReunionRepository.save(dd);
		ld.add(dd);
		d.setListDocReunions(ld);
		d.setStatut(statutProjetRepository.getOne(61));
		demandeInformationRepository.save(d);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(d.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		webs.addAuditAutorisation("Documents Attachés (Réunion)", d.getNum_demande(), d.getType(), d.getStatut(), d.getCompte());

		return new ResponseEntity<String>(String.valueOf(d.getId_demande_information()), HttpStatus.OK);
	}

	@RequestMapping(value = "/getTransporteurParamByCodeRest/{code}", method = RequestMethod.GET)
	public ResponseEntity<TransporteurParam[]> getTransporteurParamByCodeRest(@PathVariable int code) {
		TransporteurParam[] t = transporteurParamRepository.getTransporteurByCode(code);
		if(t.length==0){
			return new ResponseEntity<TransporteurParam[]>(t,HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<TransporteurParam[]>(t, HttpStatus.OK);
	}

	@RequestMapping(value = "/searchRest/{txt}", method = RequestMethod.GET)
	public ResponseEntity<TransporteurParam[]> getTransporteurParamByCodeRest(@PathVariable String txt) {
		TransporteurParam[] t = transporteurParamRepository.Search(txt);
		return new ResponseEntity<TransporteurParam[]>(t, HttpStatus.OK);
	}


	@RequestMapping(value = "/saveDocumentMouvementRest/{id_notif}/{id_detail}", method = RequestMethod.POST)
	public ResponseEntity<Notification> saveDocumentMouvementRest(@PathVariable int id_notif,@PathVariable int id_detail,String qte, MultipartFile file) {

		Notification n = notificationRepository.getOne(id_notif);
		DetailDocumentMouvement d = null;
		List<DetailDocumentMouvement> ld = n.getDocMouvement();
		if (id_detail==0){
			d = new DetailDocumentMouvement();
		}else{
			d = detailDocumentMouvementRepository.getOne(id_detail);
		}

		d.setQuantite(qte);
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/assets/myFile/" + fileName;
			d.setUrl(cc);
		}
		d = detailDocumentMouvementRepository.save(d);
		if(!ld.contains(d)){
			ld.add(d);
			n.setDocMouvement(ld);
		}

		n.setQuantite_reel(String.valueOf(Integer.parseInt((n.getQuantite_reel()==null || n.getQuantite_reel().equals(""))?"0":n.getQuantite_reel())+Integer.parseInt(qte)));

		n = notificationRepository.save(n);
		return new ResponseEntity<Notification>(n, HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteDocMouvbyIdRest/{id}/{id_notif}", method = RequestMethod.GET)
	public ResponseEntity<Notification> deleteDocMouvbyIdRest(@PathVariable int id,@PathVariable int id_notif) {
		DetailDocumentMouvement d = detailDocumentMouvementRepository.getOne(id);
		Notification n = notificationRepository.getbyid(id_notif);
		List<DetailDocumentMouvement> ld = n.getDocMouvement();
		ld.remove(d);
		n.setDocMouvement(ld);
		n.setQuantite_reel(String.valueOf(Integer.parseInt(n.getQuantite_reel())-Integer.parseInt(d.getQuantite())));
		d.setDeleteDateTime(new Date());
		detailDocumentMouvementRepository.save(d);
		n = notificationRepository.save(n);
		if(d==null){
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(n, HttpStatus.OK);
	}

	@RequestMapping(value = "/setNbrColiesRest/{id_notif}/{nbr}", method = RequestMethod.GET)
	public ResponseEntity<String> setNbrColiesRest(@PathVariable int id_notif,@PathVariable String nbr) {

		Notification n = notificationRepository.getbyid(id_notif);
		n.setNbr_colis(nbr);
		n = notificationRepository.save(n);
		if(n==null){
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}


	@RequestMapping(value = "/setdocMouvementRest/{id_notif}/{type}", method = RequestMethod.POST)
	public ResponseEntity<String> setdocMouvementRest(MultipartFile file,@PathVariable int id_notif,@PathVariable int type) {

		Notification n = notificationRepository.getbyid(id_notif);
		String fileName = fileStorageService.storeFile(file);
		String cc = "/assets/myFile/" + fileName;
		if(type==1){
			n.setUrl_certicat_elimination(cc);
		}
		else if(type==2){
			n.setUrl_quantite_justificatif(cc);
		}
		n = notificationRepository.save(n);
		if(n==null){
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}


	@RequestMapping(value = "/setdocMouvementNonDangereuxRest/{id_notif}", method = RequestMethod.POST)
	public ResponseEntity<String> setdocMouvementNonDangereuxRest(MultipartFile file,@PathVariable int id_notif) {

		Notification n = notificationRepository.getbyid(id_notif);
		String fileName = fileStorageService.storeFile(file);
		String cc = "/assets/myFile/" + fileName;
		n.setUrl_document_mouvement(cc);
		n = notificationRepository.save(n);
		if(n==null){
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}

	@RequestMapping(value = "/getdeclarationbyNotificationRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<DeclarationTransporteur> getdeclarationbyNotificationRest(@PathVariable int id) {
		DeclarationTransporteur d = declarationTransporteurRepository.getlastDeclarationByNotificationId(id);

		return new ResponseEntity<DeclarationTransporteur>(d, HttpStatus.OK);
	}


	@RequestMapping(value = "/createDeclarationTransporteurRest/{id_trans}/{id_notif}/{id_decl}", method = RequestMethod.POST)
	public ResponseEntity<Void> createDeclarationTransporteurRest(MultipartFile file,@PathVariable int id_trans,@PathVariable int id_notif,@PathVariable int id_decl, UriComponentsBuilder ucBuilder) throws JsonProcessingException, UnknownHostException {
		DeclarationTransporteur d = null;
		Notification n = notificationRepository.getOne(id_notif);
		if(id_decl>0){
			d = declarationTransporteurRepository.getOne(id_decl);
		}else{
			d= new DeclarationTransporteur();
		}
		d.setTransporteurParam(transporteurParamRepository.getOne(id_trans));
		d.setNotification(notificationRepository.getOne(id_notif));
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/dowload_uploaded/" + fileName;
			d.setUrl_file(cc);
		}
		d.setEtat("0");
		d.setDateModification(new Date());
		d = declarationTransporteurRepository.save(d);
		n.setStatut(statutProjetRepository.getOne(66));
		notificationRepository.save(n);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		webs.addAuditAutorisation("Attente de validation du Transporteur", n.getNum_notification(), n.getZf_et(), n.getStatut(),n.getCompte());

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/createDeclarationTransporteurRest/{id_trans}/{id_notif}/{id_decl}").buildAndExpand(d.getTransporteurParam().getId_transporteurParam(),d.getNotification().getId_notification(),d.getDeclarationId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/getDeclaravionValideByNotificationIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<DeclarationTransporteur> getDeclaravionValideByNotificationIdRest(@PathVariable int id) {
		DeclarationTransporteur d = declarationTransporteurRepository.getDeclarationTransValideByNotification(id);
		return new ResponseEntity<DeclarationTransporteur>(d, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDeclaravionByNotificationIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<DeclarationTransporteur> getDeclaravionByNotificationIdRest(@PathVariable int id) {
		DeclarationTransporteur d = declarationTransporteurRepository.getDeclarationTransByNotification(id);
		return new ResponseEntity<DeclarationTransporteur>(d, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDocumentImortationDechetRest", method = RequestMethod.GET)
	public ResponseEntity<DocumentImportationDechet> getDocumentImortationDechetRest() {
		DocumentImportationDechet d = documentImortationDechetRepository.getDocumentImortationDechet();
		return new ResponseEntity<DocumentImportationDechet>(d, HttpStatus.OK);
	}

	@RequestMapping(value = "/changerStatutNotifRest/{id_notification}", method = RequestMethod.GET)
	public ResponseEntity<Notification> ChangerStatutNotif(@PathVariable int id_notification) {
		Notification n = notificationRepository.getbyid(id_notification);
			n.setStatut(statutProjetRepository.getById(94));
			notificationRepository.save(n);
		if (n == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(n, HttpStatus.OK);
	}

	@RequestMapping(value = "/changerStatutInstallRest/{id_installation}", method = RequestMethod.GET)
	public ResponseEntity<Installation> ChangerStatutInstall(@PathVariable int id_installation) {
		Installation n = installationRepository.getOne(id_installation);
		n.setStatut(statutProjetRepository.getById(88));
		installationRepository.save(n);
		if (n == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(n, HttpStatus.OK);
	}

	@RequestMapping(value = "/changerStatutCTRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> ChangerStatutCT(@PathVariable int id) {
		CollecteTransporteur ct = collecteRepository.getById(id);
		ct.setStatut(statutProjetRepository.getById(19));
		collecteRepository.save(ct);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}

	@RequestMapping(value = "/changerStatutITRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> ChangerStatutIT(@PathVariable int id) {
		Installation it = installationDechetRepository.getById(id);
		it.setStatut(statutProjetRepository.getById(88));
		installationRepository.save(it);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}

	@RequestMapping(value = "/changerTypeITRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> ChangerTypeIT(@PathVariable int id) {
		Installation it = installationDechetRepository.getById(id);
		if(it.getType().equals("3")){
			it.setType("1");
		}
		installationRepository.save(it);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}

	@RequestMapping(value = "/changerEtat/{id}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Notification> changerEtat(@PathVariable int id,@PathVariable String type) throws UnknownHostException, JsonProcessingException {
		Notification x = null;
		if(type.equals("ZF") || type.equals("TR") || type.equals("XD") || type.equals("ET")){
			Notification n = notificationRepository.getbyid(id);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_notification());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			if(n.getStatut().getId_statut_projet()==63){
				webs.addAuditAutorisation("en attente de la Validation de certificat", n.getNum_notification(), n.getZf_et(), n.getStatut(),n.getCompte());
			}else {
				webs.addAuditAutorisation("en attente de la Validation des Documents", n.getNum_notification(), n.getZf_et(), n.getStatut(), n.getCompte());
			}
		}
		else if(type.equals("CT")){
			CollecteTransporteur n = collecteRepository.getbyid(id);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Attente Validation des Documents", n.getNum_demande(), "CT", n.getStatut(),n.getCompte());
		}
		else if(type.equals("EE") || type.equals("NT") || type.equals("AE")){
			DemandeInformation n = demandeInformationRepository.getOne(id);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Attente Validation des Documents", n.getNum_demande(), n.getType(), n.getStatut(),n.getCompte());
		}
		else {
			Installation n = installationRepository.getOne(id);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(n.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Attachement des Documents", n.getNum_demande(), "IT", n.getStatut(),n.getCompte());
		}

		return new ResponseEntity<Notification>(x,HttpStatus.OK);
	}

	@RequestMapping(value = "/getListTransporteurParamByCodeNotInNotifRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<TransporteurParam[]> getListTransporteurParamByCodeNotInNotifRest(@PathVariable int id) {
		Notification n = notificationRepository.getOne(id);
		List<Integer> l_ids = new ArrayList<Integer>();
		if(n.getTransporteur().size()>0)
		for (TransporteurParam tmp : n.getTransporteur()) {
			l_ids.add(tmp.getId_transporteurParam());
		}else{
			l_ids.add(-1);
		}

		List<TransporteurParam> t = transporteurParamRepository.getTransporteurByCodeNotIn(n.getCode().getId_code(),l_ids);

		TransporteurParam[] res = new TransporteurParam[t.size()];
		t.toArray(res);

		return new ResponseEntity<TransporteurParam[]>(res, HttpStatus.OK);
	}


	@RequestMapping(value = "/saveDemandeAERest/{id}/{idcompt}", method = RequestMethod.POST)
	public ResponseEntity<Void> saveDemandeAERest(@PathVariable int id,@PathVariable int idcompt,MultipartFile file, UriComponentsBuilder ucBuilder) throws JsonProcessingException {

		DemandeInformation d=demandeInformationRepository.getOne(id);
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/dowload_uploaded/" + fileName;
			d.setUrl_file_AE(cc);
		}
		demandeInformationRepository.save(d);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/saveDemandeAERest/{id}/{idcompt}").buildAndExpand(d.getId_demande_information(),idcompt).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/saveFile_complementaireRest/{id_dmd}/{id_ae}/{id_compt}", method = RequestMethod.POST)
	public ResponseEntity<String> getListTransporteurParamByCodeNotInNotifRest(@PathVariable int id_dmd,@PathVariable int id_ae,@PathVariable int id_compt,MultipartFile file) {
		DocumentsAE d = documentsAERepository.getOne(id_ae);
		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/dowload_uploaded/" + fileName;
			d.setUrl_file(cc);
		}
		DemandeInformation dd = demandeInformationRepository.getdemandeByComptId(id_dmd,id_compt);
		dd.setStatut(statutProjetRepository.getOne(12));//conforme
		documentsAERepository.save(d);
		return new ResponseEntity<String>("save", HttpStatus.OK);
	}

	@RequestMapping(value = "/saveFile_Rapport_aeRest/{id_dmd}/{id_rapport}/{id_compt}", method = RequestMethod.POST)
	public ResponseEntity<String> saveFile_Rapport_aeRest(@PathVariable int id_dmd,@PathVariable int id_rapport,@PathVariable int id_compt,MultipartFile file) {

		RapportsAE r = null;
		if(id_rapport>0){
			r = rapportsAERepository.getOne(id_rapport);
		}else{
			r = new RapportsAE();
			SimpleDateFormat sm = new SimpleDateFormat("YYYY-MM-dd");
			r.setDate(sm.format(new Date()));
		}

		if(file!=null){
			String fileName = fileStorageService.storeFile(file);
			String cc = "/dowload_uploaded/" + fileName;
			r.setUrl_file(cc);
		}
		rapportsAERepository.save(r);
		DemandeInformation dd = demandeInformationRepository.getdemandeByComptId(id_dmd,id_compt);
		List<RapportsAE> lr = dd.getRapports_AE();
		if(id_rapport==0){
			lr.add(r);
		}
		dd.setRapports_AE(lr);
		demandeInformationRepository.save(dd);
		return new ResponseEntity<String>("save", HttpStatus.OK);
	}


}
