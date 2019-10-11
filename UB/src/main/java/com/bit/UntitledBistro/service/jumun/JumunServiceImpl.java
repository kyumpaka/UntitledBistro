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
import com.bit.UntitledBistro.model.jumun.SalesDTO;
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
		
		return dao.menuTypeInsert(menuTypeDTO); // 메뉴구분 추가
	}
	
	@Override
	public int menuTypeRemove(String[] list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		int cnt = 0;
		map = new HashMap<String, String>();
		
		for(String mt_Code : list) {
			map.put("mt_Code", mt_Code);
			map.put("menu_Mt_Code", mt_Code);
			
			dao.ingreDelete(map); // 포함되는 재료 삭제
			dao.menuDelete(map); // 포함되는 메뉴 삭제
			dao.menuTypeDelete(map); // 포함되는 메뉴구분 삭제
			cnt++;
		}
		return cnt;
	}
	
	@Override 
	public int menuTypeModi(MenuTypeDTO menuTypeDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);

		return dao.menuTypeUpdate(menuTypeDTO); // 메뉴구분 이름 수정
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
		menuDTO.get(0).setIngredientDTO(dao.ingreSelect(map)); // 메뉴에 들어가는 재료 조회
		
		return menuDTO.get(0);
	}
	
	@Override
	public int menuAdd(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		dao.menuInsert(menuDTO); // 메뉴 추가
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map)); // 메뉴이름으로 메뉴코드 찾기
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // 메뉴에 들어가는 재료 입력
				}
			}
		}
		return 1;
	}

	@Override
	public String imgUpload(MultipartHttpServletRequest mRequest) {
		String saveFileName = null;
		
		try {
			// 사진 저장위치
			String uploadPath = mRequest.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/";
			File dir = new File(uploadPath);
			// 디렉토리 생성
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			Iterator<String> iter = mRequest.getFileNames();
			while(iter.hasNext()) {
				// 파일이름
				String uploadFileName = iter.next();
				
				MultipartFile mFile = mRequest.getFile(uploadFileName);
				String originalFileName = mFile.getOriginalFilename();
				UUID uuid = UUID.randomUUID(); // 사진 이름 중복 방지
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
			
			dao.ingreDelete(map); // 메뉴에 속하는 재료 삭제
			dao.menuDelete(map); // 메뉴 삭제
			cnt++; // 몇 개 메뉴 삭제했는지 확인 카운트
		}
		return cnt;
	}
	
	@Override
	public int menuModi(MenuDTO menuDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		if(menuDTO.getMenu_Image() == null) menuDTO.setMenu_Image("noImage.jpg"); // 첨부된 파일 없을 시
		dao.menuUpdate(menuDTO); // 메뉴 수정
		
		map = new HashMap<String, String>();
		map.put("ingredient_Menu_Code", menuDTO.getMenu_Code());
		dao.ingreDelete(map); // 기존 재료 삭제
		if(menuDTO.getIngredientDTO() != null) {
			for(int i = 0; i < menuDTO.getIngredientDTO().size(); i++) {
				if(menuDTO.getIngredientDTO().get(i).getIngredient_Product_Code() != null && menuDTO.getIngredientDTO().get(i).getIngredient_Qty() != 0) {
					map = new HashMap<String, String>();
					map.put("menu_Name", menuDTO.getMenu_Name());
					menuDTO.getIngredientDTO().get(i).setIngredient_Menu_Code(dao.menuSelectByMenuName(map));
					dao.ingreInsert(menuDTO.getIngredientDTO().get(i)); // 새로운 메뉴 재료 입력
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
		
		return dao.ingreSelect(map); // 재료 조회
	}
	
	@Override
	public ArrayList<TableSaveDTO> tableSearch() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.tableSelect(); // 테이블 조회
	}

	@Override
	public int tableAdd(List<TableSaveDTO> list) {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		dao.tableDelete(); // 기존 테이블 삭제
		int cnt = 0;
		for(int i = 0; i < list.size(); i++) {
			dao.tableInsert(list.get(i)); // 새로운 테이블 입력
			cnt++; // 테이블 개수 확인 카운트
		}
		
		return cnt;
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> orderListAll() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.ordersSelect(); // 전체 주문내역 조회(메인 포스)
	}
	
	@Override
	public OrdersDTO ordersList(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map); // 주문 조회
		
		if(ordersDTO != null) {
			map.put("od_Orders_No", orders_No);
			ordersDTO.setOrdersListDTO(dao.ordersDetailsSelect(map)); // 주문내역 조회
		}
		
		return ordersDTO;
	}
	
	@Override
	public int odAllPrice(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", orders_No);
		
		return dao.odAllPrice(map); // 주문 전체 금액 조회
	}
	
	@Override
	public int ordersRemove(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storeAllPlus(map); // 재고 추가
		dao.shippingHistoryOneDelete(map); // 출고내역 삭제
		
		return dao.ordersDetailsDelete(map); // 주문내역 메뉴 1개 삭제
	}
	
	@Override
	public int ordersRemoveAll(OrdersDetailsDTO ordersDetailDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("od_Orders_No", ordersDetailDTO.getOd_Orders_No());
		dao.storeAllPlus(map); // 재고 추가
		dao.shippingHistoryAllDelete(map); // 출고내역 삭제
		
		return dao.ordersDetailsDelete(map); // 주문내역 전체 삭제
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
		
		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storeMinus(map); // 재고 감소
		dao.shippingHistoryInsert(map); // 출고내역 기록
		dao.storeCheck(map); // 재고수량 확인
		
		// 기존에 시킨 메뉴인지 확인
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
		dao.ordersUpdate(map); // 주문시간 갱신

		map.put("od_Menu_Code", ordersDetailDTO.getOd_Menu_Code());
		dao.storePlus(map); // 재고 증가
		dao.shippingHistoryDelete(map);
		
		return dao.ordersDetailsMinus(ordersDetailDTO); // 주문내역 감소시키기
	}

	@Override
	public ArrayList<Integer> tableInfo() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableInfo(); // 테이블 정보 조회
	}

	@Override
	public ArrayList<HashMap<String, Object>> tableControl() {
		dao = sqlSession.getMapper(JumunDAO.class);
		return dao.tableControl(); // 테이블 사용 조회
	}

	@Override
	public int tableControl(Map<String, String> table) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", table.get("oldTable"));
		dao.ordersDelete(map); // 이동할 테이블 주문 삭제
		map.put("od_Orders_No", table.get("oldTable"));
		ArrayList<HashMap<String, Object>> oldList =  dao.ordersDetailsSelect(map);
		// 원래 테이블 주문내역 삭제하기
		dao.ordersDetailsDelete(map);
		map.remove("od_Orders_No");
		map.put("od_Orders_No", table.get("newTable"));
		ArrayList<HashMap<String, Object>> newList =  dao.ordersDetailsSelect(map);
		
		// 새로운 테이블 주문과 원래 테이블 주문 가져와서 메뉴코드가 일치하면 삭제하고 남은것만 넣기
		for (int i = 0; i < oldList.size(); i++) {
			for (int j = 0; j < newList.size(); j++) {
				if(oldList.get(i).get("OD_MENU_CODE").equals(newList.get(j).get("OD_MENU_CODE"))) {
					// 수량 업데이트 및 리스트에서 삭제
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
		
		// 새로운 메뉴 추가
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
		dao.salesInsert(); // 판매내역번호 생성
		int sales_No = dao.salesSelectMax();
		
		int payment_Card = paymentDTO.getPayment_Card();
		int payment_Cash = paymentDTO.getPayment_Cash();
		int payment_Point = paymentDTO.getPayment_Point();
		
		// 카드결제 여부
		if(payment_Card > 0) {
			RestTemplate restTemplate = new RestTemplate();
			
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	        
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        
	        params.add("cid", "TC0ONETIME"); // 테스트용 코드번호
	        params.add("partner_order_id", Integer.toString(sales_No)); // 판매번호
	        params.add("partner_user_id", "UntitledBistro"); // 매장 이름
	        params.add("item_name", "UntitledBistro"); // 물품 이름(매장 이름)
	        params.add("quantity", "1"); // 개수
	        params.add("total_amount", Integer.toString(payment_Card)); // 카드 결제 금액
	        params.add("tax_free_amount", "0"); // 비과세
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
		
		int sales_No = ordersToSales(orders_No, paymentDTO); // 주문 삭제 후 결제 입력
		
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f75c66eebd8bf507d001dbc7bf11d9f6");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyDTO.getTid());
        params.add("partner_order_id", Integer.toString(sales_No));
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
	public int ordersToSales(String orders_No, PaymentDTO paymentDTO) {
		dao = sqlSession.getMapper(JumunDAO.class);
		int sales_No = dao.salesSelectMax();
		
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		ArrayList<SalesDetailsDTO> sdList = dao.salesInputSelect(map); // 주문내역 가져오기
		
		int tableNum = dao.salesTableSelect(map);
		
		for(int i = 0; i < sdList.size(); i++) {
			sdList.get(i).setSd_Sales_No(Integer.toString(sales_No)); // 판매내역번호 설정
			dao.salesDetailsInsert(sdList.get(i)); // 판매내역 입력
		}
		
		paymentDTO.setPayment_Sales_No(Integer.toString(sales_No)); // 판매내역번호 설정
		paymentDTO.setPayment_Table(Integer.toString(tableNum)); // 테이블번호 설정
		dao.paymentInsert(paymentDTO); // 결제내역 입력
		
		map.put("od_Orders_No", orders_No);
		dao.ordersDelete(map); // 주문 삭제
		dao.ordersDetailsDelete(map); // 주문내역 삭제

		int payment_Card = paymentDTO.getPayment_Card();
		int payment_Cash = paymentDTO.getPayment_Cash();
		int payment_Point = paymentDTO.getPayment_Point();
		
		String member_Id = paymentDTO.getPayment_Member_Id().trim();
		int sumPrice = payment_Card + payment_Cash + payment_Point;
		
		// 포인트 관련
		String grade = "";
		if(!member_Id.equals("")) {
			map.put("member_Id", member_Id);
			grade = dao.memberGradeSelectById(map);
		
			// 등급확인하고 포인트비율 다르게
			int sumPoint = (int) (sumPrice * 0.01);
			if(grade.equals("silver")) {
				sumPoint = (int) (sumPrice * 0.05);
			} else if(grade.equals("gold")) {
				sumPoint = (int) (sumPrice * 0.1);
			}
			
			map.put("upPoint", Integer.toString(sumPoint));
			map.put("upPay", Integer.toString(sumPrice));
			dao.memberPointUpdateById(map); // 결제한 금액 포인트, 총 결제금액 증가
			if(payment_Point != 0) {
				map.put("downPoint", Integer.toString(payment_Point));  // 사용한 포인트 감소
				dao.memberPointDowndateById(map);
			}
			
			// 누적 총결제 금액 확인 
			int price = dao.memberPaySelectById(map);
			if(price > 500000) {
				map.put("member_Grade", "silver");
				dao.memberGradeUpdateById(map);
			} else if(price > 2000000) {
				map.put("member_Grade", "gold");
				dao.memberGradeUpdateById(map);
			}
		}
		
		// 주문내역
		map.put("sales_No", Integer.toString(sales_No));
		dao.shippingHistoryUpdate(map);
		
		return sales_No;
	}
	
	@Override
	public int payFail() {
		dao = sqlSession.getMapper(JumunDAO.class);
		
		return dao.payFail(); // 결제 취소 및 실패 시 결제번호 삭제
	}
	
	@Override
	public Date paymentTime(String sales_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("payment_Sales_No", sales_No);
		
		return dao.paymentDateSelect(map); // 결제시간 조회
	}
	
	@Override
	public int memberPointSearchById(String member_Id) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("member_Id", member_Id);
		
		return dao.memberPointSelectById(map); // 아이디로 포인트 조회
	}
	
	@Override
    public int orderPDF(String orders_No, HttpServletRequest request) {
		
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		OrdersDTO ordersDTO = dao.ordersSelectByNo(map);
		
		map.put("od_Orders_No", orders_No);
		ArrayList<HashMap<String, Object>> list = dao.ordersDetailsSelect(map);
		
        int result = 0; // 초기값이 null이 들어가면 오류가 발생될수 있기 때문에 공백을 지정
 
        try {
            Document document = new Document(); // pdf문서를 처리하는 객체
            String path = request.getSession().getServletContext().getRealPath("/") + "resources/images/jumun/ordersPDF.pdf";
            
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path));
            // pdf파일의 저장경로를 orderPDF.pdf로 한다는 뜻
 
            document.open(); // 웹페이지에 접근하는 객체를 연다
 
            BaseFont baseFont = BaseFont.createFont("c:/windows/fonts/malgun.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            // pdf가 기본적으로 한글처리가 안되기 때문에 한글폰트 처리를 따로 해주어야 한다.
            // createFont메소드에 사용할 폰트의 경로 (malgun.ttf)파일의 경로를 지정해준다.
            // 만약에 이 경로에 없을 경우엔 java파일로 만들어서 집어넣어야 한다.
 
            Font font = new Font(baseFont, 12); // 폰트의 사이즈를 12픽셀로 한다.
 
            PdfPTable table = new PdfPTable(4); // 4개의 셀을 가진 테이블 객체를 생성 (pdf파일에 나타날 테이블)
            Chunk chunk = new Chunk(ordersDTO.getOrders_TableSave_Code()+ "번 테이블 주문서", font); // 타이틀 객체를 생성 (타이틀의 이름을 장바구니로 하고 위에 있는 font를 사용)
            Paragraph ph = new Paragraph(chunk);
            ph.setAlignment(Element.ALIGN_CENTER);
            document.add(ph); // 문단을 만들어서 가운데 정렬 (타이틀의 이름을 가운데 정렬한다는 뜻)
            
            document.add(Chunk.NEWLINE); // 줄바꿈 (왜냐하면 타이틀에서 두줄을 내린후에 셀(테이블)이 나오기 때문)
            document.add(Chunk.NEWLINE);

            SimpleDateFormat  format = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");
            String timeFirst = "처음주문 시간 : " + format.format(ordersDTO.getOrders_First());
            Chunk chunkFirst = new Chunk(timeFirst, font);
            Paragraph phFirst = new Paragraph(chunkFirst);
            phFirst.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFirst);
            
            String timeFinal = "마지막 주문 시간 : " + format.format(ordersDTO.getOrders_Final());
            Chunk chunkFinal = new Chunk(timeFinal, font);
            Paragraph phFinal = new Paragraph(chunkFinal);
            phFinal.setAlignment(Element.ALIGN_RIGHT);
            document.add(phFinal);

            document.add(Chunk.NEWLINE);
            PdfPCell cell1 = new PdfPCell(new Phrase("번호", font)); // 셀의 이름과 폰트를 지정해서 셀을 생성한다.
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER); // 셀의 정렬방식을 지정한다. (가운데정렬)
            
            PdfPCell cell2 = new PdfPCell(new Phrase("상품명", font));
            cell2.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell3 = new PdfPCell(new Phrase("단가", font));
            cell3.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            PdfPCell cell4 = new PdfPCell(new Phrase("수량", font));
            cell4.setHorizontalAlignment(Element.ALIGN_CENTER);
 
            table.addCell(cell1); // 그리고 테이블에 위에서 생성시킨 셀을 넣는다.
            table.addCell(cell2);
            table.addCell(cell3);
            table.addCell(cell4);
    		
            // 서비스로부터 id값을 매개값으로 주어서 장바구니목록을 가져온다.
            for (int i = 0; i < list.size(); i++) {
            	HashMap<String, Object> map = list.get(i); // 레코드에 값들을 꺼내서 dto에 저장
                PdfPCell od_No = new PdfPCell(new Phrase("" + map.get("OD_NO"), font)); 
                od_No.setHorizontalAlignment(Element.ALIGN_CENTER);
                // 반복문을 사용해서 상품정보를 하나씩 출력해서 셀에 넣고 테이블에 저장한다.
 
                PdfPCell menu_Name = new PdfPCell(new Phrase("" + map.get("MENU_NAME"), font));
                menu_Name.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.
 
                PdfPCell menu_Price = new PdfPCell(new Phrase("" + map.get("MENU_PRICE"), font));
                menu_Price.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.
 
                PdfPCell od_Qty = new PdfPCell(new Phrase("" + map.get("OD_QTY"), font));
                od_Qty.setHorizontalAlignment(Element.ALIGN_CENTER);
                // Phrase타입은 숫자형(int형 같은타입)으로 하면 에러가 발생되기 때문에 dto앞에 공백("")주어서 String타입으로 변경한다.
 
                table.addCell(od_No); // 셀의 데이터를 테이블에 저장한다. (장바구니안에 들어있는 갯수만큼 테이블이 만들어진다)
                table.addCell(menu_Name);
                table.addCell(menu_Price);
                table.addCell(od_Qty);
            }
            
            document.add(table); // 웹접근 객체에 table를 저장한다.
            document.close(); // 저장이 끝났으면 document객체를 닫는다.
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
		
		return dao.ordersCheck(map); // 주문내역 개수
	}
	
	@Override
	public void ordersDeleteCheck(String orders_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("orders_No", orders_No);
		// 주문내역 유무
		if(dao.ordersCheck(map) == 0) {
			dao.ordersDelete(map); // 주문번호 삭제
		}
	}
	
	@Override
	public ArrayList<PaymentDTO> paymentSearch(String data, String searchType, String predatepicker, String postdatepicker) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		// mapper 에러 방지
		if(data == null) data = "";
		if(searchType == null) searchType = "";
		if(predatepicker == null) predatepicker = "";
		if(postdatepicker == null) postdatepicker = "";

		if(postdatepicker != "") {
			postdatepicker = Integer.toString(Integer.parseInt(postdatepicker) + 1); // ~까지 날짜도 보여주기위해 1일 더하기
		}
		
		map.put("data", data);
		map.put("searchType", searchType);
		map.put("predatepicker", predatepicker);
		map.put("postdatepicker", postdatepicker);
		
		return dao.paymentSelect(map); // 결제내역 조회
	}
	
	@Override
	public ArrayList<SalesDetailsDTO> salesDetailsSearch(String sales_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("sales_No", sales_No);
		
		return dao.salesDetailesSelect(map); // 결제내역 세부 조회
	}
	
	@Override
	public int paymentCancle(String payment_No) {
		dao = sqlSession.getMapper(JumunDAO.class);
		map = new HashMap<String, String>();
		map.put("payment_No", payment_No);
		
		return dao.paymentCancle(map); // 환불 처리
	}
	
	@Override // 재고가 부족한 메뉴 이름
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
