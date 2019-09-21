package com.bit.UntitledBistro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.service.balju.Balju_Service;

@Controller
public class Balju_Controller {
	
	@Autowired
	private Balju_Service balju_Service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String a() {
		System.out.println("메인페이지에 접속되었습니다.");
		return "baseLayout";
		
	}
	
	@RequestMapping(value = "/balju/Balju_Plan", method = RequestMethod.GET)
	public void b() {
		System.out.println("발주계획에 접속되었습니다.");
		
	}
	
	@RequestMapping(value = "/balju/Balju_Plan_Result", method = RequestMethod.GET)
	public void c() {
		System.out.println("발주계획현황에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju", method = RequestMethod.GET)
	public void d() {
		System.out.println("발주입력에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju_Result", method = RequestMethod.GET)
	public void e() {
		System.out.println("발주현황에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju_Search", method = RequestMethod.GET)
	public void f() {
		System.out.println("발주조회에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju_Plan_Input", method = RequestMethod.POST)
	public String Balju_Input(Balju_PlanDTO BPdto) throws Exception{
		System.out.println("발주계획 입력 진행중 접속되었습니다.");
		this.balju_Service.insert_Balju_Plan1(BPdto);
		return "/balju/Balju_Plan";
	}
	
	@RequestMapping(value ="/balju_Plan_Result", method = RequestMethod.GET)
	@ResponseBody
	public List Balju_Plan_Result(Balju_PlanDTO BPdto) throws Exception{
		System.out.println("발주계획현황에 접속되었습니다.");
		System.out.println("발주계획현황에 접속되었습니다.");
		System.out.println("발주계획현황에 접속되었습니다.");
		List list = this.balju_Service.balju_Plan_list(BPdto);
		
		return list;
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public void test() {
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
	}
	
}
