package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class StatistiqueController {

    @Autowired
    private NotificationRepository notifRepository;
    @Autowired
    private
    StatistiqueRepository statistiqueRepository;
    @Autowired
    StatutProjetRepository statutProjetRepository;
    @Autowired
    private InstallationRepository installationRepository;
    @Autowired
    private SecurityService secure;
    @Autowired
    FileStorageService fileStorageService;
    @Autowired
    WebService web;
    @Autowired
    RegionRepository regionRepository;
    @Autowired
    PrefectureRepository prefectureRepository;


    @RequestMapping(value = "/api/statistique/InformationGeneraleJsp", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView societeImportatriceJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/informationGenerale/societeImportatrice", model);
    }

    @RequestMapping(value = "/api/statistique/avisDepartementJsp", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView avisDepartementJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/informationGenerale/avisDepartement", model);
    }

    @RequestMapping(value = "/api/statistique/getSocieteImportatriceJsp",method = RequestMethod.GET)
    public @ResponseBody Object[] getSocieteImportatriceJsp(@RequestParam int typeDechet) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        if(typeDechet==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getSocieteImportatriceDang()));
        }
        else{
            addList.addAll(Arrays.asList(statistiqueRepository.getSocieteImportatriceNonDang()));
        }

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getSocieteExportateurJsp",method = RequestMethod.GET)
    public @ResponseBody Object[] getSocieteExportateurJsp(@RequestParam int typeDechet) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        if(typeDechet==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getSocieteExportateurDang()));
        }
        else{
            addList.addAll(Arrays.asList(statistiqueRepository.getSocieteExportateurNonDang()));
        }

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getProducteurZFJsp",method = RequestMethod.GET)
    public @ResponseBody Object[] getProducteurZFJsp(@RequestParam int typeDechet) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getProducteursZF(typeDechet)));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/getStatutDossierBytype/{type}", method = RequestMethod.POST)
    public ModelAndView getStatutDossierBytype(@PathVariable("type") String type) {

        Map<String,Object> model = new HashMap<String,Object>();

        if(type.equals("ZF")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeZF();
            model.put("statuts",statuts);
        }
        if(type.equals("ET")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeET();
            model.put("statuts",statuts);
        }
        if(type.equals("XD")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeXD();
            model.put("statuts",statuts);
        }
        if(type.equals("TR")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeTR();
            model.put("statuts",statuts);
        }
        if(type.equals("CT")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeCT();
            model.put("statuts",statuts);
        }
        if(type.equals("IT")){
            List<StatutProjet> statuts = statistiqueRepository.getAllStatutByTypeIT();
            model.put("statuts",statuts);
        }
        return new ModelAndView("ayoub/select",model);
    }

    @RequestMapping(value = "/api/statistique/getStatutDossierJsp",method = RequestMethod.GET)
    public @ResponseBody Object[] getStatutDossierJsp(@RequestParam String type, @RequestParam int statut_select) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        if(type.equals("CT")){
            addList.addAll(Arrays.asList(statistiqueRepository.getStatutDossiersCT(statut_select)));
        }else if(type.equals("IT")){
            addList.addAll(Arrays.asList(statistiqueRepository.getStatutDossiersIT(statut_select)));
        }else{
            addList.addAll(Arrays.asList(statistiqueRepository.getStatutDossiers(type, statut_select)));
        }
        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getAvisdepartementsconcernesJsp",method = RequestMethod.GET)
    public @ResponseBody Object[] getAvisdepartementsconcernesJsp() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getAvisdepartementsconcernes()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/jspPaysEtranger", method = RequestMethod.GET)
    public @ResponseBody ModelAndView jspPaysEtranger(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/typesETJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCodeTypeET",method = RequestMethod.GET)
    public @ResponseBody Object[] getCodeTypeET() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByETtypes()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/jspNombrePaysEtranger", method = RequestMethod.GET)
    public @ResponseBody ModelAndView jspNombrePaysEtranger(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/nombrePaysJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCodeNombreET",method = RequestMethod.GET)
    public @ResponseBody Object[] getCodeNombreET() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByETNombre()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getNombrePaysET",method = RequestMethod.GET)
    public @ResponseBody Object[] getNombrePaysET(@RequestParam int pays) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getNombrePaysParCode(pays)));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/typeDechetPaysEtranger", method = RequestMethod.GET)
    public @ResponseBody ModelAndView typeDechetPaysEtranger(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Pays> n = statistiqueRepository.getPaysNotificationsET();
        model.put("pays",n);
        model.put("type",type);
        return new ModelAndView("statistique/paysEtranger", model);
    }

    @RequestMapping(value = "/api/statistique/typeExportJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView typeExportJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/typeExportJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCodeTypeXD",method = RequestMethod.GET)
    public @ResponseBody Object[] getCodeTypeXD() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByXDtypes()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/paysExportJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView paysExportJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/paysExportJsp", model);
    }

    @RequestMapping(value = "/api/pays", method = RequestMethod.GET)
    public @ResponseBody String[] getPays(){
        String[] n = notifRepository.getXD();
        return n;
    }

    @RequestMapping(value = "/api/statistique/getCodePaysXD",method = RequestMethod.GET)
    public @ResponseBody Object[] getCodePaysXD() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByXDPays()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/nombreCodeExportJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView nombreCodeExportJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/nombreCodeExportJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getNombreCodeXD",method = RequestMethod.GET)
    public @ResponseBody Object[] getNombreCodeXD() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByNombreXDCode()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/paysMarocExportJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView paysMarocExportJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/paysMarocExportJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getPaysMarocExport",method = RequestMethod.GET)
    public @ResponseBody Object[] getPaysMarocExport() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationByPaysMarocXD()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getNombrePaysTypeXD",method = RequestMethod.GET)
    public @ResponseBody Object[] getNombrePaysTypeXD(@RequestParam int typeDechet) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationNombrePaysTypeXD(typeDechet)));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/quantitePaysExportJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView quantitePaysExportJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        return new ModelAndView("statistique/quantitePaysExportJsp", model);
    }

    ///////////////////////////Collecte///////////////////////////////////

    @RequestMapping(value = "/api/statistique/getQuantitePaysExport",method = RequestMethod.GET)
    public @ResponseBody Object[] getQuantitePaysExport() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getnotificationQuantitePaysExport()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/collecteStatistiqueJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView collecteStatistiqueJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        List<Region> n = regionRepository.getAllRegion();
        model.put("region",n);
        return new ModelAndView("statistique/collecte/collecteStatistique", model);
    }

    @RequestMapping(value = "/api/region", method = RequestMethod.GET)
    public @ResponseBody String[] getRegion(@RequestParam int id_pref){
        if(id_pref==0){
            String[] n = regionRepository.getRegions();
            return n;
        }else{
            String[] p = regionRepository.getPrefectures();
            return p;
        }

    }

    @RequestMapping(value = "/api/statistique/getCountCollectByRegion",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountCollectByRegion(@RequestParam int id_reg, @RequestParam int prefecture) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();
        if(id_reg==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountCollectByAll()));
        }else if(id_reg!=1 && id_reg!=0 && prefecture==0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountCollectByRegion(id_reg)));
        }else if(prefecture!=0 && id_reg!=1 && id_reg!=0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountCollectByVille(id_reg, prefecture)));
        }
        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/getVillesByRegion/{id_reg}", method = RequestMethod.POST)
    public ModelAndView getVillesByRegion(@PathVariable int id_reg) {

        Map<String, Object> model = new HashMap<String, Object>();
        if (id_reg != 0){
            List<Prefecture> prefectures = prefectureRepository.getAllPrefecturebyRegionId(id_reg);
            model.put("prefectures",prefectures);
        }
        return new ModelAndView("ayoub/select3",model);
    }

    @RequestMapping(value = "/api/statistique/collecteStatistiqueCodeJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView collecteStatistiqueCodeJsp() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/collecteStatistiqueCodeJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCountCollecteByCode",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountCollecteByCode() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCountCollecteByCode()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/demandeAjoutStatistiqueCountJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView demandeAjoutStatistiqueCountJsp() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/demandeAjoutStatistiqueCountJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCountDemandeAjout",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountDemandeAjout() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCountDemandeAjout()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/vehiculesStatistiqueCountJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView vehiculesStatistiqueCountJsp() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/vehiculesStatistiqueCountJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCountVehicules",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountVehicules() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCountVehicules()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/typeCodeSociete", method = RequestMethod.GET)
    public @ResponseBody ModelAndView typeCodeSociete() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/typeCodeSociete", model);
    }

    @RequestMapping(value = "/api/statistique/getTypeCodeSociete",method = RequestMethod.GET)
    public @ResponseBody Object[] getTypeCodeSociete() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCodeTypeBySociete()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/getSocietesCollecte", method = RequestMethod.GET)
    public @ResponseBody String[] getSocietesCollecte(){
        String[] n = statistiqueRepository.getSocietesCollecte();
        return n;
    }

    @RequestMapping(value = "/api/statistique/getCollectByRegion",method = RequestMethod.GET)
    public @ResponseBody Object[] getCollectByRegion(@RequestParam int id_reg, @RequestParam int prefecture) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();
        if(id_reg==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getCollectByAll()));
        }else if(id_reg!=1 && id_reg!=0 && prefecture==0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCollectByRegion(id_reg)));
        }else if(prefecture!=0 && id_reg!=1 && id_reg!=0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCollectByVille(id_reg, prefecture)));
        }
        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/societeDemandeAjout", method = RequestMethod.GET)
    public @ResponseBody ModelAndView societeDemandeAjout() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/societeDemandeAjout", model);
    }

    @RequestMapping(value = "/api/statistique/getSocieteDemandeAjout",method = RequestMethod.GET)
    public @ResponseBody Object[] getSocieteDemandeAjout() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getSocieteDemandeAjout()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/dateExpiration", method = RequestMethod.GET)
    public @ResponseBody ModelAndView dateExpiration() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/collecte/dateExpiration", model);
    }

    @RequestMapping(value = "/api/statistique/getDateExpiration",method = RequestMethod.GET)
    public @ResponseBody Object[] getDateExpiration() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getDateExpiration()));

        res=addList.toArray();
        return res;
    }


    ///////////////////////////Installation///////////////////////////////////

    @RequestMapping(value = "/api/statistique/installationStatistiqueJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView installationStatistiqueJsp(@RequestParam String type) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("type",type);
        List<Region> n = regionRepository.getAllRegion();
        model.put("region",n);
        return new ModelAndView("statistique/installation/installationStatistique", model);
    }

    @RequestMapping(value = "/api/statistique/getCountInstallationByRegion",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountInstallationByRegion(@RequestParam int id_reg, @RequestParam int prefecture) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();
        if(id_reg==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountInstallationByAll()));
        }else if(id_reg!=1 && id_reg!=0 && prefecture==0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountInstallationByRegion(id_reg)));
        }else if(prefecture!=0 && id_reg!=1 && id_reg!=0){
            addList.addAll(Arrays.asList(statistiqueRepository.getCountInstallationByVille(id_reg, prefecture)));
        }
        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/installationStatistiqueCodeJsp", method = RequestMethod.GET)
    public @ResponseBody ModelAndView installationStatistiqueCodeJsp() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/installation/installationStatistiqueCodeJsp", model);
    }

    @RequestMapping(value = "/api/statistique/getCountInstallationByCode",method = RequestMethod.GET)
    public @ResponseBody Object[] getCountInstallationByCode() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCountInstallationByCode()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/getInstallationByRegion",method = RequestMethod.GET)
    public @ResponseBody Object[] getInstallationByRegion(@RequestParam int id_reg, @RequestParam int prefecture) throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();
        if(id_reg==1){
            addList.addAll(Arrays.asList(statistiqueRepository.getInstallationByAll()));
        }else if(id_reg!=1 && id_reg!=0 && prefecture==0){
            addList.addAll(Arrays.asList(statistiqueRepository.getInstallationByRegion(id_reg)));
        }else if(prefecture!=0 && id_reg!=1 && id_reg!=0){
            addList.addAll(Arrays.asList(statistiqueRepository.getInstallationByVille(id_reg, prefecture)));
        }
        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/statistique/typeCodeSocieteInstalaltion", method = RequestMethod.GET)
    public @ResponseBody ModelAndView typeCodeSocieteInstalaltion() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/installation/typeCodeSocieteInstalaltion", model);
    }

    @RequestMapping(value = "/api/statistique/getTypeCodeSocieteInstalaltion",method = RequestMethod.GET)
    public @ResponseBody Object[] getTypeCodeSocieteInstalaltion() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getCodeTypeBySocieteInstall()));

        res=addList.toArray();
        return res;
    }

    @RequestMapping(value = "/api/getSocietesInstallation", method = RequestMethod.GET)
    public @ResponseBody String[] getSocietesInstallation(){
        String[] n = statistiqueRepository.getSocietesInstallation();
        return n;
    }

    @RequestMapping(value = "/api/statistique/dateExpirationInstall", method = RequestMethod.GET)
    public @ResponseBody ModelAndView dateExpirationInstall() {
        Map<String, Object> model = new HashMap<String, Object>();
        return new ModelAndView("statistique/installation/dateExpirationInstall", model);
    }

    @RequestMapping(value = "/api/statistique/getDateExpirationInstall",method = RequestMethod.GET)
    public @ResponseBody Object[] getDateExpirationInstall() throws Exception {

        Object[] res = null;
        List<Object> addList = new ArrayList<Object>();

        addList.addAll(Arrays.asList(statistiqueRepository.getDateExpirationInstall()));

        res=addList.toArray();
        return res;
    }
}
