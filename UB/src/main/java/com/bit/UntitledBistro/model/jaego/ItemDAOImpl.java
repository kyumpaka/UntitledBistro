package com.bit.UntitledBistro.model.jaego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	public int itemTotal() {
		return mybatis.selectOne("jaego.itemTotal");
	}
	
	public List<ItemDTO> itemSelectAll(Condition condition){
		return mybatis.selectList("jaego.itemSelectAll", condition);
	}
	
	public int defectItemInsert(List<DefectItemDTO> list){
		return mybatis.insert("jaego.defectItemInsert", list);
	}
	
	public List<ItemDTO> inItemSelectAll(Condition condition) {
		return mybatis.selectList("jaego.inItemSelectAll", condition);
	}
	
	public List<OutItemDTO> outItemSelectAll(Condition condition) {
		return mybatis.selectList("jaego.outItemSelectAll", condition);
	}
	
	public List<ChangeItemDTO> changeItemSelectAll(Condition condition) {
		return mybatis.selectList("jaego.changeItemSelectAll", condition);
	}
	
	public List<ProductDTO> productSelectAll(Condition condition) {
		return mybatis.selectList("jaego.productSelectAll", condition);
	}
	
	public List<ProductDTO> defectItemSelectAll(Condition condition) {
		return mybatis.selectList("jaego.defectItemSelectAll", condition);
	}
	
	public List<SafeItemDTO> safeItemSelectAll() {
		return mybatis.selectList("jaego.safeItemSelectAll");
	}
	
	public int riskItemCount(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.riskItemCount", list);
	}
	
	public List<RiskItemDTO> riskItemSelectAll(List<SafeItemDTO> list) {
		return mybatis.selectList("jaego.riskItemSelectAll", list);
	}
	
	public int safeItemValidate(List<SafeItemDTO> list) {
		return mybatis.selectOne("jaego.safeItemValidate", list);
	}
	
	public List<RiskItemDTO> safeItemInsert(List<SafeItemDTO> list) {
		return mybatis.selectList("jaego.safeItemInsert", list);
	}
	
	public int itemValidate(ItemDTO dto) {
		return mybatis.selectOne("jaego.itemValidate", dto);
	}
	
	public int itemUpdate(ItemDTO dto) {
		return mybatis.update("jaego.itemUpdate", dto);
	}
	
	public int itemInsert(ItemDTO dto) {
		return mybatis.update("jaego.itemInsert", dto);
	}
	
}
