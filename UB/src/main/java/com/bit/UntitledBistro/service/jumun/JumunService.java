package com.bit.UntitledBistro.service.jumun;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrderDTO;

public interface JumunService {

	// 메뉴 타입
	public ArrayList<MenuTypeDTO> menuTypeSearch(String mt_Code);
	
	public int menuTypeAdd(MenuTypeDTO dto);
	
	public int menuTypeRemove(String[] list);

	public int menuTypeModi(MenuTypeDTO dto);
	
	// 메뉴
	public ArrayList<MenuDTO> menuSearch(String menu_Mt_Code);

	public MenuDTO menuSearchByMenuCode(String menu_Code);

	public int menuAdd(MenuDTO dto);

	public String imgUpload(MultipartHttpServletRequest mRequest);
	
	public int menuRemove(String[] list);
	
	public int menuModi(MenuDTO dto);
	
	// 재료
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(String menu_Code);
	
	// 주문목록
	public OrderDTO orderList(OrderDTO orderDTO);
	
}
