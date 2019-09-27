package com.bit.UntitledBistro.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;
import com.bit.UntitledBistro.service.balju.Balju_Service;

@Controller
public class Balju_Controller {
	
	@Autowired
	private Balju_Service balju_Service;
	
	private static final Logger logger = LoggerFactory.getLogger(Balju_Controller.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String a() {
		System.out.println("메인페이지에 접속되었습니다.");
		return "baseLayout";
		
	}
	
	@RequestMapping(value = "/balju_Plan_Grid", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String,String>> Balju_Plan_Grid(Balju_PlanDTO BPdto) {
		logger.info("발주계획 그리드폼이 시작합니다");
		List<Map<String,String>> list = this.balju_Service.balju_Dummy(BPdto);
		return list;
	}
	
	
	@RequestMapping(value = "/balju/Balju_Plan", method = RequestMethod.GET)
	public void Balju_Plan(Locale locale, Model model) {
		logger.info("발주계획에 접속되었습니다.");
		
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String date = SDF.format(new Date());
		model.addAttribute("balju_date", date);
	}
	
	@RequestMapping(value = "/balju/Balju_Plan_Result", method = RequestMethod.GET)
	public void c() {
		System.out.println("발주계획현황에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju", method = RequestMethod.GET)
	public void Balju_Plan() {
		System.out.println("발주입력에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju_Result", method = RequestMethod.GET)
	public void e() {
		System.out.println("발주현황에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju/Balju_Mng", method = RequestMethod.GET)
	public void f() {
		System.out.println("발주관리에 접속되었습니다.");
	}
	
	@RequestMapping(value = "/balju_Plan_Input", method = RequestMethod.POST)
	public String balju_Plan_Input(Balju_PlanDTO BPdto) throws Exception{
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
	
	//팝업창 영역
	
	//발주계획팝업창버튼 [제품정보]
	@RequestMapping(value = "/balju/popup/Item_list", method = RequestMethod.GET)
	public String item_list(Item_DTO Idto, Model model) {
		System.out.println("품목 새창  띄우기 기능이 실행되었습니다.");
		List<Map<String,String>> list = this.balju_Service.item_list(Idto);
		model.addAttribute("item_list", list);
		return "balju/popup/Item_List";
	}
	
}
