package com.bit.UntitledBistro.controller;

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
import com.bit.UntitledBistro.model.jaego.InItemDTO;
import com.bit.UntitledBistro.model.jaego.ItemDTO;
import com.bit.UntitledBistro.model.jaego.OutItemDTO;
import com.bit.UntitledBistro.model.jaego.ProductDTO;
import com.bit.UntitledBistro.model.jaego.RiskItemDTO;
import com.bit.UntitledBistro.model.jaego.SafeItemDTO;
import com.bit.UntitledBistro.service.jaego.JaegoServiceImpl;

@Controller
@RequestMapping(value = "/jaego")
public class JaegoController {
	private static final Logger logger = LoggerFactory.getLogger(JaegoController.class);
	
	@Autowired
	private JaegoServiceImpl service;
	
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
	
	@RequestMapping(value = "/gridItemSelectList")
	public @ResponseBody List<ItemDTO> gridItemSelectList(Condition condition) {
		logger.info("여기는 그리드 재고 테이블 전체조회 컨트롤러 입니다.");
		logger.info(condition.toString());
		return service.itemSelectList(condition);
	}
	
	@RequestMapping(value = "/gridInItemSelectList")
	public @ResponseBody List<InItemDTO> gridInItemSelectList(Condition condition) {
		logger.info("여기는 그리드 입고 테이블 전체조회 컨트롤러 입니다.");
		return service.inItemSelectList(condition);
	}
	
	@RequestMapping(value = "/gridOutItemSelectList")
	public @ResponseBody List<OutItemDTO> gridOutItemSelectList(Condition condition) {
		logger.info("여기는 그리드 출고 테이블 전체조회 컨트롤러 입니다.");
		return service.outItemSelectList(condition);
	}
	
	@RequestMapping(value = "/gridChangeItemSelectList")
	public @ResponseBody List<ChangeItemDTO> gridChangeItemSelectList(Condition condition) {
		logger.info("여기는 그리드 재고변동표 전체조회 컨트롤러 입니다.");
		return service.changeItemSelectList(condition);
	}
	
	@RequestMapping(value = "/gridDefectItemInsert")
	public @ResponseBody int gridDefectItemInsert(@RequestBody DefectItemDTO[] defectItemDTOs) {
		logger.info("여기는 그리드 불량 테이블 추가 컨트롤러 입니다.");
		return service.defectItemInserts(defectItemDTOs);
	}
	
	@RequestMapping(value = "/gridDefectItemSelectList")
	public @ResponseBody List<DefectItemDTO> gridDefectItemSelectList(Condition condition) {
		logger.info("여기는 그리드 불량 테이블 전체조회 컨트롤러 입니다.");
		return service.defectItemSelectList(condition);
	}
	
	@RequestMapping(value = "/gridDefectItemUpdates")
	public @ResponseBody int gridDefectItemUpdates(@RequestBody DefectItemDTO[] defectItemDTOs) {
		logger.info("여기는 그리드 불량 테이블 다중수정 컨트롤러 입니다.");
		return service.defectItemUpdates(defectItemDTOs);
	}
	
	@RequestMapping(value = "/gridDefectItemDeletes")
	public @ResponseBody int gridDefectItemDeletes(@RequestBody DefectItemDTO[] defectItemDTOs) {
		logger.info("여기는 그리드 불량 테이블 다중삭제 컨트롤러 입니다.");
		return service.defectItemDeletes(defectItemDTOs);
	}
	
	@RequestMapping(value = "/gridProductSelectList")
	public @ResponseBody List<ProductDTO> gridProductSelectList(Condition condition) {
		logger.info("여기는 그리드 품목 테이블 전체조회 컨트롤러 입니다.");
		return service.productSelectList(condition);
	}
	
	@GetMapping(value = "/gridRiskItemCount")
	public @ResponseBody int gridRiskItemCount() {
		logger.info("여기는 그리드 위험재고 갯수조회 컨트롤러입니다.");
		return service.riskItemCount();
	}
	
	///////////////////
	@GetMapping(value = "/risk_item")
	public void risk_item() {
		logger.info("여기는 위험재고 조회 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/gridRiskItemSelectList")
	public @ResponseBody List<RiskItemDTO> gridRiskItemSelectList() {
		logger.info("여기는 그리드 위험재고 전체조회 컨트롤러입니다.");
		return service.riskItemSelectList();
	}
	
	@GetMapping(value = "/safe_item")
	public void safe_item() {
		logger.info("여기는 안전재고 조회 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/gridSafeItemSelectList")
	public @ResponseBody List<SafeItemDTO> gridSafeItemSelectList() {
		logger.info("여기는 그리드 안전 테이블 전체조회 컨트롤러입니다.");
		return service.safeItemSelectList();
	}
	
	@RequestMapping(value = "/gridSafeItemUpdates")
	public @ResponseBody int gridSafeItemUpdates(@RequestBody SafeItemDTO[] safeItemDTOs) {
		logger.info("여기는 그리드 안전 테이블 다중수정 컨트롤러 입니다.");
		return service.safeItemUpdates(safeItemDTOs);
	}
	
	@RequestMapping(value = "/gridSafeItemDeletes")
	public @ResponseBody int gridSafeItemDeletes(@RequestBody SafeItemDTO[] safeItemDTOs) {
		logger.info("여기는 그리드 안전 테이블 다중삭제 컨트롤러 입니다.");
		return service.safeItemDeletes(safeItemDTOs);
	}
	
	@GetMapping(value = "/safe_itemInsert")
	public void safe_itemInsert() {
		logger.info("여기는 안전재고 등록 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/gridSafeItemSelectProductCode")
	public @ResponseBody String gridSafeItemSelectProductCode(String si_product_code) {
		logger.info("여기는 안전재고 품목코드 유효성 검사 컨트롤러입니다.");
		return service.safeItemSelectValidate(si_product_code);
	}
	
	@PostMapping(value = "/gridSafeItemInserts")
	public @ResponseBody int gridSafeItemInsertList(@RequestBody SafeItemDTO[] safeItemDTOs) {
		logger.info("여기는 그리드 안전재고s 등록 컨트롤러입니다.");
		return service.safeItemInserts(safeItemDTOs);
	}

	@GetMapping(value = "/in_item_insert")
	public void in_item_insert() {
		logger.info("여기는 입고 등록 테스트 컨트롤러입니다.");
	}
	
	@GetMapping(value = "/out_item_insert")
	public void out_item_insert() {
		logger.info("여기는 출고 등록 테스트 컨트롤러입니다.");
	}
	
}
