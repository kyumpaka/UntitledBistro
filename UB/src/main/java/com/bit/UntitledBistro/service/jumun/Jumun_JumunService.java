package com.bit.UntitledBistro.service.jumun;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.Jumun_IngredientDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_OrderDTO;

public interface Jumun_JumunService {

	// 메뉴 타입
	public ArrayList<Jumun_MenuTypeDTO> menuTypeSearch(String mt_Code);
	
	public int menuTypeAdd(Jumun_MenuTypeDTO dto);
	
	public int menuTypeRemove(String[] list);

	public int menuTypeModi(Jumun_MenuTypeDTO dto);
	
	// 메뉴
	public ArrayList<Jumun_MenuDTO> menuSearch(String menu_Mt_Code);

	public Jumun_MenuDTO menuSearchByMenuCode(String menu_Code);

	public int menuAdd(Jumun_MenuDTO dto);

	public String imgUpload(MultipartHttpServletRequest mRequest);
	
	public int menuRemove(String[] list);
	
	public int menuModi(Jumun_MenuDTO dto);
	
	// 재료
	public ArrayList<Jumun_IngredientDTO> ingreSearchByMenuCode(String menu_Code);
	
	// 주문목록
	public Jumun_OrderDTO orderList(Jumun_OrderDTO orderDTO);
	
}
