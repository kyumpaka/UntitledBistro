package com.bit.UntitledBistro.service.jaego;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bit.UntitledBistro.model.jaego.ChangeItemDTO;
import com.bit.UntitledBistro.model.jaego.Condition;
import com.bit.UntitledBistro.model.jaego.DefectItemDTO;
import com.bit.UntitledBistro.model.jaego.InItemDTO;
import com.bit.UntitledBistro.model.jaego.ItemDTO;
import com.bit.UntitledBistro.model.jaego.JaegoDAOImpl;
import com.bit.UntitledBistro.model.jaego.OutItemDTO;
import com.bit.UntitledBistro.model.jaego.ProductDTO;
import com.bit.UntitledBistro.model.jaego.RiskItemDTO;
import com.bit.UntitledBistro.model.jaego.SafeItemDTO;

@Service
@Transactional
public class JaegoServiceImpl {
	
	@Autowired
	private JaegoDAOImpl dao;
	
	// 재고 테이블 전체조회
	public List<ItemDTO> itemSelectList(Condition condition) {
		return dao.itemSelectList(condition);
	}
	
	// 입고 테이블 전체조회
	public List<InItemDTO> inItemSelectList(Condition condition) {
		return dao.inItemSelectList(condition);
	}
	
	// 출고 테이블 전체조회
	public List<OutItemDTO> outItemSelectList(Condition condition) {
		return dao.outItemSelectList(condition);
	}
	
	// 재고변동표 전체조회
	public List<ChangeItemDTO> changeItemSelectList(Condition condition) {
		return dao.changeItemSelectList(condition);
	}
	
	// 불량 테이블 다중등록
	public int defectItemInserts(DefectItemDTO[] defectItemDTOs) {
		for(DefectItemDTO defectItemDTO : defectItemDTOs) {
			dao.defectItemInsert(defectItemDTO);
			
			OutItemDTO outItemDTO = new OutItemDTO();
			outItemDTO.setOi_product_code(defectItemDTO.getDi_product_code());
			outItemDTO.setOi_product_name(defectItemDTO.getDi_product_name());
			outItemDTO.setOi_qty(defectItemDTO.getDi_qty());
			dao.outItemInsert(outItemDTO);
			
			ItemDTO itemDTO = new ItemDTO();
			itemDTO.setItem_product_code(defectItemDTO.getDi_product_code());
			itemDTO.setItem_qty(defectItemDTO.getDi_qty());
			dao.itemMinusUpdate(itemDTO);
			
		} // for end
		
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList);
	}
	
	// 불량 테이블 전체조회
	public List<DefectItemDTO> defectItemSelectList(Condition condition) {
		return dao.defectItemSelectList(condition);
	}
	
	// 불량 테이블 다중수정
	public int defectItemUpdates(DefectItemDTO[] defectItemDTOs) {
		List<DefectItemDTO> defectItemList = Arrays.asList(defectItemDTOs);
		dao.defectItemUpdates(defectItemList);
		int i = 0;
		for(DefectItemDTO defectItemDTO : defectItemDTOs) {
			i++;
			System.out.println("테스트" + i);
			System.out.println(defectItemDTO);
			int before_qty = dao.outItemSelectForDefectItem(defectItemDTO);
			int update_qty = defectItemDTO.getDi_qty();
			int item_qty = before_qty - update_qty;
			dao.outItemUpdateForDefectItem(defectItemDTO);
			defectItemDTO.setDi_qty(item_qty);
			dao.itemUpdateForDefectItem(defectItemDTO);
		}
		
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList);
	}
	
	// 불량 테이블 다중삭제
	public int defectItemDeletes(DefectItemDTO[] defectItemDTOs) {
		List<DefectItemDTO> defectItemList = Arrays.asList(defectItemDTOs);
		dao.defectItemDeletes(defectItemList);
		dao.outItemDeleteForDefectItem(defectItemList);
		dao.itemPlusUpdateForDefectItem(defectItemList);
		
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList);
	}
	
	// 품목 테이블 전체조회
	public List<ProductDTO> productSelectList(Condition condition) {
		return dao.productSelectList(condition);
	}
	
	// 위험재고 갯수조회
	public int riskItemCount() {
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		System.out.println("안전재고 리스트조회");
		System.out.println(safeItemList);
		return dao.riskItemCount(safeItemList);
	}
	
	// 위험재고 전체조회
	public List<RiskItemDTO> riskItemSelectList() {
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemSelectList(safeItemList);
	}
	
	// 안전 테이블 전체조회
	public List<SafeItemDTO> safeItemSelectList() {
		return dao.safeItemSelectList();
	}
	
	// 안전 테이블 다중수정
	public int safeItemUpdates(SafeItemDTO[] safeItemDTOs) {
		List<SafeItemDTO> safeItemList = Arrays.asList(safeItemDTOs);
		dao.safeItemUpdates(safeItemList);
		
		List<SafeItemDTO> safeItemList2 = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList2);
	}
	
	// 안전 테이블 다중삭제
	public int safeItemDeletes(SafeItemDTO[] safeItemDTOs) {
		List<SafeItemDTO> safeItemList = Arrays.asList(safeItemDTOs);
		dao.safeItemDeletes(safeItemList);
		
		List<SafeItemDTO> safeItemList2 = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList2);
	}
	
	// 안전 테이블 품목코드 유효성 검사
	public String safeItemSelectValidate(String si_product_code) {
		String result =  dao.safeItemSelectValidate(si_product_code);
		if(result == null) result = "noData";
		return result;
	}
	
	// 안전 테이블 다중등록
	public int safeItemInserts(SafeItemDTO[] safeItemDTOs) {
		List<SafeItemDTO> list = Arrays.asList(safeItemDTOs);
		int result = dao.safeItemValidate(list);
		
		if(result == 0) {
			dao.safeItemInserts(list);
			List<SafeItemDTO> listAll = dao.safeItemSelectList();
			return dao.riskItemCount(listAll);
		} else {
			return -1;
		}
		
	}
	
	// 입고 테이블 등록
	public void inItemInsert(int ordin_num) {
		List<InItemDTO> inItemDTOList = dao.orderInItemSelect(ordin_num);
		for(InItemDTO inItemDTO : inItemDTOList) {
			inItemDTO.setIi_ordin_num(ordin_num);
			dao.inItemInsert(inItemDTO);
			
			ItemDTO itemDTO = new ItemDTO();
			itemDTO.setItem_product_code(inItemDTO.getIi_product_code());
			itemDTO.setItem_qty(inItemDTO.getIi_qty());
			
			int result = dao.itemValidate(itemDTO);
			if(result == 0) {
				dao.itemInsert(itemDTO);
			} else {
				dao.itemPlusUpdate(itemDTO);
			}
		}
		
	}
	
	// 입고 테이블 삭제
	public void inItemDelete(int ordin_num) {
		List<InItemDTO> inItemDTOList = dao.orderInItemSelect(ordin_num);
		for(InItemDTO inItemDTO : inItemDTOList) {
			dao.inItemDelete(inItemDTO);
			ItemDTO itemDTO = new ItemDTO();
			itemDTO.setItem_product_code(inItemDTO.getIi_product_code());
			itemDTO.setItem_qty(inItemDTO.getIi_qty());
			
			dao.itemMinusUpdate(itemDTO);
		}
		
	}
	
	// 출고 테이블 등록
	public int outItemInsert(OutItemDTO outItemDTO) {
		dao.outItemInsert(outItemDTO);
		
		ItemDTO itemDTO = new ItemDTO();
		itemDTO.setItem_product_code(outItemDTO.getOi_product_code());
		itemDTO.setItem_qty(outItemDTO.getOi_qty());
		dao.itemMinusUpdate(itemDTO);

		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList);
	}
	
}
