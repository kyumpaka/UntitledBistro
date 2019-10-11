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
	
	// 불량 테이블 다중삭제
	public void defectItemDeletes(List<DefectItemDTO> defectItemList) {
		mybatis.delete("jaego.defectItemDeletes", defectItemList);
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
	
	// 안전재고 다중등록
	public List<RiskItemDTO> safeItemInserts(List<SafeItemDTO> SafeItemDTOs) {
		return mybatis.selectList("jaego.safeItemInserts", SafeItemDTOs);
	}
	
	// 입고 테이블 등록
	public int inItemInsert(InItemDTO inItemDTO) {
		return mybatis.insert("jaego.inItemInsert", inItemDTO);
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
