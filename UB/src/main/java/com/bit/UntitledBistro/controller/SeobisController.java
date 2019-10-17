package com.bit.UntitledBistro.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
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
	@RequestMapping(value="/cal") //메뉴를 누르면 예약 캘린더로 보내는 맵핑
	public String seobis_formcalendar() {
		return "seobis/Seobis_calendar";
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
	
	@RequestMapping(value="/mList")  //회원 목록을 처리하는 맵핑
	public String seobis_memberList(Model model, HashMap<String, Object> map) {
		List<Seobis_MemberDTO> Seobis_memberList = Seobis_memberService.Seobis_MemberList(map);
		model.addAttribute("Seobis_memberList", Seobis_memberList);
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
	
	@RequestMapping(value="/update") //회원 수정 맵핑 
	public String seobis_memberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {
		Seobis_memberService.Seobis_MemberUpdate(seobis_MemberDTO_dto);
		return "redirect:mList";
	}
	
	@RequestMapping(value="/select") //회원 읽기 맵핑
	public String seobis_memberSelect(String member_id, Model model) {
		model.addAttribute("Seobis_memberSelect", Seobis_memberService.Seobis_MemberSelect(member_id));	 
		return "seobis/Seobis_update";
	}
	
	/*
	 * @RequestMapping(value="/users/calendar") //캘린더 예약 public String
	 * seobis_memberCalendar(Model model, String member_id) {
	 * model.addAttribute("Seobis_memberCalendar",
	 * Seobis_memberService.Seobis_ReserveCalendar(member_id)); return
	 * "seobis/Seobis_update"; }
	 * 
	 * @RequestMapping(value="/users/attendances", method = RequestMethod.GET)
	 * public List<Seobis_ReserveDTO> seobis_memberCalendarList(Model model, String
	 * member_id){ List<Calendar> calList =
	 * Seobis_memberService.Seobis_ReserveCalendarList(member_id);
	 * List<Seobis_ReserveDTO> events = new ArrayList<Seobis_ReserveDTO>(); return
	 * events; }
	 */
}
