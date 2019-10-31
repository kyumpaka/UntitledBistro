package com.bit.UntitledBistro.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.balju.BaljuResultDTO;
import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.BookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemBookMarkDTO;
import com.bit.UntitledBistro.model.balju.ItemResultListDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderInputOrderPlanDTO;
import com.bit.UntitledBistro.model.balju.OrderListDTO;
import com.bit.UntitledBistro.model.balju.OrderPlanDTO;
import com.bit.UntitledBistro.model.balju.ProductDTO;
import com.bit.UntitledBistro.service.balju.Balju_Service;

@Controller
public class Balju_Controller {

	@Autowired
	private Balju_Service balju_Service;

	private static final Logger logger = LoggerFactory.getLogger(Balju_Controller.class);

	////////// 일반 페이지 영역 //////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String a() {
		logger.info("메인페이지에 접속되었습니다.");
		return "baseLayout";

	}

	@RequestMapping(value = "/balju/Balju_Plan", method = RequestMethod.GET)
	public void Balju_Plan(Locale locale, Model model) {
		logger.info("발주계획에 접속되었습니다.");

		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String date = SDF.format(new Date());
		model.addAttribute("balju_date", date);
	}

	@RequestMapping(value = "/balju/Balju_Plan_Result", method = RequestMethod.GET)
	public void c() {
		logger.info("발주계획현황에 접속되었습니다.");
	}

	@RequestMapping(value = "/balju/Balju", method = RequestMethod.GET)
	public void Balju(Locale locale, Model model) {
		logger.info("발주서 입력에 접속되었습니다.");

		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd");
		String date = SDF.format(new Date());
		model.addAttribute("balju_date", date);
	}

	@RequestMapping(value = "/balju/Balju_Result", method = RequestMethod.GET)
	public void balju_Result(Model model, Balju_DTO Bdto) {
		logger.info("발주현황에 접속되었습니다.");
			List<BaljuResultDTO> list = this.balju_Service.balju_Result();
			model.addAttribute("Result_list", list);
		}

	
	@RequestMapping(value = "/balju/Balju_Mng_All", method = RequestMethod.GET)
	public String Balju_Mng(Model model, Balju_DTO Bdto) {
		logger.info("발주관리 필터(전체)에 접속되었습니다."); 
		List<OrderInputOrderListDTO> list = this.balju_Service.balju_Mng_List(); 
		model.addAttribute("Mng_list",list); 
		return "balju/Balju_Mng";
	}
	
	@RequestMapping(value = "/balju/Balju_Com", method = RequestMethod.GET)
	public String Balju_Com (Model model) {
		logger.info("발주관리 완료 필터에 접속되었습니다.");
		String FilterParam = "취소";
		List<OrderInputOrderListDTO> list = this.balju_Service.balju_Mng_Filter(FilterParam);
		model.addAttribute("Mng_list", list);
		return "balju/Balju_Mng";
	}
	
	@RequestMapping(value = "/balju/Balju_Mng", method = RequestMethod.GET)
	public String Balju_Mng_Filter(@RequestParam (value = "FilterParam", required = false ,defaultValue = "종결") String FilterParam, @RequestParam(value = "isRiskItemCount", defaultValue = "none") String isRiskItemCount, Model model) {
		logger.info("발주관리 필터에 접속되었습니다.");
		logger.info(FilterParam);
		logger.info(isRiskItemCount);
		List<OrderInputOrderListDTO> list = this.balju_Service.balju_Mng_Filter(FilterParam);
		
		
		
		model.addAttribute("Mng_list", list);
		model.addAttribute("isRiskItemCount", isRiskItemCount);
		return "balju/Balju_Mng";
	}
	////////// 일반 페이지 영역 //////////

	////////// 기능 구현 영역 //////////
	//////// 발주계획파트///////////////
	// 발주계획입력
	@RequestMapping(value = "/balju_Plan_Input", method = RequestMethod.POST)
	@ResponseBody
	public Object balju_Plan_Input(@RequestBody List<Map<String, String>> list, OrderPlanDTO BPdto) throws Exception {
		System.out.println("발주계획 입력 진행중 접속되었습니다.");
		System.out.println(list);

		Map<String, String> resultMap = new HashMap<String, String>();
		String result = null;
		String resultMsg = null;

		this.balju_Service.insert_Balju_Plan1();
		try {
			int index = 1;
			for (Map<String, String> data : list) {
				System.out.println("들어갈 칼럼명과 데이터 : " + data.toString());
				BPdto.setOrdpl_onum(index++);
				BPdto.setOrdpl_product_code(data.get("order_product_code"));
				BPdto.setOrdpl_product_name(data.get("order_product_name"));
				BPdto.setOrdpl_product_stndr(data.get("order_product_stndr"));
				BPdto.setOrdpl_qt(Integer.parseInt(data.get("order_qt")));
				BPdto.setOrdpl_pr_ea(Integer.parseInt(data.get("order_pr_ea")));
				BPdto.setOrdpl_wr(data.get("order_wr"));
				this.balju_Service.insert_Balju_Plan2(BPdto);
			}
			result = "success";
			resultMsg = "성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		System.out.println(result);
		System.out.println(resultMsg);
		System.out.println(resultMap);

		return resultMap;
	}

	// 발주계획현황 그리드 데이터 로딩
	@RequestMapping(value = "/balju_Plan_Result", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderPlanDTO> Balju_Plan_Result(Balju_PlanDTO BPdto) throws Exception {

		logger.info("발주계획현황에 접속되었습니다.");
		List<OrderPlanDTO> list = this.balju_Service.balju_Plan_list();
		return list;

	}

	// 발주계획현황 데이터수정(수량)
	@RequestMapping(value = "/balju_Plan_Update", method = RequestMethod.POST)
	@ResponseBody
	public Object Balju_Plan_Modi(@RequestBody ArrayList<String> list, OrderPlanDTO BPdto) {

		Map<String, String> resultMap = new HashMap<String, String>();

		String result = null;
		String resultMsg = null;

		logger.info("첫번째 리스트 값 : " + list.get(0).toString());
		logger.info("두번째 리스트 값 : " + list.get(1).toString());
		logger.info("세번째 리스트 값 : " + list.get(2).toString());

		try {
			BPdto.setOrdpl_ordlin_num(Integer.parseInt(list.get(0)));
			BPdto.setOrdpl_onum(Integer.parseInt(list.get(1)));
			BPdto.setOrdpl_qt(Integer.parseInt(list.get(2)));

			this.balju_Service.balju_Plan_modi(BPdto);

			result = "success";
			resultMsg = "수정 성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "수정 실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;

	}

	// 발주계획현황 데이터삭제(하위테이블내역삭제)
	@RequestMapping(value = "/balju_Plan_Delete", method = RequestMethod.POST)
	@ResponseBody
	public Object balju_Plan_Delete(@RequestBody ArrayList<String> list, OrderPlanDTO BPdto) {

		Map<String, String> resultMap = new HashMap<String, String>();

		String result = null;
		String resultMsg = null;

		logger.info("첫번째 리스트 값 : " + list.get(0).toString());
		logger.info("두번째 리스트 값 : " + list.get(1).toString());

		try {
			BPdto.setOrdpl_ordlin_num(Integer.parseInt(list.get(0)));
			BPdto.setOrdpl_onum(Integer.parseInt(list.get(1)));

			this.balju_Service.Delete_Balju_Plan(BPdto);

			result = "success";
			resultMsg = "삭제 성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "삭제 실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;

	}

	// 발주계획현황 데이터삭제(상위테이블 목록번호삭제)
	@RequestMapping(value = "/balju_Plan_Check", method = RequestMethod.POST)
	@ResponseBody
	public Object balju_Plan_Check(Balju_PlanDTO BPdto) {

		Map<String, String> resultMap = new HashMap<String, String>();

		String result = null;
		String resultMsg = null;

		try {
			// 두개의 테이블을 left outer join으로 값비교, null값을 추출하여 목록번호를 delete
			this.balju_Service.Delete_Balju_Plan_Check(BPdto);

			result = "success";
			resultMsg = "발주계획 정리완료, 기능을 시작합니다.";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "발주계획 로딩 에러";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}
	//////// 발주계획파트 종료///////////////

	////////// 발주서 파트 시작 //////////////
	// 발주서 입력
	@RequestMapping(value = "/balju_Input", method = RequestMethod.POST)
	@ResponseBody
	public Object balju_Input(@RequestBody List<Map<String, String>> list) throws Exception {
		logger.info("발주서 입력 진행중 접속되었습니다.");
		System.out.println(list);

		Map<String, String> resultMap = new HashMap<String, String>();
		String result = null;
		String resultMsg = null;

		this.balju_Service.insert_Balju1();
		OrderListDTO orderListDTO = null;
		try {
			int index = 1;
			for (Map<String, String> data : list) {
				orderListDTO = new OrderListDTO();
				System.out.println("들어갈 칼럼명과 데이터 : " + data.toString());
				orderListDTO.setOrder_num(index++);
				orderListDTO.setOrder_product_code(data.get("order_product_code"));
				orderListDTO.setOrder_product_name(data.get("order_product_name"));
				orderListDTO.setOrder_product_stndr(data.get("order_product_stndr"));
				orderListDTO.setOrder_qt(Integer.parseInt(data.get("order_qt")));
				orderListDTO.setOrder_pr_ea(Integer.parseInt(data.get("order_pr_ea")));
				orderListDTO.setOrder_wr(data.get("order_wr"));
				this.balju_Service.insert_Balju2(orderListDTO);
			}
			result = "success";
			resultMsg = "성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}

	// 발주서 삭제
	@RequestMapping(value = "/balju/deleteBalju", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> deleteBalju(@RequestBody ArrayList<String> deleteRow) {
		logger.info("발주서 삭제에 접속되었습니다");
		Map<String, String> resultMap = new HashMap<String, String>();
		String result = null;
		String resultMsg = null;

		System.out.println("삭제 where row값 : " + deleteRow);

		try {
			this.balju_Service.Delete_Balju(deleteRow);

			result = "success";
			resultMsg = "삭제 성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "삭제 실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;

	}

	// 발주서 종결
	@RequestMapping(value = "/balju/BaljuEnd", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> BaljuEnd(@RequestBody List<Map<String,String>> EndRow) {
		logger.info("발주서 종결기능에 접속되었습니다");
		Map<String, String> resultMap = new HashMap<String, String>();
		String result = null;
		String resultMsg = null;
		int riskItemCount = 0;

		System.out.println("종결 where row값 : " + EndRow);
		try {
			riskItemCount = this.balju_Service.End_Balju(EndRow);
			System.out.println("111111111111111111111");
			result = "success";
			resultMsg = "종결처리 성공";
		} catch (Exception e) {
			System.out.println("2222222222222222222222");
			result = "failure";
			resultMsg = "종결처리 실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("riskItemCount", String.valueOf(riskItemCount));
		
		return resultMap;

	}
	
	@RequestMapping(value = "/balju/Balju_Result_Search", method = RequestMethod.POST)
	public String Balju_Search(@RequestParam("DATESTART") String DATESTART, @RequestParam("DATEEND") String DATEEND, Model model) {
		logger.info("발주서 조회 기능에 접속되었습니다");
		
		logger.info("조회할 시작일자 값 : " + DATESTART);
		logger.info("조회할 종료일자 값 : " + DATEEND);
		
		List<BaljuResultDTO> list = this.balju_Service.balju_Result_Search(DATESTART,DATEEND);
		model.addAttribute("Result_list", list);
		return "balju/Balju_Result";

	}
	////////// 기능 구현 영역 //////////

	// 팝업창 영역
	// 발주계획팝업창버튼 [제품정보]
	@RequestMapping(value = "/balju/popup/Item_list", method = RequestMethod.GET)
	public String item_list(Item_DTO Idto, Model model) {
		logger.info("제품정보 새창에 실행되었습니다.");
		List<ProductDTO> list = this.balju_Service.item_list();
		// 모델로 값을 넣고
		model.addAttribute("item_list", list);
		// 스트링으로 뷰를지정
		return "/views/balju/popup/Item_List";
	}

	// 발주계획현황 팝업창버튼 [재고현황]
	@RequestMapping(value = "/balju/popup/Item_Result", method = RequestMethod.GET)
	public String item_Result(Item_DTO Idto, Model model) {
		logger.info("재고현황 새창에 실행되었습니다");
		List<ItemResultListDTO> list = this.balju_Service.item_resultList();
		model.addAttribute("itemResult", list);
		return "/views/balju/popup/Item_Result";
	}

	// 팝업창 버튼 [관심품목]
	@RequestMapping(value = "/balju/popup/BookMark_list", method = RequestMethod.GET)
	public String item_BookMark(Item_DTO Idto) {
		logger.info("관심품목 새창에 실행되었습니다");
		return "/views/balju/popup/BookMark_List";
	}

	@RequestMapping(value = "/balju/popup/BookMark_REG", method = RequestMethod.GET)
	public String BookMark_REG() {
		logger.info("관심품목 등록 새창에 등록되었습니다");
		return "/views/balju/popup/BookMark_REG";
	}

	@RequestMapping(value = "balju/popup/BookMark_Result", method = RequestMethod.GET)
	@ResponseBody
	public List<?> BookMark_Result(ItemBookMarkDTO itemBookMarkDTO, Model model) {
		logger.info("관심품목 그리드에 접속되었습니다.");
		List<ItemBookMarkDTO> list = this.balju_Service.item_BookMark(itemBookMarkDTO);
		return list;
	}

	// 팝업창 버튼 [관심품목 등록]
	@RequestMapping(value = "/insert_BookMark", method = RequestMethod.POST)
	@ResponseBody
	public Object insert_BookMark(@RequestBody List<Map<String, String>> list) throws Exception {
		logger.info("관심품목 입력 진행중 접속되었습니다.");
		System.out.println(list);

		Map<String, String> resultMap = new HashMap<String, String>();
		BookMarkDTO bookMarkDTO = null;
		String result = null;
		String resultMsg = null;

		try {
			for (Map<String, String> data : list) {
				bookMarkDTO = new BookMarkDTO();
				bookMarkDTO.setBk_code(data.get("bk_code"));
				bookMarkDTO.setBk_name(data.get("bk_name"));
				bookMarkDTO.setBk_stndr(data.get("bk_stndr"));
				bookMarkDTO.setBk_pr_ea(Integer.parseInt(data.get("bk_pr_ea")));
				bookMarkDTO.setBk_qt(Integer.parseInt(data.get("bk_qt")));
				bookMarkDTO.setBk_wr(data.get("bk_wr"));
				System.out.println(bookMarkDTO);
				this.balju_Service.insert_BookMark(bookMarkDTO);
			}

			result = "success";
			resultMsg = "성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	// 팝업창 [관심품목] 데이터삭제
	@RequestMapping(value = "/BookMark_delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> BookMark_delete(@RequestBody ArrayList<String> DeleteParam) {
		logger.info("관심품목 삭제에 접속되었습니다");
		Map<String, String> resultMap = new HashMap<String, String>();
		String result = null;
		String resultMsg = null;

		logger.info("삭제 where rownum값 : " + DeleteParam);

		try {
			this.balju_Service.Delete_BookMark(DeleteParam);

			result = "success";
			resultMsg = "삭제 성공";
		} catch (Exception e) {
			result = "failure";
			resultMsg = "삭제 실패";
		}
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;

	}

	// 팝업창 [발주계획불러오기] 데이터 불러오기
	@RequestMapping(value = "/balju/popup/BPlan_Load", method = RequestMethod.GET)
	public String BPlan_Load(Balju_PlanDTO BPdto, Model model) {
		logger.info("제품정보 새창에 실행되었습니다.");
		List<OrderInputOrderPlanDTO> list = this.balju_Service.BPlan_Load();
		// 모델로 값을 넣고
		model.addAttribute("BP_list", list);
		// 스트링으로 뷰를지정
		return "/views/balju/popup/BPlan_Load";
	}

	// [발주계획불러오기] 목록번호로 조회한값 그리드에 입력
	@RequestMapping(value = "/balju/popup/BPlan_Search", method = RequestMethod.POST)
	@ResponseBody
	public List<OrderListDTO> BPlan_Search(@RequestBody ArrayList<String> SearchParam) {
		logger.info("발주계획불러오기 조회가 실행되었습니다.");
		List<OrderListDTO> list = this.balju_Service.BPlan_Search(SearchParam);
		return list;
	}
}
