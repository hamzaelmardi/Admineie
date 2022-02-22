package com.EIE.demo.web;

import com.EIE.demo.dao.*;
import com.EIE.demo.dataService.FileStorageService;
import com.EIE.demo.dataService.SecurityService;
import com.EIE.demo.dataService.WebService;
import com.EIE.demo.model.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

public class AyoubController {

	@Autowired
	private NotificationRepository notificationRepository;
	@Autowired
	FileStorageService fileStorageService;
	@Autowired
	WebService web;


	@RequestMapping(value = "/api/Autorisationdechets",method = RequestMethod.GET)
	public @ResponseBody  Object[] acceuilStat(@RequestParam("date1") String date1,@RequestParam("date2") String date2,@RequestParam("inlineRadioOptions") String inlineRadioOptions) throws Exception {



		Object[] res = null;
		List<Object> addList = new ArrayList<Object>();

	java.sql.Date d1 = java.sql.Date.valueOf(date1);
	java.sql.Date d2 = java.sql.Date.valueOf(date2);

	

	
	
	
	if(inlineRadioOptions.equals("date_depot")) {
		addList.add(notificationRepository.getByDateDepot(d1,d2)) ;
		}
	else if(inlineRadioOptions.equals("date_validation")) {
		addList.add(notificationRepository.geByDateValidation(d1,d2));
		}



		res=addList.toArray();
		return res;
	}
}
