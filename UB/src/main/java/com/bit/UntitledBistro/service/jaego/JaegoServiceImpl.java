package com.bit.UntitledBistro.service.jaego;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public List<ItemDTO> itemSelectList(Condition condition) {
		return dao.itemSelectList(condition);
	}
	
	public List<InItemDTO> inItemSelectList(Condition condition) {
		return dao.inItemSelectList(condition);
	}
	
	public List<OutItemDTO> outItemSelectList(Condition condition) {
		return dao.outItemSelectList(condition);
	}
	
	public List<ChangeItemDTO> changeItemSelectList(Condition condition) {
		return dao.changeItemSelectList(condition);
	}
	
	public int defectItemInsert(DefectItemDTO[] defectItemDTOs) {
		for(DefectItemDTO defectItemDTO : defectItemDTOs) {
			dao.defectItemInsert(defectItemDTO);
			
			OutItemDTO outItemDTO = new OutItemDTO();
			outItemDTO.setOi_product_code(defectItemDTO.getDi_product_code());
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
	
	public List<DefectItemDTO> defectItemSelectList(Condition condition) {
		return dao.defectItemSelectList(condition);
	}
	
	public List<ProductDTO> productSelectList(Condition condition) {
		return dao.productSelectList(condition);
	}
	
	public int riskItemCount() {
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemCount(safeItemList);
	}
	
	public List<RiskItemDTO> riskItemSelectList() {
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		return dao.riskItemSelectList(safeItemList);
	}
	
	public List<SafeItemDTO> safeItemSelectList() {
		return dao.safeItemSelectList();
	}
	
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
	
	public Map<String, Object> inItemInsert(InItemDTO inItemDTO) {
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
		
		List<SafeItemDTO> safeItemList = dao.safeItemSelectList();
		int count = dao.riskItemCount(safeItemList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("count", count);
		return map;
	}
	
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
