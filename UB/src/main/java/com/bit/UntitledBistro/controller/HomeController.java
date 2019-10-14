package com.bit.UntitledBistro.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/")
	public String home(HttpSession session) {
		logger.info("로그인 컨트롤러에 오신걸 환영합니다");
		return "views/insa/InsaLogin";
	}
	
	@RequestMapping(value = "/erp")
	public String erp() {
		logger.info("홈 컨트롤러에 오신걸 환영합니다");
		return "baseLayout";
	}
	
	@RequestMapping(value = "/customLogin")
	public String customLogin(String error, String logout, Model model) {
		logger.info("커스텀 로그인 컨트롤러에 오신걸 환영합니다");
		
		logger.info("error: " + error);
		logger.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		return "baseLayout";
	}
}
