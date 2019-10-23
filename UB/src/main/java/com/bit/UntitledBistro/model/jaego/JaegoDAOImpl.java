package com.bit.UntitledBistro.model.jaego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JaegoDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 재고 테이블 전체조회
	public List<ItemDTO> itemSelectList(Condition condition){
		return mybatis.selectList("jaego.itemSelectList", condition);
	}
	
	// 입고 테이블 전체조회
	public List<InItemDTO> inItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.inItemSelectList", condition);
	}
	
	// 출고 테이블 전체조회
	public List<OutItemDTO> outItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.outItemSelectList", condition);
	}
	
	// 재고변동표 전체조회
	public List<ChangeItemDTO> changeItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.changeItemSelectList", condition);
	}
	
	// 불량재고 테이블 등록
	public int defectItemInsert(DefectItemDTO dto){
		return mybatis.insert("jaego.defectItemInsert", dto);
	}
	
	// 출고 테이블 등록
	public int outItemInsert(OutItemDTO dto){
		return mybatis.insert("jaego.outItemInsert", dto);
	}
	
	// 재고 테이블 빼기 수정
	public int itemMinusUpdate(ItemDTO dto) {
		return mybatis.update("jaego.itemMinusUpdate", dto);
	}
	
	// 불량 테이블 전체조회
	public List<DefectItemDTO> defectItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.defectItemSelectList", condition);
	}
	
	// 불량 테이블 다중수정
	public void defectItemUpdates(List<DefectItemDTO> defectItemList) {
		mybatis.update("jaego.defectItemUpdates", defectItemList);
	}
	// 불량수정으로 인한 수정 전 출고수량 조회
	public int outItemSelectForDefectItem(DefectItemDTO defectItemDTO) {
		return mybatis.selectOne("jaego.outItemSelectForDefectItem", defectItemDTO);
	}
	// 불량수정으로 인한 출고 테이블 수정
	public void outItemUpdateForDefectItem(DefectItemDTO defectItemDTO) {
		mybatis.update("jaego.outItemUpdateForDefectItem", defectItemDTO);
	}
	// 불량수정으로 인한 재고 테이블 수정
	public void itemUpdateForDefectItem(DefectItemDTO defectItemDTO) {
		mybatis.update("jaego.itemUpdateForDefectItem", defectItemDTO);
	}
	
	// 불량 테이블 다중삭제
	public void defectItemDeletes(List<DefectItemDTO> defectItemList) {
		mybatis.delete("jaego.defectItemDeletes", defectItemList);
	}
	// 불량삭제로 인한 출고 테이블 다중삭제
	public void outItemDeleteForDefectItem(List<DefectItemDTO> defectItemList) {
		mybatis.delete("jaego.outItemDeleteForDefectItem", defectItemList);
	}
	// 불량삭제로 인한 재고 테이블 수정
	public void itemPlusUpdateForDefectItem(List<DefectItemDTO> defectItemList) {
		mybatis.delete("jaego.itemPlusUpdateForDefectItem", defectItemList);
	}
	
	
	// 품목 테이블 전체조회
	public List<ProductDTO> productSelectList(Condition condition) {
		return mybatis.selectList("jaego.productSelectList", condition);
	}
	
	// 안전 테이블 전체조회
	public List<SafeItemDTO> safeItemSelectList() {
		return mybatis.selectList("jaego.safeItemSelectList");
	}
	
	// 안전 테이블 다중수정
	public void safeItemUpdates(List<SafeItemDTO> safeItemList) {
		mybatis.update("jaego.safeItemUpdates", safeItemList);
	}
	
	// 안전 테이블 다중삭제
	public void safeItemDeletes(List<SafeItemDTO> safeItemList) {
		mybatis.delete("jaego.safeItemDeletes", safeItemList);
	}
	
	// 위험재고 갯수조회
	public int riskItemCount(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.riskItemCount", list);
	}
	
	// 위험재고 전체조회
	public List<RiskItemDTO> riskItemSelectList(List<SafeItemDTO> list) {
		return mybatis.selectList("jaego.riskItemSelectList", list);
	}
	
	// 안전재고 유효성검사
	public int safeItemValidate(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.safeItemValidate", list);
	}
	
	// 안전 테이블 품목코드 유효성 검사
	public String safeItemSelectValidate(String si_product_code) {
		return mybatis.selectOne("jaego.safeItemSelectValidate", si_product_code);
	}
	
	// 안전 테이블 다중등록
	public List<RiskItemDTO> safeItemInserts(List<SafeItemDTO> SafeItemDTOs) {
		return mybatis.selectList("jaego.safeItemInserts", SafeItemDTOs);
	}
	
	// 주문 테이블 이용하여 입고 테이블 조회하기
	public List<InItemDTO> orderInItemSelect(int ordin_num) {
		return mybatis.selectList("jaego.orderInItemSelect", ordin_num);
	}
	
	// 입고 테이블 등록
	public int inItemInsert(InItemDTO inItemDTO) {
		return mybatis.insert("jaego.inItemInsert", inItemDTO);
	}
	
	// 입고 테이블 삭제
	public int inItemDelete(InItemDTO inItemDTO) {
		return mybatis.delete("jaego.inItemDelete", inItemDTO);
	}
	
	
	// 재고 테이블 유효성검사
	public int itemValidate(ItemDTO itemDTO) {
		return mybatis.selectOne("jaego.itemValidate", itemDTO);
	}
	
	// 재고 테이블 등록
	public int itemInsert(ItemDTO itemDTO) {
		return mybatis.insert("jaego.itemInsert", itemDTO);
	}
	
	// 재고 테이블 더하기 수정
	public int itemPlusUpdate(ItemDTO itemDTO) {
		return mybatis.update("jaego.itemPlusUpdate", itemDTO);
	}
	
}
