package com.bit.UntitledBistro.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
import com.bit.UntitledBistro.model.seobis.Seobis_ReserveDTO;
import com.bit.UntitledBistro.service.seobis.Seobis_MemberService;


@Controller
@RequestMapping(value = "/Seobis")
public class SeobisController {
	
	@Autowired
	private Seobis_MemberService Seobis_memberService;
	
	@RequestMapping(value = "/joinUs") // 회원 관리 메뉴를 누르면 이동하는 맵핑
	public String seobis_formstart() {
		return "seobis/Seobis_form";
	}
	@RequestMapping(value="/jUs")  // 회원 등록으로 보내는 맵핑
	public String seobis_formadd() {
		return "seobis/Seobis_joinUs";
	}
	@RequestMapping(value="/Seobis_calendar") //메뉴를 누르면 예약 캘린더로 보내는 맵핑
	public String seobis_formcalendar(Model model) {
		model.addAttribute("Seobis_reserveSelect", Seobis_memberService.Seobis_ReserveSelect());
		return "seobis/Seobis_calendar";
	}
	@RequestMapping(value="/pop/jUs")  // 팝업 회원 등록으로 보내는 맵핑
	public String seobis_formaddPop() {
		return "views/seobis/Seobis_joinUs";
	}
	@RequestMapping(value="/pop/Seobis_calendar")  // 팝업 예약 내역 확인
	public String seobis_resList(Model model) {
		model.addAttribute("Seobis_reserveSelect", Seobis_memberService.Seobis_ReserveSelect());
		return "views/seobis/Seobis_calendar";
	}
	@RequestMapping(value="/Seobis_newCalendar") //예약 새창으로 보내는 맵핑
	public String seobis_formnewCalendar(@ModelAttribute("date") String date) {
		return "/views/seobis/Seobis_newCalendar";
	}
	
	@RequestMapping(value="/nck") //예약 확인 페이지로 보내는 맵핑
	public String seobis_formCkCalendar(@RequestParam("reserve_num") String reserve_num, Model model) {
		model.addAttribute("Seobis_reserveSelect", Seobis_memberService.Seobis_ReserveSelectByNum(reserve_num));
		return "/views/seobis/Seobis_newCkCalendar";
	}
	
	@RequestMapping(value="/createMember", method = RequestMethod.POST)  //회원 가입을 처리하는 맵핑
	public String seobis_joinUsSubmit (HttpSession session, Seobis_MemberDTO seobis_MemberDTO_dto) {
		String view = null;
		
		Seobis_memberService.Seobis_MemberInsert(seobis_MemberDTO_dto);
		
		if(seobis_MemberDTO_dto != null) {
			session.setAttribute("USERNAME", seobis_MemberDTO_dto.getMember_id());
			view = "seobis/Seobis_success";
		} else {
			view = "seobis/Seobis_fail";
		}
		return view;
	}
	private static final Logger logger = LoggerFactory.getLogger(JumunController.class);
	@RequestMapping(value="/mList")  //회원 목록을 처리하는 맵핑
	public String seobis_memberList(Model model, HashMap<String, Object> map) {
		List<Seobis_MemberDTO> Seobis_memberList = Seobis_memberService.Seobis_MemberList(map);
		model.addAttribute("Seobis_memberList", Seobis_memberList);
		logger.info(Seobis_memberList.get(0).getMember_phone1()+"asdfasdf");
		return "seobis/Seobis_memberList"; //.jsp
	}
	
	@RequestMapping(value="/pList") //포인트 목록을 처리하는 맵핑
	public String seobis_pointList(Model model, HashMap<String, Object> map) {
		List<Seobis_MemberDTO> Seobis_memberList = Seobis_memberService.Seobis_MemberList(map);
		model.addAttribute("Seobis_memberList", Seobis_memberList);
		return "seobis/Seobis_pointList"; //.jsp
	}
	 
	@RequestMapping(value="/delete")  //회원 삭제 맵핑
	
	public String seobis_memberDelete(Seobis_MemberDTO seobis_MemberDTO_dto) {
		Seobis_memberService.Seobis_MemberDelete(seobis_MemberDTO_dto);
		return "redirect:mList";
	}
	
	@RequestMapping(value="/update") //회원 업데이트 맵핑 
	public String seobis_memberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {
		Seobis_memberService.Seobis_MemberUpdate(seobis_MemberDTO_dto);
		return "redirect:mList";
	}
	
	@RequestMapping(value="/pUpdate")  //포인트 업데이트 맵핑
	public String seobis_pointUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {
		Seobis_memberService.Seobis_PointUpdate(seobis_MemberDTO_dto);
		return "redirect:pList";
	}
	
	@RequestMapping(value="/select") //회원 수정 맵핑
	public String seobis_memberSelect(String member_id, Model model) {
		model.addAttribute("Seobis_memberSelect", Seobis_memberService.Seobis_MemberSelect(member_id));	 
		return "seobis/Seobis_update";
	}
	
	@RequestMapping(value="/resAdd", method = RequestMethod.POST) // 예약 추가 맵핑
	@ResponseBody
	public int seobis_reserveAdd(Seobis_ReserveDTO seobis_ReserveDTO_dto) {
		return Seobis_memberService.Seobis_ReserveAdd(seobis_ReserveDTO_dto);
	}
	
	@RequestMapping(value="/resCheck") // 예약시 회원 아이디 유효성 검사 맵핑
	@ResponseBody
	public int seobis_resCheck(@RequestParam("reserve_member_id") String reserve_member_id) {
		
		return Seobis_memberService.Seobis_MemberListCount(reserve_member_id);
	}
	
	@RequestMapping(value="/selectP") //포인트 수정 맵핑
	public String seobis_pointSelect(String member_id, Model model) {
		model.addAttribute("Seobis_memberSelect", Seobis_memberService.Seobis_MemberSelect(member_id));	 
		return "seobis/Seobis_pointUpdate";
	}
	
	@RequestMapping(value="/rUpdate")  //예약 업데이트 맵핑
	@ResponseBody
	public int seobis_resUpdate(Seobis_ReserveDTO seobis_ReserveDTO_dto) {
		return Seobis_memberService.Seobis_ReserveUpdate(seobis_ReserveDTO_dto);
	}
	
	@RequestMapping(value="/rDelete")  //예약 삭제 맵핑
	@ResponseBody
	public void seobis_reserveDelete(Seobis_ReserveDTO seobis_ReserveDTO_dto) {
		Seobis_memberService.Seobis_ReserveDelete(seobis_ReserveDTO_dto);
	}
	
}
