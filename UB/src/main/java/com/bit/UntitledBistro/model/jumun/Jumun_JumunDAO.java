package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;
import java.util.Map;

public interface Jumun_JumunDAO {

	// 메뉴분류
	public ArrayList<Jumun_MenuTypeDTO> menuTypeSelect(Map<String, String> map);
	
	public int menuTypeInsert(Jumun_MenuTypeDTO dto);

	public int menuTypeDelete(Map<String, String> map);
	
	public int menuTypeUpdate(Jumun_MenuTypeDTO dto);
	
	// 메뉴
	public ArrayList<Jumun_MenuDTO> menuSelect(Map<String, String> map);
	
	public String menuSelectByMenuName(Map<String, String> map);
	
	public int menuInsert(Jumun_MenuDTO dto);
	
	public int menuDelete(Map<String, String> map);
	
	public int menuUpdate(Jumun_MenuDTO dto);
	
	// 재료
	public ArrayList<Jumun_IngredientDTO> ingreSelect(Map<String, String> map);
	
	public int ingreInsert(Jumun_IngredientDTO dto);

	public int ingreDelete(Map<String, String> map);
	
	// 주문내역
	public Jumun_OrderDTO orderSelect(Map<String, String> map);
	
	public ArrayList<Jumun_OrderDetailDTO> orderDetailSelect(Map<String, String> map);
	
	public int orderInsert(Jumun_OrderDTO orderDTO);
	
}
