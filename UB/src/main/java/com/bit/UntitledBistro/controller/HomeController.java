package com.bit.UntitledBistro.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.service.insa.InsaService;
import com.bit.UntitledBistro.service.insa.InsaServiceImpl;

@Controller
public class HomeController {
	
	@Autowired
	InsaService insaService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/login", "/"})
	public String home(String error, String logout, Model model) {
		if(error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
			
		} else {
			model.addAttribute("error", "empty");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃하셨습니다.");
			
		} else {
			model.addAttribute("logout", "empty");
		}
		
		return "views/insa/InsaLogin";
	}
	
	@RequestMapping(value = "/accessDenied")
	public String accessDenied() {
		
		return "views/insa/accessDenied";
	}
	
	@RequestMapping(value = "/logoutSuccess")
	public String logoutSuccess() {
		
		return "views/insa/logoutSuccess";
	}
	
	@RequestMapping(value = "/erp")
	public String erp(Insa_EmpRegisterDTO dto, HttpSession session) {
		insaService.InsaLoginSearch(dto, session);
		
		return "baseLayout";
	}
	
}
