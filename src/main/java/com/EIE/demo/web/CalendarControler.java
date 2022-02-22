package com.EIE.demo.web;


import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.CollecteTransporteur;
import com.EIE.demo.model.Compte;
import com.EIE.demo.model.DemandeInformation;
import com.EIE.demo.model.Installation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CalendarControler {

    @Autowired
    private ReunionRepository reunionRepository;

    @Autowired
    private DemandeInformationRepository demandeInformationRepository;

    @Autowired
    private VisiteInstallationRepository visiteInstallationRepository;
    @Autowired
    private InstallationRepository installationRepository;
    @Autowired
    private
    WebService web;
    @Autowired private
    CollecteRepository collecteRepository;


    @GetMapping("/reunionsCalendar")
    public @ResponseBody List<Object> reunions(){
//        return reunionRepository.findAll();
    	List<Object> obj=new  ArrayList<Object>();
    	Compte c = web.getCompteConnected();
    	if(c.getAuto_nv().equals("ev")){
            obj.addAll(reunionRepository.findDataForCalendar());
        }
        else if(c.getAuto_nv().equals("auto")) {
            obj.addAll(installationRepository.findDataForCalendar());
            obj.addAll(collecteRepository.findDataForCalendarCollecte());
        }else{
            obj.addAll(reunionRepository.findDataForCalendar());
            obj.addAll(installationRepository.findDataForCalendar());
            obj.addAll(collecteRepository.findDataForCalendarCollecte());
        }
        //obj.addAll(reunionRepository.findDataForCalendar2());
        return obj;    }

    @GetMapping("/visites")
    public @ResponseBody List<Object> visites(){
//        return reunionRepository.findAll();
        return visiteInstallationRepository.findDataForCalendar();
    }

    @PostMapping("/getOneEventsReunion/{type}")
    public ModelAndView getOneEventsReunion(@RequestParam int id,@PathVariable String type){
        Map<String, Object> model = new HashMap<String,Object>();
        DemandeInformation d = null;
        Installation ins = null;
        CollecteTransporteur coll = null;
        if(type.equals("Reunion")){
            d = demandeInformationRepository.getDemandeByReunion(id);
        }

        else if(type.equals("Installation")){
            ins = installationRepository.getInstallationByVisite(id);
        }

        else if(type.equals("Collecte")){
            coll= collecteRepository.getCollecteByReunion1(id);
        }

        model.put("demande",d);
        model.put("installation",ins);
        model.put("collecte",coll);
        model.put("type",type);

        return new ModelAndView("user_modal/auto_load_events",model);
    }





}
