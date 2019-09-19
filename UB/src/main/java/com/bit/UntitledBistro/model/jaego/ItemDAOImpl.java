package com.bit.UntitledBistro.model.jaego;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ItemDTO> item_selectAll(){
		return mybatis.selectList("jaego.item_selectAll");
	}
	
	public int item_insert(ItemDTO dto){
		return mybatis.insert("jaego.item_insert", dto);
	}
	
	public int item_update(ItemDTO dto){
		return mybatis.update("jaego.item_update", dto);
	}
	
}
