package com.bit.UntitledBistro.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.jungsan.DeadlineDTO;
import com.bit.UntitledBistro.service.jungsan.DeadlineService;

@Controller
public class deadlineController {
	
	@Resource(name ="Deadline_Test")
	private DeadlineService DeadlineService;
	
	@RequestMapping("/deadlineForm.html")
	public String list(HttpServletRequest request) {
		
		HashMap map = new HashMap();
		
		List<DeadlineDTO> Deadlinelist = DeadlineService.getdeadlineList(map);
		System.out.println("================결과======================")	;
		for (DeadlineDTO deadlineDTO : Deadlinelist) {
			System.out.println(deadlineDTO.getOrsa_qt());
			System.out.println(deadlineDTO.getSalary_workingDate());
		}
		System.out.println(Deadlinelist);
		System.out.println("=========================================")	;
		request.setAttribute("Deadlinelist",Deadlinelist);
		
		int day_profit=DeadlineService.day_profit();
		request.setAttribute("day_profit",day_profit);
		
		int month_profit =DeadlineService.month_profit();
		request.setAttribute("month_profit",month_profit);
		
		int day_expenditure=DeadlineService.day_expenditure();
		request.setAttribute("day_expenditure",day_expenditure);
		
		int month_expenditure=DeadlineService.month_expenditure();
		request.setAttribute("month_expenditure",month_expenditure);
		
		int day_refund=DeadlineService.day_refund();
		request.setAttribute("day_refund",day_refund);
		
		int day_worktime=DeadlineService.day_worktime();
		request.setAttribute("day_worktime",day_worktime);
		
		int month_worktime=DeadlineService.month_worktime();
		request.setAttribute("month_worktime",month_worktime);
		
		int day_max_profit=DeadlineService.day_max_profit();
		request.setAttribute("day_max_profit",day_max_profit);
		
		int month_max_profit=DeadlineService.month_max_profit();
		request.setAttribute("month_max_profit",month_max_profit);
		
		return "jungsan/deadlineForm";
	}

}
