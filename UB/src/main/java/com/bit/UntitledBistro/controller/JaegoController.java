package com.bit.UntitledBistro.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.jaego.ChangeItemDTO;
import com.bit.UntitledBistro.model.jaego.Condition;
import com.bit.UntitledBistro.model.jaego.ItemDAOImpl;
import com.bit.UntitledBistro.model.jaego.ItemDTO;
import com.bit.UntitledBistro.model.jaego.OutItemDTO;
import com.bit.UntitledBistro.model.jaego.Page;

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
	public @ResponseBody List gridSelectAll(Condition condition, Page page) {
		logger.info("여기는 그리드 재고현황 조회 컨트롤러 입니다.");
		int total = dao.itemTotal();
		page.paging(total, 10, 5);
		condition.setStartPage(page.getStartRow());
		condition.setEndPage(page.getEndRow());
		logger.info("===============================================");
		logger.info("keyword : " + condition.getKeyword());
		logger.info("getStartPage : " + condition.getStartPage());
		logger.info("getEndPage : " + condition.getEndPage());
		logger.info("===============================================");
		List list = dao.itemSelectAll(condition);
		list.add(page.getSb());
		return list;
	}
	
	@RequestMapping(value = "/gridInItemSelectAll")
	public @ResponseBody List<ItemDTO> gridInItemSelectAll(Condition condition) {
		logger.info("여기는 그리드 입고 조회 컨트롤러 입니다.");
		return dao.inItemSelectAll(condition);
	}
	
	@RequestMapping(value = "/gridOutItemSelectAll")
	public @ResponseBody List<OutItemDTO> gridOutItemSelectAll(Condition condition) {
		logger.info("여기는 그리드 출고 조회 컨트롤러 입니다.");
		return dao.outItemSelectAll(condition);
	}
	
	@RequestMapping(value = "/gridChangeItemSelectAll")
	public @ResponseBody List<ChangeItemDTO> gridChangeItemSelectAll(Condition condition) {
		logger.info("여기는 그리드 재고변동 조회 컨트롤러 입니다.");
		logger.info("==================================");
		logger.info("keyword : " + condition.getKeyword());
		logger.info("keyword2 : " + condition.getKeyword2());
		logger.info("startDate : " + condition.getStartDate());
		logger.info("endDate : " + condition.getEndDate());
		logger.info("==================================");
		return dao.changeItemSelectAll(condition);
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
