package com.bit.UntitledBistro.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;
import com.bit.UntitledBistro.service.jungsan.Jungsan_Input_Service;
import com.bit.UntitledBistro.service.jungsan.Jungsan_view_Service;

@Controller
@RequestMapping("/jungsan")
public class JungsanController {
	@Resource(name = "view")
	private Jungsan_view_Service jungsan_view_Service; // 결산 현황 view
	@Resource(name = "input")
	private Jungsan_Input_Service jungsan_input_Service; // 결산 마감 insert & list
	private Object insert_daily; // 일마감 인서트 dto

	
	@RequestMapping("/View_jungsan.html") // 결산 현황 view 매핑
	public String Show(HttpServletRequest request) {

		int menucount_total = jungsan_view_Service.menucount_total(); // 메뉴 토탈 테스트용
		request.setAttribute("menucount_total", menucount_total);

		int menucount_drink = jungsan_view_Service.menucount_drink(); // 메뉴 주류
		request.setAttribute("menucount_drink", menucount_drink);

		int menucount_cooking = jungsan_view_Service.menucount_cooking(); // 메뉴 요리
		request.setAttribute("menucount_cooking", menucount_cooking);

		int menucount_soup = jungsan_view_Service.menucount_soup(); // 메뉴 국물
		request.setAttribute("menucount_soup", menucount_soup);

		int befor_cash = jungsan_view_Service.befor_cash(); // 어제 현금
		request.setAttribute("befor_cash", befor_cash);

		int befor_card = jungsan_view_Service.befor_card(); // 어제 카드
		request.setAttribute("befor_card", befor_card);

		/*
		 * int befor_code= jungsan_view_Service.befor_code(); //어제 메뉴
		 * request.setAttribute("befor_code", befor_code);
		 */

		int today_cash = jungsan_view_Service.today_cash(); // 현재 현금
		request.setAttribute("today_cash", today_cash);

		int today_card = jungsan_view_Service.today_card(); // 현재 카드
		request.setAttribute("today_card", today_card);

		/*
		 * int today_code= jungsan_view_Service.today_code(); //현재 메뉴
		 * request.setAttribute("today_code", today_code);
		 */

		int today_point = jungsan_view_Service.today_point(); // 사용 포인트
		request.setAttribute("today_point", today_point);

		return "jungsan/View_jungsan";
	}

	/* 결산 현황 & 결산 마감 나누어지는 중간지점 */

	@RequestMapping("Day_DeadLine.html") // 결산 마감 맵핑
	public String Day_DeadLine(HttpServletRequest request) {
		HashMap map = new HashMap();

		List<Jungsan_view_DTO> getjungsan_viewList = jungsan_view_Service.getjungsan_viewList(map);
		request.setAttribute("getjungsan_viewList", getjungsan_viewList);

		int befor_cash = jungsan_view_Service.befor_cash(); // 어제 현금
		request.setAttribute("befor_cash", befor_cash);

		int befor_card = jungsan_view_Service.befor_card(); // 어제 카드
		request.setAttribute("befor_card", befor_card);

		int today_cash = jungsan_view_Service.today_cash(); // 현재 현금
		request.setAttribute("today_cash", today_cash);

		int today_card = jungsan_view_Service.today_card(); // 현재 카드
		request.setAttribute("today_card", today_card);

		int menucount_drink = jungsan_view_Service.menucount_drink(); // 메뉴 주류
		request.setAttribute("menucount_drink", menucount_drink);

		int menucount_cooking = jungsan_view_Service.menucount_cooking(); // 메뉴 요리
		request.setAttribute("menucount_cooking", menucount_cooking);

		int menucount_soup = jungsan_view_Service.menucount_soup(); // 메뉴 국물
		request.setAttribute("menucount_soup", menucount_soup);

		return "jungsan/Day_DeadLine";
	}

	@RequestMapping("Day_DeadLineForm.html") // 인서트 맵핑
	public String Day_DeadLineForm(HttpServletRequest request, @ModelAttribute Jungsan_Input_DTO dto) {
		// 인서트
		jungsan_input_Service.insert_daily(dto);
		request.setAttribute("insert_daily", insert_daily);
		return "redirect:Daily.html";
	}

	/* 리스트 맵핑들 */

	@RequestMapping("Daily.html") // 일마감
	public String day_list(HttpServletRequest request, Jungsan_Input_DTO dto) {

		HashMap map = new HashMap();

		List<Jungsan_Input_DTO> getjungsan_inputList = jungsan_input_Service.getjungsan_inputList(map); // 조회

		request.setAttribute("getjungsan_inputList", getjungsan_inputList); // 조회한걸 담음

		return "jungsan/Daily"; // 주소 이동
	}

	@RequestMapping("Monthly.html") // 월마감
	public String month_list(HttpServletRequest request) {
		return "jungsan/Monthly";
	}

	/* 업데이트 */
	@RequestMapping("UpdateForm.html")
	public String update(HttpServletRequest request, @ModelAttribute Jungsan_Input_DTO dto) {
		int update = jungsan_input_Service.update(dto); // 업데이트 실행
		request.setAttribute("update", update); // 1개 결과 담음
		return "jungsan/UpdateForm"; // 주소 이동
	}

	@RequestMapping("Update.html") // 일마감
	public String day_listupdate(Jungsan_Input_DTO dto) {
		int update = jungsan_input_Service.update(dto);
		return "redirect:Daily.html"; // 주소 이동
	}
}
