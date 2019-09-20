package com.bit.UntitledBistro.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.insa.Insa_EmpRegisterDTO;
import com.bit.UntitledBistro.service.insa.InsaService;

@Controller
public class InsaController {

	@Resource(name = "test")
	private InsaService insaService;

	@RequestMapping("/EmpRegisterInsertForm")
	public String insertform() {
		return "views/insa/EmpRegisterInsertForm";
	}// ModelAndView를 리턴하는것과 같음

	@RequestMapping("/EmpRegisterInsert")
	public String insert(Insa_EmpRegisterDTO dto) {
		insaService.EmpRegisterInsert(dto);
		return "redirect:/insa/EmpRegisterList";
	}

	@RequestMapping("/EmpRegisterList")
	public String list(HttpServletRequest request) {

		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);

		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = insaService.getEmpCount();
		System.out.println("시작 : " + start + " 끝:" + end);
		System.out.println("글의 수 : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize);

		int block = 5;
		int fromPage = ((pg - 1) / block * block) + 1;

		int toPage = ((pg - 1) / block * block) + block;
		if (toPage > allPage) {
			toPage = allPage;

		}

		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);

		List<Insa_EmpRegisterDTO> EmpRegisterList = insaService.EmpRegisterList(map);
		request.setAttribute("EmpRegisterList", EmpRegisterList);
		request.setAttribute("pg", pg);
		request.setAttribute("allPage", allPage);
		request.setAttribute("block", block);
		request.setAttribute("fromPage", fromPage);
		request.setAttribute("toPage", toPage);

		return "insa/EmpRegisterList"; // list.jsp

	}

}
