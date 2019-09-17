package com.bit.UntitledBistro.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
import com.bit.UntitledBistro.service.seobis.Seobis_MemberService;

@Controller
public class Seobis_MemberCheckController {
	
	@Autowired
	private Seobis_MemberService Seobis_memberService;
	
	@RequestMapping(value = "/") //메인 화면
	public String test() {
		return "baseLayout";
	}
	
	@RequestMapping(value = "/Seobis_joinUs") // 회원 관리 메뉴를 누르면 이동하는 맵핑
	public String seobis_formstart() {
		return "seobis/Seobis_form";
	}
	
	@RequestMapping(value="/Seobis_jUs")  //회원 관리창에서 회원 추가로 보내는 맵핑
	public String seobis_formList() {
	return "seobis/Seobis_joinUs";
	}
	
	@RequestMapping(value="/createMember", method = RequestMethod.POST)  //회원 가입완료를 누르면 처리하는 메소드
	public String joinUsSubmit (HttpSession session, Seobis_MemberDTO Seobis_MemberDTO_dto) {
		String view = null;
		Seobis_memberService.Seobis_MemberInsert(Seobis_MemberDTO_dto);
		
		if(Seobis_MemberDTO_dto != null) {
			session.setAttribute("USERNAME", Seobis_MemberDTO_dto.getMember_id());
			view = "seobis/Seobis_succes";
		} else {
			view = "seobis/Seobis_fail";
		}
		return view;
	}
	
	/*
	 * @RequestMapping(value="/showList", method = RequestMethod.POST) public String
	 * showList(HttpSession session, Seobis_MemberDTO cm) {
	 * 
	 * String view = null;
	 * 
	 * view = return view; }
	 * 
	 * public void list(HttpServletRequest request, HttpServletResponse response)
	 * throws ServletException, IOException{ GuestDAO dao = new GuestDAO();
	 * List<GuestDTO> list = dao.getList(); if(list != null){
	 * request.setAttribute("list", list);
	 * request.getRequestDispatcher("/list.jsp").forward(request, response); }else{
	 * response.sendRedirect("error.jsp"); } }
	 */
	
	
	/*
	 * @RequestMapping(value = "/b") public String b() { return
	 * "seobis/Seobis_form"; }
	 */
}
