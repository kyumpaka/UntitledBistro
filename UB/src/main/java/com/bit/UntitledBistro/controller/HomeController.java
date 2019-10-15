package com.bit.UntitledBistro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
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
	public String erp() {
		
		return "baseLayout";
	}
	
}
