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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriComponentsBuilder;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
public class RestFulControler {

	@Autowired
	RegionRepository fm;
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
	CompteRepository cr;
	@Autowired
	StatutProjetRepository sp;
	@Autowired
	StatutCollecteRepository statutCollecteRepository;
	@Autowired
	DetailRegionRepository detailRegionRepository;
	@Autowired
	RegionRepository rg;
	@Autowired
	SecurityService secure;
	@Autowired
	NotificationRepository nr;
	@Autowired
	InstallationRepository inr;
	@Autowired
	SecteurRepository str;
	@Autowired
	StatutProjetRepository stRep;
	@Autowired
	ImportateurRepository ir;
	@Autowired
	TransporteurRepository tr;
	@Autowired
	TransporteurParamRepository trP;
	@Autowired
	ImportHistoriqueRepository impRep;
	@Autowired
	ProducteurRepository pr;
	@Autowired
	SocieteRepository st;
	@Autowired
	NotificationRepository notificationRepository;
	@Autowired
	CollecteRepository collecteRepository;

	@Autowired
	CategorieRepository ct;

	@Autowired
	WebService web;

	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private RegionRepository regionRepository;

	@Autowired
	private DemandeInformationRepository demandeinfoRepository;
	@Autowired
	private ReunionRepository reunionRepository;
	@Autowired
	private DocImportRepository docImportRepository;
	@Autowired
	private InstallationRepository instalRepository;

	@Autowired
	private StatutInstallationRepository stIn;

	@Autowired
	private ListDocNotifRepository listDocNotifRepository;

	@Autowired
	private PrefectureRepository prefectureRepository;

	@Autowired
	private CommuneRepository communeRepository;

	@Autowired
	private CategorieDechetRepository categorieDechetRepository;

	@Autowired
	private CodeRepository codeRepository;

	@Autowired
	private CompteRepository compteRepository;


	@Autowired
	private RegionDocRepository regionDocRepository;
	@Autowired
	AuditAutorisationRepository auditAutorisationRepository;

	ObjectMapper objectMapper = new ObjectMapper();

	@RequestMapping(value = "/SelectOneUser/{email}", method = RequestMethod.GET)
	public ResponseEntity<Compte> SelectOneUser(@PathVariable String email) {
		Compte etapeDossier = cr.siExiste(email);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}



	@RequestMapping(value = "/SelectOneUser3/{email}/{Password}", method = RequestMethod.GET)
	public ResponseEntity<Notification> SelectOneUser3(@PathVariable String email,@PathVariable String Password) {
		Notification nt = notificationRepository.siExisteEmailAutorite(Password,email);
		if (nt == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(nt, HttpStatus.OK);
	}


	@RequestMapping(value = "/SelectOneEmail/{email}", method = RequestMethod.GET)
	public ResponseEntity<Compte> SelectOneEmail(@PathVariable String email) {
		Compte etapeDossier = cr.siExisteemailrecup(email);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}
//mon profil ayoub*
	@RequestMapping(value = "/chackmailmonprofil/{email}/{id}", method = RequestMethod.GET)
	public ResponseEntity<Compte> chackmailmonprofil(@PathVariable String email,@PathVariable int id) {
		Compte etapeDossier = cr.siExisteemailrecupmonprofil(email,id);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}
	//mon profil ayoub****


	@RequestMapping(value = "/SelectOneUser2/{email}", method = RequestMethod.GET)
	public ResponseEntity<Compte> SelectOneUser2(@PathVariable String email) {
		Compte etapeDossier = cr.siExisteemailrecup(email);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}
	@RequestMapping(value = "/check_autorisation/{email}/{statut}/{id}", method = RequestMethod.GET)
	public ResponseEntity<Compte> check_autorisation(@PathVariable String email,@PathVariable String statut,@PathVariable int id) {
		Compte etapeDossier = cr.sicheckauto(email,statut,id);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCompteByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<Compte> getCompteById(@PathVariable int id) {
		Compte etapeDossier = cr.getOne(id);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}
	//**********passe******
	@RequestMapping(value = "/getCompteBypasseRest/{passe}", method = RequestMethod.GET)
	public ResponseEntity<Compte> getCompteBypasseRest(@PathVariable String  passe) {
		Compte etapeDossier = cr.getpasse(passe);
		if (etapeDossier == null) {
			return new ResponseEntity<Compte>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Compte>(etapeDossier, HttpStatus.OK);
	}
	//*********************
	@RequestMapping(value = "/updatepasswordRest/{id}/{passe}", method = RequestMethod.POST)
	public ResponseEntity<Void> updatepassword(@PathVariable int id,@PathVariable String passe,@RequestParam String password , UriComponentsBuilder ucBuilder) {

		String passe_2=passe.replace("-","/");
		Compte etapeDossier = cr.getcomptebyidpasse(id,passe_2);
		etapeDossier.setPassword(passwordEncoder.encode(password));
		cr.save(etapeDossier);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/add_object/{id}").buildAndExpand(tr).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/updatepasswordRest2/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> updatepassword(@PathVariable int id,@RequestParam String password , UriComponentsBuilder ucBuilder) {

		Compte etapeDossier = cr.getcomptebyidpasse2(id);
		etapeDossier.setPassword(passwordEncoder.encode(password));
		etapeDossier.setChequer("oui");
		cr.save(etapeDossier);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/add_object/{id}").buildAndExpand(tr).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/findByIdnotifRest/{idnotif}", method = RequestMethod.GET)
	public ResponseEntity<Notification> findByIdnotifRest(@PathVariable int idnotif) {
		Notification nt = nr.getbyid(idnotif);
		if (nt == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(nt, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDemandeInfoByNum/{num}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation> getDemandeInfoByNum(@PathVariable String num) {
		DemandeInformation not = demandeinfoRepository.siExiste(num);
		if (not == null) {
			return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotByNum/{num}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotByNum(@PathVariable String num) {
		Notification not = nr.siExiste(num);
		if (not == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCollByNum/{num}", method = RequestMethod.GET)
	public ResponseEntity<CollecteTransporteur> getCollByNum(@PathVariable String num) {
		CollecteTransporteur not = collecteRepository.siExiste(num);
		if (not == null) {
			return new ResponseEntity<CollecteTransporteur>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<CollecteTransporteur>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstalById/{id}/{compt_id}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstalById(@PathVariable int id,@PathVariable int compt_id) {
		//Installation not = instalRepository.getOne(id);
		Installation ins = instalRepository.getInstallationByCompte(id,compt_id);
		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallByIdentifiant/{id}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallById(@PathVariable int id,@PathVariable int compt_id) {
		//Installation not = instalRepository.getOne(id);
		Installation ins = instalRepository.getOne(id);
		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallByNum/{num}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallByNul(@PathVariable String num) {
		Installation ins = instalRepository.siExiste(num);
		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstalById2Rest/{id}/{compt_id}/{typeRenv}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstalById(@PathVariable int id,@PathVariable int compt_id,@PathVariable String typeRenv) {
		Installation ins = null;
		if(id>0 && typeRenv.equals("N")){
			ins = instalRepository.getInstallationByCompte(id,compt_id);
		}else if(id>0 && typeRenv.equals("R")){
			ins = instalRepository.getInstallationByCompte_deleted(id,compt_id);
		}

		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotByNumzfEt/{num}/{type}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotByNumZFET(@PathVariable String num,@PathVariable String type) {
		Notification not = nr.siExisteZFET(num,type);
		if (not == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDemandeInfoByIdRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation> getDemandeInfoByIdRest(@PathVariable int id) {
		DemandeInformation not = demandeinfoRepository.getOne(id);
		if (not == null) {
			return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDemandeInfoByIdNoticeRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation> getDemandeInfoByIdNoticeRest(@PathVariable int id) {
		DemandeInformation not = demandeinfoRepository.getOne(id);
		not.setStatut(stRep.getById(1));
		demandeinfoRepository.save(not);
		if (not == null) {
			return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getDemandeInfoByIdTypeRest/{id}/{type}", method = RequestMethod.GET)
	public ResponseEntity<DemandeInformation> getDemandeInfoByIdTypeRest(@PathVariable int id, @PathVariable String type) {
		DemandeInformation not = demandeinfoRepository.getDemandeInformationByIdType(id,type);
		if (not == null) {
			return new ResponseEntity<DemandeInformation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DemandeInformation>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getRegionId/{id}", method = RequestMethod.GET)
	public ResponseEntity<Region> getRegionId(@PathVariable int id) {
		Region not = rg.getOne(id);
		if (not == null) {
			return new ResponseEntity<Region>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Region>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPrefectureId/{id}", method = RequestMethod.GET)
	public ResponseEntity<Prefecture> getPrefectureId(@PathVariable int id) {
		Prefecture not = prefectureRepository.getOne(id);
		if (not == null) {
			return new ResponseEntity<Prefecture>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Prefecture>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCommuneId/{id}", method = RequestMethod.GET)
	public ResponseEntity<Commune> getCommuneId(@PathVariable int id) {
		Commune not = communeRepository.getOne(id);
		if (not == null) {
			return new ResponseEntity<Commune>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Commune>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getNotById/{id}", method = RequestMethod.GET)
	public ResponseEntity<Notification> getNotById(@PathVariable int id) throws UnknownHostException, JsonProcessingException {
		Notification not = nr.getOne(id);
		if (not == null) {
			return new ResponseEntity<Notification>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Notification>(not, HttpStatus.OK);
	}

	@RequestMapping(value = "/getInstallById/{id}", method = RequestMethod.GET)
	public ResponseEntity<Installation> getInstallById(@PathVariable int id) {
		Installation ins = inr.getOne(id);
		if (ins == null) {
			return new ResponseEntity<Installation>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Installation>(ins, HttpStatus.OK);
	}

	@RequestMapping(value = "/getProvinceByRegionRest/{id}/{id_dmd}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<List<Prefecture>> getPrefectureByRegion(@PathVariable int[] id,@PathVariable int id_dmd,@PathVariable int id_compt) {
		DemandeInformation d = demandeinfoRepository.getdemandeByComptId(id_dmd,id_compt);
		List<Region> lr = new ArrayList<Region>();
		List<Prefecture> lp = new ArrayList<Prefecture>();
		List<Commune> lc = new ArrayList<Commune>();
		DetailRegion detail = new DetailRegion();
		for (int tmp : id) {
			Region r = null;
			if(tmp>0){
				r = regionRepository.getOne(tmp);
				lr.add(r);
			}


			if(d.getDetailRegion()!=null){
				List<Prefecture> lp_dmd = d.getDetailRegion().getPrefectures();
				List<Commune> lc_dmd = d.getDetailRegion().getCommunes();
				for (Prefecture p : lp_dmd) {
					if(r!=null && r.getPrefecture().contains(p)){
						lp.add(p);
						for (Commune c_tmp : lc_dmd) {
							if(p.getCommune().contains(c_tmp))
								lc.add(c_tmp);
						}
					}
				}
			}
		}
		List<Prefecture> prefecture = prefectureRepository.getAllPrefecturebyRegionId2(id);
		if(lr.size()>0)
			detail.setRegion(lr);
		if(lp.size()>0)
			detail.setPrefectures(lp);
		if(lc.size()>0)
			detail.setCommunes(lc);
		detail = detailRegionRepository.save(detail);
		d.setDetailRegion(detail);
		demandeinfoRepository.save(d);
		if(prefecture == null){
			return new ResponseEntity<List<Prefecture>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Prefecture>>(prefecture, HttpStatus.OK);
	}

	@RequestMapping(value = "/getProvinceByRegion/{id}", method = RequestMethod.GET)
	public ResponseEntity<List<Prefecture>> getProvinceByRegion(@PathVariable int[] id) {

		List<Prefecture> prefecture = prefectureRepository.getAllPrefecturebyRegionId2(id);
		if(prefecture == null){
			return new ResponseEntity<List<Prefecture>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Prefecture>>(prefecture, HttpStatus.OK);
	}
	//*********statut*******
	@RequestMapping(value = "/getAllStatut/", method = RequestMethod.GET)
	public ResponseEntity<String[]> getStatutProjet() {

		String[] Statutprojet = sp.getAllStatutNames();
		if(Statutprojet == null){
			return new ResponseEntity<String[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<String[]>(Statutprojet, HttpStatus.OK);
	}

	@RequestMapping(value = "/getPrefectureByRegion/{id}", method = RequestMethod.GET)
	public ResponseEntity<List<Prefecture>> getPrefectureByRegion(@PathVariable int[] id) {
		List<Prefecture> prefecture = prefectureRepository.getAllPrefecturebyRegionId2(id);
		if(prefecture == null){
			return new ResponseEntity<List<Prefecture>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Prefecture>>(prefecture, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCommuneByPrefecture/{id}", method = RequestMethod.GET)
	public ResponseEntity<List<Commune>> getCommuneByPrefecture(@PathVariable int[] id) {
		List<Commune> communes = communeRepository.getAllCommuneByProvinceId2(id);
		if(communes == null){
			return new ResponseEntity<List<Commune>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Commune>>(communes, HttpStatus.OK);
	}

	@RequestMapping(value = "/getCommuneByPrefectureRest/{id}/{id_dmd}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<List<Commune>> getCommuneByPrefectureRest(@PathVariable int[] id,@PathVariable int id_dmd,@PathVariable int id_compt) {
		DemandeInformation d = demandeinfoRepository.getdemandeByComptId(id_dmd,id_compt);
		List<Prefecture> lp = new ArrayList<Prefecture>();
		List<Commune> lc = new ArrayList<Commune>();
		for (int tmp : id) {
			Prefecture p = null;
			if(tmp>0){
				p = prefectureRepository.getOne(tmp);
				lp.add(p);
			}

			List<Commune> lc_dmd = d.getDetailRegion().getCommunes();
			for (Commune c_tmp : lc_dmd) {
				if(p!=null && p.getCommune().contains(c_tmp))
					lc.add(c_tmp);
			}
		}

		d.getDetailRegion().setPrefectures(lp);
		d.getDetailRegion().setCommunes(lc);
		demandeinfoRepository.save(d);
		List<Commune> communes = communeRepository.getAllCommuneByProvinceId2(id);
		if(communes == null){
			return new ResponseEntity<List<Commune>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Commune>>(communes, HttpStatus.OK);
	}

	@RequestMapping(value = "/savecommuneDetailRegionRest/{id}/{id_dmd}/{id_compt}", method = RequestMethod.GET)
	public ResponseEntity<List<Commune>> savecommuneDetailRegionRest(@PathVariable int[] id,@PathVariable int id_dmd,@PathVariable int id_compt) {
		DemandeInformation d = demandeinfoRepository.getdemandeByComptId(id_dmd,id_compt);
		List<Commune> lc = new ArrayList<Commune>();
		for (int tmp : id) {
			lc.add(communeRepository.getOne(tmp));
		}

		d.getDetailRegion().setCommunes(lc);
		demandeinfoRepository.save(d);
		if(lc == null){
			return new ResponseEntity<List<Commune>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Commune>>(lc, HttpStatus.OK);
	}



	@RequestMapping(value = "/addNumNotifcationRest/{text}", method = RequestMethod.POST)
	public ResponseEntity<Void> addNewForumRest(@RequestBody Notification nt, UriComponentsBuilder ucBuilder,
												@PathVariable String text) throws JsonProcessingException {

		nr.save(nt);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addNumNotification/{id}").buildAndExpand(nt.getId_notification()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addImporteurRest/{text}", method = RequestMethod.POST)
	public ResponseEntity<Void> addImporteurRest(@RequestBody ImportateurNotifiant nt, UriComponentsBuilder ucBuilder,
												 @PathVariable String text) throws JsonProcessingException {
		ir.save(nt);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(
				ucBuilder.path("/addImporteurRest/{id}").buildAndExpand(nt.getId_ImportateurNotifiant()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addTransporteurRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> addTransporteurRest(@RequestBody Transporteur nt, UriComponentsBuilder ucBuilder,
													@PathVariable int id) throws JsonProcessingException {
		Notification not = nr.getOne(id);
		tr.save(nt);
		List<TransporteurParam> transp = not.getTransporteur();
		transp.add(trP.getOne(nt.getId_transporteur()));

		not.setTransporteur(transp);
		nr.save(not);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(
				ucBuilder.path("/addTransporteurRest/{id}").buildAndExpand(nt.getId_transporteur()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addDemandeInformationRest/{type}", method = RequestMethod.POST)
	public ResponseEntity<Void> addDemandeInformationRest(@RequestBody DemandeInformation di, UriComponentsBuilder ucBuilder,
														  @PathVariable String type) throws JsonProcessingException, UnknownHostException {

		boolean rens = false;
		if(type.equals("EE")){
			if(di.getId_demande_information()==0){
				Integer i = demandeinfoRepository.count_EE()+1;
				di.setNum_demande("N-" + i);
			}
			else{
				DemandeInformation d = demandeinfoRepository.getById(di.getId_demande_information());
				if (d != null && (d.getStatut().getId_statut_projet()==11)) {
					Integer i = demandeinfoRepository.count_EE()+1;
					di.setNum_demande("N-" + i);
					rens=true;
				}else if(d!=null ){
					di.setNum_demande(d.getNum_demande());
				}

				if(d.getType().equals("RS")){
					d.setType(type);
				}
			}
		}
		else if(type.equals("RS")){
			if( di.getId_demande_information()==0){
				Integer i =  demandeinfoRepository.count_RS()+1;
				di.setNum_demande("RS-" + i);
			}else{
				di.setNum_demande(demandeinfoRepository.getById(di.getId_demande_information()).getNum_demande());
			}
		}
		else if(type.equals("NT")){
			if( di.getId_demande_information()==0){
				Integer i =  demandeinfoRepository.count_NT()+1;
				di.setNum_demande("NT-" + i);
			}
			else{
				di.setNum_demande(demandeinfoRepository.getById(di.getId_demande_information()).getNum_demande());
			}
		}
		else if(type.equals("AE")){
			if( di.getId_demande_information()==0){
				Integer i =  demandeinfoRepository.count_AE()+1;
				di.setNum_demande("AE-" + i);
			}else{
				di.setNum_demande(demandeinfoRepository.getById(di.getId_demande_information()).getNum_demande());
			}
		}

		di.setDateDepot(new Date());
		List<Categorie> lc = new ArrayList<Categorie>();

		if(di.getId_demande_information()>0){
			DemandeInformation tmp = demandeinfoRepository.getById(di.getId_demande_information());
			di.setDetailRegion(tmp.getDetailRegion());
			di.setStatut(tmp.getStatut());
			di.setUrl_cachier(tmp.getUrl_cachier());
			di.setUrl_enquette(tmp.getUrl_enquette());
			di.setUrl_etude(tmp.getUrl_etude());
			di = tmp;
			if(rens){
				di.setType(type);
			}else{
				di.setType(tmp.getType());
			}
		}
		else{
			di.setStatut(stRep.getOne(47));
			di.setType(type);
		}

		demandeinfoRepository.save(di);
		int cpt=0;
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(di.getNum_demande());
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
			if (di.getStatut().getNom_fr().equals("Brouillon")) {
				secure.addAuditAutorisation("Enregistrement comme brouillon", di.getNum_demande(), di.getType(), di.getStatut(), di.getCompte());
			}else {
				secure.addAuditAutorisation("Demande de numéro de notification", di.getNum_demande(), di.getType(), di.getStatut(), di.getCompte());
			}
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addDemandeInformationRest/{id}")
				.buildAndExpand(di.getId_demande_information()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addDemandeInformationDocRest/{id}/{check}", method = RequestMethod.POST)
	public ResponseEntity<Void> addDemandeInformationDocRest(@PathVariable int id, @PathVariable int check,
															 MultipartFile file, UriComponentsBuilder ucBuilder) throws JsonProcessingException {

		String fileName = fileStorageService.storeFile(file);

		String cc = "/assets/myFile/" + fileName;

		DemandeInformation di = demandeinfoRepository.getById(id);
		di.setDateDepot(new Date());

		/*if (check == 1) {
			di.setUrl_etude(cc);
			if(di.getStatut().getId_statut_projet()!=47)
				di.setStatut(stRep.getOne(1));
		}
		if (check == 2) {
			di.setUrl_cachier(cc);
			if(di.getStatut().getId_statut_projet()!=47)
				di.setStatut(stRep.getOne(1));
		}
		if (check == 3) {
			di.setUrl_enquette(cc);
			if(di.getStatut().getId_statut_projet()!=47)
				di.setStatut(stRep.getOne(1));
		}*/
		if (check == 4) {
			di.setUrl_pv(cc);
		}
		if (check == 5) {
			di.setUrl_presence(cc);
		}

		if (check == 6) {
			di.setUrl_cachier_defenitive(cc);
		}

		if (check == 7) {
			di.setUrl_enquette_defenitive(cc);
		}

		if (check == 66) {
			di.setUrl_avis(cc);

		}
		if (check == 67) {
			di.setUrl_registre(cc);

		}



		demandeinfoRepository.save(di);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addDemandeInformationDocRest/{id}")
				.buildAndExpand(di.getId_demande_information()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}


	@RequestMapping(value = "/addRegionDocRest/{id}/{idRegion}", method = RequestMethod.POST)
	public ResponseEntity<Void> addRegionDocRest(@PathVariable int id, @PathVariable int idRegion,
												 MultipartFile file, UriComponentsBuilder ucBuilder) throws JsonProcessingException {

		RegionDoc regionDoc = null;
		RegionDoc[] tmp = regionDocRepository.getByIdRegion(idRegion,id);
		if(tmp.length==0){
			regionDoc = new RegionDoc();
		}else{
			regionDoc = tmp[0];
		}
		String fileName = fileStorageService.storeFile(file);
		String cc = "/assets/myFile/" + fileName;
		regionDoc.setDoc(cc);
		regionDoc.setRegion(regionRepository.getOne(idRegion));
		regionDocRepository.save(regionDoc);
		DemandeInformation demandeInformation = demandeinfoRepository.getOne(id);
		List<RegionDoc> regionDocs = new ArrayList<RegionDoc>();
		regionDocs.addAll(demandeInformation.getRegiondoc());
		if(tmp.length==0){
			regionDocs.add(regionDoc);
		}

		demandeInformation.setRegiondoc(regionDocs);
		demandeinfoRepository.save(demandeInformation);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addRegionDocRest/{id}")
				.buildAndExpand(demandeInformation.getId_demande_information()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

//	add doc autorisation

	@RequestMapping(value = "/addDocAutRest/{id}/{check}/{typeauto}", method = RequestMethod.POST)
	public ResponseEntity<Void> addDocAutRest(@PathVariable int id, @PathVariable int check,@PathVariable String typeauto, MultipartFile file,
											  UriComponentsBuilder ucBuilder) throws JsonProcessingException, UnknownHostException {

		String fileName = fileStorageService.storeFile(file);
		importHistorique imp = new importHistorique();
		String cc = "/assets/myFile/" + fileName;
		ListDocNotif listDoc = new ListDocNotif();
		if(typeauto.equals("ZF")) {
			if (listDocNotifRepository.ListDocNotifImport(id, check) == null) {
			} else {
				listDoc = listDocNotifRepository.ListDocNotifImport(id, check);
			}


			Notification nt = nr.getOne(id);
			if(nt.getStatut().getId_statut_projet()!=37 && nt.getStatut().getId_statut_projet()!=48 && nt.getStatut().getId_statut_projet()!=49 && nt.getStatut().getId_statut_projet()!=52 && nt.getStatut().getId_statut_projet()!=53){
				nt.setStatut(stRep.getOne(33));
			}

			nt.setDateValidation(new Date());

			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DAY_OF_MONTH, -nt.getNbJour());
			nt.setDateConteur(calendar.getTime());
			nr.save(nt);
			imp.setDate(new Date());
			imp.setEtat("en attente");
			imp.setNotif(nt);
			impRep.save(imp);
			listDoc.setNotif(nr.getOne(id));
		}
		else if(typeauto.equals("CT")) {
			if (listDocNotifRepository.ListDocCollectImport(id, check) == null) {

			} else {
				listDoc = listDocNotifRepository.ListDocCollectImport(id, check);
			}

			CollecteTransporteur nt = collecteRepository.getOne(id)  ;
			listDoc.setCollecte(nt);
			if(nt.getStatut().getId_statut_projet()==41)
				nt.setStatut(stRep.getOne(70));
			else if (nt.getStatut().getId_statut_projet()==42)
				nt.setStatut(stRep.getOne(19));
			collecteRepository.save(nt);
		}
		else if(typeauto.equals("IT")) {
			Installation in=instalRepository.getOne(id);
			if(in.getStatut().getId_statut_projet()==87){
				in.setStatut(stRep.getOne(88));
			} else if(in.getStatut().getId_statut_projet()==15){
				in.setStatut(stRep.getOne(15));
			}
			else
			{
				in.setStatut(stRep.getOne(51));
			}
			instalRepository.save(in);
			if (listDocNotifRepository.ListDocInstallImport(id, check) == null) {

			} else {
				listDoc = listDocNotifRepository.ListDocInstallImport(id, check);
			}
			listDoc.setInstall(instalRepository.getOne(id));
		}
		else if(typeauto.equals("EE") || typeauto.equals("AE") || typeauto.equals("NT")) {
			DemandeInformation nt = demandeinfoRepository.getOne(id);
			if(nt.getStatut().getId_statut_projet()!=59 && nt.getStatut().getId_statut_projet()!=47 && !typeauto.equals("AE")){
				nt.setStatut(stRep.getOne(1));
			}

			nt.setDate_reception(new Date());
			demandeinfoRepository.save(nt);
			/*List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(nt.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			if(nt.getStatut().getId_statut_projet()!=47){
				secure.addAuditAutorisation("Compléter les documents", nt.getNum_demande(), nt.getType(), nt.getStatut(),nt.getCompte());
			}
*/
			if (listDocNotifRepository.ListDocEEImport(id, check) == null) {
			}else{
				listDoc = listDocNotifRepository.ListDocEEImport(id, check);
			}
			listDoc.setDemandeEIE(demandeinfoRepository.getOne(id));
		}
		listDoc.setDocImport(docImportRepository.getOne(check));
		listDoc.setUrl(cc);
		listDocNotifRepository.save(listDoc);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addDocAutRest/{id}").buildAndExpand(listDoc.getId_listDocNotif()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addProducteurRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> addProducteurRest(@RequestBody Producteur nt, UriComponentsBuilder ucBuilder,
												  @PathVariable int id) throws JsonProcessingException {
		Notification not = nr.getOne(id);
		pr.save(nt);
		not.setProducteur(pr.getOne(nt.getId_producteur()));
		nr.save(not);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addProducteurRest/{id}").buildAndExpand(nt.getId_producteur()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/verifiedCompteRest/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> verifiedCompteRest(@PathVariable int id, UriComponentsBuilder ucBuilder)
			throws JsonProcessingException {

		Societe sts = st.getOne(id);
		sts.setEtat("1");
		st.save(sts);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/verifiedCompteRest/{id}").buildAndExpand(sts.getSocietesId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}


	//	login espace client
	@RequestMapping(value = "/login2/{j_name}/{j_pass}", method = RequestMethod.GET)
	public ResponseEntity<String> verifiedCompteRest(Model model, @PathVariable String j_name,
													 @PathVariable String j_pass) throws JsonProcessingException {
		String s = "non";
		if (j_name != null) {
			s = secure.autologin(j_name, j_pass);
			if (s == "oui") {

				s = "oui";
			} else {
				s = "non";
			}

		} else {
			s = "non";
		}
		return new ResponseEntity<String>(s, HttpStatus.OK);
	}

	@RequestMapping(value = "/changeStatutRest/{statut}", method = RequestMethod.POST)
	public ResponseEntity<Void> addSocieteRest(@RequestBody DemandeInformation nt, @PathVariable int statut,
											   UriComponentsBuilder ucBuilder) throws JsonProcessingException, MessagingException, UnknownHostException {
		DemandeInformation dr = demandeinfoRepository.getOne(nt.getId_demande_information());
		if(Objects.equals(dr.getType(), "RS") && dr.getStatut().getId_statut_projet()==1){
			dr.setType("EE");
		}
		dr.setStatut(stRep.getOne(statut));
		dr.setDateDepot(new Date());
		if(!dr.getType().equals("NT"))
			dr.setDateValidation(new Date());
		String num = dr.getNum_demande();
		if(statut == 1 && num.startsWith("RS")){
			Integer i = demandeinfoRepository.count_EE()+1;
			dr.setNum_demande("N-" + i);
		}
		demandeinfoRepository.save(dr);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dr.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(dr.getStatut().getId_statut_projet()==9){
			secure.addAuditAutorisation("Document definitiv attaché", dr.getNum_demande(), dr.getType(), dr.getStatut(),web.getCompteConnected());
		}
		else{
			secure.addAuditAutorisation("dépôt de dossier", dr.getNum_demande(), dr.getType(), dr.getStatut(),web.getCompteConnected());
		}

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(
				ucBuilder.path("/changeStatutRest/{id}").buildAndExpand(nt.getId_demande_information()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}
	@RequestMapping(value = "/changeStatutRestAE/{statut}", method = RequestMethod.POST)
	public ResponseEntity<Void> addSocieteRestAE(@RequestBody DemandeInformation nt, @PathVariable int statut,
												 UriComponentsBuilder ucBuilder) throws JsonProcessingException, MessagingException, UnknownHostException, UnsupportedEncodingException {
		DemandeInformation dr = demandeinfoRepository.getOne(nt.getId_demande_information());
		dr.setStatut(stRep.getOne(statut));
		if(!dr.getType().equals("NT"))
			dr.setDateValidation(new Date());
		String num = dr.getNum_demande();
		demandeinfoRepository.save(dr);


		MimeMessage mimeMessage = emailSender.createMimeMessage();

		boolean multipart = true;

		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;

		messageEmail.setTo(InternetAddress.parse(web.getCompteConnected().getEmail()));
		to_send = true;
		messageEmail.setSubject("Dépot de la demande");
		messageEmail.setText("<p>La demande numéro "+dr.getNum_demande()+" à été déposé avec success</p><br>" +
				"<p>L'état de la demande est : "+dr.getStatut().getNom_fr()+"</p>", true);
		messageEmail.setFrom(dr.getEmail(),"Pétitionnaire");

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}


		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dr.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(dr.getStatut().getId_statut_projet()==1){
			secure.addAuditAutorisation("dépôt de dossier", dr.getNum_demande(), dr.getType(), dr.getStatut(),web.getCompteConnected());
		}
		else{
			secure.addAuditAutorisation("Ajouter les documents définitifs", dr.getNum_demande(), dr.getType(), dr.getStatut(),web.getCompteConnected());
		}

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(
				ucBuilder.path("/changeStatutRestAE/{id}").buildAndExpand(nt.getId_demande_information()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);

	}

	@RequestMapping(value = "/addSocieteRest/{secteur}", method = RequestMethod.POST)
	public ResponseEntity<String> addSocieteRest(@RequestBody Societe nt, @PathVariable int secteur,
												 UriComponentsBuilder ucBuilder) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {

		String nouveauIdentifiant="";
		String emailNt=nt.getEmail();
		String pas = nt.getPassword();
		String objet_email="";

		if(secteur==0){

			Random r = new Random();
			String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			String identifiant = "";
			objet_email="Création";
			for (int i = 0; i < 5; i++) {
				identifiant += alphabet.charAt(r.nextInt(alphabet.length()));
			}

			nouveauIdentifiant=identifiant+"_"+cr.count();
			Compte ct = new Compte();

			ct.setEmailRecup(nt.getEmail());
			nt.setPassword(passwordEncoder.encode(nt.getPassword()));
			st.save(nt);
			ct.setPassword(passwordEncoder.encode(pas));
			ct.setSt(st.getOne(nt.getSocietesId()));
			ct.setEmail(nouveauIdentifiant);
			ct.setNom(nt.getName_fr());

			cr.save(ct);
		}
		else{
			// if(!nt.getPassword().equals("drdrdrdr")){
			// nt.setPassword(passwordEncoder.encode(nt.getPassword()));
			// }
			nt.setSocietesId(secteur);
			st.save(nt);
			Compte ctr=cr.getCompteBysociet(secteur);
			// if(!pas.equals("drdrdrdr")){
			// ctr.setPassword(passwordEncoder.encode(pas));
			// }
			nouveauIdentifiant=ctr.getEmail();
			ctr.setSt(st.getOne(nt.getSocietesId()));
			ctr.setEmailRecup(nt.getEmail());

			cr.save(ctr);

			objet_email="Modification";

		}
		//nt.setEmail(nt.getRaison_fr()+cr.count());
		// ------------- Send email -----------------------------------

		MimeMessage mimeMessage = emailSender.createMimeMessage();

		boolean multipart = true;

		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;

		messageEmail.setTo(InternetAddress.parse(emailNt));
		to_send = true;
		if(objet_email=="Modification")

		{
			String ZF= Objects.equals(nt.getZF(), "on") ?"Importation Des Déchets En Zone Franche":"";
			String ET= Objects.equals(nt.getET(), "on") ?"Importation Des Déchets Non Dangereux D'un pays Etranger":"";;
			String CT= Objects.equals(nt.getCT(), "on") ?"Collecte/Transport Des Déchets ":"";;
			String IT= Objects.equals(nt.getIT(), "on") ?"Installation De Traitement Des Déchets":"";;
			String XD= Objects.equals(nt.getXD(), "on") ?"Exportation Des Déchets Dangereux":"";;
			String TR= Objects.equals(nt.getTR(), "on") ?"Transit Des Déchets":"";;
			String EE= Objects.equals(nt.getEIE(), "on") ?"Etude d’Impact sur l’Environnement":"";;
			String AE= Objects.equals(nt.getEA(), "on") ?"Audit Environnemental":"";;
			String NT= Objects.equals(nt.getNT(), "on") ?"Notice d’Impact sur l’Environnement":"";;
			messageEmail.setSubject(objet_email+" de votre compte");
			messageEmail.setText("<p style='color:black'>Bonjour M/Mme  " +nt.getName_fr()+"</p>"
					+"<p style='color:black'>Nous vous informons que les modifications apportées à votre compte ont été pris en considération,</p>"+
					"<p style='color:black'>veuillez trouver ci-dessous vos nouvelles informations: </p>"+
							"<table style='color:black'><tr><td> identifiant </td><td>: "+nouveauIdentifiant+"</td></tr></td></tr><tr><td>Numero RC </td><td>: "+nt.getNumRc()+"</td></tr><tr><td>Raison Sociale</td><td>: "+nt.getRaison_fr()+"</td></tr><tr><td>Téléphone </td><td>: "+nt.getTel()+"</td></tr><tr><td>Email </td><td>: "+nt.getEmail()+"</td></tr></table>"+
							"<hr style='width:65%'>"+
							"<strong style='color:black'>Les autorisations des déchets  :</strong>" +
							"<p style='color:black'>"+ZF+"</p>"+
							"<p style='color:black'>"+ET+"</p>"+
							"<p style='color:black'>"+IT+"</p>"+
							"<p style='color:black'>"+CT+"</p>"+
							"<p style='color:black'>"+XD+"</p>"+
							"<p style='color:black'>"+TR+"</p>"+
							"<hr style='width:65%'>"+
							"<strong style='color:black'>Evaluation environnemental  :</strong>"+
							"<p style='color:black'>"+EE+"</p>"+
							"<p style='color:black'>"+AE+"</p>"+
							"<p style='color:black'>"+NT+"</p>", true);

		}
		else
		{
		String ZF= Objects.equals(nt.getZF(), "on") ?"Importation Des Déchets En Zone Franche":"";
		String ET= Objects.equals(nt.getET(), "on") ?"Importation Des Déchets Non Dangereux D'un pays Etranger":"";;
		String CT= Objects.equals(nt.getCT(), "on") ?"Collecte/Transport Des Déchets ":"";;
		String IT= Objects.equals(nt.getIT(), "on") ?"Installation De Traitement Des Déchets":"";;
		String XD= Objects.equals(nt.getXD(), "on") ?"Exportation Des Déchets Dangereux":"";;
		String TR= Objects.equals(nt.getTR(), "on") ?"Transit Des Déchets":"";;
		String EE= Objects.equals(nt.getEIE(), "on") ?"Etude d’Impact sur l’Environnement":"";;
		String AE= Objects.equals(nt.getEA(), "on") ?"Audit Environnemental":"";;
		String NT= Objects.equals(nt.getNT(), "on") ?"Notice d’Impact sur l’Environnement":"";;

			messageEmail.setSubject(objet_email+" de votre compte");
			messageEmail.setText("<p style='color:black'>Bonjour M/Mme "  +nt.getName_fr()+"</p>"+
					"<p style='color:black'>Merci d'avoir rejoint e-services.environnement.gov.ma,nous aimerions vous confirmer que votre compte a été créé avec succès,</p>"+
					"<p style='color:black'>veuillez trouver ci-dessous, les informations pour accéder à votre compte:</p>"+
					"<table style='color:black'><tr><td> identifiant </td><td>: "+nouveauIdentifiant+"</td></tr></td></tr><tr><td>Numero RC </td><td>: "+nt.getNumRc()+"</td></tr><tr><td>Raison Sociale</td><td>: "+nt.getRaison_fr()+"</td></tr><tr><td>Téléphone </td><td>: "+nt.getTel()+"</td></tr><tr><td>Email </td><td>: "+nt.getEmail()+"</td></tr></table>"+
					"<hr style='width:65%'>"+
					"<strong style='color:black'>Les autorisations des déchets  :</strong>" +
					"<p style='color:black'>"+ZF+"</p>"+
					"<p style='color:black'>"+ET+"</p>"+
					"<p style='color:black'>"+IT+"</p>"+
					"<p style='color:black'>"+CT+"</p>"+
					"<p style='color:black'>"+XD+"</p>"+
					"<p style='color:black'>"+TR+"</p>"+
					"<hr style='width:65%'>"+
					"<strong style='color:black'>Evaluation environnemental  :</strong>"+
							"<p style='color:black'>"+EE+"</p>"+
							"<p style='color:black'>"+AE+"</p>"+
							"<p style='color:black'>"+NT+"</p>",true);
		}
		messageEmail.setFrom(fromusermail,fromuser);

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addSocieteRest/{id}").buildAndExpand(nouveauIdentifiant).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);

	}


	@RequestMapping(value = "/sendEmailRest/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> sendEmailRest(@PathVariable int id, UriComponentsBuilder ucBuilder) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {

		Compte ct = compteRepository.getOne(id);
		MimeMessage mimeMessage = emailSender.createMimeMessage();

		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");
		boolean to_send = false;
		messageEmail.setTo(InternetAddress.parse(ct.getEmailRecup()));
		to_send = true;
		messageEmail.setSubject("Email de réinitialisation de mot de passe");
		messageEmail.setText("Bonjour M/Mme "+ct.getNom()+"<p>Il semble que vous avez oublié votre mot de passe pour e-services.environnement.gov.ma . </p>"+"" +
				"<p>Pour réinitialiser votre mot de passe <a href='"+urls+"/getforget/"+"AH6543YLOK"+ct.getCompteId()+"GDTGD1213F"+"/"+ct.getPassword().replace("/","-")+"'>cliquer ici </a> </p>"+"" +
				"<p>Si vous n'avez pas oublié votre mot de passe, veuillez ignorer cet e-mail.</p>", true);

		messageEmail.setFrom(fromusermail,fromuser);

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/addSocieteRest/{id}").buildAndExpand(ct.getCompteId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);

	}



	@RequestMapping(value="/updateRegionRest/{id}/{regionId}")
	public  ResponseEntity<List<Prefecture>>  updateRegionRest(@PathVariable int id, @PathVariable int regionId) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {
		Notification nt = notificationRepository.getOne(id);
		Region r = regionRepository.getOne(regionId);
		nt.setRegion(r);
		notificationRepository.save(nt);
		List<Prefecture> prefecture = prefectureRepository.getAllPrefecturebyRegionId(regionId);
		if(prefecture == null){
			return new ResponseEntity<List<Prefecture>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Prefecture>>(prefecture, HttpStatus.OK);
	}

	@RequestMapping(value="/updateRegionCTRest/{regionId}")
	public  ResponseEntity<List<Prefecture>>  updateRegionCTRest(@PathVariable int regionId) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {
		List<Prefecture> prefecture = prefectureRepository.getAllPrefecturebyRegionId(regionId);
		if(prefecture == null){
			return new ResponseEntity<List<Prefecture>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Prefecture>>(prefecture, HttpStatus.OK);
	}

	@RequestMapping(value="/updatePrefectureRest/{id}/{prefectureId}")
	public void updatePrefectureRest(@PathVariable int id, @PathVariable int prefectureId) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {
		Notification nt = notificationRepository.getOne(id);
		Prefecture P = prefectureRepository.getOne(prefectureId);
		nt.setPrefecture(P);
		notificationRepository.save(nt);
	}

	@RequestMapping(value="/updatePrefectureCTRest/{id}/{prefectureId}")
	public void updatePrefectureCTRest(@PathVariable int id, @PathVariable int prefectureId) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {
		CollecteTransporteur nt = collecteRepository.getOne(id);
		Prefecture P = prefectureRepository.getOne(prefectureId);
		nt.setPrefecture(P);
		collecteRepository.save(nt);
	}

	@RequestMapping(value = "/add_object/{table}", method = RequestMethod.POST)
	public ResponseEntity<Void> add_objectt(UriComponentsBuilder ucBuilder, @RequestBody Object obj,
											@PathVariable String table) {

		String requ = "";
		String requ2 = "";
		String val = "";
		@SuppressWarnings("unchecked")
		HashMap<String, String> o = (HashMap<String, String>) obj;
		for (String key : o.keySet()) {
			if (o.get(key) != "") {
				requ2 += key + ",";
				val += "N'" + (o.get(key).replace("'", "''")) + "',";
			}

		}
		String cc = requ2.substring(0, requ2.length() - 1);
		String bb = val.substring(0, val.length() - 1);
		requ = " insert into " + table + "(" + cc + ") values (" + bb + ") select isnull( SCOPE_IDENTITY() ,0) ";
		int tr = regionRepository.add_object(requ);

		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/add_object/{id}").buildAndExpand(tr).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/update_object/{table}/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> update_object(UriComponentsBuilder ucBuilder, @RequestBody Object obj,
											  @PathVariable String table, @PathVariable String id) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {

		String requ = "";
		String requ2 = "";
		String val = "";
		@SuppressWarnings("unchecked")
		HashMap<String, String> o = (HashMap<String, String>) obj;
		for (String key : o.keySet()) {
			if (o.get(key) != "") {
				requ2 += key + "=N'" + (o.get(key).replace("'", "''")) + "',";
			}
		}
		String cc = requ2.substring(0, requ2.length() - 1);

		requ = " update " + table + " set  " + cc + " where " + id + "  select 0 ";
		int tr = regionRepository.add_object(requ);
		if(table.equals("collectetransporteur")){
			int cpt = 0;
			int id_colle = Integer.parseInt(id.replace("id_collecte = ",""));
			CollecteTransporteur c = collecteRepository.getOne(id_colle);
			c.setDeleteDateTime(null);
			collecteRepository.save(c);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(c.getNum_demande());
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
				secure.addAuditAutorisation("Enregistrement comme brouillon", c.getNum_demande(), "CT", c.getStatut(), c.getCompte());
			}
		}
		if(table.equals("installation")){
			int cpt = 0;
			String t[] = id.split("=");
			int id_inst=Integer.parseInt(t[1].trim());
			Installation ins=instalRepository.getOne(id_inst);
			if(ins.getType()!=null && ins.getType().equals("0")){
				List<Code> c = ins.getCode();
				c.removeAll(c);
				ins.setCode(c);
			}
			ins.setDeleteDateTime(null);
			instalRepository.save(ins);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ins.getNum_demande());
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
				secure.addAuditAutorisation("Enregistrement comme brouillon", ins.getNum_demande(), "IT", ins.getStatut(), ins.getCompte());
			}
		}
		if(table.equals("notification")) {
			int cpt = 0;
			String t[] = id.split("=");
			int id_inst = Integer.parseInt(t[1].trim());
			Notification ins = notificationRepository.getOne(id_inst);
			ins.setDeleteDateTime(null);

			notificationRepository.save(ins);

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ins.getNum_notification());
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
				if (ins.getStatut().getNom_fr().equals("Brouillon")) {
					secure.addAuditAutorisation("Enregistrement comme brouillon", ins.getNum_notification(), ins.getZf_et(), ins.getStatut(), ins.getCompte());
				}else {
					secure.addAuditAutorisation("Demande de numéro de notification", ins.getNum_notification(), ins.getZf_et(), ins.getStatut(), ins.getCompte());
				}
			}
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/update_object/{id}").buildAndExpand(id).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/getdemandeinfo/{id}", method = RequestMethod.GET)
	public Reunion checknmprojetdemande(@PathVariable int id) {

		Reunion rn = reunionRepository.getById(id);
		// DemandeInformation dm =
		// demandeinfoRepository.getById(rn.getDemandeInformation().getId_demande_information());

		return rn;
	}

	@RequestMapping(value = "/addCategoriesDechetRest/{id_notif}", method = RequestMethod.POST)
	public ResponseEntity<Void> addCategorieDechet(@PathVariable int id_notif) {

		Installation i = instalRepository.getOne(id_notif);

		List<Code> codes = codeRepository.getAllCode();

		i.setCode(codes);
		instalRepository.save(i);

		HttpHeaders headers = new HttpHeaders();
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/getsocieteRest/{id}", method = RequestMethod.GET)
	public Societe getsociete(@PathVariable int id) {
		Societe societe = st.getById(id);
		return societe;
	}

	@RequestMapping(value = "/tcheckdatereunion/{date}", method = RequestMethod.GET)
	public int tcheckdatereunion(@PathVariable String date) {

		int rn = reunionRepository.checkdatereunion(date);

		return rn;
	}
	@RequestMapping(value = "/getDocImportByTypeREST/{type}", method = RequestMethod.GET)
	public  ResponseEntity<DocImport[]> getDocImportByTypeREST(@PathVariable String type) {
		DocImport[] doc = docImportRepository.getAllDocImportByType(type);
		if (doc == null) {
			return new ResponseEntity<DocImport[]>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<DocImport[]>(doc, HttpStatus.OK);
	}

	@RequestMapping(value = "/getStatutNumNotificationREST/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> getStatutNumNotification(@PathVariable int id ) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {

		Notification notif = notificationRepository.getbyid(id);

		if (notif == null) {
			return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
		}

		if(notif.getStatut().getId_statut_projet()==91 && notif.getImportateur()!=null){
			notif.setStatut(stRep.getById(29));
		}
		notif = notificationRepository.save(notif);


		if(notif.getStatut().getId_statut_projet()==29) {
			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail = notif.getImportateur().getMail();

			if (mail != null) {
				messageEmail.setTo(notif.getImportateur().getMail());
			} else {
			}

			to_send = true;

			messageEmail.setSubject("Création de votre numéro de demande " + notif.getNum_notification());
			String type = "";
			if(notif.getZf_et().equals("ZF")){
				type="Importation des déchets d'une zone franche";
			}else if(notif.getZf_et().equals("XD")){
				type="Exportation des déchets";
			}

			messageEmail.setText("<h3>" + type + "</h3>\n" +
					"Votre numéro de demande <b>" + notif.getNum_notification() + "</b> a été créé avec succès", true);
			messageEmail.setFrom(fromusermail, fromuser);


			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
		}
		return new ResponseEntity<String>(HttpStatus.OK);
	}

		@RequestMapping(value = "/setStatutNotificationRest/{id_notif}/{id_statut}/{compteId}/{type}", method = RequestMethod.GET)
	public ResponseEntity<String> setStatutNotificationRest(@PathVariable int id_notif, @PathVariable int id_statut, @PathVariable int compteId, @PathVariable String type) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		String res = "ko";
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		if (type.equals("CT")) {
			CollecteTransporteur notif = collecteRepository.getCollecteById(id_notif, compteId);
			if (notif == null) {
				return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}
			notif.setStatut(stRep.getOne(id_statut));
			notif.setDateDepot(new Date());
			notif = collecteRepository.save(notif);
			res = notif.getStatut().getId_statut_projet() == id_statut ? "ok" : "ko";

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			messageEmail.setTo(notif.getDemandeurEmail());
			to_send = true;

			messageEmail.setSubject("Traitement de dossier Numéro "+notif.getNum_demande());

			messageEmail.setText("<h3>Collecte/Transport des déchets</h3>\n" +
					"Suite au dépôt de votre dossier numéro "+notif.getNum_demande()+", nous vous informons que votre demande d'autorisation est "+"<b>"+notif.getStatut().getNom_fr()+"</b>" +
					"<p></p>"+
					"<hr style='width:65%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+notif.getNum_demande()+"</div>\n" +
					"<div><b>Raison sociale: </b>"+notif.getRaison()+"</div>\n"+
					"<div><b>Date de dépôt: </b>"+dateFormat.format(notif.getDateDepot())+"</div>"+
					"<div><b>Statut: "+notif.getStatut().getNom_fr()+"</b></div>", true);

			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(notif.getNum_demande());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			secure.addAuditAutorisation("Dépôt de dossier", notif.getNum_demande(), "CT", notif.getStatut(), notif.getCompte());

		}
		else if (type.equals("IT")) {
			Installation notif = instalRepository.getInstallationByCompte(id_notif, compteId);
			if (notif == null) {
				return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}
			notif.setStatut(stRep.getOne(id_statut));
			notif.setDateDepot(new Date());
			notif = instalRepository.save(notif);
			res = notif.getStatut().getId_statut_projet() == id_statut ? "ok" : "ko";

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			messageEmail.setTo(notif.getEmail());
			to_send = true;

			messageEmail.setSubject("Traitement de dossier Numéro "+notif.getNum_demande());

			messageEmail.setText("<h3>Installation de traitement des déchets</h3>\n" +
					"Suite au dépôt de votre dossier numéro "+notif.getNum_demande()+", nous vous informons que votre demande d'autorisation est "+"<b>"+notif.getStatut().getNom_fr()+"</b>" +
					"<p></p>"+
					"<hr style='width:65%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+notif.getNum_demande()+"</div>\n" +
					"<div><b>Raison sociale: </b>"+notif.getRaison()+"</div>\n"+
					"<div><b>Date de dépôt: </b>"+dateFormat.format(notif.getDateDepot())+"</div>"+
					"<div><b>Statut: "+notif.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(notif.getNum_demande());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			secure.addAuditAutorisation("Dépôt de dossier", notif.getNum_demande(), "IT", notif.getStatut(), notif.getCompte());

		}
		else {
			Notification notif = notificationRepository.getNotificationByIdComptId(id_notif, compteId);
			if (notif == null) {
				return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}
			notif.setStatut(stRep.getOne(id_statut));
			notif.setDateDepot(new Date());
			notif = notificationRepository.save(notif);
			res = notif.getStatut().getId_statut_projet() == id_statut ? "ok" : "ko";

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;

			messageEmail.setTo(notif.getImportateur().getMail());

			to_send = true;
			String not="";
			if(notif.getZf_et().equals("ZF")){
				type="Importation des déchets d'une zone franche";
			}else if(notif.getZf_et().equals("ET")){
				type="Importation des déchets non dangereux d'un pays etranger";
			}else if(notif.getZf_et().equals("XD")){
				type="Exportation des déchets dangereux";
			}else if(notif.getZf_et().equals("TR")){
				type="Transit des déchets";
			}
			messageEmail.setSubject("Traitement de dossier numéro "+notif.getNum_notification());
			messageEmail.setText("<h3>"+type+"</h3>\n" +
					"Suite au dépôt de votre dossier numéro <b>"+notif.getNum_notification()+"</b>, nous vous informons que votre demande d'autorisation est "+"<b>"+notif.getStatut().getNom_fr()+"</b>" +
					"<p></p>"+
					"<hr style='width:75%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+notif.getNum_notification()+"</div>\n" +
					"<div><b>Classification des déchets: </b>"+notif.getClassification().getNom_fr()+"</div>\n"+
					"<div><b>Code: </b>"+notif.getCode().getNom_fr()+"</div>\n"+
					"<div><b>Type de déchet: </b>"+notif.getCode().getNom_ar()+"</div>\n" +
					"<div><b>Date de dépôt: </b>"+dateFormat.format(notif.getDateDepot())+"</div>"+
					"<div><b>Statut: "+notif.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(notif.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			if (notif.getStatut().getId_statut_projet() == 64) {
				secure.addAuditAutorisation("Ajouter le certificat d'élimination", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			} else if (notif.getStatut().getId_statut_projet() == 63) {
				secure.addAuditAutorisation("Attente validation certificat", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			} else {
				secure.addAuditAutorisation("Dépôt de dossier", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			}
		}
		return new ResponseEntity<String>(res, HttpStatus.OK);
	}


	///// STP ne supprime pas cette methode
	@RequestMapping(value = "/setStatutNotificationRest1/{id_notif}/{id_statut}/{compteId}", method = RequestMethod.GET)
	public ResponseEntity<String> setStatutNotificationRest1(@PathVariable int id_notif, @PathVariable int id_statut, @PathVariable int compteId) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		String res = "ko";
			Notification notif = notificationRepository.getNotificationByIdComptId(id_notif, compteId);
			if (notif == null) {
				return new ResponseEntity<String>(HttpStatus.NO_CONTENT);
			}
			notif.setStatut(stRep.getOne(id_statut));
			notif = notificationRepository.save(notif);
			res = notif.getStatut().getId_statut_projet() == id_statut ? "ok" : "ko";

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(notif.getNum_notification());
			if (list.size() > 0) {
				for (AuditAutorisation a : list) {
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			if (notif.getStatut().getId_statut_projet() == 64) {
				secure.addAuditAutorisation("Ajouter le certificat d'élimination", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			} else if (notif.getStatut().getId_statut_projet() == 63) {
				secure.addAuditAutorisation("Attente validation certificat", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			} else {
				secure.addAuditAutorisation("Dépôt de dossier", notif.getNum_notification(), notif.getZf_et(), notif.getStatut(), notif.getCompte());
			}

		return new ResponseEntity<String>(res, HttpStatus.OK);
	}


	@RequestMapping(value = "/sendErrorMail")
	public  ResponseEntity<Void> SendErrorMail(int compte,String errorMessage,String errorUrl,int errorStatutCode) throws MessagingException, UnsupportedEncodingException {

		Compte ct = compteRepository.getOne(compte);

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
				"            <td>"+ct.getNom()+" / "+ct.getEmailRecup()+" \t @Petitionnaire</td>\n" +
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

	@RequestMapping(value="/getAllStatutAvenant/{id}")
	public  ResponseEntity<List<Integer>> getAllStatutAvenant(@PathVariable int id) throws JsonProcessingException, MessagingException, UnsupportedEncodingException {
		List<Integer> list = collecteRepository.getListStatutAvenant(id);
		if(list == null){
			return new ResponseEntity<List<Integer>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Integer>>(list, HttpStatus.OK);
	}

}
