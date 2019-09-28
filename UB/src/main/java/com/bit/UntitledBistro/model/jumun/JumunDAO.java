package com.bit.UntitledBistro.model.jumun;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
	
	// 테이블
	public ArrayList<TableSaveDTO> tableSelect();
	
	public int tableInsert(TableSaveDTO tableSaveDTO);
	
	public int tableDelete();
	
	// 주문내역
	public ArrayList<HashMap<String, Object>> ordersSelect();
	
	public OrdersDTO ordersSelectByNo(Map<String, String> map);
	
	public int ordersInsert(OrdersDTO ordersDTO);
	
	public int ordersUpdate(Map<String, String> map);
	
	public ArrayList<HashMap<String, Object>> ordersDetailsSelect(Map<String, String> map);
	
	public int odAllPrice(Map<String, String> map);
	
	public int ordersDetailsSelectCount(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersDetailsInsert(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersDetailsDelete(Map<String, String> map);
	
	public int ordersDetailsPlus(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersDetailsMinus(OrdersDetailsDTO ordersDetailDTO);
	
	public ArrayList<Integer> tableInfo();
	
	public ArrayList<HashMap<String, Object>> tableControl();
	
	public int order_tableControl(Map<String, Object> map);

	public int od_tableControl(Map<String, Object> map);
	
	public ArrayList<PaymentDTO> paymentSelect();
	
	public ArrayList<SalesDetailsDTO> salesDetailesSelect(SalesDTO salesDTO);
	
	// 결제
	public int salesInsert();

	public int salesSelectMax();
	
	public ArrayList<SalesDetailsDTO> salesInputSelect(Map<String, String> map);
	
	public int salesTableSelect(Map<String, String> map);
	
	public int salesDetailsInsert(SalesDetailsDTO salesDetailsDTO);
	
	public int ordersDelete(Map<String, String> map);
	
	public int paymentInsert(PaymentDTO paymentDTO);
	
	public Date paymentDateSelect(Map<String, String> map);
	
	public int payFail();
	
	public int memberPointSelectById(Map<String, String> map);
	
	public int memberPointUpdateById(Map<String, String> map);

	public int memberPointDowndateById(Map<String, String> map);
	
}
