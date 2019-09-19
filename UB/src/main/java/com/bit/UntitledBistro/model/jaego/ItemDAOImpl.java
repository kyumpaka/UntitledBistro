package com.bit.UntitledBistro.model.jaego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ItemDTO> itemSelectAll(){
		return mybatis.selectList("jaego.itemSelectAll");
	}
	
	public List<ItemDTO> itemSelect(ItemDTO dto){
		return mybatis.selectList("jaego.itemSelect", dto);
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
	
}
