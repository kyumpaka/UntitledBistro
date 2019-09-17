package com.bit.UntitledBistro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Balju")
public class Balju_Controller {

	@RequestMapping(value="/Balju.do", method=RequestMethod.GET)
	public String home() {
		return "balju/Balju";
	}
	
	
	
}
