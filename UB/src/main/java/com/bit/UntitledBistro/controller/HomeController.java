package com.bit.UntitledBistro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.service.insa.InsaService;

@Controller
public class HomeController {
	
	@Autowired
	InsaService insaService;

	@RequestMapping(value = {"/login", "/"})
	public String home() {
		
		return "views/insa/InsaLogin";
	}
	
	@RequestMapping(value = "/loginFail")
	public String loginFail(String error, String logout, String exist, String timeOut, String access, Model model) {
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
		
		if(exist != null) {
			model.addAttribute("exist", "이미 접속중입니다. 로그인하시려면 다시 시도해주세요.");
			
		} else {
			model.addAttribute("exist", "empty");
		}
		
		if(timeOut != null) {
			model.addAttribute("timeOut", "현재 계정으로 다른 곳에서 로그인하였습니다.");
			
		} else {
			model.addAttribute("timeOut", "empty");
		}
		
		if(access != null) {
			model.addAttribute("access", "권한이 부족합니다.");
			
		} else {
			model.addAttribute("access", "empty");
		}
		
		return "views/insa/loginFail";
	}
	
	@RequestMapping(value = "/erp")
	public String erp(Insa_EmpRegisterDTO dto, HttpSession session, Model model) {
		insaService.InsaLoginSearch(dto, session); // 세션에 넣기
		
		return "baseLayout";
	}
	
}
