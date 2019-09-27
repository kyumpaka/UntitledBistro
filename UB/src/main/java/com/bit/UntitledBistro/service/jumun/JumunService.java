package com.bit.UntitledBistro.service.jumun;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.KakaoPayApprovalDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDetailsDTO;
import com.bit.UntitledBistro.model.jumun.PaymentDTO;
import com.bit.UntitledBistro.model.jumun.SalesDTO;
import com.bit.UntitledBistro.model.jumun.SalesDetailsDTO;
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;

public interface JumunService {

	// 메뉴 타입
	public ArrayList<MenuTypeDTO> menuTypeSearch(String mt_Code);
	
	public int menuTypeAdd(MenuTypeDTO dto);
	
	public int menuTypeRemove(String[] list);

	public int menuTypeModi(MenuTypeDTO dto);
	
	// 메뉴
	public ArrayList<MenuDTO> menuSearch(String menu_Mt_Code, String menu_State);

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
	public ArrayList<HashMap<String, Object>> orderListAll();
	
	public OrdersDTO ordersList(String orders_No);
	
	public int odAllPrice(String orders_No);
	
	public int ordersRemove(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersRemoveAll(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersPlus(OrdersDetailsDTO ordersDetailDTO);
	
	public int ordersMinus(OrdersDetailsDTO ordersDetailDTO);
	
	public ArrayList<Integer> tableInfo();
	
	public ArrayList<HashMap<String, Object>> tableControl();
	
	public int tableControl(Map<String, Object> table);
	
	public ArrayList<PaymentDTO> paymentSearch();
	
	public ArrayList<SalesDetailsDTO> salesDetailsSearch(SalesDTO salesDTO);
	
	public String kakaoPayReady(String orders_No, PaymentDTO paymentDTO);
	
	public KakaoPayApprovalDTO kakaoPayInfo(String pg_token, String sales_no, String payment_Card);
	
	public Date paymentTime(String sales_No);
	
	public String createPdf(String orders_No, HttpServletRequest request);
	
	public int memberPointSearchById(String member_Id);
	
}
