package com.bit.UntitledBistro.service.jaego;

import java.util.List;
import java.util.Map;

import com.bit.UntitledBistro.model.jaego.ChangeItemDTO;
import com.bit.UntitledBistro.model.jaego.Condition;
import com.bit.UntitledBistro.model.jaego.DefectItemDTO;
import com.bit.UntitledBistro.model.jaego.InItemDTO;
import com.bit.UntitledBistro.model.jaego.ItemDTO;
import com.bit.UntitledBistro.model.jaego.OutItemDTO;
import com.bit.UntitledBistro.model.jaego.ProductDTO;
import com.bit.UntitledBistro.model.jaego.RiskItemDTO;
import com.bit.UntitledBistro.model.jaego.SafeItemDTO;

public interface JaegoService {

	// 재고 테이블 전체조회
	List<ItemDTO> itemSelectList(Condition condition);

	// 입고 테이블 전체조회
	List<InItemDTO> inItemSelectList(Condition condition);

	// 출고 테이블 전체조회
	List<OutItemDTO> outItemSelectList(Condition condition);

	// 재고변동표 전체조회
	List<ChangeItemDTO> changeItemSelectList(Condition condition);

	// 불량 테이블 다중등록
	int defectItemInserts(DefectItemDTO[] defectItemDTOs);

	// 불량 테이블 전체조회
	List<DefectItemDTO> defectItemSelectList(Condition condition);

	// 품목 테이블 전체조회
	List<ProductDTO> productSelectList(Condition condition);

	// 위험재고 갯수조회
	int riskItemCount();

	// 위험재고 전체조회
	List<RiskItemDTO> riskItemSelectList();

	// 안전 테이블 전체조회
	List<SafeItemDTO> safeItemSelectList();

	// 안전 테이블 다중등록
	int safeItemInserts(SafeItemDTO[] safeItemDTOs);

	// 입고 테이블 등록
	Map<String, Object> inItemInsert(InItemDTO inItemDTO);

	// 출고 테이블 등록
	int outItemInsert(OutItemDTO outItemDTO);

}
