package com.bit.UntitledBistro.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.jaego.ItemDAOImpl;
import com.bit.UntitledBistro.model.jaego.ItemDTO;

@Controller
@RequestMapping(value = "/jaego")
public class JaegoController {
	private static final Logger logger = LoggerFactory.getLogger(JaegoController.class);
	
	@Autowired
	private ItemDAOImpl dao;
	
	@RequestMapping(value = "/item")
	public void item(Model model) {
		logger.info("여기는 재고현황 컨트롤러 입니다.");
	}
	@RequestMapping(value = "/itemInsert")
	public void itemInsert(Model model) {
		logger.info("여기는 재고현황 컨트롤러 입니다.");
	}
	@RequestMapping(value = "/itemUpdate")
	public void itemUpdate(Model model) {
		logger.info("여기는 재고현황 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/in_item")
	public void in_item() {
		logger.info("여기는 입고현황 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/out_item")
	public void out_item() {
		logger.info("여기는 출고현황 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/change_item")
	public void change_item() {
		logger.info("여기는 재고변동 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/bad_item")
	public void bad_item() {
		logger.info("여기는 불량처리 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/special_item")
	public void special_item() {
		logger.info("여기는 특별재고 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/gridSelectAll")
	public @ResponseBody List<ItemDTO> grid() {
		logger.info("여기는 그리드 전체 조회 컨트롤러 입니다.");
		return dao.itemSelectAll();
	}
	
	@RequestMapping(value = "/gridInsert")
	public @ResponseBody void gridInsert(ItemDTO dto) {
		logger.info("여기는 그리드 추가 컨트롤러 입니다.");
		dao.itemInsert(dto);
	}
	
	@RequestMapping(value = "/gridUpdate")
	public @ResponseBody void gridUpdate(ItemDTO dto) {
		logger.info("여기는 그리드 수정 컨트롤러 입니다.");
		dao.itemUpdate(dto);
	}
	
	@RequestMapping(value = "/gridDelete")
	public @ResponseBody void gridDelete(ItemDTO dto) {
		logger.info("여기는 그리드 삭제 컨트롤러 입니다.");
		dao.itemDelete(dto);
	}
}
