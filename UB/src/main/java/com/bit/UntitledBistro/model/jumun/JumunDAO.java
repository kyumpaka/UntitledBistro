package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;
import java.util.Map;

public interface JumunDAO {

	// 메뉴분류
	public ArrayList<MenuTypeDTO> menuTypeSelect(Map<String, String> map);
	
	public int menuTypeInsert(MenuTypeDTO dto);

	public int menuTypeDelete(Map<String, String> map);
	
	public int menuTypeUpdate(MenuTypeDTO dto);
	
	// 메뉴
	public ArrayList<MenuDTO> menuSelect(Map<String, String> map);
	
	public String menuSelectByMenuName(Map<String, String> map);
	
	public int menuInsert(MenuDTO dto);
	
	public int menuDelete(Map<String, String> map);
	
	public int menuUpdate(MenuDTO dto);
	
	// 재료
	public ArrayList<IngredientDTO> ingreSelect(Map<String, String> map);
	
	public int ingreInsert(IngredientDTO dto);

	public int ingreDelete(Map<String, String> map);
	
	// 주문내역
	public OrderDTO orderSelect(Map<String, String> map);
	
	public ArrayList<OrderDetailDTO> orderDetailSelect(Map<String, String> map);
	
	public int orderInsert(OrderDTO orderDTO);
	
}
