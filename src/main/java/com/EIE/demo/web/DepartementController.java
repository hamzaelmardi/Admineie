package com.EIE.demo.web;

import com.EIE.demo.dao.DepartementRepository;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.model.Departement;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller

public class DepartementController {
    @Autowired
    DepartementRepository departementRepository;
    @Autowired
    private SecurityService webs;

    @RequestMapping(value = "/api/getDepartement", method = RequestMethod.GET)
    public ModelAndView getDepartement() {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("listF", departementRepository.getAllDepartement());
        return new ModelAndView("param/departement", model);
    }

    @RequestMapping(value = "/api/updateDepartement/{id}", method = RequestMethod.GET)
    public ModelAndView getDepartement(@PathVariable int id) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("departementone", departementRepository.getOne(id));
        return new ModelAndView("param/departement", model);
    }

    @RequestMapping(value = "/api/adddepartement/", method = RequestMethod.POST)
    public   ModelAndView changerStatut(@RequestBody Departement departement ) throws JsonProcessingException {
        Map<String, Object> model = new HashMap<String, Object>();
        Object old = null;
        String action = "ajouter";
        if (departement.getDepartementid()!= 0) {
            int idd = departement.getDepartementid();
            old = departementRepository.getOne(idd);
            action = "modifier";
        }
        webs.addAudit("", action, "",departement.getDepartementid()+ "", old, departement, "departement");
        departementRepository.save(departement);
        model.put("listF", departementRepository.getAllDepartement());

        return new ModelAndView("param/departement", model);

    }

    @RequestMapping(value = "/api/deleteDepartement/{id}", method = RequestMethod.POST)
    public   @ResponseBody void deleteDepartement(@PathVariable int id) throws JsonProcessingException {
        Departement em=departementRepository.getOne(id);
        Departement oldem = em;
        em.setDeleteDateTime(new Date());

        departementRepository.save(em);
        webs.addAudit("", "supprimer", "",em.getDepartementid() + "", oldem, em, "Employe");


    }
}
