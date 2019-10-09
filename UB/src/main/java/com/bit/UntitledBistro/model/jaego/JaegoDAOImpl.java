package com.bit.UntitledBistro.model.jaego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JaegoDAOImpl implements JaegoDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 재고 테이블 전체조회
	@Override
	public List<ItemDTO> itemSelectList(Condition condition){
		return mybatis.selectList("jaego.itemSelectList", condition);
	}
	
	// 입고 테이블 전체조회
	@Override
	public List<InItemDTO> inItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.inItemSelectList", condition);
	}
	
	// 출고 테이블 전체조회
	@Override
	public List<OutItemDTO> outItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.outItemSelectList", condition);
	}
	
	// 재고변동표 전체조회
	@Override
	public List<ChangeItemDTO> changeItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.changeItemSelectList", condition);
	}
	
	// 불량재고 테이블 등록
	@Override
	public int defectItemInsert(DefectItemDTO dto){
		return mybatis.insert("jaego.defectItemInsert", dto);
	}
	
	// 출고 테이블 등록
	@Override
	public int outItemInsert(OutItemDTO dto){
		return mybatis.insert("jaego.outItemInsert", dto);
	}
	
	// 재고 테이블 빼기 업데이트
	@Override
	public int itemMinusUpdate(ItemDTO dto) {
		return mybatis.update("jaego.itemMinusUpdate", dto);
	}
	
	// 불량 테이블 전체조회
	@Override
	public List<DefectItemDTO> defectItemSelectList(Condition condition) {
		return mybatis.selectList("jaego.defectItemSelectList", condition);
	}
	
	// 품목 테이블 전체조회
	@Override
	public List<ProductDTO> productSelectList(Condition condition) {
		return mybatis.selectList("jaego.productSelectList", condition);
	}
	
	// 안전 테이블 전체조회
	@Override
	public List<SafeItemDTO> safeItemSelectList() {
		return mybatis.selectList("jaego.safeItemSelectList");
	}
	
	// 위험재고 갯수조회
	@Override
	public int riskItemCount(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.riskItemCount", list);
	}
	
	// 위험재고 전체조회
	@Override
	public List<RiskItemDTO> riskItemSelectList(List<SafeItemDTO> list) {
		return mybatis.selectList("jaego.riskItemSelectList", list);
	}
	
	// 안전재고 유효성검사
	@Override
	public int safeItemValidate(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.safeItemValidate", list);
	}
	
	// 안전재고 다중등록
	@Override
	public List<RiskItemDTO> safeItemInserts(List<SafeItemDTO> SafeItemDTOs) {
		return mybatis.selectList("jaego.safeItemInserts", SafeItemDTOs);
	}
	
	// 입고 테이블 등록
	@Override
	public int inItemInsert(InItemDTO inItemDTO) {
		return mybatis.insert("jaego.inItemInsert", inItemDTO);
	}
	
	// 재고 테이블 유효성검사
	@Override
	public int itemValidate(ItemDTO itemDTO) {
		return mybatis.selectOne("jaego.itemValidate", itemDTO);
	}
	
	// 재고 테이블 등록
	@Override
	public int itemInsert(ItemDTO itemDTO) {
		return mybatis.insert("jaego.itemInsert", itemDTO);
	}
	
	// 재고 테이블 더하기 업데이트
	@Override
	public int itemPlusUpdate(ItemDTO itemDTO) {
		return mybatis.update("jaego.itemPlusUpdate", itemDTO);
	}
	
}
