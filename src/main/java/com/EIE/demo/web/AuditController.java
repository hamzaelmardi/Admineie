package com.EIE.demo.web;

import com.EIE.demo.dao.AuditAutorisationRepository;
import com.EIE.demo.dao.AuditRepository;
import com.EIE.demo.dao.CompteRepository;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.AuditAutorisation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AuditController {

    @Autowired
    CompteRepository compteRepository;

    @Autowired
    AuditAutorisationRepository auditAutorisationRepository;

    @Autowired
    WebService web;

    @RequestMapping(value = "/api/AuditAutorisation/{page}/{size}/{type}", method = RequestMethod.GET)
    public ModelAndView AuditAutorisation(@PathVariable int page, @PathVariable int size, @PathVariable String type) {

        Map<String,Object> model = new HashMap<String,Object>();
        model.put("compte", compteRepository.getAllCompte());
        Page<AuditAutorisation> h = auditAutorisationRepository.getauditAutorisationByaction(new PageRequest(page, size),type);
        if (h != null) {
            List<AuditAutorisation> searchResult = h.getContent();
            model.put("notif", searchResult);
            model.put("total", h.getTotalElements());
            model.put("number", h.getNumber());
            model.put("page", 0);
            model.put("totalPage", h.getTotalPages());
            model.put("size", h.getSize());

        } else {
            model.put("totalPage", 0);
        }
        model.put("user", web.getCompteConnected());
        return new ModelAndView("Audit/AuditAutorisation",model);
    }

    @RequestMapping(value = "/api/AuditAutorisation/{numero}", method = RequestMethod.GET)
    public ModelAndView AuditAutorisationByNumero(@PathVariable String numero) {
        Map<String,Object> model = new HashMap<String,Object>();
        List<AuditAutorisation> list = auditAutorisationRepository.getListAuditAutorisationByNumero(numero);
        AuditAutorisation a = auditAutorisationRepository.getAuditAutorisationByNumero(numero);
        model.put("old",list);
        model.put("nn",a);
        model.put("user",web.getCompteConnected());
        return new ModelAndView("Audit/historiqueAudit",model);
    }


    @RequestMapping(value = "/api/AuditAutorisationNum/{numero}", method = RequestMethod.GET)
    public @ResponseBody String AuditAutorisationByNum(@PathVariable String numero) {
        return numero;
    }
}
