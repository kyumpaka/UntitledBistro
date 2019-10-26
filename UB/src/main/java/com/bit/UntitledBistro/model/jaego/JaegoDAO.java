package com.bit.UntitledBistro.model.jaego;

import java.util.List;

public interface JaegoDAO {

	// 재고 테이블 전체조회
	List<ItemDTO> itemSelectList(Condition condition);

	// 입고 테이블 전체조회
	List<InItemDTO> inItemSelectList(Condition condition);

	// 출고 테이블 전체조회
	List<OutItemDTO> outItemSelectList(Condition condition);

	// 재고변동표 전체조회
	List<ChangeItemDTO> changeItemSelectList(Condition condition);

	// 불량재고 테이블 등록
	int defectItemInsert(DefectItemDTO dto);

	// 출고 테이블 등록
	int outItemInsert(OutItemDTO dto);

	// 재고 테이블 빼기 업데이트
	int itemMinusUpdate(ItemDTO dto);

	// 불량 테이블 전체조회
	List<DefectItemDTO> defectItemSelectList(Condition condition);

	// 품목 테이블 전체조회
	List<ProductDTO> productSelectList(Condition condition);

	// 안전 테이블 전체조회
	List<SafeItemDTO> safeItemSelectList();

	// 위험재고 갯수조회
	int riskItemCount(List<SafeItemDTO> list);

	// 위험재고 전체조회
	List<RiskItemDTO> riskItemSelectList(List<SafeItemDTO> list);

	// 안전재고 유효성검사
	int safeItemValidate(List<SafeItemDTO> list);

	// 안전재고 다중등록
	List<RiskItemDTO> safeItemInserts(List<SafeItemDTO> SafeItemDTOs);

	// 입고 테이블 등록
	int inItemInsert(InItemDTO inItemDTO);

	// 재고 테이블 유효성검사
	int itemValidate(ItemDTO itemDTO);

	// 재고 테이블 등록
	int itemInsert(ItemDTO itemDTO);

	// 재고 테이블 더하기 업데이트
	int itemPlusUpdate(ItemDTO itemDTO);

}