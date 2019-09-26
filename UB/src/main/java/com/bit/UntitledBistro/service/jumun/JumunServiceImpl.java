package com.bit.UntitledBistro.service.jumun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.JumunDAO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDetailsDTO;
import com.bit.UntitledBistro.model.jumun.PaymentDTO;
import com.bit.UntitledBistro.model.jumun.SalesDTO;
import com.bit.UntitledBistro.model.jumun.SalesDetailsDTO;
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;

@Service
public class JumunServiceImpl implements JumunService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	JumunDAO dao;
	Map<String, String> map;
	
	@Override
	public ArrayList<MenuTypeDTO> menuTypeSearch(String mt_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("mt_Code", mt_Code);

		return dao.menuTypeSelect(map);
	}
	
	@Override
	public int menuTypeAdd(MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.menuTypeInsert(menuTypeDTO);
	}
	
	@Override
	public int menuTypeRemove(String[] list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		int cnt = 0;
		map = new HashMap<String, String>();
		
		for(String mt_Code : list) {
			map.put("mt_Code", mt_Code);
			map.put("menu_Mt_Code", mt_Code);
			
			dao.ingreDelete(map);
			dao.menuDelete(map);
			dao.menuTypeDelete(map);
			cnt++;
		}
		return cnt;
	}
	
	@Override
	public int menuTypeModi(MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);

		return dao.menuTypeUpdate(menuTypeDTO);
	}
	
	@Override
	public ArrayList<MenuDTO> menuSearch(String menu_Mt_Code, String menu_State) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Mt_Code", menu_Mt_Code);
		map.put("menu_State", menu_State);
		
		return dao.menuSelect(map);
	}

	@Override
	public MenuDTO menuSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Code", menu_Code);
		map.put("ingredient_Menu_Code", menu_Code);
		ArrayList<MenuDTO> menuDTO = dao.menuSelect(map);
		menuDTO.get(0).setIngredientDTO(dao.ingreSelect(map));
		
		return menuDTO.get(0);
	}
	
	@Override
	public int menuAdd(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		dao.menuInsert(menuDTO);
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map));
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i));
				}
			}
		}
		return 1;
	}

	@Override
	public String imgUpload(MultipartHttpServletRequest mRequest) {
		
		String saveFileName = null;
		
		try {
			String uploadPath = mRequest.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/";
			
			File dir = new File(uploadPath);

			// 디렉토리 생성
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			
			Iterator<String> iter = mRequest.getFileNames();
			
			while(iter.hasNext()) {
				String uploadFileName = iter.next();
				
				MultipartFile mFile = mRequest.getFile(uploadFileName);
				String originalFileName = mFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				if(originalFileName != "") {
					saveFileName = uuid + "_" + originalFileName;
				} else {
					saveFileName = "noImage.jpg";
				}
				
				byte[] data = mFile.getBytes();
				FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
				fos.write(data);
				fos.close();
			}
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		return saveFileName;
	}
	
	@Override
	public int menuRemove(String[] mt_CodeList) {
		dao = sqlSession.getMapper(JumunDAO.class);
		int cnt = 0;
		for(String menu_Code : mt_CodeList) {
			map = new HashMap<String, String>();
			map.put("menu_Code", menu_Code);
			map.put("ingredient_Menu_Code", menu_Code);
			
			dao.ingreDelete(map);
			dao.menuDelete(map);
			cnt++;
		}
		return cnt;
	}
	
	@Override
	public int menuModi(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		if(menuDTO.getMenu_Image() == null) menuDTO.setMenu_Image("없음.jpg");
		dao.menuUpdate(menuDTO);
		
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menuDTO.getMenu_Code());
		dao.ingreDelete(map);
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map));
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i));
				}
			}
		}
		return 1;
	}
	
	@Override
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menu_Code);
		
		return dao.ingreSelect(map);
	}
	
	@Override
	public ArrayList<TableSaveDTO> tableSearch() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.tableSelect();
	}

	@Override
	public int tableAdd(List<TableSaveDTO> list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		dao.tableDelete();
		int cnt = 0;
		for(int i = 0; i < list.size(); i++) {
			dao.tableInsert(list.get(i));
			cnt++;
		}
		
		return cnt;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> orderListAll() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersSelect();
	}
	
	@Override
	public OrdersDTO ordersList(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map);
		
		if(ordersDTO != null) {
			map.put("od_Orders_No", orders_No);
			ordersDTO.setOrdersListDTO(dao.ordersDetailsSelect(map));
		}
		
		return ordersDTO;
	}
	
	@Override
	public int odAllPrice(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", orders_No);
		return dao.odAllPrice(map);
	}
	
	@Override
	public int ordersRemove(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersDetailsDelete(ordersDetailDTO);
	}
	
	@Override
	public int ordersRemoveAll(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersDetailsDeleteAll(ordersDetailDTO);
	}
	
	@Override
	public int ordersPlus(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.ordersUpdate(map);
		
		// 미사용 테이블이면 생성
		if(dao.ordersSelectByNo(map) == null) {
			OrdersDTO ordersDTO = new OrdersDTO();
			ordersDTO.setOrders_No(ordersDetailDTO.getOd_Orders_No());
			ordersDTO.setOrders_TableSave_Code(ordersDetailDTO.getOd_Orders_No());
			dao.ordersInsert(ordersDTO);
		}
				
		if(dao.ordersDetailsSelectCount(ordersDetailDTO) == 0) {
			return dao.ordersDetailsInsert(ordersDetailDTO);			
		} else {
			return dao.ordersDetailsPlus(ordersDetailDTO);
		}
	}
	
	@Override
	public int ordersMinus(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.ordersUpdate(map);
		
		return dao.ordersDetailsMinus(ordersDetailDTO);
	}

	@Override
	public ArrayList<Integer> tableInfo() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableInfo();
	}

	@Override
	public ArrayList<HashMap<String, Object>> tableControl() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableControl();
	}

	@Override
	public int tableControl(Map<String, Object> table) {
		dao = sqlSession.getMapper(JumunDAO.class);
		dao.od_tableControl(table);
		return dao.order_tableControl(table);
	}

	@Override
	public ArrayList<PaymentDTO> paymentSearch() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.paymentSelect();
	}
	
	@Override
	public ArrayList<SalesDetailsDTO> salesDetailsSearch(SalesDTO salesDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.salesDetailesSelect(salesDTO);
	}
}
