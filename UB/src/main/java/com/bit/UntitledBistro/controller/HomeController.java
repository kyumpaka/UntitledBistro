package com.bit.UntitledBistro.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	@RequestMapping(value = {"/login", "/"})
	public String home(HttpSession session) {
		logger.info("로그인 컨트롤러에 오신걸 환영합니다");
		return "views/insa/InsaLogin";
	}
	
	@RequestMapping(value = "/accessDenied")
	public String accessDenied(HttpSession session) {

		return "views/insa/accessDenied";
	}
	
	@RequestMapping(value = "/erp")
	public String erp() {
		logger.info("홈 컨트롤러에 오신걸 환영합니다");
		return "baseLayout";
	}
	
	
}
