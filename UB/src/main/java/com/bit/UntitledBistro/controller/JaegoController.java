package com.bit.UntitledBistro.controller;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@RequestMapping(value = "/gridItemSelectAll")
	public @ResponseBody List<ItemDTO> gridItemSelectAll(Condition condition) {
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
	
	@PostMapping(value = "/gridSafeItemInsert")
	public @ResponseBody int safeItemInsert(@RequestBody SafeItemDTO[] dtos) {
		logger.info("여기는 그리드 안전재고 등록 컨트롤러입니다.");
		List<SafeItemDTO> list = Arrays.asList(dtos);
		int result = dao.safeItemValidate(list);
		if(result == 0) {
			dao.safeItemInsert(list);
		}
		
		return result;
	}

	@GetMapping(value = "/item_insert")
	public void item_insert() {
		logger.info("여기는 재고 등록 테스트 컨트롤러입니다.");
	}
	
	
	///////////////////////////////////////////////////
	///////////  그리드 재고 등록 테스트   ////////////
	///////////////////////////////////////////////////
	
	@PostMapping(value = "/gridItemInsert")
	public @ResponseBody int gridItemInsert(ItemDTO dto) {
		logger.info("여기는 그리드 재고 등록 테스트 컨트롤러입니다.");
		logger.info("item_product_code : " + dto.getItem_product_code());
		logger.info("item_qty : " + dto.getItem_qty());
		int result = dao.itemValidate(dto);
		if(result == 0) {
			dao.itemInsert(dto);
		} else {
			dao.itemUpdate(dto);
		}
		return result;
	}
}
