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

	// 재고 테이블 빼기 수정
	int itemMinusUpdate(ItemDTO dto);

	// 불량 테이블 전체조회
	List<DefectItemDTO> defectItemSelectList(Condition condition);

	// 불량 테이블 다중수정
	void defectItemUpdates(List<DefectItemDTO> defectItemList);

	// 불량수정으로 인한 수정 전 출고수량 조회
	int outItemSelectForDefectItem(DefectItemDTO defectItemDTO);

	// 불량수정으로 인한 출고 테이블 수정
	void outItemUpdateForDefectItem(DefectItemDTO defectItemDTO);

	// 불량수정으로 인한 재고 테이블 수정
	void itemUpdateForDefectItem(DefectItemDTO defectItemDTO);

	// 불량 테이블 다중삭제
	void defectItemDeletes(List<DefectItemDTO> defectItemList);

	// 불량삭제로 인한 출고 테이블 다중삭제
	void outItemDeleteForDefectItem(List<DefectItemDTO> defectItemList);

	// 불량삭제로 인한 재고 테이블 수정
	void itemPlusUpdateForDefectItem(List<DefectItemDTO> defectItemList);

	// 품목 테이블 전체조회
	List<ProductDTO> productSelectList(Condition condition);

	// 안전 테이블 전체조회
	List<SafeItemDTO> safeItemSelectList();

	// 안전 테이블 다중수정
	void safeItemUpdates(List<SafeItemDTO> safeItemList);

	// 안전 테이블 다중삭제
	void safeItemDeletes(List<SafeItemDTO> safeItemList);

	// 위험재고 갯수조회
	int riskItemCount(List<SafeItemDTO> list);

	// 위험재고 전체조회
	List<RiskItemDTO> riskItemSelectList(List<SafeItemDTO> list);

	// 안전재고 유효성검사
	int safeItemValidate(List<SafeItemDTO> list);

	// 안전 테이블 품목코드 유효성 검사
	String safeItemSelectValidate(String si_product_code);

	// 안전 테이블 다중등록
	List<RiskItemDTO> safeItemInserts(List<SafeItemDTO> SafeItemDTOs);

	// 주문 테이블 이용하여 입고 테이블 조회하기
	List<InItemDTO> orderInItemSelect(int ordin_num);

	// 입고 테이블 등록
	int inItemInsert(InItemDTO inItemDTO);

	// 입고 테이블 삭제
	int inItemDelete(InItemDTO inItemDTO);

	// 재고 테이블 유효성검사
	int itemValidate(ItemDTO itemDTO);

	// 재고 테이블 등록
	int itemInsert(ItemDTO itemDTO);

	// 재고 테이블 더하기 수정
	int itemPlusUpdate(ItemDTO itemDTO);

}