package com.bit.UntitledBistro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.UntitledBistro.model.jumun.IngredientDTO;
import com.bit.UntitledBistro.model.jumun.MenuDTO;
import com.bit.UntitledBistro.model.jumun.MenuTypeDTO;
import com.bit.UntitledBistro.model.jumun.OrdersDetailsDTO;
import com.bit.UntitledBistro.model.jumun.PaymentDTO;
import com.bit.UntitledBistro.model.jumun.SalesDetailsDTO;
import com.bit.UntitledBistro.model.jumun.TableSaveDTO;
import com.bit.UntitledBistro.service.jumun.JumunService;

@Controller
@RequestMapping("/jumun")
public class JumunController {
	
	@Autowired
	private JumunService jumunService;
	private static final Logger logger = LoggerFactory.getLogger(JumunController.class);
	
	// 메뉴 설정
	@RequestMapping(value = "/erp/menuSetting.do")
	public String menuSettingSearch(@ModelAttribute("mt_Code") String mt_Code, Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumunService.menuSearch(mt_Code, "미판매"));

		return "jumun/menuSetting";
	}
	
	// 메뉴구분 추가 형식
	@RequestMapping(value = "/erp/menuTypeAddForm.do")
	public String menuTypeAddForm() {
		
		return "views/jumun/menuTypeAddForm";
	}
	
	// 메뉴구분 추가
	@RequestMapping(value = "/erp/menuTypeAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeAdd(@RequestBody MenuTypeDTO menuTypeDTO, RedirectAttributes attr) {
		
		return jumunService.menuTypeAdd(menuTypeDTO);
	}
	
	// 메뉴구분 관리
	@RequestMapping(value = "/erp/menuTypeList.do")
	public String menuTypeList(Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		
		return "views/jumun/menuTypeList";
	}
	
	// 메뉴구분 삭제
	@RequestMapping(value = "/erp/menuTypeRemove.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeRemove(@RequestParam("mt_Code") String mt_Code) {
		
		return jumunService.menuTypeRemove(mt_Code);
	}
	
	// 메뉴구분 수정
	@RequestMapping(value = "/erp/menuTypeModi.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuTypeModi(@RequestBody MenuTypeDTO menuTypeDTO) {
		
		return jumunService.menuTypeModi(menuTypeDTO);
	}
	
	// 메뉴 추가 형식
	@RequestMapping(value = "/erp/menuAddForm.do")
	public String menuAddForm(Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("productList", jumunService.productSearch());
		
		return "views/jumun/menuAddForm";
	}
	
	// 메뉴 추가
	@RequestMapping(value = "/erp/menuAdd.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuAdd(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumunService.imgUpload(mRequest);
		menuDTO.setMenu_Image(fileName);
		
		return jumunService.menuAdd(menuDTO);
	}
	
	// 메뉴 삭제
	@RequestMapping(value = "/erp/menuRemove.do", method = RequestMethod.POST)
	public String menuRemove(RedirectAttributes attr, @RequestParam("menu_Code") String[] list) {
		attr.addFlashAttribute("result", jumunService.menuRemove(list));
		
		return "redirect:menuSetting.do";
	}
	
	// 메뉴 수정 형식
	@RequestMapping(value = "/erp/menuModiForm.do")
	public String menuModiForm(@RequestParam("menu_Code") String menu_Code, Model model) {
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuDTO", jumunService.menuSearchByMenuCode(menu_Code));
		model.addAttribute("productList", jumunService.productSearch());
		
		return "views/jumun/menuModiForm";
	}
	
	// 메뉴 수정
	@RequestMapping(value = "/erp/menuModi.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuModi(MenuDTO menuDTO, MultipartHttpServletRequest mRequest) {
		String fileName = jumunService.imgUpload(mRequest);
		menuDTO.setMenu_Image(fileName);
		
		return jumunService.menuModi(menuDTO);
	}
	
	// 메뉴 이름 확인
	@RequestMapping(value = "/erp/menuNameCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int menuNameCheck(@RequestParam("name") String name) {
		
		return jumunService.menuNameCheck(name);
	}
	
	// 재료 확인
	@RequestMapping(value = "/erp/ingreSearchByMenuCode.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<IngredientDTO> ingreSearchByMenuCode(@RequestParam("menu_Code") String menu_Code) {

		return jumunService.ingreSearchByMenuCode(menu_Code);
	}
	
	// 테이블 설정
	@RequestMapping(value = "/erp/tableSetting.do")
	public String tableSetting(Model model) {
		model.addAttribute("tableList", jumunService.tableSearch());
		
		return "jumun/tableSetting";
	}
	
	// 테이블 위치 저장
	@RequestMapping(value = "/erp/tableSave.do", method = RequestMethod.POST)
	@ResponseBody
	public int tableSave(@RequestBody List<TableSaveDTO> list) {
		return jumunService.tableAdd(list);
	}
	
	// 포스 메인페이지
	@RequestMapping(value = "/posMain.do")
	public String posMain(Model model) {
		model.addAttribute("tableList", jumunService.tableSearch());
		model.addAttribute("posMainList", jumunService.orderListAll());
		model.addAttribute("tableUseList", jumunService.tableInfo());
		
		return "views/jumun/posMain";
	}
	
	// 주문 목록
	@RequestMapping(value = "/ordersList.do", method = RequestMethod.POST)
	public String orderList(@ModelAttribute("orders_No") String orders_No, Model model, @ModelAttribute("mt_Code") String mt_Code) {
		model.addAttribute("ordersList", jumunService.ordersList(orders_No));
		model.addAttribute("allPrice", jumunService.odAllPrice(orders_No));
		model.addAttribute("menuTypeList", jumunService.menuTypeSearch("all"));
		model.addAttribute("menuList", jumunService.menuSearch(mt_Code, "판매"));
		
		return "views/jumun/ordersList";
	}

	// 주문 취소
	@RequestMapping(value = "/ordersRemove.do", method = RequestMethod.POST)
	@ResponseBody
	public int ordersRemove(@RequestBody OrdersDetailsDTO ordersDetailDTO) {
		
		return jumunService.ordersRemove(ordersDetailDTO);
	}
	
	// 주문메뉴 모두 취소
	@RequestMapping(value = "/ordersRemoveAll.do", method = RequestMethod.POST)
	@ResponseBody
	public int ordersRemoveAll(@RequestBody OrdersDetailsDTO ordersDetailDTO) {
		
		return jumunService.ordersRemoveAll(ordersDetailDTO);
	}
	
	// 메뉴 주문
	@RequestMapping(value = "/ordersPlus.do", method = RequestMethod.POST)
	@ResponseBody
	public int ordersPlus(@RequestBody OrdersDetailsDTO ordersDetailDTO) {
		
		return jumunService.ordersPlus(ordersDetailDTO);
	}

	// 메뉴 주문 감소
	@RequestMapping(value = "/ordersMinus.do", method = RequestMethod.POST)
	@ResponseBody
	public int ordersMinus(@RequestBody OrdersDetailsDTO ordersDetailDTO) {
		
		return jumunService.ordersMinus(ordersDetailDTO);
	}
	
	// 테이블 사용 관리
	@RequestMapping(value = "/tableControl.do")
	public String tableControl(Model model) {
		model.addAttribute("tableList", jumunService.tableControl());
		
		return "views/jumun/tableControl";
	}
	
	// 테이블 사용 조절
	@RequestMapping(value = "/tableControl.do", method = RequestMethod.POST)
	@ResponseBody
	public int tableControl(@RequestBody Map<String, String> table) {
		
		return jumunService.tableControl(table);
	}
	
	// 할인 형식
	@RequestMapping(value = "/orderDiscount.do")
	public String orderDiscount(@ModelAttribute("allPrice") String allPrice) {
		return "views/jumun/orderDiscount";
	}
	
	// 결제 시작
	@RequestMapping(value = "/paymentStart.do")
	public String paymentStart(@ModelAttribute("orders_No") String orders_No, @ModelAttribute("allPrice") String allPrice
			, @ModelAttribute("discountPrice") String discountPrice, @ModelAttribute("resultPrice") String resultPrice) {
		
		return "views/jumun/paymentStart";
	}
	
	// 카카오(카드) 결제 1단계
	@RequestMapping(value = "/kakaoPay.do", method = RequestMethod.POST)
	public String kakaoPay(@RequestParam("orders_No") String orders_No, PaymentDTO paymentDTO) {
		
		return "redirect:" + jumunService.kakaoPayReady(orders_No, paymentDTO);
	}
	
	// 카카오 결제 완료
	@RequestMapping(value = "/kakaoPaySuccess.do")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, @RequestParam("orders_No") String orders_No, 
    		@ModelAttribute("payment_Cash") String payment_Cash, @ModelAttribute("payment_Card") String payment_Card, @ModelAttribute("payment_Point") String payment_Point) {
		model.addAttribute("info", jumunService.kakaoPayInfo(pg_token, orders_No));
        
        return "views/jumun/kakaoPaySuccess";
    }
	
	// 현금 결제 완료
	@RequestMapping(value = "/paySuccess.do")
	public String paySuccess(@ModelAttribute("payment_Cash") String payment_Cash, Model model
			, @ModelAttribute("sales_No") String sales_No, @ModelAttribute("payment_Point") String payment_Point) {
		model.addAttribute("payment_Time", jumunService.paymentTime(sales_No));
		
		return "views/jumun/paySuccess";
	}
	
	// 카카오(카드) 결제 실패
	@RequestMapping(value = "/kakaoPaySuccessFail.do")
	public String kakaoPaySuccessFail() {
		jumunService.payFail();
		
		return "views/jumun/kakaoPaySuccessFail";
	}

	// 카카오(카드) 결제 취소
	@RequestMapping(value = "/kakaoPayCancel.do")
	public String kakaoPayCancel() {
		jumunService.payFail();
		
		return "views/jumun/kakaoPayCancel";
	}
	
	// 포인트 조회
	@RequestMapping(value = "/memberPointSearchById.do", method = RequestMethod.POST)
	@ResponseBody
	public int memberPointSearchById(@RequestParam("member_Id") String member_Id) {
		
		return jumunService.memberPointSearchById(member_Id);
	}
	
	// PDF파일 만들기(출력)
	@RequestMapping(value = "/ordersPDF.do")
	public String ordersPDF(Model model, HttpServletRequest request) {
		String orders_No = request.getParameter("orders_No");
		model.addAttribute("result", jumunService.orderPDF(orders_No, request));
		
		return "views/jumun/ordersPDF";
	}
	
	// 주문내역 개수 확인
	@RequestMapping(value = "/ordersCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int ordersCheck(@RequestParam("orders_No") String orders_No) {

		return jumunService.ordersCheck(orders_No);
	}
	
	// 주문내역 없으면 주문번호 없애기
	@RequestMapping(value = "/ordersDeleteCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public void ordersDeleteCheck(@RequestParam("orders_No") String orders_No) {
		jumunService.ordersDeleteCheck(orders_No);
	}
	
	// 판매내역 보기
	@RequestMapping(value = "/salesList.do")
	public String salesList(Model model) {
		
		return "views/jumun/salesList";
	}
	
	// 판매내역 조회
	@RequestMapping(value = "/salesSearch.do")
	@ResponseBody
	public ArrayList<PaymentDTO> salesList(HttpServletRequest request) {
		String data = request.getParameter("data");
		String searchType = request.getParameter("searchType");
		String predatepicker = request.getParameter("predatepicker");
		String postdatepicker = request.getParameter("postdatepicker");
		
		return jumunService.paymentSearch(data, searchType, predatepicker, postdatepicker);
	}
	
	// 판매내역 세부 조회
	@RequestMapping(value = "/salesDetailsByNo.do", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<SalesDetailsDTO> salesDetailsByNo(@RequestParam("sales_No") String sales_No) {

		return jumunService.salesDetailsSearch(sales_No);
	}
	
	// 환불처리
	@RequestMapping(value = "/paymentCancle.do")
	@ResponseBody
	public int paymentCancle(@RequestParam("payment_No") String payment_No) {
		
		return jumunService.paymentCancle(payment_No);
	}
	
	// 재고 개수 확인
	@RequestMapping(value = "/storeCountCheck.do")
	@ResponseBody
	public ArrayList<String> storeCountCheck() {
		
		return jumunService.storeCountCheck();
	}
	
}
