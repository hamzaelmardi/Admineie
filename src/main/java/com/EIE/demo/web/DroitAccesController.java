package com.EIE.demo.web;

import com.EIE.demo.dao.GroupAccesRepository;
import com.EIE.demo.dao.PrRoleRepository;
import com.EIE.demo.dao.ProfilRepository;
import com.EIE.demo.dao.RoleRepository;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class DroitAccesController {

    @Autowired
    ProfilRepository profilRepository;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    PrRoleRepository profilRoleRepository;
    @Autowired
    GroupAccesRepository groupAccesRepository;
    @Autowired
    private WebService web;

    @RequestMapping(value = "/api/droit_acces/0", method = RequestMethod.GET)
    public ModelAndView getDroitAcces() {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("roles", roleRepository.getAllRole());
        model.put("user", web.getCompteConnected());
        return new ModelAndView("droitAcces/profil", model);
    }

    @RequestMapping(value = "/api/getListProfile/{page}/{size}", method = RequestMethod.GET)
    public ModelAndView getList(@PathVariable int page,@PathVariable int size) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("profiles", profilRepository.getAllProfil());
        Page<Profil> h = profilRepository.getAllProfils(new PageRequest(page, size));
        if (h != null) {

            List<Profil> searchResult = h.getContent();

            model.put("profiles", searchResult);
            model.put("total", h.getTotalElements());

            model.put("number", h.getNumber());
            model.put("page", 0);
            model.put("totalPage", h.getTotalPages());
            model.put("size", h.getSize());

        } else {
            model.put("totalPage", 0);
        }
        model.put("user",web.getCompteConnected());
        return new ModelAndView("droitAcces/ListProfile", model);
    }

    @RequestMapping(value = "/api/saveProfile", method = RequestMethod.POST)
    public @ResponseBody int saveProfile(@RequestBody Profil profil) {
        Map<String, Object> model = new HashMap<String, Object>();
        profilRepository.save(profil);
        int fr=profil.getProfilId();
        return fr;
    }

    @RequestMapping(value = "/api/addProfilInfo/{action}/{profil}", method = RequestMethod.POST)

    public @ResponseBody String addRoles(@PathVariable String action, @PathVariable int profil) {

            List<ProfilRole> p = profilRoleRepository.getAllProfilRoles(profil);
            if(p.size()>0) {
                profilRoleRepository.deleteAll(p);
            }
            if (action.equals("add")) {
                List<Role> roles = roleRepository.getAllRole();
                for (Role r : roles) {
                        ProfilRole prf = new ProfilRole();
                        prf.setValider("oui");
                        prf.setTous("oui");
                        prf.setProfil(profilRepository.getOne(profil));
                        prf.setRole(r);
                        profilRoleRepository.save(prf);
                    }

            } else {
                List<ProfilRole> pr = profilRoleRepository.getAllProfilRoles(profil);
                if (pr != null) {
                    profilRoleRepository.deleteAll(pr);
                }

            }

        return "";
    }

    @RequestMapping(value = "/api/actionProfil/{action}/{id}/{profil}", method = RequestMethod.POST)
    public @ResponseBody String ajouter(@PathVariable String action, @PathVariable int id, @PathVariable int profil) {
        if (action.equals("ajouter")) {
            ProfilRole profils=new ProfilRole();
            profils.setValider("oui");
            profils.setProfil(profilRepository.getOne(profil));
            profils.setRole(roleRepository.getOne(id));
            profilRoleRepository.save(profils);
        }
        else{
            ProfilRole pr = profilRoleRepository.getAllProfilRole(id, profil);
            if(pr!=null){
                profilRoleRepository.delete(pr);
            }
        }
        return "";
    }

    @RequestMapping(value = "/api/getProfilDetails/{val}", method = RequestMethod.GET)
    public ModelAndView getProfilDetails(@PathVariable int val) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Role> list = roleRepository.getAllRole();
        List<ProfilRole> rt = profilRoleRepository.getAllProfilRoles(val);
        List<Role> role=new ArrayList<Role>();
        for(ProfilRole rs:rt){
            role.add(rs.getRole());
        }
        for(Role check : role){
            if(list.contains(check)){
                list.remove(check);
            }
        }
        model.put("role", role);
        model.put("roles", list);
        model.put("Profil", profilRepository.getOne(val));
        model.put("action","modifier");
        model.put("user", web.getCompteConnected());
        return new ModelAndView("droitAcces/profil", model);
    }

    @RequestMapping(value = "/api/getProfilDroisAcces/{id}", method = RequestMethod.GET)
    public ModelAndView getProfilDroisAcces(@PathVariable int id) {
        Map<String, Object> model = new HashMap<String, Object>();
        List<Role> list = roleRepository.getAllRole();
        List<ProfilRole> rt = profilRoleRepository.getAllProfilRoles(id);
        List<Role> role=new ArrayList<Role>();
        for(ProfilRole rs:rt){
            role.add(rs.getRole());
        }
        for(Role check : role){
            if(list.contains(check)){
                list.remove(check);
            }
        }
        model.put("role", role);
        model.put("roles", list);
        model.put("Profil", profilRepository.getOne(id));
        model.put("action","modifier");

        return new ModelAndView("droitAcces/acces", model);
    }

    @RequestMapping(value = "/api/saveGroupe", method = RequestMethod.POST)
    public @ResponseBody int saveGroupe(@RequestBody GroupAcces group) {
        Map<String, Object> model = new HashMap<String, Object>();
        groupAccesRepository.save(group);
        int gr=group.getId_groupe();
        return gr;
    }
    @RequestMapping(value = "/api/delete/{id}", method = RequestMethod.POST)
    public @ResponseBody void deleteProfile(@PathVariable int id) {
       Profil p = profilRepository.getOne(id);
       p.setDeleteDateTime(new Date());
       profilRepository.save(p);
    }

    @RequestMapping(value = "/api/isAccessible/{id}", method = RequestMethod.GET)
    public @ResponseBody String isAccessible(@PathVariable int id) {

        Compte ct = web.getCompteConnected();
        List<Integer> integerList = profilRoleRepository.getAllRoleByProfil(ct.getProfil().getProfilId());

        if(integerList.contains(id) || integerList.contains(1)){
            return "oui";
        }
       return "non";
    }
}
