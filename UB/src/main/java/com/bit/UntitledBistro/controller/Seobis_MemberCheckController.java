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
	
	@RequestMapping(value="/start") // 인덱스에서 선택창으로 보내는 맵핑
	public String formStart() {
	return "Seobis_form";
	}
	
	@RequestMapping(value="/Seobis_jUs")  //선택창에서 회원 추가로 보내는 맵핑
	public String formList() {
	return "Seobis_joinUs";
	}
	
	@RequestMapping(value="/createMember", method = RequestMethod.POST)  //회원 가입완료를 누르면 처리하는 메소드
	public String joinUsSubmit (HttpSession session, Seobis_MemberDTO Seobis_MemberDTO_dto) {
		System.out.println("시작");
		System.out.println("파라미터 테스트 ================== "); 
		System.out.println("아이디 :  " + Seobis_MemberDTO_dto.getMember_id());
		System.out.println("비밀번호 :  " + Seobis_MemberDTO_dto.getMember_password());
		System.out.println("이름 :  " + Seobis_MemberDTO_dto.getMember_name());
		System.out.println("성별 :  " + Seobis_MemberDTO_dto.getMember_gender());
		System.out.println("이메일 :  " + Seobis_MemberDTO_dto.getMember_email());
		System.out.println("파라미터 테스트 ================== ");
		String view = null;
		Seobis_memberService.Seobis_MemberInsert(Seobis_MemberDTO_dto);
		System.out.println("완료");
		if(Seobis_MemberDTO_dto != null) {
			System.out.println("바인드 시작");
			session.setAttribute("USERNAME", Seobis_MemberDTO_dto.getMember_id());
			System.out.println("바인드 끝");
			view = "Seobis_succes";
		} else {
			view = "Seobis_fail";
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
}
