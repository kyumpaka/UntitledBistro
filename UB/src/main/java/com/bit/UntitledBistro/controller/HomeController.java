package com.bit.UntitledBistro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.jaego.ItemDAOImpl;
import com.bit.UntitledBistro.model.jaego.SafeItemDTO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ItemDAOImpl dao;
	
	@RequestMapping(value = "/")
	public String test(HttpSession session) {
		logger.info("홈 컨트롤러에 오신걸 환영합니다");
		List<SafeItemDTO> safeItemList = dao.safeItemSelectAll();
		session.setAttribute("riskItemCount", dao.riskItemCount(safeItemList));
		return "baseLayout";
	}
	
}
