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

      return dao.menuTypeSelect(map); // 메뉴구분 조회
   }
   
   @Override
   public int menuTypeAdd(MenuTypeDTO menuTypeDTO) {
      dao = sqlSession.getMapper(JumunDAO.class);
      
      return dao.menuTypeInsert(menuTypeDTO); // 메뉴구분 추�?
   }
   
   @Override
   public int menuTypeRemove(String mt_Code) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      
      map.put("mt_Code", mt_Code);
      map.put("menu_Mt_Code", mt_Code);
      
      dao.ingreDelete(map); // ?�함?�는 ?�료 ??��
      dao.menuDelete(map); // ?�함?�는 메뉴 ??��
      dao.menuTypeDelete(map); // ?�함?�는 메뉴구분 ??��
      
      return 1;
   }
   
   @Override 
   public int menuTypeModi(MenuTypeDTO menuTypeDTO) {
      dao = sqlSession.getMapper(JumunDAO.class);

      return dao.menuTypeUpdate(menuTypeDTO); // 메뉴구분 ?�름 ?�정
   }
   
   @Override
   public ArrayList<MenuDTO> menuSearch(String menu_Mt_Code, String menu_State) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("menu_Mt_Code", menu_Mt_Code);
      map.put("menu_State", menu_State);
      
      return dao.menuSelect(map); // 메뉴 조회
   }

   @Override
   public MenuDTO menuSearchByMenuCode(String menu_Code) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("menu_Code", menu_Code);
      ArrayList<MenuDTO> menuDTO = dao.menuSelect(map); // 메뉴 조회
      map.put("ingredient_Menu_Code", menu_Code);
      menuDTO.get(0).setIngredientDTO(dao.ingreSelect(map)); // 메뉴?? ?�어가?? ?�료 조회
      
      return menuDTO.get(0);
   }
   
   @Override
   public int menuAdd(MenuDTO menuDTO) {
      dao = sqlSession.getMapper(JumunDAO.class);
      dao.menuInsert(menuDTO); // 메뉴 추�?
      if(menuDTO.getIngredientDTO() != null) {
         for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
            if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
               map = new HashMap<String, String>();
               map.put("menu_Name", menuDTO.getMenu_Name());
               menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map)); // 메뉴?�름?�로 메뉴코드 찾기
               dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // 메뉴?? ?�어가?? ?�료 ?�력
            }
         }
      }
      return 1;
   }

   @Override
   public String imgUpload(MultipartHttpServletRequest mRequest) {
      String saveFileName = null;
      
      try {
         // ?�진 ?�?�위�?
         String uploadPath = mRequest.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/";
         File dir = new File(uploadPath);
         // ?�렉?�리 ?�성
         if (!dir.isDirectory()) {
            dir.mkdirs();
         }
         Iterator<String> iter = mRequest.getFileNames();
         while(iter.hasNext()) {
            // ?�일?�름
            String uploadFileName = iter.next();
            
            MultipartFile mFile = mRequest.getFile(uploadFileName);
            String originalFileName = mFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID(); // ?�진 ?�름 중복 방�?
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
         
         dao.ingreDelete(map); // 메뉴?? ?�하?? ?�료 ??��
         dao.menuDelete(map); // 메뉴 ??��
         cnt++; // �? �? 메뉴 ??��?�는지 ?�인 카운??
      }
      return cnt;
   }
   
   @Override
   public int menuModi(MenuDTO menuDTO) {
      dao = sqlSession.getMapper(JumunDAO.class);
      if(menuDTO.getMenu_Image() == null) menuDTO.setMenu_Image("noImage.jpg"); // 첨�??? ?�일 ?�을 ??
      dao.menuUpdate(menuDTO); // 메뉴 ?�정
      
      map = new HashMap<String, String>();
      map.put("ingredient_Menu_Code", menuDTO.getMenu_Code());
      dao.ingreDelete(map); // 기존 ?�료 ??��
      if(menuDTO.getIngredientDTO() != null) {
         for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
            if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
               map = new HashMap<String, String>();
               map.put("menu_Name", menuDTO.getMenu_Name());
               menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map)); // 메뉴?�름?�로 메뉴코드 찾기
               dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // ?�로?? 메뉴 ?�료 ?�력
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
      
      return dao.ingreSelect(map); // ?�료 조회
   }
   
   @Override
   public ArrayList<TableSaveDTO> tableSearch() {
      dao = sqlSession.getMapper(JumunDAO.class);
      
      return dao.tableSelect(); // ?�이�? 조회
   }

	@Override
	public int tableAdd(List<TableSaveDTO> list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		dao.tableDelete(); // 기존 ?�이�? ??��
		int cnt = 0;
		for(int i = 0; i < list.size(); i++) {
			dao.tableInsert(list.get(i)); // ?�로?? ?�이�? ?�력
			cnt++; // ?�이�? 개수 ?�인 카운??
		}
		
		return cnt;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> orderListAll() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersSelect(); // ?�체 주문?�역 조회(메인 ?�스)
	}
	
	@Override
	public OrdersDTO ordersList(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map); // 주문 조회
		
		if(ordersDTO != null) {
			map.put("od_Orders_No", orders_No);
			ordersDTO.setOrdersListDTO(dao.ordersDetailsSelect(map)); // 주문?�역 조회
		}
		
		return ordersDTO;
	}
	
	@Override
	public int odAllPrice(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", orders_No);
		
		return dao.odAllPrice(map); // 주문 ?�체 금액 조회
	}
	
	@Override
	public int ordersRemove(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storeAllPlus(map); // ?�고 추�?
		dao.shippingHistoryOneDelete(map); // 출고?�역 ??��
		
		return dao.ordersDetailsDelete(map); // 주문?�역 메뉴 1�? ??��
	}
	
	@Override
	public int ordersRemoveAll(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.storeAllPlus(map); // ?�고 추�?
		dao.shippingHistoryAllDelete(map); // 출고?�역 ??��
		
		return dao.ordersDetailsDelete(map); // 주문?�역 ?�체 ??��
	}
	
	@Override
	public int ordersPlus(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.ordersUpdate(map);
		
		// 미사?? ?�이블이�? ?�성
		if(dao.ordersSelectByNo(map) == null) {
			OrdersDTO ordersDTO = new OrdersDTO();
			ordersDTO.setOrders_No(ordersDetailDTO.getOd_Orders_No());
			ordersDTO.setOrders_TableSave_Code(ordersDetailDTO.getOd_Orders_No());
			dao.ordersInsert(ordersDTO);
		}
		
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		// 기존?? ?�킨 메뉴?��? ?�인
		if(dao.ordersDetailsSelectCount(ordersDetailDTO) == 0) {
			dao.ordersDetailsInsert(ordersDetailDTO);			
		} else {
			dao.ordersDetailsPlus(ordersDetailDTO);
		}
		dao.storeMinus(map); // ?�고 감소
		dao.shippingHistoryInsert(map); // 출고?�역 기록
		dao.storeCheck(map); // ?�고?�량 ?�인
		
		return 1;
	}
	
	@Override
	public int ordersMinus(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.ordersUpdate(map); // 주문?�간 갱신

      map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
      dao.storePlus(map); // ?�고 증�?
      dao.shippingHistoryDelete(map);
      
      return dao.ordersDetailsMinus(ordersDetailDTO); // 주문?�역 감소?�키�?
   }

   @Override
   public ArrayList<Integer> tableInfo() {
      dao = sqlSession.getMapper(JumunDAO.class);
      return dao.tableInfo(); // ?�이�? ?�보 조회
   }

   @Override
   public ArrayList<HashMap<String, Object>> tableControl() {
      dao = sqlSession.getMapper(JumunDAO.class);
      return dao.tableControl(); // ?�이�? ?�용 조회
   }

   @Override
   public int tableControl(Map<String, String> table) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("orders_No", table.get("oldTable"));
      dao.ordersDelete(map); // ?�동?? ?�이�? 주문 ??��
      map.put("od_Orders_No", table.get("oldTable"));
      ArrayList<HashMap<String, Object>> oldList =  dao.ordersDetailsSelect(map);
      // ?�래 ?�이�? 주문?�역 ??��?�기
      dao.ordersDetailsDelete(map);
      map.remove("od_Orders_No");
      map.put("od_Orders_No", table.get("newTable"));
      ArrayList<HashMap<String, Object>> newList =  dao.ordersDetailsSelect(map);
      
      // ?�로?? ?�이�? 주문�? ?�래 ?�이�? 주문 가?��??? 메뉴코드가 ?�치?�면 ??��?�고 ?��?것만 ?�기
      for (int i = 0; i < oldList.size(); i++) {
         for (int j = 0; j < newList.size(); j++) {
            if(oldList.get(i).get("OD_MENU_CODE").equals(newList.get(j).get("OD_MENU_CODE"))) {
               // ?�량 ?�데?�트 �? 리스?�에?? ??��
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
      
      // ?�로?? 메뉴 추�?
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
      dao.salesInsert(); // ?�매?�역번호 ?�성
      int sales_No = dao.salesSelectMax();
      
      int payment_Card = paymentDTO.getPayment_Card();
      int payment_Cash = paymentDTO.getPayment_Cash();
      int payment_Point = paymentDTO.getPayment_Point();
      
      // 카드결제 ?��?
      if(payment_Card > 0) {
         RestTemplate restTemplate = new RestTemplate();
         
           // ?�버�? ?�청?? Header
           HttpHeaders headers = new HttpHeaders();
           headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
           headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
           headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
           
           // ?�버�? ?�청?? Body
           MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
           
           params.add("cid", "TC0ONETIME"); // ?�스?�용 코드번호
           params.add("partner_order_id", Integer.toString(sales_No)); // ?�매번호
           params.add("partner_user_id", "UntitledBistro"); // 매장 ?�름
           params.add("item_name", "UntitledBistro"); // 물품 ?�름(매장 ?�름)
           params.add("quantity", "1"); // 개수
           params.add("total_amount", Integer.toString(payment_Card)); // 카드 결제 금액
           params.add("tax_free_amount", "0"); // 비과??
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
      
      ordersToSales(orders_No, paymentDTO); // 주문 ??�� ?? 결제 ?�력
      
        RestTemplate restTemplate = new RestTemplate();
 
        // ?�버�? ?�청?? Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // ?�버�? ?�청?? Body
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
      ArrayList<SalesDetailsDTO> sdList = dao.salesInputSelect(map); // 주문?�역 가?�오�?
      
      int tableNum = dao.salesTableSelect(map);
      
      for(int i = 0; i < sdList.size(); i++) {
         dao.salesDetailsInsert(sdList.get(i)); // ?�매?�역 ?�력
      }
      
      paymentDTO.setPayment_Table(Integer.toString(tableNum)); // ?�이블번?? ?�정
      dao.paymentInsert(paymentDTO); // 결제?�역 ?�력
      
      map.put("od_Orders_No", orders_No);
      dao.ordersDetailsDelete(map); // 주문?�역 ??��
      dao.ordersDelete(map); // 주문 ??��

      int payment_Card = paymentDTO.getPayment_Card();
      int payment_Cash = paymentDTO.getPayment_Cash();
      int payment_Point = paymentDTO.getPayment_Point();
      
      String member_Id = paymentDTO.getPayment_Member_Id().trim();
      int sumPrice = payment_Card + payment_Cash + payment_Point;
      
      // ?�인?? 관??
      String grade = "";
      if(!member_Id.equals("")) {
         map.put("member_Id", member_Id);
         grade = dao.memberGradeSelectById(map);
      
         // ?�급?�인?�고 ?�인?�비?? ?�르�?
         int sumPoint = (int) (sumPrice * 0.01);
         if(grade.equals("silver")) {
            sumPoint = (int) (sumPrice * 0.05);
         } else if(grade.equals("gold")) {
            sumPoint = (int) (sumPrice * 0.1);
         }
         
         map.put("upPoint", Integer.toString(sumPoint));
         map.put("upPay", Integer.toString(sumPrice));
         dao.memberPointUpdateById(map); // 결제?? 금액 ?�인??, �? 결제금액 증�?
         if(payment_Point != 0) {
            map.put("downPoint", Integer.toString(payment_Point));  // ?�용?? ?�인?? 감소
            dao.memberPointDowndateById(map);
         }
         
         // ?�적 총결?? 금액 ?�인 
         int price = dao.memberPaySelectById(map);
         if(price > 500000) {
            map.put("member_Grade", "silver");
            dao.memberGradeUpdateById(map);
         } else if(price > 2000000) {
            map.put("member_Grade", "gold");
            dao.memberGradeUpdateById(map);
         }
      }
      
      // 주문?�역
      dao.shippingHistoryUpdate(map);
   }
   
   @Override
   public int payFail() {
      dao = sqlSession.getMapper(JumunDAO.class);
      
      return dao.payFail(); // 결제 취소 �? ?�패 ?? 결제번호 ??��
   }
   
   @Override
   public Date paymentTime(String sales_No) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("payment_Sales_No", sales_No);
      
      return dao.paymentDateSelect(map); // 결제?�간 조회
   }
   
   @Override
   public int memberPointSearchById(String member_Id) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("member_Id", member_Id);
      
      return dao.memberPointSelectById(map); // ?�이?�로 ?�인?? 조회
   }
   
   @Override
    public int orderPDF(String orders_No, HttpServletRequest request) {
      
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("orders_No", orders_No);
      OrdersDTO ordersDTO = dao.ordersSelectByNo(map);
      
      map.put("od_Orders_No", orders_No);
      ArrayList<HashMap<String, Object>> list = dao.ordersDetailsSelect(map);
      
        int result = 0; // 초기값이 null?? ?�어가�? ?�류가 발생?�수 ?�기 ?�문?? 공백?? 지??
 
        try {
            Document document = new Document(); // pdf문서�? 처리?�는 객체
            String path = request.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/ordersPDF.pdf";
            
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path));
            // pdf?�일?? ?�?�경로�? orderPDF.pdf�? ?�다?? ??
 
            document.open(); // ?�페?��??? ?�근?�는 객체�? ?�다
 
            BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            // pdf가 기본?�으�? ?��?처리가 ?�되�? ?�문?? ?��??�트 처리�? ?�로 ?�주?�야 ?�다.
            // createFont메소?�에 ?�용?? ?�트?? 경로 (malgun.ttf)?�일?? 경로�? 지?�해준??.
            // 만약?? ?? 경로?? ?�을 경우?? java?�일�? 만들?�서 집어?�어?? ?�다.
 
            Font font = new Font(baseFont, 12); // ?�트?? ?�이즈�? 12?��?�? ?�다.
            Font font2 = new Font(baseFont, 8); // ?�트?? ?�이즈�? 12?��?�? ?�다.
 
            PdfPTable table = new PdfPTable(4); // 4개의 ?�?? 가�? ?�이�? 객체�? ?�성 (pdf?�일?? ?��??? ?�이�?)
            Chunk chunk = new Chunk(ordersDTO.getOrders_TableSave_Code()+ "�? ?�이�? 주문??", font); // ?�?��? 객체�? ?�성 (?�?��??? ?�름?? ?�바구니�? ?�고 ?�에 ?�는 font�? ?�용)
            Paragraph ph = new Paragraph(chunk);
            ph.setAlignment(Element.ALIGN_CENTER);
            document.add(ph); // 문단?? 만들?�서 가?�데 ?�렬 (?�?��??? ?�름?? 가?�데 ?�렬?�다?? ??)
            
            document.add(Chunk.NEWLINE); // 줄바�? (?�냐?�면 ?�?��??�서 ?�줄?? ?�린?�에 ?�(?�이�?)?? ?�오�? ?�문)
            document.add(Chunk.NEWLINE);

            SimpleDateFormat  format = new SimpleDateFormat("yyyy?? MM?? dd?? hh?? mm�? ss�?");
            String timeFirst = "처음주문 ?�간 : " + format.format(ordersDTO.getOrders_First());
            Chunk chunkFirst = new Chunk(timeFirst, font2);
            Paragraph phFirst = new Paragraph(chunkFirst);
            phFirst.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFirst);
            
            String timeFinal = "마�?�? 주문 ?�간 : " + format.format(ordersDTO.getOrders_Final());
            Chunk chunkFinal = new Chunk(timeFinal, font2);
            Paragraph phFinal = new Paragraph(chunkFinal);
            phFinal.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFinal);

            document.add(Chunk.NEWLINE);
            PdfPCell cell1 = new PdfPCell(new Phrase("번호", font)); // ?�?? ?�름�? ?�트�? 지?�해?? ?�?? ?�성?�다.
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // ?�?? ?�렬방식?? 지?�한??. (가?�데?�렬)
            
            PdfPCell cell2 = new PdfPCell(new Phrase("?�품�?", font));
            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell3 = new PdfPCell(new Phrase("?��?", font));
            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell4 = new PdfPCell(new Phrase("?�량", font));
            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            table.addCell(cell1); // 그리�? ?�이블에 ?�에?? ?�성?�킨 ?�?? ?�는??.
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
          
            // ?�비?�로부?? id값을 매개값으�? 주어?? ?�바구니목록?? 가?�온??.
            for (int i = 0; i < list.size(); i++) {
               HashMap<String, Object> map = list.get(i); // ?�코?�에 값들?? 꺼내?? dto?? ?�??
                PdfPCell od_No = new PdfPCell(new Phrase("" + map.get("OD_NO"), font)); 
                od_No.setHorizontalAlignment(Element.ALIGN_CENTER);
                // 반복문을 ?�용?�서 ?�품?�보�? ?�나?? 출력?�서 ?�?? ?�고 ?�이블에 ?�?�한??.
 
                PdfPCell menu_Name = new PdfPCell(new Phrase("" + map.get("MENU_NAME"), font));
                menu_Name.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?�?��? ?�자??(int?? 같�??�??)?�로 ?�면 ?�러가 발생?�기 ?�문?? dto?�에 공백("")주어?? String?�?�으�? 변경한??.
 
                PdfPCell menu_Price = new PdfPCell(new Phrase("" + map.get("MENU_PRICE"), font));
                menu_Price.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?�?��? ?�자??(int?? 같�??�??)?�로 ?�면 ?�러가 발생?�기 ?�문?? dto?�에 공백("")주어?? String?�?�으�? 변경한??.
 
                PdfPCell od_Qty = new PdfPCell(new Phrase("" + map.get("OD_QTY"), font));
                od_Qty.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase?�?��? ?�자??(int?? 같�??�??)?�로 ?�면 ?�러가 발생?�기 ?�문?? dto?�에 공백("")주어?? String?�?�으�? 변경한??.
 
                table.addCell(od_No); // ?�?? ?�이?��? ?�이블에 ?�?�한??. (?�바구니?�에 ?�어?�는 �?��만큼 ?�이블이 만들?�진??)
                table.addCell(menu_Name);
                table.addCell(menu_Price);
                table.addCell(od_Qty);
            }
            
            document.add(table); // ?�접�? 객체?? table�? ?�?�한??.
            document.close(); // ?�?�이 ?�났?�면 document객체�? ?�는??.
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
      
      return dao.ordersCheck(map); // 주문?�역 개수
   }
   
   @Override
   public void ordersDeleteCheck(String orders_No) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("orders_No", orders_No);
      // 주문?�역 ?�무
      if(dao.ordersCheck(map) == 0) {
         dao.ordersDelete(map); // 주문번호 ??��
      }
   }
   
   @Override
   public ArrayList<PaymentDTO> paymentSearch(String data, String searchType, String predatepicker, String postdatepicker) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();

      if(postdatepicker != null) {
         postdatepicker = Integer.toString(Integer.parseInt(postdatepicker) + 1); // ~까�? ?�짜?? 보여주기?�해 1?? ?�하�?
      }
      
      map.put("data", data);
      map.put("searchType", searchType);
      map.put("predatepicker", predatepicker);
      map.put("postdatepicker", postdatepicker);
      
      return dao.paymentSelect(map); // 결제?�역 조회
   }
   
   @Override
   public ArrayList<SalesDetailsDTO> salesDetailsSearch(String sales_No) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("sales_No", sales_No);
      
      return dao.salesDetailesSelect(map); // 결제?�역 ?��? 조회
   }
   
   @Override
   public int paymentCancle(String payment_No) {
      dao = sqlSession.getMapper(JumunDAO.class);
      map = new HashMap<String, String>();
      map.put("payment_No", payment_No);
      
      return dao.paymentCancle(map); // ?�불 처리
   }
   
   @Override // ?�고가 부족한 메뉴 ?�름
   public ArrayList<String> storeCountCheck(){
      dao = sqlSession.getMapper(JumunDAO.class);
      
      return dao.storeZeroSelect();
   }
   
   @Override // 물품 조회
   public ArrayList<HashMap<String, Object>> productSearch() {
      dao = sqlSession.getMapper(JumunDAO.class);
      
      return dao.productSelect();
   }
   
}