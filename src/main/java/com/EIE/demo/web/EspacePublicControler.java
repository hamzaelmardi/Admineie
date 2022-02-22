package com.EIE.demo.web;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.EIE.demo.dao.UserRepository;


@Controller

public class EspacePublicControler {

	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value = "/espacepublic", method = RequestMethod.GET)
	public ModelAndView getParamPage() {
		Map<String, Object> model = new HashMap<String, Object>();
		return new ModelAndView("espacepublic/acceuil", model);
	}
		
		
		
		
		
}

