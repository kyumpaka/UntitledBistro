package com.bit.UntitledBistro.service.jumun;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.MainPosDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDetailDTO;
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;

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
	
	// 테이블
	public ArrayList<TableSaveDTO> tableSearch();
	
	public int tableAdd(List<TableSaveDTO> list);
	
	// 주문목록
	public ArrayList<MainPosDTO> orderListAll();
	
	public OrdersDTO ordersList(String orders_No);
	
	public int odAllPrice(String orders_No);
	
	public int ordersRemove(OrdersDetailDTO ordersDetailDTO);
	
	public int ordersPlus(OrdersDetailDTO ordersDetailDTO);
	
	public int ordersMinus(OrdersDetailDTO ordersDetailDTO);
}
