package com.EIE.demo.web;

import com.EIE.demo.dao.DepartementRepository;
import com.EIE.demo.dao.EmployeRepo;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller

public class EmployeController {
    @Autowired
    EmployeRepo employeRepo;
    @Autowired
    DepartementRepository departementRepository;
    @Autowired
    private SecurityService webs;
    @Autowired
    private WebService web;

    @RequestMapping(value = "/api/getEmploye", method = RequestMethod.GET)
    public ModelAndView getEmploye() {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("listF", employeRepo.getAllEmploye());
        model.put("departement", departementRepository.getAllDepartement());
        return new ModelAndView("param/employe", model);
    }

    @RequestMapping(value = "/api/updateEmploye/{id}", method = RequestMethod.GET)
    public ModelAndView getEmploye(@PathVariable int id) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("employe", employeRepo.getOne(id));
        model.put("departement", departementRepository.getAllDepartement());
        return new ModelAndView("param/employe", model);
    }

    @RequestMapping(value = "/api/addEmploye/{departementid}", method = RequestMethod.POST)
    public   ModelAndView changerStatut(@RequestBody Employe employe , @PathVariable int departementid) throws JsonProcessingException {
        Map<String, Object> model = new HashMap<String, Object>();
        Object old = null;
        String action = "ajouter";
        if (employe.getEmpId()!= 0) {
            int idd = employe.getEmpId();

            old = employeRepo.getOne(idd);

            action = "modifier";
        }
        employe.setDepartement(departementRepository.getOne(departementid));
        webs.addAudit("", action, "",employe.getEmpId()+ "", old, employe, "Emp");
        employeRepo.save(employe);
        model.put("listF", employeRepo.getAllEmploye());

        return new ModelAndView("param/employe", model);

    }

    @RequestMapping(value = "/api/deleteEmploye/{id}", method = RequestMethod.POST)
    public   @ResponseBody void deleteEmploye(@PathVariable int id) throws JsonProcessingException {
        Employe em=employeRepo.getOne(id);
        Employe oldem = em;
        em.setDeleteDateTime(new Date());


        employeRepo.save(em);
        webs.addAudit("", "supprimer", "",em.getEmpId() + "", oldem, em, "Employe");


    }
    @RequestMapping(value = "/api/getemployesearch", method = RequestMethod.POST)
    public ModelAndView getListeempSearch(@RequestParam("nom") String nom) {

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("listF",employeRepo.getAllEmployebyname(nom));
        Compte ct = web.getCompteConnected();

        return new ModelAndView("param/employetr", model);
    }


}