package com.bit.UntitledBistro.service.jumun;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.JumunDAO;
import com.bit.UntitledBistro.model.jumun.KakaoPayApprovalDTO;
import com.bit.UntitledBistro.model.jumun.KakaoPayReadyDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDetailsDTO;
import com.bit.UntitledBistro.model.jumun.PaymentDTO;
import com.bit.UntitledBistro.model.jumun.SalesDetailsDTO;
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Service
@Transactional(rollbackFor = {Exception.class})
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

		return dao.menuTypeSelect(map); // ë©”ë‰´êµ¬ë¶„ ì¡°íšŒ
	}
	
	@Override
	public int menuTypeAdd(MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.menuTypeInsert(menuTypeDTO); // ë©”ë‰´êµ¬ë¶„ ì¶”ê?
	}
	
	@Override
	public int menuTypeRemove(String mt_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		
		map.put("mt_Code", mt_Code);
		map.put("menu_Mt_Code", mt_Code);
		
		dao.ingreDelete(map); // ?¬í•¨?˜ëŠ” ?¬ë£Œ ?? œ
		dao.menuDelete(map); // ?¬í•¨?˜ëŠ” ë©”ë‰´ ?? œ
		dao.menuTypeDelete(map); // ?¬í•¨?˜ëŠ” ë©”ë‰´êµ¬ë¶„ ?? œ
		
		return 1;
	}
	
	@Override 
	public int menuTypeModi(MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);

		return dao.menuTypeUpdate(menuTypeDTO); // ë©”ë‰´êµ¬ë¶„ ?´ë¦„ ?˜ì •
	}
	
	@Override
	public ArrayList<MenuDTO> menuSearch(String menu_Mt_Code, String menu_State) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Mt_Code", menu_Mt_Code);
		map.put("menu_State", menu_State);
		
		return dao.menuSelect(map); // ë©”ë‰´ ì¡°íšŒ
	}

	@Override
	public MenuDTO menuSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Code", menu_Code);
		ArrayList<MenuDTO> menuDTO = dao.menuSelect(map); // ë©”ë‰´ ì¡°íšŒ
		map.put("ingredient_Menu_Code", menu_Code);
		menuDTO.get(0).setIngredientDTO(dao.ingreSelect(map)); // ë©”ë‰´?? ?¤ì–´ê°€?? ?¬ë£Œ ì¡°íšŒ
		
		return menuDTO.get(0);
	}
	
	@Override
	public int menuAdd(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		dao.menuInsert(menuDTO); // ë©”ë‰´ ì¶”ê?
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map)); // ë©”ë‰´?´ë¦„?¼ë¡œ ë©”ë‰´ì½”ë“œ ì°¾ê¸°
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // ë©”ë‰´?? ?¤ì–´ê°€?? ?¬ë£Œ ?…ë ¥
				}
			}
		}
		return 1;
	}

	@Override
	public String imgUpload(MultipartHttpServletRequest mRequest) {
		String saveFileName = null;
		
		try {
			// ?¬ì§„ ?€?¥ìœ„ì¹?
			String uploadPath = mRequest.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/";
			File dir = new File(uploadPath);
			// ?”ë ‰? ë¦¬ ?ì„±
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			Iterator<String> iter = mRequest.getFileNames();
			while(iter.hasNext()) {
				// ?Œì¼?´ë¦„
				String uploadFileName = iter.next();
				
				MultipartFile mFile = mRequest.getFile(uploadFileName);
				String originalFileName = mFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID(); // ?¬ì§„ ?´ë¦„ ì¤‘ë³µ ë°©ì?
				if(originalFileName != "") {
					saveFileName = uuid + "_" + originalFileName;
					
					byte[] data = mFile.getBytes();
					FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
					fos.write(data);
					fos.close();
				} else {
					saveFileName = "noImage.jpg";
				}
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
			
			dao.ingreDelete(map); // ë©”ë‰´?? ?í•˜?? ?¬ë£Œ ?? œ
			dao.menuDelete(map); // ë©”ë‰´ ?? œ
			cnt++; // ëª? ê°? ë©”ë‰´ ?? œ?ˆëŠ”ì§€ ?•ì¸ ì¹´ìš´??
		}
		return cnt;
	}
	
	@Override
	public int menuModi(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		if(menuDTO.getMenu_Image() == null) menuDTO.setMenu_Image("noImage.jpg"); // ì²¨ë??? ?Œì¼ ?†ì„ ??
		dao.menuUpdate(menuDTO); // ë©”ë‰´ ?˜ì •
		
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menuDTO.getMenu_Code());
		dao.ingreDelete(map); // ê¸°ì¡´ ?¬ë£Œ ?? œ
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map)); // ë©”ë‰´?´ë¦„?¼ë¡œ ë©”ë‰´ì½”ë“œ ì°¾ê¸°
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // ?ˆë¡œ?? ë©”ë‰´ ?¬ë£Œ ?…ë ¥
				}
			}
		}
		return 1;
	}
	
	@Override
	public int menuNameCheck(String name) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("menu_Name", name);
		
		return dao.menuNameCheck(map);
	}
	
	@Override
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(String menu_Code) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menu_Code);
		
		return dao.ingreSelect(map); // ?¬ë£Œ ì¡°íšŒ
	}
	
	@Override
	public ArrayList<TableSaveDTO> tableSearch() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.tableSelect(); // ?Œì´ë¸? ì¡°íšŒ
	}

	@Override
	public int tableAdd(List<TableSaveDTO> list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		dao.tableDelete(); // ê¸°ì¡´ ?Œì´ë¸? ?? œ
		int cnt = 0;
		for(int i = 0; i < list.size(); i++) {
			dao.tableInsert(list.get(i)); // ?ˆë¡œ?? ?Œì´ë¸? ?…ë ¥
			cnt++; // ?Œì´ë¸? ê°œìˆ˜ ?•ì¸ ì¹´ìš´??
		}
		
		return cnt;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> orderListAll() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersSelect(); // ?„ì²´ ì£¼ë¬¸?´ì—­ ì¡°íšŒ(ë©”ì¸ ?¬ìŠ¤)
	}
	
	@Override
	public OrdersDTO ordersList(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map); // ì£¼ë¬¸ ì¡°íšŒ
		
		if(ordersDTO != null) {
			map.put("od_Orders_No", orders_No);
			ordersDTO.setOrdersListDTO(dao.ordersDetailsSelect(map)); // ì£¼ë¬¸?´ì—­ ì¡°íšŒ
		}
		
		return ordersDTO;
	}
	
	@Override
	public int odAllPrice(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", orders_No);
		
		return dao.odAllPrice(map); // ì£¼ë¬¸ ?„ì²´ ê¸ˆì•¡ ì¡°íšŒ
	}
	
	@Override
	public int ordersRemove(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storeAllPlus(map); // ?¬ê³  ì¶”ê?
		dao.shippingHistoryOneDelete(map); // ì¶œê³ ?´ì—­ ?? œ
		
		return dao.ordersDetailsDelete(map); // ì£¼ë¬¸?´ì—­ ë©”ë‰´ 1ê°? ?? œ
	}
	
	@Override
	public int ordersRemoveAll(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.storeAllPlus(map); // ?¬ê³  ì¶”ê?
		dao.shippingHistoryAllDelete(map); // ì¶œê³ ?´ì—­ ?? œ
		
		return dao.ordersDetailsDelete(map); // ì£¼ë¬¸?´ì—­ ?„ì²´ ?? œ
	}
	
	@Override
	public int ordersPlus(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.ordersUpdate(map);
		
		// ë¯¸ì‚¬?? ?Œì´ë¸”ì´ë©? ?ì„±
		if(dao.ordersSelectByNo(map) == null) {
			OrdersDTO ordersDTO = new OrdersDTO();
			ordersDTO.setOrders_No(ordersDetailDTO.getOd_Orders_No());
			ordersDTO.setOrders_TableSave_Code(ordersDetailDTO.getOd_Orders_No());
			dao.ordersInsert(ordersDTO);
		}
		
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storeMinus(map); // ?¬ê³  ê°ì†Œ
		dao.shippingHistoryInsert(map); // ì¶œê³ ?´ì—­ ê¸°ë¡
		dao.storeCheck(map); // ?¬ê³ ?˜ëŸ‰ ?•ì¸
		
		// ê¸°ì¡´?? ?œí‚¨ ë©”ë‰´?¸ì? ?•ì¸
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
		dao.ordersUpdate(map); // ì£¼ë¬¸?œê°„ ê°±ì‹ 

		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storePlus(map); // ?¬ê³  ì¦ê?
		dao.shippingHistoryDelete(map);
		
		return dao.ordersDetailsMinus(ordersDetailDTO); // ì£¼ë¬¸?´ì—­ ê°ì†Œ?œí‚¤ê¸?
	}

	@Override
	public ArrayList<Integer> tableInfo() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableInfo(); // ?Œì´ë¸? ?•ë³´ ì¡°íšŒ
	}

	@Override
	public ArrayList<HashMap<String, Object>> tableControl() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableControl(); // ?Œì´ë¸? ?¬ìš© ì¡°íšŒ
	}

	@Override
	public int tableControl(Map<String, String> table) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", table.get("oldTable"));
		dao.ordersDelete(map); // ?´ë™?? ?Œì´ë¸? ì£¼ë¬¸ ?? œ
		map.put("od_Orders_No", table.get("oldTable"));
		ArrayList<HashMap<String, Object>> oldList =  dao.ordersDetailsSelect(map);
		// ?ë˜ ?Œì´ë¸? ì£¼ë¬¸?´ì—­ ?? œ?˜ê¸°
		dao.ordersDetailsDelete(map);
		map.remove("od_Orders_No");
		map.put("od_Orders_No", table.get("newTable"));
		ArrayList<HashMap<String, Object>> newList =  dao.ordersDetailsSelect(map);
		
		// ?ˆë¡œ?? ?Œì´ë¸? ì£¼ë¬¸ê³? ?ë˜ ?Œì´ë¸? ì£¼ë¬¸ ê°€?¸ì??? ë©”ë‰´ì½”ë“œê°€ ?¼ì¹˜?˜ë©´ ?? œ?˜ê³  ?¨ì?ê²ƒë§Œ ?£ê¸°
		for (int i = 0; i < oldList.size(); i++) {
			for (int j = 0; j < newList.size(); j++) {
				if(oldList.get(i).get("OD_MENU_CODE").equals(newList.get(j).get("OD_MENU_CODE"))) {
					// ?˜ëŸ‰ ?…ë°?´íŠ¸ ë°? ë¦¬ìŠ¤?¸ì—?? ?? œ
					OrdersDetailsDTO dto = new OrdersDetailsDTO();
					int qty = Integer.parseInt(String.valueOf(oldList.get(i).get("OD_QTY")));
					dto.setOd_Qty(qty);
					dto.setOd_Menu_Code((String)oldList.get(i).get("OD_MENU_CODE"));
					dto.setOd_Orders_No(table.get("newTable"));
					
					dao.ordersDetailsUpdate(dto);
					oldList.remove(i);
				}
			}
		}
		
		// ?ˆë¡œ?? ë©”ë‰´ ì¶”ê?
		for (int i = 0; i < oldList.size(); i++) {
			OrdersDetailsDTO dto = new OrdersDetailsDTO();
			int qty = Integer.parseInt(String.valueOf(oldList.get(i).get("OD_QTY")));
			dto.setOd_Qty(qty);
			dto.setOd_Menu_Code((String)oldList.get(i).get("OD_MENU_CODE"));
			dto.setOd_Orders_No(table.get("newTable"));
			
			dao.ordersDetailsInsert(dto);
		}
		
		return 0;
	}
	
	private static final String HOST = "https://kapi.kakao.com";
    private KakaoPayReadyDTO kakaoPayReadyDTO;
    private KakaoPayApprovalDTO kakaoPayApprovalDTO;
    private PaymentDTO paymentDTO;
    
	@Override
	public String kakaoPayReady(String orders_No, PaymentDTO paymentDTO) {
		this.paymentDTO = paymentDTO;
		
		dao = sqlSession.getMapper(JumunDAO.class);
		dao.salesInsert(); // ?ë§¤?´ì—­ë²ˆí˜¸ ?ì„±
		int sales_No = dao.salesSelectMax();
		
		int payment_Card = paymentDTO.getPayment_Card();
		int payment_Cash = paymentDTO.getPayment_Cash();
		int payment_Point = paymentDTO.getPayment_Point();
		
		// ì¹´ë“œê²°ì œ ?¬ë?
		if(payment_Card > 0) {
			RestTemplate restTemplate = new RestTemplate();
			
	        // ?œë²„ë¡? ?”ì²­?? Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // ?œë²„ë¡? ?”ì²­?? Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        
	        params.add("cid", "TC0ONETIME"); // ?ŒìŠ¤?¸ìš© ì½”ë“œë²ˆí˜¸
	        params.add("partner_order_id", Integer.toString(sales_No)); // ?ë§¤ë²ˆí˜¸
	        params.add("partner_user_id", "UntitledBistro"); // ë§¤ì¥ ?´ë¦„
	        params.add("item_name", "UntitledBistro"); // ë¬¼í’ˆ ?´ë¦„(ë§¤ì¥ ?´ë¦„)
	        params.add("quantity", "1"); // ê°œìˆ˜
	        params.add("total_amount", Integer.toString(payment_Card)); // ì¹´ë“œ ê²°ì œ ê¸ˆì•¡
	        params.add("tax_free_amount", "0"); // ë¹„ê³¼??
	        params.add("approval_url", "http://localhost:8095/UntitledBistro/jumun/kakaoPaySuccess.do?payment_Cash="+payment_Cash + "&payment_Card=" + payment_Card + "&orders_No=" + orders_No + "&payment_Point=" + payment_Point);
	        params.add("cancel_url", "http://localhost:8095/UntitledBistro/jumun/kakaoPayCancel.do");
	        params.add("fail_url", "http://localhost:8095/UntitledBistro/jumun/kakaoPaySuccessFail.do");
	 
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	            kakaoPayReadyDTO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyDTO.class);
	            
	            return kakaoPayReadyDTO.getNext_redirect_pc_url();
	 
	        } catch (RestClientException e) {
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            e.printStackTrace();
	        }
		} else if(payment_Card == 0) {
			ordersToSales(orders_No, paymentDTO);
			return "paySuccess.do?payment_Cash=" + payment_Cash + "&sales_No=" + sales_No + "&payment_Point=" + payment_Point;
		}
        return "kakaoPaySuccessFail.do";
	}
	
	@Override
	public KakaoPayApprovalDTO kakaoPayInfo(String pg_token, String orders_No) {
		
		ordersToSales(orders_No, paymentDTO); // ì£¼ë¬¸ ?? œ ?? ê²°ì œ ?…ë ¥
		
        RestTemplate restTemplate = new RestTemplate();
 
        // ?œë²„ë¡? ?”ì²­?? Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // ?œë²„ë¡? ?”ì²­?? Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("partner_order_id", Integer.toString(dao.salesSelectMax()));
        params.add("partner_user_id", "UntitledBistro");
        params.add("pg_token", pg_token);
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
        	kakaoPayApprovalDTO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalDTO.class);
          
            return kakaoPayApprovalDTO;
        
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }
	
	@Override
	public void ordersToSales(String orders_No, PaymentDTO paymentDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		ArrayList<SalesDetailsDTO> sdList = dao.salesInputSelect(map); // ì£¼ë¬¸?´ì—­ ê°€?¸ì˜¤ê¸?
		
		int tableNum = dao.salesTableSelect(map);
		
		for(int i = 0; i < sdList.size(); i++) {
			dao.salesDetailsInsert(sdList.get(i)); // ?ë§¤?´ì—­ ?…ë ¥
		}
		
		paymentDTO.setPayment_Table(Integer.toString(tableNum)); // ?Œì´ë¸”ë²ˆ?? ?¤ì •
		dao.paymentInsert(paymentDTO); // ê²°ì œ?´ì—­ ?…ë ¥
		
		map.put("od_Orders_No", orders_No);
		dao.ordersDelete(map); // ì£¼ë¬¸ ?? œ
		dao.ordersDetailsDelete(map); // ì£¼ë¬¸?´ì—­ ?? œ

		int payment_Card = paymentDTO.getPayment_Card();
		int payment_Cash = paymentDTO.getPayment_Cash();
		int payment_Point = paymentDTO.getPayment_Point();
		
		String member_Id = paymentDTO.getPayment_Member_Id().trim();
		int sumPrice = payment_Card + payment_Cash + payment_Point;
		
		// ?¬ì¸?? ê´€??
		String grade = "";
		if(!member_Id.equals("")) {
			map.put("member_Id", member_Id);
			grade = dao.memberGradeSelectById(map);
		
			// ?±ê¸‰?•ì¸?˜ê³  ?¬ì¸?¸ë¹„?? ?¤ë¥´ê²?
			int sumPoint = (int) (sumPrice * 0.01);
			if(grade.equals("silver")) {
				sumPoint = (int) (sumPrice * 0.05);
			} else if(grade.equals("gold")) {
				sumPoint = (int) (sumPrice * 0.1);
			}
			
			map.put("upPoint", Integer.toString(sumPoint));
			map.put("upPay", Integer.toString(sumPrice));
			dao.memberPointUpdateById(map); // ê²°ì œ?? ê¸ˆì•¡ ?¬ì¸??, ì´? ê²°ì œê¸ˆì•¡ ì¦ê?
			if(payment_Point != 0) {
				map.put("downPoint", Integer.toString(payment_Point));  // ?¬ìš©?? ?¬ì¸?? ê°ì†Œ
				dao.memberPointDowndateById(map);
			}
			
			// ?„ì  ì´ê²°?? ê¸ˆì•¡ ?•ì¸ 
			int price = dao.memberPaySelectById(map);
			if(price > 500000) {
				map.put("member_Grade", "silver");
				dao.memberGradeUpdateById(map);
			} else if(price > 2000000) {
				map.put("member_Grade", "gold");
				dao.memberGradeUpdateById(map);
			}
		}
		
		// ì£¼ë¬¸?´ì—­
		dao.shippingHistoryUpdate(map);
	}
	
	@Override
	public int payFail() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.payFail(); // ê²°ì œ ì·¨ì†Œ ë°? ?¤íŒ¨ ?? ê²°ì œë²ˆí˜¸ ?? œ
	}
	
	@Override
	public Date paymentTime(String sales_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("payment_Sales_No", sales_No);
		
		return dao.paymentDateSelect(map); // ê²°ì œ?œê°„ ì¡°íšŒ
	}
	
	@Override
	public int memberPointSearchById(String member_Id) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("member_Id", member_Id);
		
		return dao.memberPointSelectById(map); // ?„ì´?”ë¡œ ?¬ì¸?? ì¡°íšŒ
	}
	
	@Override
    public int orderPDF(String orders_No, HttpServletRequest request) {
		
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map);
		
		map.put("od_Orders_No", orders_No);
		ArrayList<HashMap<String, Object>> list = dao.ordersDetailsSelect(map);
		
        int result = 0; // ì´ˆê¸°ê°’ì´ null?? ?¤ì–´ê°€ë©? ?¤ë¥˜ê°€ ë°œìƒ? ìˆ˜ ?ˆê¸° ?Œë¬¸?? ê³µë°±?? ì§€??
 
        try {
            Document document = new Document(); // pdfë¬¸ì„œë¥? ì²˜ë¦¬?˜ëŠ” ê°ì²´
            String path = request.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/ordersPDF.pdf";
            
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path));
            // pdf?Œì¼?? ?€?¥ê²½ë¡œë? orderPDF.pdfë¡? ?œë‹¤?? ??
 
            document.open(); // ?¹í˜?´ì??? ?‘ê·¼?˜ëŠ” ê°ì²´ë¥? ?°ë‹¤
 
            BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            // pdfê°€ ê¸°ë³¸?ìœ¼ë¡? ?œê?ì²˜ë¦¬ê°€ ?ˆë˜ê¸? ?Œë¬¸?? ?œê??°íŠ¸ ì²˜ë¦¬ë¥? ?°ë¡œ ?´ì£¼?´ì•¼ ?œë‹¤.
            // createFontë©”ì†Œ?œì— ?¬ìš©?? ?°íŠ¸?? ê²½ë¡œ (malgun.ttf)?Œì¼?? ê²½ë¡œë¥? ì§€?•í•´ì¤€??.
            // ë§Œì•½?? ?? ê²½ë¡œ?? ?†ì„ ê²½ìš°?? java?Œì¼ë¡? ë§Œë“¤?´ì„œ ì§‘ì–´?£ì–´?? ?œë‹¤.
 
            Font font = new Font(baseFont, 12); // ?°íŠ¸?? ?¬ì´ì¦ˆë? 12?½ì?ë¡? ?œë‹¤.
            Font font2 = new Font(baseFont, 8); // ?°íŠ¸?? ?¬ì´ì¦ˆë? 12?½ì?ë¡? ?œë‹¤.
 
            PdfPTable table = new PdfPTable(4); // 4ê°œì˜ ?€?? ê°€ì§? ?Œì´ë¸? ê°ì²´ë¥? ?ì„± (pdf?Œì¼?? ?˜í??? ?Œì´ë¸?)
            Chunk chunk = new Chunk(ordersDTO.getOrders_TableSave_Code()+ "ë²? ?Œì´ë¸? ì£¼ë¬¸??", font); // ?€?´í? ê°ì²´ë¥? ?ì„± (?€?´í??? ?´ë¦„?? ?¥ë°”êµ¬ë‹ˆë¡? ?˜ê³  ?„ì— ?ˆëŠ” fontë¥? ?¬ìš©)
            Paragraph ph = new Paragraph(chunk);
            ph.setAlignment(Element.ALIGN_CENTER);
            document.add(ph); // ë¬¸ë‹¨?? ë§Œë“¤?´ì„œ ê°€?´ë° ?•ë ¬ (?€?´í??? ?´ë¦„?? ê°€?´ë° ?•ë ¬?œë‹¤?? ??)
            
            document.add(Chunk.NEWLINE); // ì¤„ë°”ê¿? (?œëƒ?˜ë©´ ?€?´í??ì„œ ?ì¤„?? ?´ë¦°?„ì— ?€(?Œì´ë¸?)?? ?˜ì˜¤ê¸? ?Œë¬¸)
            document.add(Chunk.NEWLINE);

            SimpleDateFormat  format = new SimpleDateFormat("yyyy?? MM?? dd?? hh?? mmë¶? ssì´?");
            String timeFirst = "ì²˜ìŒì£¼ë¬¸ ?œê°„ : " + format.format(ordersDTO.getOrders_First());
            Chunk chunkFirst = new Chunk(timeFirst, font2);
            Paragraph phFirst = new Paragraph(chunkFirst);
            phFirst.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFirst);
            
            String timeFinal = "ë§ˆì?ë§? ì£¼ë¬¸ ?œê°„ : " + format.format(ordersDTO.getOrders_Final());
            Chunk chunkFinal = new Chunk(timeFinal, font2);
            Paragraph phFinal = new Paragraph(chunkFinal);
            phFinal.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFinal);

            document.add(Chunk.NEWLINE);
            PdfPCell cell1 = new PdfPCell(new Phrase("ë²ˆí˜¸", font)); // ?€?? ?´ë¦„ê³? ?°íŠ¸ë¥? ì§€?•í•´?? ?€?? ?ì„±?œë‹¤.
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // ?€?? ?•ë ¬ë°©ì‹?? ì§€?•í•œ??. (ê°€?´ë°?•ë ¬)
            
            PdfPCell cell2 = new PdfPCell(new Phrase("?í’ˆëª?", font));
            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell3 = new PdfPCell(new Phrase("?¨ê?", font));
            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell4 = new PdfPCell(new Phrase("?˜ëŸ‰", font));
            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            table.addCell(cell1); // ê·¸ë¦¬ê³? ?Œì´ë¸”ì— ?„ì—?? ?ì„±?œí‚¨ ?€?? ?£ëŠ”??.
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
    		
            // ?œë¹„?¤ë¡œë¶€?? idê°’ì„ ë§¤ê°œê°’ìœ¼ë¡? ì£¼ì–´?? ?¥ë°”êµ¬ë‹ˆëª©ë¡?? ê°€?¸ì˜¨??.
            for (int i = 0; i < list.size(); i++) {
            	HashMap<String, Object> map = list.get(i); // ?ˆì½”?œì— ê°’ë“¤?? êº¼ë‚´?? dto?? ?€??
                PdfPCell od_No = new PdfPCell(new Phrase("" + map.get("OD_NO"), font)); 
                od_No.setHorizontalAlignment(Element.ALIGN_CENTER);
                // ë°˜ë³µë¬¸ì„ ?¬ìš©?´ì„œ ?í’ˆ?•ë³´ë¥? ?˜ë‚˜?? ì¶œë ¥?´ì„œ ?€?? ?£ê³  ?Œì´ë¸”ì— ?€?¥í•œ??.
 
                PdfPCell menu_Name = new PdfPCell(new Phrase("" + map.get("MENU_NAME"), font));
                menu_Name.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?€?…ì? ?«ì??(int?? ê°™ì??€??)?¼ë¡œ ?˜ë©´ ?ëŸ¬ê°€ ë°œìƒ?˜ê¸° ?Œë¬¸?? dto?ì— ê³µë°±("")ì£¼ì–´?? String?€?…ìœ¼ë¡? ë³€ê²½í•œ??.
 
                PdfPCell menu_Price = new PdfPCell(new Phrase("" + map.get("MENU_PRICE"), font));
                menu_Price.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?€?…ì? ?«ì??(int?? ê°™ì??€??)?¼ë¡œ ?˜ë©´ ?ëŸ¬ê°€ ë°œìƒ?˜ê¸° ?Œë¬¸?? dto?ì— ê³µë°±("")ì£¼ì–´?? String?€?…ìœ¼ë¡? ë³€ê²½í•œ??.
 
                PdfPCell od_Qty = new PdfPCell(new Phrase("" + map.get("OD_QTY"), font));
                od_Qty.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?€?…ì? ?«ì??(int?? ê°™ì??€??)?¼ë¡œ ?˜ë©´ ?ëŸ¬ê°€ ë°œìƒ?˜ê¸° ?Œë¬¸?? dto?ì— ê³µë°±("")ì£¼ì–´?? String?€?…ìœ¼ë¡? ë³€ê²½í•œ??.
 
                table.addCell(od_No); // ?€?? ?°ì´?°ë? ?Œì´ë¸”ì— ?€?¥í•œ??. (?¥ë°”êµ¬ë‹ˆ?ˆì— ?¤ì–´?ˆëŠ” ê°?ˆ˜ë§Œí¼ ?Œì´ë¸”ì´ ë§Œë“¤?´ì§„??)
                table.addCell(menu_Name);
                table.addCell(menu_Price);
                table.addCell(od_Qty);
            }
            
            document.add(table); // ?¹ì ‘ê·? ê°ì²´?? tableë¥? ?€?¥í•œ??.
            document.close(); // ?€?¥ì´ ?ë‚¬?¼ë©´ documentê°ì²´ë¥? ?«ëŠ”??.
            result = 1;
 
        } catch (Exception e) {
            e.printStackTrace();
            result = 0;
        }
        return result;
    }
	
	@Override
	public int ordersCheck(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		
		return dao.ordersCheck(map); // ì£¼ë¬¸?´ì—­ ê°œìˆ˜
	}
	
	@Override
	public void ordersDeleteCheck(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		// ì£¼ë¬¸?´ì—­ ? ë¬´
		if(dao.ordersCheck(map) == 0) {
			dao.ordersDelete(map); // ì£¼ë¬¸ë²ˆí˜¸ ?? œ
		}
	}
	
	@Override
	public ArrayList<PaymentDTO> paymentSearch(String data, String searchType, String predatepicker, String postdatepicker) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		// mapper ?ëŸ¬ ë°©ì?
		if(data == null) data = "";
		if(searchType == null) searchType = "";
		if(predatepicker == null) predatepicker = "";
		if(postdatepicker == null) postdatepicker = "";

		if(postdatepicker != "") {
			postdatepicker = Integer.toString(Integer.parseInt(postdatepicker) + 1); // ~ê¹Œì? ? ì§œ?? ë³´ì—¬ì£¼ê¸°?„í•´ 1?? ?”í•˜ê¸?
		}
		
		map.put("data", data);
		map.put("searchType", searchType);
		map.put("predatepicker", predatepicker);
		map.put("postdatepicker", postdatepicker);
		
		return dao.paymentSelect(map); // ê²°ì œ?´ì—­ ì¡°íšŒ
	}
	
	@Override
	public ArrayList<SalesDetailsDTO> salesDetailsSearch(String sales_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("sales_No", sales_No);
		
		return dao.salesDetailesSelect(map); // ê²°ì œ?´ì—­ ?¸ë? ì¡°íšŒ
	}
	
	@Override
	public int paymentCancle(String payment_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("payment_No", payment_No);
		
		return dao.paymentCancle(map); // ?˜ë¶ˆ ì²˜ë¦¬
	}
	
	@Override // ?¬ê³ ê°€ ë¶€ì¡±í•œ ë©”ë‰´ ?´ë¦„
	public ArrayList<String> storeCountCheck(){
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.storeZeroSelect();
	}
	
	@Override // ë¬¼í’ˆ ì¡°íšŒ
	public ArrayList<HashMap<String, Object>> productSearch() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.productSelect();
	}
	
}
