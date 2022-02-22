package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.json.JsonParseException;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class ParamControler {
	@Autowired
	private RenouvellementRepository renouvellementRepository;

	@Autowired
	private CategorieRepository categorieRepository;
	@Autowired
	private SecurityService webs;

	@Autowired
	private AuditRepository auditRepository;
	@Autowired
	private ComiteRepository comiteRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private CodeRepository codeRepository;
	@Autowired
	private ClassificationRepository classificationRepository;
	@Autowired
	private CodeparenttRepository codeparenttRepository;
	@Autowired
	private TypeRepository typeRepository;
	@Autowired
	private DocImportRepository docImportRepository;
	@Autowired
	private ParticipantRepository participantRep;
	@Autowired
	private ImportHistoriqueRepository importHistoriqueRepository;
	@Autowired
	WebService web;
	@Autowired
	private NotificationRepository notifRepository;
	@Autowired
	EieDreRepository eieDreRep;
	@Autowired
	private SecteurRepository secteurRepository;
	@Autowired
	private ListDocNotifRepository listDocNotifRepository;
	@Autowired
	private ZonneFrancheRepository zonneFrancheRepository;
	@Autowired
	private DemandeInformationRepository demandeInformationRepository;
	@Autowired
	private PrefectureRepository prefectureRepository;
	@Autowired
	private StatutProjetRepository statutProjetRepository;
	@Autowired
	private CommuneRepository communeRepository;
	@Autowired
	private ReunionRepository reunionRepository;
	@Autowired
	private TransporteurParamRepository transporteurParamRepository;

	@Autowired
	MoyenTransportRepository moyenTransportRepository;
	@Autowired
	LieuEliminationRepository lieuEliminationRepository;
	@Autowired
	PaysRepository paysRepository;
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	NatureActiviteRepository natureActiviteRepository;
	@Autowired
	InstallationDechetRepository installationDechetRepository;
	@Autowired
	VisiteInstallationRepository visiteInstallationRepository;
	@Autowired
	StatutInstallationRepository statutInstallationRepository;
	@Autowired
	CollecteRepository collecteRepository;
	@Autowired
	StatutProjetRepository statutRepository;

	@Autowired
	PosteRepository posteRepository;

	@Autowired
	DocumentDechetNdRepository documentDechetNdRepository;

	@Autowired
	DocumentImortationDechet documentImortationDechet;

	@Autowired
	DocumentInstalationD documentInstalationD;

	@Autowired
	DocumentExportationD documentExportationD;

	@Autowired
	DocumentTransactionD documentTransactionD;

	@Autowired
	DocumentDechetCTRepository documentDechetCTRepository;

	@Autowired
	DocumentEieRepository documentEieRepository;

	@Autowired
	AuditAutorisationRepository auditAutorisationRepository;

	@Autowired
	CategorieDechetRepository categorieDechetRepository;

	@Autowired
	VehiculeRepository vehiculeRepository;

	@Autowired
	CompteRepository compteRepository;
	@Autowired
	DeclarationTransporteurRepository declarationTransporteurRepository;

	@Autowired
	private PrRoleRepository profilRoleRepository;

	@Value("${uploadurl}")
	private String uploadurl;
	@Value("${uploadurl2}")
	private String uploadurl2;
	@Value("${url}")
	private String urlRest;

	@Autowired
	public JavaMailSender emailSender;
	@Value("${urls}")
	private String urls;
	@Value("${fromusermail}")
	private String fromusermail;
	@Value("${fromuser}")
	private String fromuser;

	@Autowired
	AffectationRepository affectationRepository;

	ObjectMapper objectMapper = new ObjectMapper();

//************************ get page parametre ****************************
	@RequestMapping(value = "/api/param", method = RequestMethod.GET)
	public ModelAndView getPageParam() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", web.getCompteConnected());

		model.put("listF", regionRepository.getAllRegion());
		Page<Region> h = regionRepository.getstatutprojetByaction(new PageRequest(0, 6));
		if (h != null) {

			List<Region> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("prefecture", prefectureRepository.getAllPrefecture());

		return new ModelAndView("paramPage", model);
	}

	@RequestMapping(value = "/api/add_object/{table}", method = RequestMethod.POST)
	public @ResponseBody String add_object(@RequestBody Object obj, @PathVariable String table) {

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
		requ = " insert into " + table + "(" + cc + ") values (" + bb + ")  select isnull( SCOPE_IDENTITY() ,0)  ";
		regionRepository.add_object(requ);
		return "text";
	}

	@RequestMapping(value = "/api/getPrefectureSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListePrefectureSearch(@PathVariable("type") String type) {


		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",prefectureRepository.getPrefectureby(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/prefecturetr", model);
	}

	// ***********************parametrage MoyenTransport*************************
	@RequestMapping(value = "/api/getParamLieuElimination", method = RequestMethod.GET)
	public ModelAndView getParamLieuElimination() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", lieuEliminationRepository.getAllLieuElimination());
		model.put("classification", classificationRepository.getAllClassification());
		return new ModelAndView("/param/lieuElimination", model);
	}

	@RequestMapping(value = "/api/postParamLieuElimination", method = RequestMethod.POST)
	public ModelAndView postParamLieuElimination(@RequestBody LieuElimination lieuElimination) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (lieuElimination.getId_lieuElimination()!= 0) {
			int idd = lieuElimination.getId_lieuElimination();

			old =lieuEliminationRepository.getOne(idd);

			action = "modifier";
		}
		if (lieuElimination.getId_lieuElimination()!= 0) {
			webs.addAudit("", action, "", lieuElimination.getId_lieuElimination() + "", old, lieuElimination, "LieuElimination");
			lieuEliminationRepository.save(lieuElimination);
		}
		else{
			lieuEliminationRepository.save(lieuElimination);
			webs.addAudit("", action, "", lieuElimination.getId_lieuElimination() + "", old, lieuElimination, "LieuElimination");
		}
		model.put("classification", classificationRepository.getAllClassification());
		model.put("listF", lieuEliminationRepository.getAllLieuElimination());
		return new ModelAndView("/param/lieuElimination", model);

	}

	@RequestMapping(value = "/api/updateParamLieuElimination/{id}", method = RequestMethod.GET)
	public ModelAndView editParamLieuElimination(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("lieuE", lieuEliminationRepository.getOne(id));
		model.put("classification", classificationRepository.getAllClassification());
		return new ModelAndView("/param/lieuElimination", model);
	}

	@RequestMapping(value = "/api/deleteParamLieuElimination/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamLieuElimination(@PathVariable int id) throws JsonProcessingException {
		LieuElimination l = lieuEliminationRepository.getOne(id);
		LieuElimination oldl = l;
		l.setDeleteDateTime(new Date());
		lieuEliminationRepository.save(l);
		webs.addAudit("", "supprimer", "", l.getId_lieuElimination() + "", oldl, l, "LieuElimination");


	}

	@RequestMapping(value = "/api/getlieuSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getLieuSearch(@PathVariable("type") String type) {


		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",lieuEliminationRepository.getLieuBy(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/Lieutr", model);
	}





	// ***********************parametrage MoyenTransport*************************
	@RequestMapping(value = "/api/getParamMoyenTransport/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamMoyenTransport(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", moyenTransportRepository.getAllMoyenTransport());
		Page<MoyenTransport> h = moyenTransportRepository.getMoyenPage(new PageRequest(page, size));
		if (h != null) {

			List<MoyenTransport> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("/param/moyenTransport", model);
	}

	@RequestMapping(value = "/api/addParamMoyenTransport", method = RequestMethod.POST)
	public ModelAndView saveParamMoyenTransport(@RequestBody MoyenTransport moyenTransport)
			throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (moyenTransport.getId_moyenTransport() != 0) {
			int idd = moyenTransport.getId_moyenTransport();

			old = moyenTransportRepository.getOne(idd);

			action = "modifier";
		}
		if (moyenTransport.getId_moyenTransport() != 0) {
			webs.addAudit("", action, "", moyenTransport.getId_moyenTransport() + "", old, moyenTransport, "MoyenTransport");
			moyenTransportRepository.save(moyenTransport);
		}
		else{
			moyenTransportRepository.save(moyenTransport);
			webs.addAudit("", action, "", moyenTransport.getId_moyenTransport() + "", old, moyenTransport, "MoyenTransport");
		}
		model.put("mTrans", moyenTransportRepository.getAllMoyenTransport());
		return new ModelAndView("/param/moyenTransport", model);
	}

	@RequestMapping(value = "/api/editParamMoyenTransport/{id}", method = RequestMethod.GET)
	public ModelAndView editParamMoyenTransport(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("moyenTrans", moyenTransportRepository.getOne(id));
		;
		return new ModelAndView("/param/moyenTransport", model);
	}

	@RequestMapping(value = "/api/deleteParamMoyenTransport/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamMoyenTransport(@PathVariable int id) throws JsonProcessingException {
		MoyenTransport m = moyenTransportRepository.getOne(id);
		MoyenTransport oldm = m;
		m.setDeleteDateTime(new Date());
		moyenTransportRepository.save(m);
		webs.addAudit("", "supprimer", "", m.getId_moyenTransport() + "", oldm, m, "MoyenTransport");

	}

	@RequestMapping(value = "/api/getMoyentransSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListeMoyenSearch(@PathVariable("type") String type) {


		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",moyenTransportRepository.getMoyentransBy(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/Moyentr", model);
	}






	// ***********************parametrage Transporteur *************************
	@RequestMapping(value = "/api/getParamTransporteur/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamTransporteur(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", transporteurParamRepository.getAllTransporteurParam());
		model.put("code", codeRepository.getAllCode());
		model.put("moyenTransport", moyenTransportRepository.getAllMoyenTransport());
		Page<TransporteurParam> h = transporteurParamRepository.getTransporteurPage(new PageRequest(page, size));
		if (h != null) {

			List<TransporteurParam> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		return new ModelAndView("/param/transporteurParam", model);
	}

	@RequestMapping(value = "/api/addParamTransporteur/{code}/{moyenTransport}", method = RequestMethod.POST)
	public ModelAndView saveParamTransportateur(@RequestBody TransporteurParam transporteurParam,
			@PathVariable int[] code, @PathVariable int[] moyenTransport) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (transporteurParam.getId_transporteurParam() != 0) {
			int idd = transporteurParam.getId_transporteurParam();

			old = transporteurParamRepository.getOne(idd);

			action = "modifier";
		}
		List<Code> c = new ArrayList<Code>();
		List<MoyenTransport> m = new ArrayList<MoyenTransport>();
		if (code[0] == 0) {

		} else {

			for (int i = 0; i < code.length; i++) {
				c.add(codeRepository.getCodeById(code[i]));
			}
		}
		if (moyenTransport[0] == 0) {

		} else {
			for (int i = 0; i < moyenTransport.length; i++) {
				m.add(moyenTransportRepository.getMoyenTransportById(moyenTransport[i]));
			}
		}
		transporteurParam.setCode(c);
		transporteurParam.setMoyenTransport(m);
		if (transporteurParam.getId_transporteurParam() != 0) {
			webs.addAudit("", action, "", transporteurParam.getId_transporteurParam() + "", old, transporteurParam, "TransporteurParam");
			transporteurParamRepository.save(transporteurParam);
		}
		else{
			transporteurParamRepository.save(transporteurParam);
			webs.addAudit("", action, "", transporteurParam.getId_transporteurParam() + "", old, transporteurParam, "TransporteurParam");
		}
		model.put("listF", transporteurParamRepository.getAllTransporteurParam());
		model.put("code", codeRepository.getAllCode());
		model.put("moyenTransport", moyenTransportRepository.getAllMoyenTransport());

		return new ModelAndView("/param/transporteurParam", model);

	}

	@RequestMapping(value = "/api/editParamTransporteur/{id}", method = RequestMethod.GET)
	public ModelAndView editParamTransportateur(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("transporteurP", transporteurParamRepository.getOne(id));
		model.put("code", codeRepository.getAllCode());
		model.put("moyenTransport", moyenTransportRepository.getAllMoyenTransport());
		return new ModelAndView("/param/transporteurParam", model);
	}

	@RequestMapping(value = "/api/deleteParamTransporteur/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamTransportateur(@PathVariable int id) throws JsonProcessingException {
		TransporteurParam m = transporteurParamRepository.getOne(id);
		TransporteurParam oldm = m;
		m.setDeleteDateTime(new Date());
		transporteurParamRepository.save(m);
		webs.addAudit("", "supprimer", "", m.getId_transporteurParam() + "", oldm, m, "MoyenTransport");


	}
	@RequestMapping(value = "/api/getTransporteurSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListeempSearch(@PathVariable("type") String type) {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",transporteurParamRepository.getTransporteurBy(type));
		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/transporteurtr", model);
	}
	// **********************parametrage comite*****************************

	@RequestMapping(value = "/api/getParamComite", method = RequestMethod.GET)
	public ModelAndView getParamComite() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("comiteP", comiteRepository.getAllComite());
		model.put("region", regionRepository.getAllRegion());
		model.put("test", "amal");
		return new ModelAndView("/param/comite", model);
	}

	@RequestMapping(value = "/api/addcomite", method = RequestMethod.POST)
	public ModelAndView saveRegistration(@RequestBody Comite comite) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (comite.getComiteId()!= 0) {
			int idd = comite.getComiteId();

			old = comiteRepository.getOne(idd);

			action = "modifier";
		}
		if (comite.getComiteId()!= 0) {
			webs.addAudit("", action, "", comite.getComiteId() + "", old, comite, "Comite");
			comiteRepository.save(comite);
		}
		else{
			comiteRepository.save(comite);
			webs.addAudit("", action, "", comite.getComiteId() + "", old, comite, "Comite");
		}
		model.put("comiteP", comiteRepository.getAllComite());
		model.put("test", "amal");
		return new ModelAndView("/param/comite", model);



	}

	@RequestMapping(value = "/api/editComite/{id}", method = RequestMethod.GET)
	public ModelAndView editComite(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("comite", comiteRepository.getOne(id));
		model.put("region", regionRepository.getAllRegion());
		return new ModelAndView("/param/comite", model);
	}

	@RequestMapping(value = "/api/deleteComite/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteComite(@PathVariable int id) throws JsonProcessingException {
		Comite c = comiteRepository.getOne(id);
		Comite oldc = c;
		c.setDeleteDateTime(new Date());
		comiteRepository.save(c);
		webs.addAudit("", "supprimer", "", c.getComiteId() + "", oldc, c, "Comite");


	}

    @RequestMapping(value = "/api/getComiteSearch/{type}", method = RequestMethod.GET)
    public ModelAndView getListeComiteSearch(@PathVariable("type") String type) {


        Map<String, Object> model = new HashMap<String, Object>();
        model.put("comiteP",comiteRepository.getComiteBy(type));


        Compte ct = web.getCompteConnected();

        return new ModelAndView("param/Comitetr", model);
    }
//  ***********************parametrzge statut projet************************

	@RequestMapping(value = "/api/getParamStatutProjet/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamStatutProjet(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", statutProjetRepository.getAllStatutProjet());

		Page<StatutProjet> h = statutProjetRepository.getstatutprojetByaction(new PageRequest(page, size));
		if (h != null) {

			List<StatutProjet> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
	//	model.put("listF", statutProjetRepository.getAllStatutProjet());
		return new ModelAndView("/param/statutProjet", model);
	}

	@RequestMapping(value = "/api/postParamStatutProjet", method = RequestMethod.POST)
	public ModelAndView postParamStatutProjet(@RequestBody StatutProjet statut) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (statut.getId_statut_projet() != 0) {
			int idd = statut.getId_statut_projet();

			old = statutProjetRepository.getOne(idd);

			action = "modifier";
		}
		if (statut.getId_statut_projet() != 0) {
			webs.addAudit("", action, "", statut.getId_statut_projet() + "", old, statut, "StatutProjet");
			statutProjetRepository.save(statut);
		}
		else{
			statutProjetRepository.save(statut);
			webs.addAudit("", action, "", statut.getId_statut_projet() + "", old, statut, "StatutProjet");
		}
		model.put("listF", statutProjetRepository.getAllStatutProjet());
		return new ModelAndView("/param/statutProjet", model);


	}

	@RequestMapping(value = "/api/updateParamStatutProjet/{id}", method = RequestMethod.GET)
	public ModelAndView editParamStatutProjet(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("statut", statutProjetRepository.getOne(id));
		return new ModelAndView("/param/statutProjet", model);
	}

	@RequestMapping(value = "/api/deleteParamStatutProjet/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamStatutProjet(@PathVariable int id) throws JsonProcessingException {
		StatutProjet stat = statutProjetRepository.getOne(id);
		StatutProjet oldstat =stat;
		stat.setDeleteDateTime(new Date());
		statutProjetRepository.save(stat);
		webs.addAudit("", "supprimer", "", stat.getId_statut_projet() + "", oldstat, stat, "StatutProjet");


	}

	//Get List Statut project By Type

	@RequestMapping(value = "/api/api/getListStatut/{val}", method = RequestMethod.GET)
	public ModelAndView getParamRegion(@PathVariable String val) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listS", statutProjetRepository.getAllStatutByType(val));
		model.put("type",statutProjetRepository.getAllType());
		return new ModelAndView("/param/statutProjet", model);
	}

//	***********************parametrage region*******************************
	@RequestMapping(value = "/api/getParamRegion/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamRegion(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", regionRepository.getAllRegion());
		Page<Region> h = regionRepository.getstatutprojetByaction(new PageRequest(page, size));
		if (h != null) {

			List<Region> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("prefecture", prefectureRepository.getAllPrefecture());
		return new ModelAndView("/param/region", model);
	}

	@RequestMapping(value = "/api/postParamRegion/{prefecture}", method = RequestMethod.POST)
	public ModelAndView postParamRegion(@RequestBody Region region, @PathVariable int[] prefecture) throws JsonProcessingException {

		List<Prefecture> p = new ArrayList<Prefecture>();
		if (prefecture[0] == 0) {

		} else {

			for (int i = 0; i < prefecture.length; i++) {
				p.add(prefectureRepository.getPrefectureById(prefecture[i]));
			}
		}
		Object old = null;

		String action = "ajouter";
		if (region.getRegionId() != 0) {
			int idd = region.getRegionId();

			old = regionRepository.getOne(idd);

			action = "modifier";
		}

		region.setPrefecture(p);
		if(region.getRegionId() != 0){
			webs.addAudit("", action, "", region.getRegionId()+ "", old, region, "Region");
			regionRepository.save(region);
		}
		else{
			regionRepository.save(region);
			webs.addAudit("", action, "", region.getRegionId()+ "", old, region, "Region");
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", regionRepository.getAllRegion());
		model.put("prefecture", prefectureRepository.getAllPrefecture());
		return new ModelAndView("/param/region", model);

	}

	@RequestMapping(value = "/api/updateParamRegion/{id}", method = RequestMethod.GET)
	public ModelAndView editParamRegion(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("region", regionRepository.getOne(id));
		model.put("listF", regionRepository.getAllRegion());
		model.put("prefecture", prefectureRepository.getAllPrefecture());
		return new ModelAndView("/param/region", model);
	}

	@RequestMapping(value = "/api/deleteParamRegion/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamRegion(@PathVariable int id) throws JsonProcessingException {
		Region r = regionRepository.getOne(id);
		Region oldr = r;
		r.setDeleteDateTime(new Date());
		regionRepository.save(r);
		webs.addAudit("", "supprimer", "", r.getRegionId() + "", oldr, r, "Region");



	}

	@RequestMapping(value = "/api/getRegionSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListeRegionSearch(@PathVariable("type") String type) {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",regionRepository.getRegionBy(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/Regiontr", model);
	}

	// ******************* parametrage categorie !*******************
	@RequestMapping(value = "/api/getParamCategorie", method = RequestMethod.GET)
	public ModelAndView getParamCategorie() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", categorieRepository.getAllCategorie());
		return new ModelAndView("/param/categorie", model);
	}

	@RequestMapping(value = "/api/postParamCategorie", method = RequestMethod.POST)
	public ModelAndView postParamCategorie(@RequestBody Categorie categorie) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		String action = "ajouter";
		if (categorie.getId_categorie() != 0) {
			int idd = categorie.getId_categorie();
			old = categorieRepository.getOne(idd);
			action = "modifier";
		}
		if(categorie.getId_categorie() != 0){
		webs.addAudit("", action, "", categorie.getId_categorie()+ "", old, categorie, "Categorie");
		categorieRepository.save(categorie);
		}
		else{
			categorieRepository.save(categorie);
			webs.addAudit("", action, "", categorie.getId_categorie()+ "", old, categorie, "Categorie");
		}
		model.put("listF", categorieRepository.getAllCategorie());
		return new ModelAndView("/param/categorie", model);


	}

	@RequestMapping(value = "/api/updateParamCategorie/{id}", method = RequestMethod.GET)
	public ModelAndView editParamCategorie(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("categorie", categorieRepository.getOne(id));
		return new ModelAndView("/param/categorie", model);
	}

	@RequestMapping(value = "/api/deleteParamCategorie/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamCategorie(@PathVariable int id) throws JsonProcessingException {
		Categorie cat = categorieRepository.getOne(id);
		Categorie oldcat =cat;
		cat.setDeleteDateTime(new Date());
		categorieRepository.save(cat);
		webs.addAudit("", "supprimer", "", cat.getId_categorie() + "", oldcat, cat, "Categorie");


	}

	// ******************** parametrage code ************************

	@RequestMapping(value = "/api/getParamCode/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamCode(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", codeRepository.getAllCode());
		Page<Code> h = codeRepository.getcodeByaction(new PageRequest(page, size));
		if (h != null) {

			List<Code> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		model.put("classification", classificationRepository.getAllClassification());
		List<Codeparentt> listParents= codeparenttRepository.getAllCodeparentt();
	model.put("codeParents", codeparenttRepository.getAllCodeparentt());
	model.put("idParent",3);
		return new ModelAndView("/param/code", model);
	}

	// *********************************get codes by categories***********************************
	@RequestMapping(value = "/api/getCodesBycategorie/{page}/{size}/{idParent}", method = RequestMethod.GET)
	public ModelAndView getParamCodesByCategorie(@PathVariable int page,@PathVariable int size,@PathVariable int idParent) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", codeRepository.getAllCode());
		Page<Code> h = codeRepository.getcodeByactionByCategorie(new PageRequest(page, size),idParent);
		if (h != null) {

			List<Code> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());


		} else {
			model.put("totalPage", 0);
		}

		model.put("classification", classificationRepository.getAllClassification());
		List<Codeparentt> listParents= codeparenttRepository.getAllCodeparentt();
	model.put("codeParents", codeparenttRepository.getAllCodeparentt());
	model.put("idParent",idParent);

		return new ModelAndView("/param/code", model);
	}

	//*********************************get codes by categories***********************************

	@RequestMapping(value = "/api/postParamCode", method = RequestMethod.POST)
	public ModelAndView postParamCode(@RequestBody Code code) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (code.getId_code()!= 0) {
			int idd = code.getId_code();

			old =codeRepository.getOne(idd);

			action = "modifier";
		}
		if (code.getId_code()!= 0) {
			webs.addAudit("", action, "", code.getId_code() + "", old, code, "Code");
			codeRepository.save(code);
		}
		else{
			codeRepository.save(code);
			webs.addAudit("", action, "", code.getId_code() + "", old, code, "Code");
		}

		model.put("listF", codeRepository.getAllCode());
		Page<Code> h = codeRepository.getcodeByaction(new PageRequest(0, 6));
		if (h != null) {

			List<Code> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		model.put("classification", classificationRepository.getAllClassification());

		model.put("codeParents", codeparenttRepository.getAllCodeparentt());
		model.put("idParent",3);
		return new ModelAndView("/param/code", model);

	}

	@RequestMapping(value = "/api/updateParamCode/{id}", method = RequestMethod.GET)
	public ModelAndView editParamCode(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("code", codeRepository.getOne(id));
		model.put("classification", classificationRepository.getAllClassification());
		model.put("codeParents", codeparenttRepository.getAllCodeparentt());
		return new ModelAndView("/param/code", model);
	}

	@RequestMapping(value = "/api/deleteParamCode/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamCode(@PathVariable int id) throws JsonProcessingException {
		Code c = codeRepository.getOne(id);
		Code oldc = c;
		c.setDeleteDateTime(new Date());
		codeRepository.save(c);
		webs.addAudit("", "supprimer", "", c.getId_code() + "", oldc, c, "Code");



	}


	@RequestMapping(value = "/api/getCodeSearch/{type}", method = RequestMethod.GET)
	public ModelAndView getListeCodeSearch(@PathVariable("type") String type) {


		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF",codeRepository.getCodeBy(type));


		Compte ct = web.getCompteConnected();

		return new ModelAndView("param/codetr", model);
	}

	// ******************** parametrage nature activite ************************

	@RequestMapping(value = "/api/getParamNatureActivite", method = RequestMethod.GET)
	public ModelAndView getParamNatureActivite() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", natureActiviteRepository.getAllNatureActivite());
		return new ModelAndView("/param/natureActivite", model);
	}

	@RequestMapping(value = "/api/postParamNatureActivite", method = RequestMethod.POST)
	public ModelAndView postParamNatureActivite(@RequestBody NatureActivite natureActivite) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (natureActivite.getId_natureActivite()!= 0) {
			int idd = natureActivite.getId_natureActivite();

			old =natureActiviteRepository.getOne(idd);

			action = "modifier";
		}
		if (natureActivite.getId_natureActivite()!= 0) {
			webs.addAudit("", action, "", natureActivite.getId_natureActivite() + "", old, natureActivite, "NatureActivite");
			natureActiviteRepository.save(natureActivite);
		}
		else{
			natureActiviteRepository.save(natureActivite);
			webs.addAudit("", action, "", natureActivite.getId_natureActivite() + "", old, natureActivite, "NatureActivite");
		}
		model.put("listF", natureActiviteRepository.getAllNatureActivite());
		return new ModelAndView("/param/natureActivite", model);

	}

	@RequestMapping(value = "/api/updateParamNatureActivite/{id}", method = RequestMethod.GET)
	public ModelAndView editParamNatureActivite(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("natureActivite", natureActiviteRepository.getOne(id));
		return new ModelAndView("/param/natureActivite", model);
	}

	@RequestMapping(value = "/api/deleteParamNatureActivite/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamNatureActivite(@PathVariable int id) throws JsonProcessingException {
		NatureActivite n = natureActiviteRepository.getOne(id);
		NatureActivite oldn = n;
		n.setDeleteDateTime(new Date());
		natureActiviteRepository.save(n);
		webs.addAudit("", "supprimer", "", n.getId_natureActivite() + "", oldn, n, "NatureActivite");


	}

	////////////////////////////////////////////////////////////////////////////////// ::

	@RequestMapping(value = "/api/getParamSecteur", method = RequestMethod.GET)
	public ModelAndView getParamSecteur() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", secteurRepository.getAllSecteur());

		return new ModelAndView("/param/secteur", model);
	}

	@RequestMapping(value = "/api/getParamPoste", method = RequestMethod.GET)
	public ModelAndView getParamPoste() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", posteRepository.getAllPoste());

		return new ModelAndView("/param/Poste", model);
	}


	// ******************** parametrage doc *****************************
	@RequestMapping(value = "/api/getParamDoc/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamDoc(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();

		Page<DocImport> h = docImportRepository.getDocImportByaction(new PageRequest(page, size));
		if (h != null) {

			List<DocImport> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}


		model.put("classfication", classificationRepository.getAllClassification());
		return new ModelAndView("/param/doc", model);
	}

	@RequestMapping(value = "/api/postParamDoc", method = RequestMethod.POST)
	public ModelAndView postParamDoc(@RequestParam MultipartFile[] doc,@RequestParam("description") String desc,
									 @RequestParam(value = "classification",required = false) Classification classification, @RequestParam("nom_fr") String nom_fr,
									 @RequestParam("typeaut") String typeaut, @RequestParam("nom_ar") String nom_ar,@RequestParam("id_docImport") int id_docImport) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;
		DocImport d = new DocImport();
		String action = "ajouter";

		if(id_docImport != 0){
			d =docImportRepository.getOne(id_docImport);
			int idd = d.getId_docImport();
			old =docImportRepository.getOne(idd);
			action = "modifier";
		}

		if (d.getId_docImport() != 0) {
			if(doc.length>0){
				String fileName = fileStorageService.storeFile(doc[0]);
				String uri = "/assets/myFile/" + fileName;
				d.setUri(uri);
			}
			webs.addAudit("", action, "", d.getId_docImport() + "", old, d, "DocImport");
			if(!typeaut.equals("EE") && !typeaut.equals("AE") && !typeaut.equals("NT"))
				d.setClassification(classification);
			d.setNom_ar(nom_ar);
			d.setDescription(desc);
			d.setNom_fr(nom_fr);
			d.setTypeaut(typeaut);
			docImportRepository.save(d);
		}
		if(id_docImport==0){
			if(doc.length>0){
				String fileName = fileStorageService.storeFile(doc[0]);
				String uri = "/assets/myFile/" + fileName;
				d.setUri(uri);
			}
			if(!typeaut.equals("EE") && !typeaut.equals("AE") && !typeaut.equals("NT"))
				d.setClassification(classification);
			d.setNom_ar(nom_ar);
			d.setDescription(desc);
			d.setNom_fr(nom_fr);
			d.setTypeaut(typeaut);
			docImportRepository.save(d);
			webs.addAudit("", action, "", d.getId_docImport() + "", old, d, "DocImport");
		}
		model.put("classfication", classificationRepository.getAllClassification());

		model.put("listF", docImportRepository.getAllDocImport());
		Page<DocImport> h = docImportRepository.getDocImportByaction(new PageRequest(0, 6));
		if (h != null) {

			List<DocImport> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());

			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}

		return new ModelAndView("/param/doc", model);

	}

	@RequestMapping(value = "/api/updateParamDoc/{id}", method = RequestMethod.GET)
	public ModelAndView editParamDoc(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doc", docImportRepository.getOne(id));
		model.put("classfication", classificationRepository.getAllClassification());
		return new ModelAndView("/param/doc", model);
	}

	@RequestMapping(value = "/api/deleteParamDoc/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamDoc(@PathVariable int id) throws JsonProcessingException {
		DocImport d = docImportRepository.getOne(id);
		DocImport oldd = d;
		d.setDeleteDateTime(new Date());
		docImportRepository.save(d);
		webs.addAudit("", "supprimer", "",d.getId_docImport() + "", oldd, d, "DocImport");


	}

	@RequestMapping(value = "/api/getParamType", method = RequestMethod.GET)
	public ModelAndView getParamType() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", typeRepository.getAllType());
		model.put("code", codeRepository.getAllCode());
		return new ModelAndView("/param/type", model);
	}

	@RequestMapping(value = "/api/getParamZonne", method = RequestMethod.GET)
	public ModelAndView getParamZonne() {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", zonneFrancheRepository.getAllZonneFranche());
		return new ModelAndView("/param/zonne", model);
	}

	@RequestMapping(value = "/api/postParamZonne", method = RequestMethod.POST)
	public ModelAndView postParamZonne(@RequestBody ZonneFranche zonneFranche) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (zonneFranche.getId_zonnefranche()!= 0) {
			int idd = zonneFranche.getId_zonnefranche();

			old =zonneFrancheRepository.getOne(idd);

			action = "modifier";
		}
		if (zonneFranche.getId_zonnefranche()!= 0)
			{
				webs.addAudit("", action, "",zonneFranche.getId_zonnefranche() + "", old, zonneFranche, "ZonneFranche");
				zonneFrancheRepository.save(zonneFranche);
			}
		else{
			zonneFrancheRepository.save(zonneFranche);
			webs.addAudit("", action, "",zonneFranche.getId_zonnefranche() + "", old, zonneFranche, "ZonneFranche");
		}
			model.put("listF", zonneFrancheRepository.getAllZonneFranche());
		return new ModelAndView("/param/zonne", model);

	}

	@RequestMapping(value = "/api/updateParamZonne/{id}", method = RequestMethod.GET)
	public ModelAndView editParamZonne(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("zonne", zonneFrancheRepository.getOne(id));
		return new ModelAndView("/param/zonne", model);
	}

	@RequestMapping(value = "/api/deleteParamZonne/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParamZonne(@PathVariable int id) throws JsonProcessingException {
		ZonneFranche z = zonneFrancheRepository.getOne(id);
		ZonneFranche oldz = z;
		z.setDeleteDateTime(new Date());
		zonneFrancheRepository.save(z);
		webs.addAudit("", "supprimer", "",z.getId_zonnefranche() + "", oldz, z, "ZonneFranche");


	}

	@RequestMapping(value = "/api/validateDoc/{id}", method = RequestMethod.GET)
	public ModelAndView validateDoc(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doc", listDocNotifRepository.ListDocNotif(id));
		model.put("id", id);
		Notification n = notifRepository.getbyid(id);
		model.put("notif", n);
		String type = "";
		if(n!=null)
			type=n.getZf_et();
		model.put("type", type);

		return new ModelAndView("autorisation/validationDoc", model);
	}

	@RequestMapping(value = "/api/validateDocInstallation/{id}", method = RequestMethod.GET)
	public ModelAndView validateDocInstallation(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doc", listDocNotifRepository.ListDocInstall(id));
		model.put("inst",installationDechetRepository.getOne(id));
		model.put("id", id);
		return new ModelAndView("installation/validationDocInstallation", model);
	}

	@RequestMapping(value = "/api/validateDocCollecte/{id}", method = RequestMethod.GET)
	public ModelAndView validateDocCollecte(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doc", listDocNotifRepository.ListDocCollecte(id));

		model.put("id", id);
		return new ModelAndView("collecte/validationDocCollecte", model);
	}

	@RequestMapping(value = "/api/visiteInstallation/{id}/{visite}", method = RequestMethod.GET)
	public ModelAndView visiteInstallation(@PathVariable int id, @PathVariable int visite) {
		Map<String, Object> model = new HashMap<String, Object>();

		Installation inst = installationDechetRepository.getOne(id);
		if (visite != 0) {
			VisiteInstallation vi = visiteInstallationRepository.getOne(visite);
			model.put("visite", vi);
			model.put("id", visite);
		} else {
			model.put("id", id);
			model.put("visite", null);
		}
		model.put("inst",inst);
		model.put("id", id);
		return new ModelAndView("installation/visiteInstallation", model);
	}

	@ResponseBody
	@RequestMapping(value = "/api/removeCode/{id_ins}/{id_code}", method = RequestMethod.POST)
	public  int removeCode(@PathVariable int id_ins, @PathVariable int id_code) throws IOException {
		Installation i = installationDechetRepository.getOne(id_ins);
		List<Code> c = i.getCode();
		Code code = codeRepository.getCodeById(id_code);
		c.remove(codeRepository.getCodeById(id_code));
		i.setCode(c);
		installationDechetRepository.save(i);
		return 0;
	}

	@ResponseBody
	@RequestMapping(value = "/api/removeCode_ins/{id_ins}/{id_code}/{type}", method = RequestMethod.POST)
	public  String removeCode_ins(@PathVariable int id_ins, @PathVariable int id_code ,@PathVariable String type) throws IOException {
		Installation i = installationDechetRepository.getOne(id_ins);
		List<Code> c = i.getCodeTmp();
		Code code = codeRepository.getCodeById(id_code);

		if(type.equals("add") && c.contains(code)){
			c.remove(c.indexOf(codeRepository.getCodeById(id_code)));
		}else if(type.equals("delete")){
			c.add(code);
		}
		i.setCodeTmp(c);
		installationDechetRepository.save(i);
		return type;
	}

	@RequestMapping(value = "/api/documentAttche/{id}", method = RequestMethod.GET)
	public ModelAndView documentAttche(@PathVariable int id) {

		Installation inst = installationDechetRepository.getOne(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("inst",inst);
		model.put("id", id);

		return new ModelAndView("installation/attachementDoc", model);
	}



	@RequestMapping(value = "/api/add_visiteInstallation/{id}", method = RequestMethod.POST)
	public String add_visiteInstallation(@PathVariable int id, @RequestBody VisiteInstallation visite) throws UnknownHostException, JsonProcessingException, ParseException, MessagingException, UnsupportedEncodingException {
// ajouter la visite
		int idvisite = visite.getId_visite_installation();
		DateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
		Date d = sd.parse(visite.getDate_visite_S());
		visite.setDate_visite(d);
		visiteInstallationRepository.save(visite);
		if(idvisite!=0){
			Installation i = installationDechetRepository.getById(id);
			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =i.getEmail();
			if(mail!=null){
				messageEmail.setTo(i.getEmail());
			}else{
			}

			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+i.getNum_demande());
			String type="Installation de traitement des déchets";
			String etat="Reprogrammation de la visite";

			messageEmail.setText("<h3>"+type+"</h3>\n" +
					"<h5>"+etat+"</h5>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+i.getNum_demande()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+i.getNum_demande()+"</div>\n" +
					"<div><b>Raison sociale: </b>"+i.getRaison()+"</div>\n"+
					"<div><b>Date de visite: </b>"+sd.format(i.getVisite().getDate_visite())+"</div>"+
					"<div><b>Statut: "+i.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);


			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}
		}
//		ajouter la visite dans instalaation
		if (idvisite == 0) {
			Installation i = installationDechetRepository.getById(id);
			i.setVisite(visite);
			StatutProjet st = statutRepository.getOne(16);
			i.setStatut(st);
			installationDechetRepository.save(i);

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
				af.setInstallation(i);
				affectationRepository.save(af);
			}

			MimeMessage mimeMessage = emailSender.createMimeMessage();
			boolean multipart = true;
			MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

			boolean to_send = false;
			String mail =i.getEmail();
			if(mail!=null){
				messageEmail.setTo(i.getEmail());
			}else{
			}

			to_send = true;

			messageEmail.setSubject("État d'avancement de votre demande numéro "+i.getNum_demande());
			String type="Installation de traitement des déchets";
			String etat="Planification de la visite";

			messageEmail.setText("<h3>"+type+"</h3>\n" +
					"<h5>"+etat+"</h5>\n" +
					"Des changements ont été apporté à votre demande numéro <b>"+i.getNum_demande()+"</b> (information ci-après):\n\n " +
					"<p></p>"+
					"<hr style='width:55%; float:left'>"+
					"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+i.getNum_demande()+"</div>\n" +
					"<div><b>Raison sociale: </b>"+i.getRaison()+"</div>\n"+
					"<div><b>Date de visite: </b>"+sd.format(i.getVisite().getDate_visite())+"</div>"+
					"<div><b>Statut: "+i.getStatut().getNom_fr()+"</b></div>", true);
			messageEmail.setFrom(fromusermail, fromuser);


			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(i.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
				webs.addAuditAutorisation("Planfication de La visite", i.getNum_demande(), "IT", i.getStatut(), web.getCompteConnected());
		}

		return "redirect:/api/getListeInstallation/0/6/0";
	}

	@RequestMapping(value = "/api/validationFinal/{id}", method = RequestMethod.GET)
	public ModelAndView validationFinal(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("id", id);
		Notification n = notifRepository.getbyid(id);
		String type = n.getZf_et();
		model.put("type", type);

		return new ModelAndView("autorisation/validationFinal", model);
	}

	@RequestMapping(value = "/api/validationAvisCollecte/{id}", method = RequestMethod.GET)
	public ModelAndView validationAvisCollecte(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("id", id);
		return new ModelAndView("collecte/validationAvisCollecte", model);
	}

	@RequestMapping(value = "/api/validationFinalCollecte/{id}", method = RequestMethod.GET)
	public ModelAndView validationFinalCollecte(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("id", id);
		return new ModelAndView("collecte/validationFinalCollecte", model);
	}

	@RequestMapping(value = "/api/validationCollecte/{id}", method = RequestMethod.GET)
	public ModelAndView validationCollecte(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("id", id);
		return new ModelAndView("collecte/validationCollecte", model);
	}

	@RequestMapping(value = "/api/validationDestination/{id}", method = RequestMethod.GET)
	public ModelAndView validationDestination(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("id", id);
		return new ModelAndView("installation/validationDeLaDestination", model);
	}

	@RequestMapping(value = "/api/addComment/{id}", method = RequestMethod.POST)
	public @ResponseBody void addComment(@PathVariable int id, @RequestParam String comment) {

		ListDocNotif rt = listDocNotifRepository.getOne(id);
		rt.setNom_fr(comment);
		listDocNotifRepository.save(rt);
	}

	@RequestMapping(value = "/api/addCommentaire/{id}", method = RequestMethod.POST)
	public @ResponseBody void addCommentaire(@PathVariable int id, @RequestParam String comment) {

		Vehicules v = vehiculeRepository.getOne(id);
		v.setCommantaire(comment);
		vehiculeRepository.save(v);
	}

	@RequestMapping(value = "/api/validate/{id}", method = RequestMethod.POST)
	public @ResponseBody void validate(@PathVariable int id, @RequestParam String etat) {

		ListDocNotif rt = listDocNotifRepository.getOne(id);
		rt.setNom_ar(etat);
		listDocNotifRepository.save(rt);

	}

	@RequestMapping(value = "/api/validateVehicule/{id}", method = RequestMethod.POST)
	public @ResponseBody void validateVehicule(@PathVariable int id, @RequestParam String etat) {

		Vehicules v = vehiculeRepository.getOne(id);
		v.setValid(etat);
		vehiculeRepository.save(v);

	}

	// ******************* parametrage Pays !*******************
	@RequestMapping(value = "/api/getParampays/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getParamPays(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("listF", paysRepository.getAllpays());
		Page<Pays> h = paysRepository.getPaysPage(new PageRequest(page, size));
		if (h != null) {

			List<Pays> searchResult = h.getContent();

			model.put("listF", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("page", 0);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());

		} else {
			model.put("totalPage", 0);
		}
		return new ModelAndView("/param/pays", model);
	}

	@RequestMapping(value = "/api/postParampays", method = RequestMethod.POST)
	public ModelAndView postParampays(@RequestBody Pays pays) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (pays.getPaysId()!= 0) {
			int idd = pays.getPaysId();

			old =paysRepository.getOne(idd);

			action = "modifier";
		}
		if (pays.getPaysId()!= 0) {
			webs.addAudit("", action, "",pays.getPaysId() + "", old, pays, "Pays");
			paysRepository.save(pays);
		}
		else{
			paysRepository.save(pays);
			webs.addAudit("", action, "",pays.getPaysId() + "", old, pays, "Pays");
		}
			model.put("listF", paysRepository.getAllpays());
		return new ModelAndView("/param/pays", model);

	}

	@RequestMapping(value = "/api/updateParampays/{id}", method = RequestMethod.GET)
	public ModelAndView editParampays(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("pays", paysRepository.getOne(id));
		return new ModelAndView("/param/pays", model);
	}

	@RequestMapping(value = "/api/deleteParampays/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteParampays(@PathVariable int id) throws JsonProcessingException {
		Pays pay = paysRepository.getOne(id);
		Pays oldpay = pay;
		pay.setDeleteDateTime(new Date());
		paysRepository.save(pay);
		webs.addAudit("", "supprimer", "",pay.getPaysId() + "", oldpay, pay, "Pays");


	}

	@RequestMapping(value = "/api/addEtat/{id}", method = RequestMethod.POST)
	public @ResponseBody int addEtat(@PathVariable int id, @RequestParam int etat) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Notification rt = notifRepository.getOne(id);
		String s = rt.getStatut().getNom_fr();
		if(etat==39){
			rt.setDateAvisDepartement(new Date());
		}
		rt.setStatut(statutRepository.getOne(etat));
		//rt.setDateValidation(new Date());
		rt.setDateTransaction(new Date());

		long diff = (new Date().getTime()-rt.getDateConteur().getTime());

		int nbJour = (int) (rt.getNbJour()+(diff/ (1000*60*60*24)));
		rt.setNbJour(nbJour);
		Compte cpt = web.getCompteConnected();

		if(rt.getCompteAffecte()==null || cpt.getCompteId()!=rt.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(id);
			for (Affectation c : aff) {
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setNotification(notifRepository.getOne(id));
			affectationRepository.save(af);
			rt.setCompteAffecte(cpt);
		}
		notifRepository.save(rt);



		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;
		String mail =rt.getImportateur().getMail();
		if(mail!=null){
			messageEmail.setTo(rt.getImportateur().getMail());
		}else{
		}

		to_send = true;

		messageEmail.setSubject("État d'avancement de votre demande numéro "+rt.getNum_notification());
		String type="";
		if(rt.getZf_et().equals("ZF")){
			type="Importation des déchets d'une zone franche";
		}else if(rt.getZf_et().equals("ET")){
			type="Importation des déchets non dangereux d'un pays etranger";
		}else if(rt.getZf_et().equals("XD")){
			type="Exportation des déchets dangereux";
		}else if(rt.getZf_et().equals("TR")){
			type="Transit des déchets";
		}
		messageEmail.setText("<h3>"+type+"</h3>\n" +
				"Des changements ont été apporté à votre demande numéro <b>"+rt.getNum_notification()+"</b> (information ci-après):\n\n " +
				"<p></p>"+
				"<hr style='width:55%; float:left'>"+
				"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+rt.getNum_notification()+"</div>\n" +
				"<div><b>Classification des déchets: </b>"+rt.getClassification().getNom_fr()+"</div>\n"+
				"<div><b>Code: </b>"+rt.getCode().getNom_fr()+"</div>\n"+
				"<div><b>Type de déchet: </b>"+rt.getCode().getNom_ar()+"</div>\n" +
				"<div><b>Date de dépôt: </b>"+dateFormat.format(rt.getDateDepot())+"</div>"+
				"<div><b>Statut: "+rt.getStatut().getNom_fr()+"</b></div>", true);
		messageEmail.setFrom(fromusermail, fromuser);


		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}


		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(rt.getNum_notification());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(rt.getStatut().getId_statut_projet()==39){
			webs.addAuditAutorisation("Validation des Documents", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(),web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande de complément", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(),web.getCompteConnected());
		}


//		importHistorique h = new importHistorique();
//		h.setDate(new Date());
//		h.setEtat(etat);
//		h.setNotif(rt);
//		importHistoriqueRepository.save(h);

		return 0;
	}

	@RequestMapping(value = "/api/addEtatInstallation/{id}", method = RequestMethod.POST)
	public @ResponseBody String addEtatInstallation(@PathVariable int id, @RequestParam int etat) throws UnknownHostException, JsonProcessingException, MessagingException, UnsupportedEncodingException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Compte cpt = web.getCompteConnected();

		Installation nt = installationDechetRepository.getOne(id);
		nt.setStatut(statutRepository.getOne(etat));
		nt.setDateValidation(new Date());
		if(nt.getCompteAffecte()==null || cpt.getCompteId()!=nt.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(id);
			for(Affectation c : aff){
				c.setEtat("non");
			}

			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setInstallation(nt);
			affectationRepository.save(af);
			nt.setCompteAffecte(cpt);
		}
		installationDechetRepository.save(nt);



		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;
		messageEmail.setTo(nt.getEmail());
		to_send = true;

		messageEmail.setSubject("État d'avancement de votre demande numéro "+nt.getNum_demande());
		messageEmail.setText("<h3>Installation de traitement des déchets</h3>\n" +
				"Des changements ont été apporté à votre demande numéro <b>"+nt.getNum_demande()+"</b> (information ci-après):\n\n " +
				"<p></p>"+
				"<hr style='width:65%; float:left'>"+
				"\n<div style='margin-top:3%'><b>Numéro de notification: </b>"+nt.getNum_demande()+"</div>\n" +
				"<div><b>Raison sociale: </b>"+nt.getRaison()+"</div>\n"+
				"<div><b>Date de dépôt: </b>"+dateFormat.format(nt.getDateDepot())+"</div>"+
				"<div><b>Statut: "+nt.getStatut().getNom_fr()+"</b></div>", true);
		messageEmail.setFrom(fromusermail, fromuser);
		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(nt.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if(nt.getStatut().getId_statut_projet()==15) {
			webs.addAuditAutorisation("demande de complément", nt.getNum_demande(), "IT", nt.getStatut(), web.getCompteConnected());
		}
		else if(nt.getStatut().getId_statut_projet()==17) {
			webs.addAuditAutorisation("demande Favorable", nt.getNum_demande(), "IT", nt.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Programmation de la visite", nt.getNum_demande(), "IT", nt.getStatut(), web.getCompteConnected());
		}

		return "redirect:/api/getListeInstallation/0/6/0";
	}

	@RequestMapping(value = "/api/addEtatFinal/{id}", method = RequestMethod.POST)
	public @ResponseBody int addEtatFinal(@PathVariable int id, @RequestParam int etat,@RequestParam String commentaire) throws ParseException, UnknownHostException, JsonProcessingException {
		//@RequestParam String date1, @RequestParam String date2,
		Notification rt = notifRepository.getOne(id);
		rt.setStatut(statutRepository.getOne(etat));
			rt.setCommentaire(commentaire);

		//rt.setDateValidation(new Date());
		rt.setDateTransaction(new Date());
		notifRepository.save(rt);

		List<Affectation> aff = affectationRepository.SiExiste(id);
		for(Affectation c : aff){
			c.setEtat("non");
		}
		Compte cpt = web.getCompteConnected();

		if(cpt.getPoste().getId_Poste()==3) {
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setNotification(notifRepository.getOne(id));
			affectationRepository.save(af);
		}
//		importHistorique h = new importHistorique();
//		h.setDate(new Date());
//		h.setEtat(etat);
//		h.setNotif(rt);
//		importHistoriqueRepository.save(h);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(rt.getNum_notification());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(rt.getStatut().getId_statut_projet()==38) {
			webs.addAuditAutorisation("demande favorable", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(), web.getCompteConnected());
		}else{
			webs.addAuditAutorisation("demande non favorable", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(), web.getCompteConnected());
		}

		return 0;
	}

	@RequestMapping(value = "/api/addEtatFinalWithDoc/{id}", method = RequestMethod.POST,consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public @ResponseBody int addEtatFinalWithDoc(@PathVariable int id, @RequestParam int etat,@RequestParam String commentaire,@RequestParam MultipartFile[] fileToUpload) throws ParseException, UnknownHostException, JsonProcessingException {
		//@RequestParam String date1, @RequestParam String date2,
		Notification rt = notifRepository.getOne(id);
		rt.setStatut(statutRepository.getOne(etat));
		rt.setCommentaire(commentaire);
		Compte cpt = web.getCompteConnected();


		if(fileToUpload.length>0){
			String fileName = fileStorageService.storeFile(fileToUpload[0]);
			String cc = "/assets/myFile/" + fileName;
			rt.setUrl_document_validation(cc);
		}

		//rt.setDateValidation(new Date());
		rt.setDateTransaction(new Date());
		notifRepository.save(rt);

		if(rt.getCompteAffecte()==null || cpt.getCompteId()!=rt.getCompteAffecte().getCompteId()) {
				List<Affectation> aff = affectationRepository.SiExiste(id);
				for (Affectation c : aff) {
					c.setEtat("non");
				}
				Affectation af = new Affectation();
				af.setDateAffectation(new Date());
				af.setEtat("oui");
				af.setCompte(cpt);
				af.setNotification(notifRepository.getOne(id));
				affectationRepository.save(af);
				rt.setCompteAffecte(cpt);
		}
//		importHistorique h = new importHistorique();
//		h.setDate(new Date());
//		h.setEtat(etat);
//		h.setNotif(rt);
//		importHistoriqueRepository.save(h);
		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(rt.getNum_notification());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(rt.getStatut().getId_statut_projet()==38) {
			webs.addAuditAutorisation("demande favorable", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(), web.getCompteConnected());
		}else{
			webs.addAuditAutorisation("demande non favorable", rt.getNum_notification(), rt.getZf_et(), rt.getStatut(), web.getCompteConnected());
		}

		return 0;
	}



	@RequestMapping(value = "/api/addEtatFinalCollecte/{id}", method = RequestMethod.POST)
	public String addEtatFinal(@PathVariable int id, @RequestParam int etat,
			@RequestParam(value = "doc", defaultValue = "", required = false) MultipartFile doc,
			@RequestParam(value = "date1") String date1, @RequestParam("date2") String date2) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = sdf.parse(date1);
		java.sql.Date date11 = new java.sql.Date(parsed.getTime());
		java.sql.Date date22 = new java.sql.Date(sdf.parse(date2).getTime());
		CollecteTransporteur ct = collecteRepository.getById(id);
		ct.setDatecoll1(date11);
		ct.setDatecoll2(date22);
		ct.setStatut(statutProjetRepository.getOne(etat));
		//ct.setDateValidation(new Date());
		int s = ct.getStatut().getId_statut_projet();

		if (s == 26) {
			String fileName = fileStorageService.storeFile(doc);
			String cc = "/assets/myFile/" + fileName;
			ct.setDocument_attache(cc);
			collecteRepository.save(ct);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ct.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Demande non Favorable", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());


			return "redirect:/api/getListeCollecte/0/6/0";
		} else {
			collecteRepository.save(ct);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ct.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Demande Favorable", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());

			GeneratePDFDocuments.generateDocumentDeCollecte(ct);
			return "redirect:/api/getListeCollecte/0/6/0";
		}

	}

	@RequestMapping(value = "/api/addEtatAvisCollecte/{id}", method = RequestMethod.POST)
	public String addEtatAvisCollecte(@PathVariable int id, @RequestParam int etat, @RequestParam String comment)
			throws Exception {

		CollecteTransporteur ct = collecteRepository.getById(id);
		ct.setStatut(statutRepository.getOne(etat));
		ct.setDateValidation(new Date());

		int s = ct.getStatut().getId_statut_projet();
		if (s == 8) {
			ct.setCommentaire(comment);
		}
		collecteRepository.save(ct);
		return "redirect:/api/getListeCollecte";
	}

	@GetMapping("/api/generate_pdf_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_pdf_collecte(@PathVariable int id) throws Exception {

		CollecteTransporteur ct = collecteRepository.getbyid(id);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+ct.getNum_demande()+".pdf");
		ByteArrayInputStream bis = GeneratePDFDocuments.generateDocumentDeCollecte(ct);

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_word_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_vord_collecte(@PathVariable int id) throws Exception {

		CollecteTransporteur ct = collecteRepository.getbyid(id);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+ct.getNum_demande()+".pdf");
		DocumentDechetCT d = documentDechetCTRepository.getDocumentDechetCT();
		ByteArrayInputStream bis = GeneratePDF.generateDocumentCT(d,ct,urls);

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_word_collecte_Avenant/{id}")
	public ResponseEntity<InputStreamResource> generate_word_collecte_Avenant(@PathVariable int id) throws Exception {

		CollecteTransporteur ct = collecteRepository.getbyid(id);
		CollecteTransporteur ct2 = collecteRepository.getbyid(ct.getId_collecteOriginale());
		String Numero = ct2.getNum_demande();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+ct.getNum_demande()+".pdf");
		ByteArrayInputStream bis = GeneratePDF.generateDocumentCT_Avenant(ct,Numero,urls);

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_word_installation/{id}")
	public ResponseEntity<InputStreamResource> generate_word_installation(@PathVariable int id) throws Exception {

		Installation i = installationDechetRepository.getById(id);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+i.getNum_demande()+".pdf");
		DocumentInstalation d = documentInstalationD.getDocumentInstalationD();
		ByteArrayInputStream bis = GeneratePDF.generateDocumentInstalation(d,i,urls);

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_instalation/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_instalation(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		Installation ins = installationDechetRepository.getOne(id);
		headers.add("Content-Disposition", "attachment; filename="+ins.getNum_demande()+".pdf");
		ListDocNotif[] l = listDocNotifRepository.ListDocInstallation(ins.getId_installation());
		DocImport[] d =docImportRepository.getAllDocImportByType("IT");
		ByteArrayInputStream bis = GeneratePDF.generateRecapInstalation(ins,l,d,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_collecte/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_collecte(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		CollecteTransporteur ns = collecteRepository.getById(id);
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_demande()+".pdf");
		ListDocNotif[] l = listDocNotifRepository.ListDocCollectes(ns.getId_collecte());
		DocImport[] d =docImportRepository.getAllDocImportByType("CT");
		ByteArrayInputStream bis = GeneratePDF.generateRecapCollecte(ns,l,d,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_recap_imp/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_imp(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		Notification ns = notifRepository.getbyid(id);
		headers.add("Content-Disposition", "attachment; filename="+ns.getNum_notification()+".pdf");
		ListDocNotif[] l = listDocNotifRepository.ListDocNotifs(ns.getId_notification());
		DocImport[] d =docImportRepository.getAllDocImportByType(ns.getZf_et());
		DeclarationTransporteur dt = declarationTransporteurRepository.getDeclarationTransByNotification(ns.getId_notification());
		ByteArrayInputStream bis = GeneratePDF.generateRecapNotification(ns,l,d,dt,urls);

		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_word_transit/{id}")
	public ResponseEntity<InputStreamResource> generateDocumentTransaction(@PathVariable int id) throws Exception {

		Notification n = notifRepository.getbyid(id);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename="+n.getNum_notification()+".docx");
		//DocumentTransaction d = documentTransactionD.getDocumentTransactionD();
		ByteArrayInputStream bis = MonDocument.generateTransitLettre(n,urls);

		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;

		messageEmail.setTo(InternetAddress.parse(n.getAutorite().getEmail()));
		to_send = true;

		messageEmail.setSubject("Transaction Des déchets");
		messageEmail.setText(" Merci de lire le document", true);

		FileSystemResource file = new FileSystemResource(new File("src/main/webapp/WEB-INF/views/pages/eie/DocumentTransaction.docx"));
		messageEmail.addAttachment("DocumentTransit.docx", file);

		messageEmail.setFrom(fromusermail,fromuser);

		if (to_send)
			try {
				emailSender.send(mimeMessage);
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_word_export/{id}")
	public ResponseEntity<InputStreamResource> generate_word_export(@PathVariable int id) throws Exception {

		Notification n = notifRepository.getbyid(id);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=lettereAvis"+n.getNum_notification()+".docx");
		//DocumentExportaltion d = documentExportationD.getDocumentExportationD();
		ByteArrayInputStream bis = MonDocument.generateExport_lettreAvis(n,urls);

		MimeMessage mimeMessage = emailSender.createMimeMessage();
		boolean multipart = true;
		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;

			messageEmail.setTo(InternetAddress.parse(n.getCourrier()));
			to_send = true;

			messageEmail.setSubject("Exportation Des déchet");
			messageEmail.setText(" Merci de lire le document", true);


			FileSystemResource file = new FileSystemResource(new File("src/main/webapp/WEB-INF/views/pages/eie/lettereAvis"+n.getNum_notification()+".docx"));
			messageEmail.addAttachment("lettereAvis"+n.getNum_notification()+".docx", file);

			messageEmail.setFrom(fromusermail,fromuser);

			if (to_send)
				try {
					emailSender.send(mimeMessage);
				} catch (Exception ex) {
					System.out.println(ex.getMessage());
				}

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}


	@GetMapping("/api/generate_word_export_lettre_consentement/{id}")
	public ResponseEntity<InputStreamResource> generate_word_export_lettre_consentement(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment; filename=DocumentExport.docx");
		Notification n = notifRepository.getbyid(id);
		//DocumentExportaltion d = documentExportationD.getDocumentExportationD();
		//ByteArrayInputStream bis = GeneratePDF.generateDocumentExportationLettreConsentement(n);
		ByteArrayInputStream bis = MonDocument.generateDocumentExportationLettreConsentement(n,urls);
		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@GetMapping("/api/generate_pdf_installation/{id}")
	public ResponseEntity<InputStreamResource> generate_pdf_installation(@PathVariable int id) throws Exception {

		Installation ct = installationDechetRepository.getById(id);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename="+ct.getNum_demande()+"" +
				".pdf");

		ByteArrayInputStream bis = GeneratePDFDocuments.generateDocumentDInstallation(ct);

		return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/api/downloadRecuDepo/{idNotif}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generateDocumentImportationDechet(@PathVariable int idNotif)
			throws Exception {

		Notification n = notifRepository.getbyid(idNotif);

		HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Disposition", "inline; filename="+n.getNum_notification()+"" +
					".pdf");

		ByteArrayInputStream bis;
		DocumentImportationDechet d = documentImortationDechet.getDocumentImortationDechet();
		if (n != null) {
			bis = GeneratePDF.generateDocumentImportationDechet(d,n,urls);

			return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
					.body(new InputStreamResource(bis));

		}

		return null;

	}

	@RequestMapping(value = "/api/downloadRecuDepoND/{idNotif}", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> generateDocumentImportationDechetND(@PathVariable int idNotif)
			throws Exception {

		Notification n = notifRepository.getbyid(idNotif);

		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "inline; filename="+n.getNum_notification()+"" +
				".pdf");


		ByteArrayInputStream bis;
		DocumentDechetND d = documentDechetNdRepository.getDocumentDechetND();
		if (n != null) {
			bis = GeneratePDF.generateDocumentImportationDechetND(d,n,urls);

			return ResponseEntity.ok().headers(headers).contentType(MediaType.APPLICATION_OCTET_STREAM)
					.body(new InputStreamResource(bis));

		}

		return null;

	}
//	etude dimpcat enviremetale

	@RequestMapping(value = "/api/getEie/{type}/{page}/{size}/{statut}", method = RequestMethod.GET)
	public ModelAndView getEie(@PathVariable String type, @PathVariable int page,@PathVariable int size, @PathVariable int statut) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Integer> inte = new ArrayList<Integer>();
		Page<DemandeInformation> h=null;
		inte.add(47);//brouillon
		Compte ct = web.getCompteConnected();
		String x= ct.getTyperegion();
		if(statut==0) {
			h = demandeInformationRepository.getAllDemandeInformationByType(new PageRequest(page, size), type, inte);
		}
		else if(statut>0){
			h=demandeInformationRepository.getAllDemandeInformationByTypeStatut(new PageRequest(page, size), type, statut,inte);
		}else{
			//moin de 3 mois
			h=demandeInformationRepository.getAllDemandeInformationValide3mois(new PageRequest(page, size), type,inte);
		}
		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			h = demandeInformationRepository.getDemandeInformationByAffectation(new PageRequest(page, size), type, ct.getCompteId());
		}


		model.put("statutEnc", statut);
		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();
			model.put("all_demande", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("url", urlRest);

			model.put("page", page);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());
		} else {
			model.put("totalPage", 0);
		}
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("statNow",statut);
		model.put("user",ct);
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("EV");
		model.put("statut", s);
		model.put("type", type);
		if(type.equals("EE")){
			model.put("titre", "Etude d’Impact sur l’Environnement");
		}else if(type.equals("NT")){
			model.put("titre", "Notice d’Impact sur l’Environnement");
		}else if(type.equals("AE")){
			model.put("titre", "Audit Environnemental");
		}

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("eie/listEie", model);
	}

	@RequestMapping(value = "/api/getEieDesc/{type}/{page}/{size}/{statut}/{order}", method = RequestMethod.GET)
	public ModelAndView getEie(@PathVariable String type, @PathVariable int page,@PathVariable int size, @PathVariable int statut,@PathVariable String order) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Integer> inte = new ArrayList<Integer>();
		Page<DemandeInformation> h=null;
		inte.add(47);//brouillon
		Compte ct = web.getCompteConnected();
		String x= ct.getTyperegion();
		if(statut==0) {
			if(Objects.equals(order, "desc")) {
				h = demandeInformationRepository.getAllDemandeInformationByType_desc(new PageRequest(page, size), type, inte);
			}
			else{
				h = demandeInformationRepository.getAllDemandeInformationByType(new PageRequest(page, size), type, inte);
			}
		}
		else if(statut>0){
			if(Objects.equals(order, "desc")) {
				h = demandeInformationRepository.getAllDemandeInformationByTypeStatut_desc(new PageRequest(page, size), type, statut, inte);
			}
			else{
				h = demandeInformationRepository.getAllDemandeInformationByTypeStatut(new PageRequest(page, size), type, statut, inte);
			}
		}else{
			//moin de 3 mois
			h = demandeInformationRepository.getAllDemandeInformationValide3mois(new PageRequest(page, size), type, inte);
		}
		StatutProjet sp = statutProjetRepository.getOne(statut);
		if(statut!=0) {
			model.put("sp", sp.getNom_fr());
		}else{
			model.put("sp", "Tous");
		}

		if(ct.getPoste()!=null && ct.getPoste().getId_Poste()==1) {
			if(Objects.equals(order, "desc")) {
					h = demandeInformationRepository.getDemandeInformationByAffectation_desc(new PageRequest(page, size), type, ct.getCompteId());
				}
			else{
				h = demandeInformationRepository.getDemandeInformationByAffectation(new PageRequest(page, size), type, ct.getCompteId());
			}
		}

		model.put("statutEnc", statut);
		if (h != null) {

			List<DemandeInformation> searchResult = h.getContent();
			model.put("all_demande", searchResult);
			model.put("total", h.getTotalElements());
			model.put("number", h.getNumber());
			model.put("url", urlRest);

			model.put("page", page);
			model.put("totalPage", h.getTotalPages());
			model.put("size", h.getSize());
		} else {
			model.put("totalPage", 0);
		}
		model.put("affecter", profilRoleRepository.getAllProfilRole(18,  web.getCompteConnected().getProfil().getProfilId()));
		if(x.equals("1")){
			model.put("listeCompte", compteRepository.getAllCompteNotScieteByRegion(ct.getRegion().getRegionId()));
		}
		else if(x.equals("2")){
			model.put("listeCompte", compteRepository.getAllCompteNotSciete());
		}
		model.put("statNow",statut);
		model.put("user",ct);
		List<StatutProjet> s = statutProjetRepository.getAllStatutByType("EV");
		model.put("statut", s);
		model.put("type", type);
		if(type.equals("EE")){
			model.put("titre", "Etude d’Impact sur l’Environnement");
		}else if(type.equals("NT")){
			model.put("titre", "Notice d’Impact sur l’Environnement");
		}else if(type.equals("AE")){
			model.put("titre", "Audit Environnemental");
		}

		String isAccessible ="non";
		List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

		if(integerList.contains(1003)){
			isAccessible = "oui";
		}

		model.put("isAccessible", isAccessible);

		return new ModelAndView("eie/listEieDesc", model);
	}

	@RequestMapping(value = "/api/getDre/{page}/{size}", method = RequestMethod.GET)
	public ModelAndView getDre(@PathVariable int page,@PathVariable int size) {
		Map<String, Object> model = new HashMap<String, Object>();

		Compte ct = web.getCompteConnected();

		Page<EieDre> h = eieDreRep.geteieDrePage(new PageRequest(page, size));

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

	@RequestMapping(value = "/api/get_doc_impact/{id}", method = RequestMethod.GET)
	public ModelAndView get_doc_impact(@PathVariable int id)
			throws JsonParseException, IOException, MessagingException {
		Map<String, Object> model = new HashMap<String, Object>();
		List<ListDocNotif> d = listDocNotifRepository.getAllListDocNotifByType(id);
		model.put("docNT",d);
		model.put("url", urlRest);
		return new ModelAndView("eie/docList",model);
	}






	@RequestMapping(value = "/api/addDre", method = RequestMethod.GET)
	public ModelAndView addDre() {
		Map<String, Object> model = new HashMap<String, Object>();
		Compte ct = web.getCompteConnected();

		model.put("user", ct);
		model.put("regions", regionRepository.getAllRegion());
		model.put("provinces", prefectureRepository.getAllPrefecture());
		model.put("communes", communeRepository.getAllPrefecture());
		return new ModelAndView("eie/addDre", model);
	}

	@RequestMapping(value = "/api/getProvinceByRegion/{id}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getPrefectureByRegion(@PathVariable int id) {
		Map<String, Object> mdl = new HashMap<String, Object>();
		mdl.put("province", prefectureRepository.getAllPrefecturebyRegionId(id));
		return mdl;
	}

	@RequestMapping(value = "/api/getComuneByProvince/{id}", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getComuneByProvince(@PathVariable int id) {
		Map<String, Object> mdl = new HashMap<String, Object>();
		mdl.put("Commune", communeRepository.getAllCommuneByProvinceId(id));
		return mdl;
	}

	@RequestMapping(value = { "/api/editdemande/{id}/{type}/{typeS}" })
	public ModelAndView editdemande(@PathVariable int id,@PathVariable String type, @PathVariable String typeS) {
		Map<String, Object> mdl = new HashMap<String, Object>();
		DemandeInformation dmnd = demandeInformationRepository.getDemandeInformationByIdType(id, typeS);
		List<Comite> comiteOui = comiteRepository.getAllComiteByPermanentOUI();
		List<Comite> comiteNon = comiteRepository.getAllComiteByPermanentNON();
		List<Categorie> categories = categorieRepository.getAllCategorie();
		List<SousCategorie> sousCategories = new ArrayList<SousCategorie>();
		for (Categorie r : dmnd.getCategories()) {
			for (SousCategorie c :r.getSousCategories()){
				sousCategories.add(c);
			}
		}

		mdl.put("souscategories", sousCategories);
		mdl.put("categories", categories);
		mdl.put("oui", comiteOui);
		mdl.put("non", comiteNon);
		mdl.put("demande", dmnd);
		mdl.put("url_Admin", urlRest);
		mdl.put("show", "none");
		mdl.put("typeS",typeS);
		Reunion r= null;
		if(dmnd.getReunions().size()>0) {
			r= dmnd.getReunions().get(dmnd.getReunions().size()-1);
		}

		if(type.equals("reunion")){
			mdl.put("reunion",null);
			return new ModelAndView("eie/nouvelleReunion",mdl);
		}
		mdl.put("reunion",r);
		return new ModelAndView("eie/editdemande", mdl);
	}

	@PostMapping("/add_reunion")
	public String add_reunion(@Valid Reunion reunion, @Valid DemandeInformation demandeInformation,
	@RequestParam(name = "comiteOui", required = false) List<Integer> comiteOui, @RequestParam(name = "comiteNon", required = false) List<Integer> comiteNon,
							  @RequestParam String examen)
			throws IOException, MessagingException, InvalidFormatException, URISyntaxException {
		DemandeInformation dm = demandeInformationRepository.getById(demandeInformation.getId_demande_information());
		if(!dm.getType().equals("AE") || dm.getType().equals("AE") && dm.getStatut().getId_statut_projet()==1){
			StatutProjet st = statutProjetRepository.getById(2);
			dm.setStatut(st);
		}

		Compte cpt = web.getCompteConnected();
		if(dm.getCompteAffecte()==null || cpt.getCompteId()!=dm.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(demandeInformation.getId_demande_information());
			for (Affectation c : aff) {
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setDemandeInformation(dm);
			affectationRepository.save(af);
			dm.setCompteAffecte(cpt);

		}
		List<Comite> p = new ArrayList<Comite>();
		if (comiteOui != null) {
			for (int i = 0; i < comiteOui.size(); i++) {
				p.add(comiteRepository.getComitesById(comiteOui.get(i)));
			}
		}
		 if(comiteNon != null){
			 for (int i = 0; i < comiteNon.size(); i++) {
				 p.add(comiteRepository.getComitesById(comiteNon.get(i)));
			 }
		}

		MimeMessage mimeMessage = emailSender.createMimeMessage();

		boolean multipart = true;

		MimeMessageHelper messageEmail = new MimeMessageHelper(mimeMessage, multipart, "utf-8");

		boolean to_send = false;
		for (Comite r : p){
			messageEmail.setTo(InternetAddress.parse(r.getEmail()));
			to_send = true;

			messageEmail.setSubject("Programmation de réunion");
			messageEmail.setText(" Merci de lire le document", true);

			if(examen.equals("examen")){
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

		reunion.setComite(p);
		reunion = reunionRepository.save(reunion);
		/*if(reunion.getExamen().equals("deliberation")){
			dm.setStatut(statutRepository.getOne(74));
		}*/
		if(dm.getStatut().getId_statut_projet()==58){
			dm.setStatut(statutRepository.getOne(80));
		}
		if(dm.getStatut().getId_statut_projet()==71){
			dm.setStatut(statutRepository.getOne(81));
		}
		/*if(dm.getStatut().getId_statut_projet()==72){
			dm.setStatut(statutRepository.getOne(80));
		}*/
		List<Reunion> lr = dm.getReunions();
		if(lr.size()>0){
			if(!lr.contains(reunion)){
				lr.add(reunion);
			}
		}else{
			lr.add(reunion);
		}
		dm.setReunions(lr);
		demandeInformationRepository.save(dm);


		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(dm.getNum_demande());
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		webs.addAuditAutorisation("Programmation de réunion", dm.getNum_demande(), dm.getType(), dm.getStatut(), web.getCompteConnected());

		return "redirect:/api/getEie/"+dm.getType()+"/0/6/0";
	}



	@RequestMapping(value = "/changeetat/{id}/{etat}/{cause}", method = RequestMethod.GET)
	public String changeetat(@PathVariable int id, @PathVariable int etat, @PathVariable String cause) {
		String rdrct;
		Map<String, Object> mdl = new HashMap<String, Object>();

		DemandeInformation dm = demandeInformationRepository.getById(id);
		StatutProjet st = statutProjetRepository.getById(etat);

		dm.setStatut(st);

		demandeInformationRepository.save(dm);

		/*
		 * if(demande.getEtat().equals("refuse")){
		 * reunionRepository.updateStatus(demande.getId()); }
		 */

		return "success";
	}

	@PostMapping("/add_reunion_report")
	public String add_reunion_report(@Valid Reunion reunion, @Valid DemandeInformation demandeInformation)
			throws IOException, MessagingException, InvalidFormatException, URISyntaxException {
		DemandeInformation dm = demandeInformationRepository.getById(demandeInformation.getId_demande_information());

		Reunion rn = reunionRepository.getById(reunion.getId_reunion());
		rn.setReporte("oui");
		reunionRepository.save(rn);

		Reunion newRn = new Reunion();
		newRn.setDate_reunion(reunion.getDate_reunion());
		newRn.setNom_fr(rn.getNom_fr());
		reunionRepository.save(newRn);

		StatutProjet st = statutProjetRepository.getById(2);
		List<Reunion> lr = dm.getReunions();
		lr.add(newRn);
		dm.setReunions(lr);
		dm.setStatut(st);
		demandeInformationRepository.save(dm);

		return "redirect:/api/getMenu";
	}

	@PostMapping("/add_visite_report")
	public String add_visite_report(@Valid VisiteInstallation visite, @Valid Installation installation)
			throws IOException, MessagingException, InvalidFormatException, URISyntaxException {
		Installation dm = installationDechetRepository.getById(installation.getId_installation());

		VisiteInstallation rn = visiteInstallationRepository.getById(visite.getId_visite_installation());
		visiteInstallationRepository.save(rn);

		VisiteInstallation newRn = new VisiteInstallation();
		newRn.setDate_visite(visite.getDate_visite());
		newRn.setObject(rn.getObject());
		newRn.setNomsite_fr(rn.getNomsite_fr());
		visiteInstallationRepository.save(newRn);

		StatutProjet st = statutRepository.getById(16);
		dm.setStatut(st);
		installationDechetRepository.save(dm);
		return "redirect:/api/getMenu";
	}

	@RequestMapping(value = { "/api/depotdeposeetat/{id}/{type}" })
	public ModelAndView depotdeposeetat(@PathVariable int id, @PathVariable String type) {

		Map<String, Object> model = new HashMap<String, Object>();
		DemandeInformation d = demandeInformationRepository.getOne(id);
		Reunion r = null;
		if (d.getReunions().size()>0) {
			r = d.getReunions().get(d.getReunions().size() - 1);
		}
		List<Categorie> categories = categorieRepository.getAllCategorie();
		List<SousCategorie> sousCategories = new ArrayList<SousCategorie>();
		for (Categorie cc : d.getCategories()) {
			for (SousCategorie c :cc.getSousCategories()){
				sousCategories.add(c);
			}
		}

		model.put("souscategories", sousCategories);
		model.put("categories", categories);
		model.put("reunion",r);
		model.put("demande",d);
		model.put("iddemande", id);
		model.put("type", type);
		return new ModelAndView("eie/depotdeposeetat", model);

	}



	@RequestMapping(value = { "/api/depotDefinitive/{id}/{type}"})
	public ModelAndView depotDefinitive(@PathVariable int id, @PathVariable String type) {

		Map<String, Object> mdl = new HashMap<String, Object>();
		DemandeInformation d = demandeInformationRepository.getOne(id);
		mdl.put("demande",d);
		mdl.put("iddemande", id);
		mdl.put("type", type);
		return new ModelAndView("eie/docDefinitive", mdl);

	}

	@PostMapping("/deposestatut")
	public String deposestatut(@Valid DemandeInformation demande) throws IOException, MessagingException {

		Map<String, Object> mdl = new HashMap<String, Object>();

		DemandeInformation dm = demandeInformationRepository.getOne(demande.getId_demande_information());

		return "redirect:/admin/demande_admin";

	}

	@RequestMapping(value = "/api/add_rapport_attache/{id}", method = RequestMethod.POST)
	public String add_rapport_attache(@PathVariable int id, @RequestParam int etat, @RequestParam String comment,
	@RequestParam String result, @RequestParam String conclu, @RequestParam MultipartFile doc) throws UnknownHostException, JsonProcessingException {

		Installation l = installationDechetRepository.getById(id);
		l.setStatut(statutRepository.getOne(etat));
		//l.setDateValidation(new Date());
		String fileName = fileStorageService.storeFile(doc);
		String cc = "/assets/myFile/" + fileName;
		l.setDocument_attache(cc);
		int s = l.getStatut().getId_statut_projet();
		if (s == 45) {
			l.setResultat(result);
			l.setConclusion(conclu);
		}
		if (s == 46) {
			l.setCommentaire(comment);
		}
		installationDechetRepository.save(l);

		List<Affectation> aff = affectationRepository.SiExiste(id);
		for(Affectation c : aff){
			c.setEtat("non");
		}
		Compte cpt = web.getCompteConnected();
		if(cpt.getPoste().getId_Poste()!=3 && l.getStatut().getId_statut_projet()!=17) {
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setInstallation(l);
			affectationRepository.save(af);
		}

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(l.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(l.getStatut().getId_statut_projet()==17){
			webs.addAuditAutorisation("Demande Favorable", l.getNum_demande(), "IT", l.getStatut(), web.getCompteConnected());
		}
		else if(l.getStatut().getId_statut_projet()==18){
			webs.addAuditAutorisation("Demande Non Favorable", l.getNum_demande(), "IT", l.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande Favorable Sous reserves", l.getNum_demande(), "IT", l.getStatut(), web.getCompteConnected());
		}


		if(etat==87){
			return "redirect:/api/validationCodes/"+id;
		}
		else{
			return "redirect:/api/getListeInstallation/0/6/0";

		}
	}

	@RequestMapping(value = "/api/validation_destination/{id}", method = RequestMethod.POST)
	public String validation_destination(@PathVariable int id, @RequestParam int etat, @RequestParam String comment) throws UnknownHostException, JsonProcessingException {
		Installation l = installationDechetRepository.getById(id);
		l.setStatut(statutRepository.getOne(etat));
		l.setCommentaire(comment);
		installationDechetRepository.save(l);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(l.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(l.getStatut().getId_statut_projet()==17) {
			webs.addAuditAutorisation("Demande Favorable", l.getNum_demande(), "IT", l.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande non Favorable", l.getNum_demande(), "IT", l.getStatut(), web.getCompteConnected());
		}
		return "redirect:/api/getListeInstallation/0/6/0";
	}

	@RequestMapping(value = "/api/reunionCollecte/{id}/{reunion}", method = RequestMethod.GET)
	public ModelAndView reunionCollecte(@PathVariable int id, @PathVariable int reunion) {
		Map<String, Object> model = new HashMap<String, Object>();
		Reunion r = null;
		if (reunion != 0) {
			r = reunionRepository.getOne(reunion);
		}
		model.put("reunion", r);
		model.put("id", id);

		return new ModelAndView("installation/reunionCollecte", model);
	}

	@RequestMapping(value = "/api/validationCodes/{id}", method = RequestMethod.GET)
	public ModelAndView validationDoc (@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		Installation inst = installationDechetRepository.getOne(id);
		List<Code> codes = codeRepository.getAllCode();

		CategorieDechet[] categorieDechets = categorieDechetRepository.getAllCategorieDechet();
		model.put("inst", inst);
		model.put("code",codes);
		model.put("categories", Arrays.asList(categorieDechets));
		model.put("id", id);

		return new ModelAndView("installation/ValidationCodes", model);
	}

	@RequestMapping(value = "/api/changerType/{id_ins}", method = RequestMethod.POST)
	public @ResponseBody int changerType (@PathVariable int id_ins) {
		Map<String, Object> model = new HashMap<String, Object>();
		Installation inst = installationDechetRepository.getOne(id_ins);
		inst.setType("1");
		installationDechetRepository.save(inst);
		return 0;
	}

	@RequestMapping(value = "/api/addCategoriesDechet/{id_ins}/{categories}", method = RequestMethod.POST)
	public @ResponseBody int addCategorieDechet(@PathVariable int id_ins,@PathVariable int[] categories) {

		Installation i = installationDechetRepository.getOne(id_ins);

		List<CategorieDechet> categorieDechets = new ArrayList<>();

		for (int c : categories) {
			if(c>0)
				categorieDechets.add(categorieDechetRepository.getOne(c));
		}
		i.setCategorie(categorieDechets);
		i.setType("0");
		i.setStatut(statutRepository.getOne(17));
		installationDechetRepository.save(i);

		Compte cpt = web.getCompteConnected();
		if(cpt.getPoste().getId_Poste()!=3) {
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setInstallation(i);
			affectationRepository.save(af);
		}

		return 0;
	}

	@RequestMapping(value = "/api/setcodeInstallation/{id_ins}/{id_code}/{type}", method = RequestMethod.POST)
	public ModelAndView setcodeInstallationRest(@PathVariable int id_ins, @PathVariable int id_code,
														@PathVariable String type) throws IOException {

		Map<String,Object> map = new HashMap<>();

		Installation i = installationDechetRepository.getOne(id_ins);
		List<Code> c = i.getCodeTmp();
		Code code = codeRepository.getCodeById(id_code);

		if(type.equals("add") && !c.contains(code)){
			c.add(code);
		}else if(type.equals("delete")){
			c.remove(c.indexOf(codeRepository.getCodeById(id_code)));
		}
		i.setCodeTmp(c);
		installationDechetRepository.save(i);

		map.put("inst",i);
		map.put("user",web.getCompteConnected());
		map.put("codes",codeRepository.getAllCode());

		return new ModelAndView("installation/MesCodes",map);

	}



	@RequestMapping(value = "/api/setcodeCollecte/{id_coll}/{id_code}/{type}", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> setcodeCollecte(@PathVariable int id_coll, @PathVariable int id_code,@PathVariable String type) throws IOException {

		Map<String,Object> map = new HashMap<>();

		CollecteTransporteur ct = collecteRepository.getOne(id_coll);
		List<Code> c = ct.getCodeTmp();
		Code code = codeRepository.getCodeById(id_code);
		if(type.equals("add") && !c.contains(code)){
			c.add(code);
		}else if(type.equals("delete")){
			c.remove(c.indexOf(codeRepository.getCodeById(id_code)));
		}
		ct.setCodeTmp(c);
		collecteRepository.save(ct);

		map.put("user",web.getCompteConnected());
		map.put("codes",c);

		return map;

	}


	@RequestMapping(value = "/api/avis_commission/{id}", method = RequestMethod.GET)
	public ModelAndView avis_commission(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		model.put("id", id);
		model.put("collecte", ct);
		model.put("user", web.getCompteConnected());
		return new ModelAndView("collecte/avisCommission", model);
	}

	@RequestMapping(value = "/api/getVihucules/{id}", method = RequestMethod.GET)
	public ModelAndView getVihucules(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		model.put("listVehicules", ct.getVehicules());
		model.put("collecte", ct);
		model.put("user", web.getCompteConnected());
		return new ModelAndView("collecte/vehicules", model);
	}

	@RequestMapping(value = "/api/getCodes/{id}", method = RequestMethod.GET)
	public ModelAndView getCodes(@PathVariable int id) {
		Map<String, Object> model = new HashMap<String, Object>();
		CollecteTransporteur ct = collecteRepository.getbyid(id);
		model.put("listCodes", ct.getCode());
		model.put("listCodesTmp", ct.getCodeTmp2());
		model.put("collecte", ct);
		model.put("user", web.getCompteConnected());
		return new ModelAndView("collecte/codes", model);
	}




	@RequestMapping(value = "/api/add_reunionCollecte/{id}", method = RequestMethod.POST)
	public @ResponseBody void add_reunionCollecte(@PathVariable int id, @RequestBody Reunion reunion) throws UnknownHostException, JsonProcessingException {

		CollecteTransporteur collecte = collecteRepository.getById(id);
		int idreunion = reunion.getId_reunion();
		List<Reunion> re = new ArrayList<Reunion>();
		re.addAll(collecte.getReunions());
		Reunion n = null;
		if (idreunion == 0) {
			n = reunionRepository.save(reunion);
			re.add(n);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(collecte.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Planification de la réunion", collecte.getNum_demande(), "CT", collecte.getStatut(),web.getCompteConnected());

		}else{
			n = reunionRepository.getReunionById(idreunion);
			n.setDate_reunion(reunion.getDate_reunion());
			n = reunionRepository.save(reunion);
			List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(collecte.getNum_demande());
			if(list.size() > 0){
				for(AuditAutorisation a:list){
					a.setEtat(0);
					auditAutorisationRepository.save(a);
				}
			}
			webs.addAuditAutorisation("Reprogrammation de la réunion", collecte.getNum_demande(), "CT", collecte.getStatut(),web.getCompteConnected());

		}
		Compte cpt = web.getCompteConnected();

		if(collecte.getCompteAffecte()==null || cpt.getCompteId()!=collecte.getCompteAffecte().getCompteId()) {
			List<Affectation> aff = affectationRepository.SiExiste(id);
			for (Affectation c : aff) {
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setCollecte(collecte);
			affectationRepository.save(af);
			collecte.setCompteAffecte(cpt);
		}


		collecte.setReunions(re);
		collecte.setDateInfomration(new Date());
		collecte.setStatut(statutRepository.getOne(23));
		collecteRepository.save(collecte);



	}


	@RequestMapping(value = "/api/addAvisCommission/{id}", method = RequestMethod.POST)
	public String addAvisCommission(@PathVariable int id, @RequestParam String etat, @RequestParam String comment)
			throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		CollecteTransporteur ct = collecteRepository.getById(id);
		ct.setStatut(statutRepository.getOne(Integer.parseInt(etat)));
		//ct.setDateValidation(new Date());
		ct.setCommentaire(comment);
		Compte cpt = web.getCompteConnected();
		int s = ct.getStatut().getId_statut_projet();
		collecteRepository.save(ct);

		if(ct.getCompteAffecte()==null || cpt.getCompteId()!=ct.getCompteAffecte().getCompteId()) {

			List<Affectation> aff = affectationRepository.SiExiste(id);
			for (Affectation c : aff) {
				c.setEtat("non");
			}
			Affectation af = new Affectation();
			af.setDateAffectation(new Date());
			af.setEtat("oui");
			af.setCompte(cpt);
			af.setCollecte(ct);
			affectationRepository.save(af);
			ct.setCompteAffecte(cpt);

		}

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
				"<div><b>Raison sociale: </b>"+ct.getRaison()+"</div>\n"+
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
		if (list.size() > 0) {
			for (AuditAutorisation a : list) {
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}

		if (ct.getStatut().getId_statut_projet() == 42){
			webs.addAuditAutorisation("Demande De Complement", ct.getNum_demande(), "CT", ct.getStatut(), web.getCompteConnected());
		}
		else if(ct.getStatut().getId_statut_projet() == 41){
			webs.addAuditAutorisation("Favorable sous réserve", ct.getNum_demande(), "CT", ct.getStatut(), web.getCompteConnected());
		}
		else if(ct.getStatut().getId_statut_projet() == 28){
			webs.addAuditAutorisation("attente de signature", ct.getNum_demande(), "CT", ct.getStatut(), web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Demande non Favorable", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());
		}

		return "redirect:/api/getListeCollecte/0/6/0";
	}

	@RequestMapping(value = "/api/ValidationCodesAndVehicules/{id}", method = RequestMethod.GET)
	public ModelAndView ValidationCodesAndVehicules(@PathVariable int id) throws Exception {
		CollecteTransporteur ct = collecteRepository.getById(id);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("doc", listDocNotifRepository.ListDocCollecte(id));
		int cpt=0;
		for (Vehicules v: ct.getVehicules()){
			if (v.getValid()==null){
				cpt++;
			}
		}
		Compte cmt = web.getCompteConnected();

		if(ct.getCompteAffecte()==null || cmt.getCompteId()!=ct.getCompteAffecte().getCompteId()) {
			if (cmt.getPoste().getId_Poste() == 3 && ct.getStatut().getId_statut_projet() == 25) {
				List<Affectation> aff = affectationRepository.SiExiste(id);
				for (Affectation c : aff) {
					c.setEtat("non");
				}
				Affectation af = new Affectation();
				af.setDateAffectation(new Date());
				af.setEtat("oui");
				af.setCompte(cmt);
				af.setCollecte(ct);
				affectationRepository.save(af);
				ct.setCompteAffecte(cmt);
			}
		}
		collecteRepository.save(ct);
		model.put("id",id);
		model.put("cpt",cpt);
		model.put("collecte", ct);
		model.put("url",urlRest);

		return  new ModelAndView("collecte/ValidationVehiculeAndCodes",model);
	}

	@RequestMapping(value = "/api/addEtatCollecte/{id}", method = RequestMethod.POST)
	public @ResponseBody void  addEtatCollecte(@PathVariable int id, @RequestParam int etat) throws Exception {
		CollecteTransporteur ct = collecteRepository.getById(id);
		ct.setStatut(statutRepository.getOne(etat));
		//ct.setDateValidation(new Date());
		int s = ct.getStatut().getId_statut_projet();

		ct.setTypeCollecte("sr");

		collecteRepository.save(ct);

		List<AuditAutorisation> list = auditAutorisationRepository.getAuditAutorisationByNumero2(ct.getNum_demande());
		if(list.size() > 0){
			for(AuditAutorisation a:list){
				a.setEtat(0);
				auditAutorisationRepository.save(a);
			}
		}
		if(ct.getStatut().getId_statut_projet()==28){
			webs.addAuditAutorisation("en attente de signature le Document", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());
		}
		else{
			webs.addAuditAutorisation("Document Attaché", ct.getNum_demande(), "CT", ct.getStatut(),web.getCompteConnected());
		}


	}
	////******Ayoub Addren******/////
	@RequestMapping(value = "/api/postRenouvellement", method = RequestMethod.POST)
	public ModelAndView postRenouvellement(@RequestBody Renouvellement renouvellement) throws JsonProcessingException {
		Map<String, Object> model = new HashMap<String, Object>();
		Object old = null;

		String action = "ajouter";
		if (renouvellement.getId_renouvellement()!= 0) {
			int idd = renouvellement.getId_renouvellement();

			old =renouvellementRepository.getOne(idd);

			action = "modifier";
		}
		if (renouvellement.getId_renouvellement()!= 0) {
			webs.addAudit("", action, "", renouvellement.getId_renouvellement() + "", old, renouvellement, "Renouvellement");
			renouvellementRepository.save(renouvellement);
		}
		else{
			renouvellementRepository.save(renouvellement);
			webs.addAudit("", action, "", renouvellement.getId_renouvellement() + "", old, renouvellement, "Renouvellement");
		}
		//model.put("classification", classificationRepository.getAllClassification());
		model.put("listF", renouvellementRepository.getAllRenouvellement());
		return new ModelAndView("/param/renouvellement", model);

	}
////******Ayoub deleteren******/////
	@RequestMapping(value = "/api/deleteRenouvellement/{id}", method = RequestMethod.POST)
	public @ResponseBody void deleteRenouvellement(@PathVariable int id) throws JsonProcessingException {
		Renouvellement r = renouvellementRepository.getOne(id);
		Renouvellement oldr = r;
		r.setDeleteDateTime(new Date());
		renouvellementRepository.save(r);
		webs.addAudit("", "supprimer", "", r.getId_renouvellement() + "", oldr, r, "Renouvellement");
	}
	////******Ayoub editren******/////

		@RequestMapping(value = "/api/updateRenouvellement/{id}", method = RequestMethod.GET)
		public ModelAndView updateRenouvellement (@PathVariable int id) {
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("renouvellement",  renouvellementRepository.getOne(id));
			return new ModelAndView("/param/renouvellement", model);
		}
		//******param ren*******//

		@RequestMapping(value = "/api/getParamRenouvellement/{page}/{size}", method = RequestMethod.GET)
		public ModelAndView getParamRenouvellement(@PathVariable int page,@PathVariable int size) {
			Map<String, Object> model = new HashMap<String, Object>();
			Page<Renouvellement> h = renouvellementRepository.getrenouvellementByaction(new PageRequest(page, size));
			if (h != null) {

				List<Renouvellement> searchResult = h.getContent();

				model.put("listF", searchResult);
				model.put("total", h.getTotalElements());

				model.put("number", h.getNumber());
				model.put("page", 0);
				model.put("totalPage", h.getTotalPages());
				model.put("size", h.getSize());

			} else {
				model.put("totalPage", 0);
			}
			model.put("listF",renouvellementRepository.getAllRenouvellement());

			//model.put("classification", classificationRepository.getAllClassification());
			return new ModelAndView("/param/renouvellement", model);
		}




		///////////////////////////Document//////////////////////////////////////

		@RequestMapping(value = "/api/getDocument", method = RequestMethod.GET)
		public ModelAndView ListDocument() {
			Map<String, Object> model = new HashMap<String, Object>();
			model.put("doc", documentImortationDechet.getDocumentImortationDechet());
			model.put("doc2",documentDechetNdRepository.getDocumentDechetND());
			model.put("doc3",documentInstalationD.getDocumentInstalationD());
			model.put("doc4",documentDechetCTRepository.getDocumentDechetCT());
			model.put("docExp",documentExportationD.getDocumentExportationD());
			model.put("docTr",documentTransactionD.getDocumentTransactionD());
			model.put("docEie",documentEieRepository.getDocumentEIE());
			return new ModelAndView("/param/DownloadDocument",model);
		}

		@RequestMapping(value = "/api/AddDocument", method = RequestMethod.POST)
		public ModelAndView AddDoc(@RequestBody DocumentTransaction d) {
		documentTransactionD.save(d);
		return new ModelAndView("/param/DownloadDocument");
	}

		@RequestMapping(value = "/api/UpdateDocumentImportationDechet", method = RequestMethod.GET)
		public @ResponseBody String UpdateImportationDechet(@RequestParam String type,@RequestParam String val) {


			DocumentImportationDechet d = documentImortationDechet.getDocumentImortationDechet();
			if(type.equals("#titre")){
				d.setTitre(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf1")){
				d.setP1(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf_4")){
				d.setNomSociete(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf_2")){
				d.setAdresse(val);
				documentImortationDechet.save(d);
			}
			else if(type.equals("#zf__5")){
				d.setTel(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf_6")){
				d.setEmail(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf3")){
				d.setP3(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf4")){
				d.setNumero(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf5")){
				d.setType(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf_5")){
				d.setCode(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf6")) {
				d.setSource(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf7")) {
				d.setQuantite(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf8")) {
				d.setP6(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf9")) {
				d.setNomtr(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf10")) {
				d.setPattente(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf11")) {
				d.setP8(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf12")) {
				d.setNom(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf13")) {
				d.setTel(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf14")) {
				d.setAdresse(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf15")) {
				d.setPattente(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf16")) {
				d.setType(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf17")) {
				d.setP10(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf18")) {
				d.setComment(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf19")) {
				d.setTemps(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf20")) {
				d.setIla(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf21")) {
				d.setTatmin(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf22")) {
				d.setMo3alaja(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf23")) {
				d.setStAccepte(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#zf24")) {
				d.setStRefuse(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#signe")) {
				d.setSigne(val);
				documentImortationDechet.save(d);

			}
			else if(type.equals("#title")) {
				d.setTitle(val);
				documentImortationDechet.save(d);

			}
			else {
				d.setTitle2(val);
				documentImortationDechet.save(d);

			}

			return val;
		}

		@RequestMapping(value = "/api/UpdateDocumentImportationND", method = RequestMethod.GET)
		public @ResponseBody String UpdateImportationDechetNd(@RequestParam String type,@RequestParam String val) {


			DocumentDechetND d = documentDechetNdRepository.getDocumentDechetND();

			if(type.equals("#titre_dechet")){
				d.setTitre(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#p1")){
				d.setP1(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn_4")){
				d.setNomSociete(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn_2")){
				d.setAdresse(val);
				documentDechetNdRepository.save(d);
			}
			else if(type.equals("#zfn__5")){
				d.setTel(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn_6")){
				d.setEmail(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn3")){
				d.setP3(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn4")){
				d.setNumero(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn5")){
				d.setType(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn_5")){
				d.setCode(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn6")) {
				d.setSource(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn7")) {
				d.setQuantite(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn8")) {
				d.setP6(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn9")) {
				d.setNomtr(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn10")) {
				d.setPattente(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn11")) {
				d.setP8(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn12")) {
				d.setNom(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn13")) {
				d.setTel(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn14")) {
				d.setAdresse(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn15")) {
				d.setPattente(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn16")) {
				d.setType(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn17")) {
				d.setP10(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn18")) {
				d.setComment(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn19")) {
				d.setTemps(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn20")) {
				d.setIla(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn21")) {
				d.setTatmin(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn22")) {
				d.setMo3alaja(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn23")) {
				d.setStAccepte(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#zfn24")) {
				d.setStRefuse(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#logo2")) {
				d.setLogo(val);
				documentDechetNdRepository.save(d);

			}
			else if(type.equals("#signe2")) {
				d.setSigne(val);
				documentDechetNdRepository.save(d);

			}
			else {
				d.setTitle(val);
				documentDechetNdRepository.save(d);

			}

			return val;
		}

		@RequestMapping(value = "/api/UpdateDocumentInstalation", method = RequestMethod.GET)
		public @ResponseBody String UpdateImportationInstalation(@RequestParam String type,@RequestParam String val) {


			DocumentInstalation d = documentInstalationD.getOne(1);

			if(type.equals("#p001")){
				d.setP1(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p002")){
				d.setP2(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p003")){
				d.setP3(val);
				documentInstalationD.save(d);
			}
			else if(type.equals("#p004")){
				d.setP4(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p005")){
				d.setP5(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p006")){
				d.setP6(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p007")){
				d.setP7(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p008")){
				d.setP8(val);
				documentInstalationD.save(d);

			}
			else if(val.equals("#p009")){
				d.setP9(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0010")) {
				d.setP10(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0011")) {
				d.setP11(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0012")) {
				d.setP12(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0013")) {
				d.setP13(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0014")) {
				d.setP14(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0015")) {
				d.setP15(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0016")){
				d.setP16(val);
				documentInstalationD.save(d);

			}
			else if(val.equals("#p0017")){
				d.setP9(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0018")) {
				d.setP10(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0019")) {
				d.setP11(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0020")) {
				d.setP12(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#p0021")) {
				d.setP13(val);
				documentInstalationD.save(d);

			}
			else if(type.equals("#logo3")) {
				d.setP13(val);
				documentInstalationD.save(d);

			}
			else {
				d.setTitre(val);
				documentInstalationD.save(d);

			}

			return val;
		}

		@RequestMapping(value = "/api/UpdateLogoCT", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateCollecteLogo(@RequestParam MultipartFile logo4){
			DocumentDechetCT d = documentDechetCTRepository.getDocumentDechetCT();
			String fileName = saveFile(logo4);
			d.setLogo("/"+fileName);
			documentDechetCTRepository.save(d);
			return  new ModelAndView("paramPage");

		}
		@RequestMapping(value = "/api/UpdateLogoZF", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateZFLogo(@RequestParam("logo") MultipartFile file){
			DocumentImportationDechet d = documentImortationDechet.getDocumentImortationDechet();
			String fileName = saveFile(file);
			d.setLogo("/"+fileName);
			documentImortationDechet.save(d);
			return  new ModelAndView("paramPage");
		}
		@RequestMapping(value = "/api/UpdateLogoET", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateETLogo(@RequestParam MultipartFile logo2){
			DocumentDechetND d = documentDechetNdRepository.getDocumentDechetND();
			String fileName = saveFile(logo2);
			d.setLogo("/"+fileName);
			documentDechetNdRepository.save(d);
			return  new ModelAndView("paramPage");
		}
		@RequestMapping(value = "/api/UpdateLogoIT", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateInstalationLogo(@RequestParam MultipartFile logo3){
			DocumentInstalation d = documentInstalationD.getDocumentInstalationD();
			String fileName = saveFile(logo3);
			d.setLogo("/"+fileName);
			documentInstalationD.save(d);
			return  new ModelAndView("paramPage");

		}
		@RequestMapping(value = "/api/UpdateLogoEie", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateEieLogo(@RequestParam MultipartFile file){
			DocumentEIE d = documentEieRepository.getDocumentEIE();
			String fileName = saveFile(file);
			d.setLogo("/"+fileName);
			documentEieRepository.save(d);
			return  new ModelAndView("paramPage");

		}
		@RequestMapping(value = "/api/UpdateLogoTR", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateTransactionLogo(@RequestParam MultipartFile logo6){
			DocumentTransaction d = documentTransactionD.getDocumentTransactionD();
			String fileName = saveFile(logo6);
			d.setLogo("/"+fileName);
			documentTransactionD.save(d);
			return  new ModelAndView("paramPage");

		}
		@RequestMapping(value = "/api/UpdateLogoEX", method = RequestMethod.POST,headers = "content-type=multipart/form-data")
		public ModelAndView UpdateExportLogo(@RequestParam MultipartFile logo5){
			DocumentExportaltion d = documentExportationD.getDocumentExportationD();
			String fileName = saveFile(logo5);
			d.setLogo("/"+fileName);
			documentExportationD.save(d);
			return  new ModelAndView("paramPage");

		}
		@RequestMapping(value = "/api/UpdateDocumentCT", method = RequestMethod.GET)
		public @ResponseBody String ListDocumentCT(@RequestParam String type, @RequestParam String val) {

		DocumentDechetCT d = documentDechetCTRepository.getDocumentDechetCT();
		if (type.equals("#titre4")) {
			d.setP1(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_02")) {
			d.setP2(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_03")) {
			d.setP3(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_04")) {
			d.setP4(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_05")) {
			d.setP5(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_06")) {
			d.setP6(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_07")) {
			d.setP7(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_08")) {
			d.setP8(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_09")) {
			d.setP9(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_10")) {
			d.setP10(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_11")) {
			d.setP11(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_12")) {
			d.setP12(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_13")) {
			d.setP13(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_14")) {
			d.setP14(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_15")) {
			d.setP15(val);
			documentDechetCTRepository.save(d);
		} else if (type.equals("#ct_16")) {
			d.setP19(val);
			documentDechetCTRepository.save(d);
		}
		else if (type.equals("#ct_18")) {
		d.setP20(val);
		documentDechetCTRepository.save(d);
		}
		else if (type.equals("#ct_19")) {
			d.setP16(val);
			documentDechetCTRepository.save(d);
		}

		else {
			d.setP21(val);
			documentDechetCTRepository.save(d);
		}
		return val;
	}

		@RequestMapping(value = "/api/UpdateDocumentExportation", method = RequestMethod.GET)
		public @ResponseBody String UpdateExp(@RequestParam String type,@RequestParam String val) {


		DocumentExportaltion d = documentExportationD.getOne(5);
		if(type.equals("#exp1")){
			d.setP1(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp2")){
			d.setP2(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp3")){
			d.setP3(val);
			documentExportationD.save(d);
		}
		else if(type.equals("#exp4")){
			d.setP4(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp5")){
			d.setP5(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp6")){
			d.setP6(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp7")){
			d.setP7(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp8")){
			d.setP8(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp9")){
			d.setP9(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp10")){
			d.setP10(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp11")){
			d.setP11(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp12")){
			d.setP12(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp13")){
			d.setP13(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp14")){
			d.setP14(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp15")){
			d.setP15(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp16")){
			d.setP16(val);
			documentExportationD.save(d);

		}
		else if(type.equals("#exp17")){
			d.setP17(val);
			documentExportationD.save(d);

		}
		else {
			d.setTitre(val);
			documentExportationD.save(d);

		}

		return val;
	}

		@RequestMapping(value = "/api/UpdateDocumentTr", method = RequestMethod.GET)
		public @ResponseBody String UpdateTr(@RequestParam String type,@RequestParam String val) {


			DocumentTransaction d = documentTransactionD.getOne(1);

			if(type.equals("#tr1")){
				d.setP1(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr2")){
				d.setP2(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr3")){
				d.setP3(val);
				documentTransactionD.save(d);
			}
			else if(type.equals("#tr4")){
				d.setP4(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr5")){
				d.setP5(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr6")){
				d.setP6(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr7")){
				d.setP7(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr8")){
				d.setP8(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr9")){
				d.setP9(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr10")){
				d.setP10(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr11")){
				d.setP11(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr12")){
				d.setP12(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr13")){
				d.setP13(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr14")){
				d.setP14(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr15")){
				d.setP15(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr16")){
				d.setP16(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr17")){
				d.setP17(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr18")){
				d.setP18(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr19")){
				d.setP19(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr20")){
				d.setP20(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr22")){
				d.setP22(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr23")){
				d.setP23(val);
				documentTransactionD.save(d);

			}
			else if(type.equals("#tr24")){
				d.setP24(val);
				documentTransactionD.save(d);

			}
			else {
				d.setTitre(val);
				documentTransactionD.save(d);

			}

			return val;
		}

	@RequestMapping(value = "/api/UpdateDocumentEie", method = RequestMethod.GET)
	public @ResponseBody String UpdateEie(@RequestParam String type,@RequestParam String val) {


		DocumentEIE d = documentEieRepository.getDocumentEIE();

		if(type.equals("#eie1")){
			d.setP1(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie2")){
			d.setP2(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie3")){
			d.setP3(val);
			documentEieRepository.save(d);
		}
		else if(type.equals("#eie4")){
			d.setP4(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie5")){
			d.setP5(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie6")){
			d.setP6(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie7")){
			d.setP7(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie8")){
			d.setP8(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie9")){
			d.setP9(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie10")){
			d.setP10(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie11")){
			d.setP11(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie12")){
			d.setP12(val);
			documentEieRepository.save(d);

		}
		else if(type.equals("#eie13")){
			d.setP13(val);
			documentEieRepository.save(d);

		}
		else {
			d.setTitre(val);
			documentEieRepository.save(d);

		}

		return val;
	}


			private String saveFile(MultipartFile image){
				try {
					// Get the file and save it somewhere
					byte[] bytes = image.getBytes();
					Path path = Paths.get(uploadurl2 + image.getOriginalFilename());
					Files.write(path, bytes);
					return image.getOriginalFilename();
				} catch (IOException e) {
					return null;
				}
			}
	@GetMapping("/api/generate_recap_Eie/{id}")
	public ResponseEntity<InputStreamResource> generate_recap_Eie(@PathVariable int id) throws Exception {

		HttpHeaders headers = new HttpHeaders();
		// headers.add("Content-Disposition", "inline; filename=testx.pdf");
		DemandeInformation d = web.getDemandeInfoById(id);
		headers.add("Content-Disposition", "attachment; filename="+d.getNum_demande()+".pdf");
		//ListDocNotif[] l = webt.listDocNotif(d.getId_demande_information(),"EIE");// dans l'admin il n'a pas le type EIE
		//ListDocNotif[] l = web.listDocNotif(d.getId_demande_information(),d.getType());
		ListDocNotif[] l = listDocNotifRepository.ListdocEIE(d.getId_demande_information());
		ByteArrayInputStream bis = GeneratePDF.generateRecapEie(d,l,urls);
		return ResponseEntity.ok()
				.headers(headers)
				.contentType(MediaType.APPLICATION_OCTET_STREAM)
				.body(new InputStreamResource(bis));
	}

	@RequestMapping(value = "/api/getOneCodeTransporteur", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOneCodeTransporteur(@RequestParam String id)
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_trans = Integer.parseInt(id);
		TransporteurParam t =  transporteurParamRepository.getbyid(id_trans);
		List<Code> gt=t.getCode();
		map.put("code",t.getCode());
		return map;
	}

	@RequestMapping(value = "/api/getOneMoyenTransporteur", method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> getOneMoyenTransporteur(@RequestParam String id)
			throws org.springframework.boot.json.JsonParseException, IOException, MessagingException {
		Map<String,Object> map = new HashMap<>();
		int id_trans = Integer.parseInt(id);
		TransporteurParam t =  transporteurParamRepository.getbyid(id_trans);
		List<MoyenTransport> gt=t.getMoyenTransport();
		map.put("moyenTransporteur",t.getMoyenTransport());
		return map;
	}
}
