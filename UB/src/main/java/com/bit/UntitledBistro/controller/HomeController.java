package com.bit.UntitledBistro.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "baseLayout"; 
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		logger.info("테스트 컨트롤러입니다");
		return "jaego/test";
	}
	
}
