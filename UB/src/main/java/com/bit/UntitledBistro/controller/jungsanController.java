package com.bit.UntitledBistro.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.jungsan.JungsanDTO;
import com.bit.UntitledBistro.service.jungsan.JungsanService;

@Controller
public class jungsanController {
	
	@Resource(name ="Jungsan_Test")
	private JungsanService JungsanService;
	
	@RequestMapping("/JungsanForm.html")
	public String list(HttpServletRequest request) {
		
		HashMap map = new HashMap();
		
		List<JungsanDTO> Jungsanlist = JungsanService.getjungsanList(map);
		request.setAttribute("Jungsanlist", Jungsanlist);
		
		 int befor_cash = JungsanService.befor_cash();
		request.setAttribute("befor_cash", befor_cash);
		 
		 int befor_card	= JungsanService.befor_card();
		 request.setAttribute("befor_card", befor_card);
		 
		 int today_cash	= JungsanService.today_cash();
		 request.setAttribute("today_cash", today_cash);
		 
		 int today_card	= JungsanService.today_card();
		 request.setAttribute("today_card", today_card);
		 
		 System.err.println(today_card);
		 int total_cash	= JungsanService.total_cash();
		 request.setAttribute("total_cash", total_cash);
		 
		 int total_card	= JungsanService.total_card();		 
		 request.setAttribute("total_card", total_card);
		 
		 int timeto_jungsan	= JungsanService.timeto_jungsan();
		 request.setAttribute("timeto_jungsan", timeto_jungsan);
		
		return "jungsan/jungsanForm";
	}
}
