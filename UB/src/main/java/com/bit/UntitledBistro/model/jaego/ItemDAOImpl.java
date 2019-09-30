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
	
	public int itemInsert(ItemDTO dto){
		return mybatis.insert("jaego.itemInsert", dto);
	}
	
	public int itemUpdate(ItemDTO dto){
		return mybatis.update("jaego.itemUpdate", dto);
	}
	
	public int itemDelete(ItemDTO dto){
		return mybatis.update("jaego.itemDelete", dto);
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
}
