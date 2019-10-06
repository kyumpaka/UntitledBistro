package com.bit.UntitledBistro.controller;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.jaego.ChangeItemDTO;
import com.bit.UntitledBistro.model.jaego.Condition;
import com.bit.UntitledBistro.model.jaego.DefectItemDTO;
import com.bit.UntitledBistro.model.jaego.ItemDAOImpl;
import com.bit.UntitledBistro.model.jaego.ItemDTO;
import com.bit.UntitledBistro.model.jaego.OutItemDTO;
import com.bit.UntitledBistro.model.jaego.ProductDTO;
import com.bit.UntitledBistro.model.jaego.RiskItemDTO;
import com.bit.UntitledBistro.model.jaego.SafeItemDTO;

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
	
	@RequestMapping(value = "/defect_item")
	public void bad_itemList() {
		logger.info("여기는 불량 목록 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/defect_itemInsert")
	public void bad_itemInsert() {
		logger.info("여기는 불량 입력 컨트롤러 입니다.");
	}
	
	@RequestMapping(value = "/gridSelectAll")
	public @ResponseBody List<ItemDTO> gridSelectAll(Condition condition) {
		logger.info("여기는 그리드 재고현황 조회 컨트롤러 입니다.");
		logger.info("===============================================");
		logger.info("keyword : " + condition.getKeyword());
		logger.info("getStartPage : " + condition.getStartPage());
		logger.info("getEndPage : " + condition.getEndPage());
		logger.info("===============================================");
		return dao.itemSelectAll(condition);
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
	
	
	@RequestMapping(value = "/gridDefectItemInsert")
	public @ResponseBody void gridInsert(@RequestBody DefectItemDTO[] dtos) {
		
		logger.info("여기는 그리드 불량처리 추가 컨트롤러 입니다.");
		logger.info("=======================================================");
		for(DefectItemDTO dto : dtos) {
			logger.info("getDi_product_code : " + dto.getDi_product_code());
			logger.info("getProduct_name : " + dto.getProduct_name());
			logger.info("getDi_qty : " + dto.getDi_qty());
			logger.info("getDi_state : " + dto.getDi_state());
			logger.info("getDi_reason : " + dto.getDi_reason());
			logger.info("getDi_date : " + dto.getDi_date());
		}
		logger.info("=======================================================");
		List<DefectItemDTO> list = Arrays.asList(dtos);
		dao.defectItemInsert(list);
		
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
	
	@RequestMapping(value = "/gridProductSelectAll")
	public @ResponseBody List<ProductDTO> gridProductSelectAll(Condition condition) {
		logger.info("여기는 품목 조회 컨트롤러 입니다.");
		return dao.productSelectAll(condition);
	}
	
	@RequestMapping(value = "/gridDefectItemSelectAll")
	public @ResponseBody List<ProductDTO> gridDefectItemSelectAll(Condition condition) {
		logger.info("여기는 품목 조회 컨트롤러 입니다.");
		logger.info("product_code : " + condition.getKeyword());
		logger.info("product_name : " + condition.getKeyword2());
		logger.info("endDate : " + condition.getEndDate());
		return dao.defectItemSelectAll(condition);
	}
	
	@GetMapping(value = "/gridRiskItemCount")
	public @ResponseBody int gridRiskItemCount() {
		logger.info("여기는 현재 안전재고 결과 갯수 컨트롤러입니다.");
		List<SafeItemDTO> safeItemList = dao.safeItemSelectAll();
		return dao.riskItemCount(safeItemList);
	}
	
	@GetMapping(value = "/risk_item")
	public void risk_item() {
		logger.info("여기는 위험재고 조회 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/gridRiskItemSelectAll")
	public @ResponseBody List<RiskItemDTO> gridRiskItemSelectAll() {
		logger.info("여기는 그리드 안전재고 결과목록 컨트롤러입니다.");
		List<SafeItemDTO> list = dao.safeItemSelectAll();
		return dao.riskItemSelectAll(list);
	}
	
	@GetMapping(value = "/safe_item")
	public void safe_item() {
		logger.info("여기는 안전재고 조회 컨트롤러입니다.");
	}
	@GetMapping(value = "/gridSafeItemSelectAll")
	public @ResponseBody List<SafeItemDTO> gridSafeItemSelectAll() {
		logger.info("여기는 그리드 안전재고 조회 컨트롤러입니다.");
		return dao.safeItemSelectAll();
	}
	@GetMapping(value = "/safe_itemInsert")
	public void safe_itemInsert() {
		logger.info("여기는 안전재고 등록 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/gridSafeItemInsert")
	public void safeItemInsert() {
		logger.info("여기는 그리드 안전재고 등록 컨트롤러입니다.");
	}
	
	//////////////////////////////////////////////////
	// 웹소켓 공부
	/////////////////////////////////////////////////
	@GetMapping(value = "/webSocketTest")
	public void webSocketTest() {
		logger.info("여기는 웹소켓 컨트롤러 입니다.");
	}
	@GetMapping(value = "/webSocket")
	public void webSocket() {
		logger.info("여기는 웹소켓 테스트 컨트롤러 입니다.");
	}
	@GetMapping(value = "/webSocket2")
	public void webSocket2() {
		logger.info("여기는 웹소켓 멀티채팅 컨트롤러 입니다.");
	}
	@GetMapping(value = "/webSocket3")
	public void webSocket3() {
		logger.info("여기는 웹소켓 기본 컨트롤러 입니다.");
	}
}
