package com.EIE.demo.web;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.EIE.demo.dao.*;
import com.EIE.demo.model.Categorie;
import com.EIE.demo.model.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
@Controller
public class StatControler {

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
	@Autowired
	private PrRoleRepository profilRoleRepository;
	@Autowired
	private CompteRepository compteRepository;
	@Autowired
	private RegionRepository regionRepository;
	@Autowired
	private PrefectureRepository prefectureRepository;
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
	private CategorieRepository categorieRepository;


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
	private NotificationRepository notificationRepository;
	@Autowired
	private InstallationRepository installationRepository;
	@Autowired
	private SecurityService secure;
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	WebService web;

@RequestMapping(value = "/api/statistique/Autorisationparstatut",method = RequestMethod.GET)
	   public @ResponseBody Object[] Autorisationparstatut(@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("type_date") String type_date,@RequestParam(value="type") String type,@RequestParam(value="statut_select[]") int[] statut_select) throws Exception {





	   java.sql.Date d1 = java.sql.Date.valueOf(date1);
	   java.sql.Date d2 = java.sql.Date.valueOf(date2);

	   Object[] res = null;


	   List<Object> addList = new ArrayList<Object>();


	   if(type.equals("CT"))
	   {
	   if(type_date.equals("date_depot")) {
	   addList.add(collecteRepository.getStatByDateDepot1(d1,d2,statut_select)) ;
	   }
	   else {
	   addList.add(collecteRepository.getStatByDateValidation1(d1,d2,statut_select)) ;
	   }
	   }

	   if(type.equals("IT")) {
	   if (type_date.equals("date_depot")) {
	   addList.add(installationRepository.getStatByDateDepot1(d1, d2,statut_select));
	   }
	   else {
	   addList.add(installationRepository.getStatByDateValidation1(d1, d2,statut_select));
	   }
	   }

	   if(type.equals("ZF") ||type.equals("XD")  || type.equals("ET") ||type.equals("TR")) {
	   if (type_date.equals("date_depot")) {
		  addList.addAll(Arrays.asList(notificationRepository.getStatByDateDepot1(d1, d2,type,statut_select)));


	   } else if (type_date.equals("date_validation")) {
		   addList.addAll(Arrays.asList(notificationRepository.getStatByDateValidation1(d1, d2,type,statut_select)));
	   }
	//
	   }
	   res=addList.toArray();

	   return res;
	   }
@RequestMapping(value = "/api/statistique/NombreEIE/{etat}", method = RequestMethod.GET)
public ModelAndView getNombreEIE(@PathVariable String etat, @RequestParam String type) {
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("etat",etat);
	model.put("type",type);
	return new ModelAndView("statistique/NombreEIE", model);
}
//*****
@RequestMapping(value = "/api/statistique/Quantite", method = RequestMethod.GET)
public ModelAndView getQuantite(@RequestParam String type) {
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("type",type);
	return new ModelAndView("statistique/Quantite", model);
}
///
	@RequestMapping(value = "/api/statistique/numberQuantite",method = RequestMethod.GET)
	public @ResponseBody Object[] numberQuantite(@RequestParam(value="annee") Integer annee) throws Exception {

		Object[] res = null;
		//List<Integer> list = Arrays.asList(annee);
		List<Object> addList = new ArrayList<Object>();
		addList.addAll(Arrays.asList(notificationRepository.datenotif(annee)));

		res=addList.toArray();
		return res;
	}
	//**********
@RequestMapping(value = "/api/statistique/Environnementaleparregion/{etat}", method = RequestMethod.GET)
public ModelAndView getEIEparRegion(@RequestParam String type, @PathVariable String etat) {
	Map<String, Object> model = new HashMap<String, Object>();
	List<Categorie> categories = categorieRepository.getAllCategorie();
	if(etat.equals("EE")){
		List<Region> region = regionRepository.getAllRegion();
		model.put("region",region);
	}
	model.put("categorie",categories);
	model.put("type",type);
	model.put("etat",etat);
	return new ModelAndView("statistique/Environnementaleparregion", model);
}


	@RequestMapping(value = "/api/statistique/getMontantInvestis/{etat}", method = RequestMethod.GET)
	public ModelAndView getMontantInvestissement(@PathVariable String etat, @RequestParam String type) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Categorie> categories = categorieRepository.getAllCategorie();
		if(etat.equals("EE")){
			List<Region> region = regionRepository.getAllRegion();
			model.put("region",region);
		}
		model.put("categorie",categories);
		model.put("type",type);
		return new ModelAndView("statistique/montantExamine", model);
	}

	@RequestMapping(value = "/api/statistique/getEIEparcategorie/{type}",method = RequestMethod.GET)
	public @ResponseBody Object[] getEIEparcategorie(@PathVariable String type, @RequestParam(value="annee[]") Integer[] annee) throws Exception {

		Object[] res = null;
		List<Integer> list = Arrays.asList(annee);
		List<Object> addList = new ArrayList<Object>();
		if(type.equals("EE")){
			addList.addAll(Arrays.asList(demadeInfoRepository.getCountEIESignee(list)));
		}else if(type.equals("NT")){
			addList.addAll(Arrays.asList(demadeInfoRepository.getCountNTSignee(list)));
		}else if(type.equals("AE")){
			addList.addAll(Arrays.asList(demadeInfoRepository.getCountAESignee(list)));
		}

		res=addList.toArray();
		return res;
	}

@RequestMapping(value = "/api/statistique/Acceptabilites", method = RequestMethod.GET)
public ModelAndView getAcceptabilites(@RequestParam String type) {
	Map<String, Object> model = new HashMap<String, Object>();
	model.put("type",type);
	return new ModelAndView("statistique/acceptabilites", model);
}

@RequestMapping(value = "/api/statistique/getAcceptabilitesparcategorie",method = RequestMethod.GET)
public @ResponseBody Object[] getAcceptabilitesparcategorie(@RequestParam("date1") String date1,@RequestParam("date2") String date2) throws Exception {
java.sql.Date d1 = java.sql.Date.valueOf(date1);
java.sql.Date d2 = java.sql.Date.valueOf(date2);
Object[] res = null;
List<Object> addList = new ArrayList<Object>();

addList.addAll(Arrays.asList(demadeInfoRepository.geteieparcategorieDateValidation11(d1,d2))) ;

res=addList.toArray();
return res;
}

	@RequestMapping(value = "/api/statistique/getEEparRegionEtCategorie/{type}",method = RequestMethod.GET)
	public @ResponseBody Object[] getEEparRegionEtCategorie(@PathVariable String type, @RequestParam(required = false, value = "region", defaultValue = "0") int region,@RequestParam("categorie") int categorie, @RequestParam("annee") int annee) throws Exception {
		Object[] res = null;
		List<Integer> list = Arrays.asList(annee);
		List<Object> addList = new ArrayList<Object>();
		if(type.equals("EE")){
			if(region==0 && categorie==0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparTousAll()));
				}else {
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparTous(annee)));
				}
			}else if(region!=0 && categorie==0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparRegionAll(region)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparRegion(annee,region)));
				}
			}else if(region==0 && categorie!=0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparCategorieAll(categorie)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparCategorie(annee,categorie)));
				}
			}else{
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparCategorieAndRegionAll(categorie,region)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getEEparCategorieAndRegion(annee,categorie,region)));
				}
			}
		}else if(type.equals("NT")){
			if(categorie!=0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTProjetParCategorieC(categorie)));
			}else if(categorie==0 && annee!=0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTProjetParCategorieA(annee)));
			}else if(categorie==0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTProjetParCategorieAll()));
			}else{
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTProjetParCategorieAC(annee, categorie)));
			}
		}
		else if(type.equals("AE")){
			if(categorie!=0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getAEProjetParCategorieC(categorie)));
			}else if(categorie==0 && annee!=0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getAEProjetParCategorieA(annee)));
			}else if(categorie==0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getAEProjetParCategorieAll()));
			}else{
				addList.addAll(Arrays.asList(demadeInfoRepository.getAEProjetParCategorieAC(annee, categorie)));
			}
		}

		res=addList.toArray();
		return res;
	}


	@RequestMapping(value = "/api/statistique/getMontantInvestissement/{type}",method = RequestMethod.GET)
	public @ResponseBody Object[] getMontantInvestissement(@PathVariable String type, @RequestParam(defaultValue = "0", value = "region") int region,@RequestParam("categorie") int categorie, @RequestParam("annee") int annee){

		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();
		if(type.equals("EE")){
			if(region==0 && categorie==0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInAll()));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparTous(annee)));
				}
			}else if(region!=0 && categorie==0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparRegionAll(region)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparRegion(annee,region)));
				}
			}else if(region==0 && categorie!=0){
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparCategorieAll(categorie)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparCategorie(annee,categorie)));
				}

			}else{
				if(annee==0){
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparRegionCategorieAll(categorie,region)));
				}else{
					addList.addAll(Arrays.asList(demadeInfoRepository.getMontantInparRegionCategorie(annee,categorie,region)));
				}
			}
		}else if(type.equals("NT")){
			if(categorie!=0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTMontantParCategorieC(categorie)));
			}else if(categorie==0 && annee!=0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTMontantParCategorieA(annee)));
			}else if(categorie==0 && annee==0){
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTMontantParCategorieAll()));
			}else{
				addList.addAll(Arrays.asList(demadeInfoRepository.getNTMontantParCategorieAC(annee, categorie)));
			}
		}
		res=addList.toArray();
		return res;
	}
}



