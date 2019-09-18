package com.bit.UntitledBistro.service.jumun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.Jumun_IngredientDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_JumunDAO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.Jumun_OrderDTO;

@Service
public class Jumun_JumunServiceImpl implements Jumun_JumunService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	Jumun_JumunDAO dao;
	Map<String, String> map;
	
	@Override
	public ArrayList<Jumun_MenuTypeDTO> menuTypeSearch(String mt_Code) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("mt_Code", mt_Code);
		ArrayList<Jumun_MenuTypeDTO> list = dao.menuTypeSelect(map);

		return list;
	}
	
	@Override
	public int menuTypeAdd(Jumun_MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		
		return dao.menuTypeInsert(menuTypeDTO);
	}
	
	@Override
	public int menuTypeRemove(String[] list) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
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
	public int menuTypeModi(Jumun_MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);

		return dao.menuTypeUpdate(menuTypeDTO);
	}
	
	@Override
	public ArrayList<Jumun_MenuDTO> menuSearch(String menu_Mt_Code) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Mt_Code", menu_Mt_Code);
		ArrayList<Jumun_MenuDTO> list = dao.menuSelect(map);
		
		return list;
	}

	@Override
	public Jumun_MenuDTO menuSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Code", menu_Code);
		map.put("ingredient_Menu_Code", menu_Code);
		ArrayList<Jumun_MenuDTO> menuDTO = dao.menuSelect(map);
		menuDTO.get(0).setJumun_IngredientDTO(dao.ingreSelect(map));
		
		return menuDTO.get(0);
	}
	
	@Override
	public int menuAdd(Jumun_MenuDTO menuDTO) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		dao.menuInsert(menuDTO);
		if(menuDTO.getJumun_IngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getJumun_IngredientDTO().size(); i++) {
				if(menuDTO.getJumun_IngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getJumun_IngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getJumun_IngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map));
					dao.ingreInsert(menuDTO.getJumun_IngredientDTO().get(i));
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

			if (!dir.isDirectory()) {
				dir.mkdirs(); // 디렉토리 생성
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
					saveFileName = "없음.jpg";
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
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
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
	public int menuModi(Jumun_MenuDTO menuDTO) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		if(menuDTO.getMenu_Image() == null) menuDTO.setMenu_Image("없음.jpg");
		dao.menuUpdate(menuDTO);
		
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menuDTO.getMenu_Code());
		dao.ingreDelete(map);
		if(menuDTO.getJumun_IngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getJumun_IngredientDTO().size(); i++) {
				if(menuDTO.getJumun_IngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getJumun_IngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getJumun_IngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map));
					dao.ingreInsert(menuDTO.getJumun_IngredientDTO().get(i));
				}
			}
		}
		return 1;
	}
	
	@Override
	public ArrayList<Jumun_IngredientDTO> ingreSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menu_Code);
		
		return dao.ingreSelect(map);
	}

	@Override
	public Jumun_OrderDTO orderList(Jumun_OrderDTO orderDTO) {
		dao = sqlSession.getMapper(Jumun_JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("order_No", orderDTO.getOrder_No());
		map.put("od_Order_No", orderDTO.getOrder_No());
		Jumun_OrderDTO dto = dao.orderSelect(map);
		
		if(dto == null) {
			dao.orderInsert(orderDTO);
			return orderDTO;
		} else {
			dto.setJumun_OrderDetailDTO(dao.orderDetailSelect(map));
		}
		
		return dto;
	}

}
