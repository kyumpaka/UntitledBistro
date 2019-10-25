package com.bit.UntitledBistro.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.UntitledBistro.model.insa.Insa_SalaryDTO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;
import com.bit.UntitledBistro.service.insa.InsaService;
import com.bit.UntitledBistro.service.jungsan.Jungsan_Input_Service;
import com.bit.UntitledBistro.service.jungsan.Jungsan_view_Service;

@Controller
public class JungsanController {
	@Resource(name = "view")
	private Jungsan_view_Service jungsan_view_Service; 			// 결산 현황 view
	private Object insert_state;								// 결산 현황 인서트
	private Object insert_Initial_value;						// 기본값 인서트
	private Object delete_state;								// 기본값 딜리트
	@Resource(name = "input")
	private Jungsan_Input_Service jungsan_input_Service; 		// 결산 마감 insert & list
	private Object insert_daily; 								// 일마감 인서트 dto
	private Object insert_Monthly;								// 월마감 인서트
	private Object Show_difference;								// 차액
	private Object update_difference;							// 차액 수정
	private Object update_difference_Month;						// 월마감 리스트에 차액
	private Object delete_Initialvalue_Month;					// 월마감 기본값

	@RequestMapping("View_jungsan.html") // 결산 현황 view 매핑
	public String Show(HttpServletRequest request) {
		///////////////////////////////////////// 어제///////////////////////////////////////////
		int befor_cash = jungsan_view_Service.befor_cash(); // 어제 현금
		request.setAttribute("befor_cash", befor_cash);

		int befor_card = jungsan_view_Service.befor_card(); // 어제 카드
		request.setAttribute("befor_card", befor_card);

		int befor_point = jungsan_view_Service.befor_point(); // 어제 카드
		request.setAttribute("befor_point", befor_point);
		////////////// 오늘//////////
		int today_cash = jungsan_view_Service.today_cash(); // 현재 현금
		request.setAttribute("today_cash", today_cash);

		int today_card = jungsan_view_Service.today_card(); // 현재 카드
		request.setAttribute("today_card", today_card);

		int today_point = jungsan_view_Service.today_point(); // 사용 포인트
		request.setAttribute("today_point", today_point);
		///////////////////////////////////////// 제품///////////////////////////////////////////
		int menucount_drink = jungsan_view_Service.menucount_drink(); // 메뉴 주류
		request.setAttribute("menucount_drink", menucount_drink);

		int menucount_cooking = jungsan_view_Service.menucount_cooking(); // 메뉴 요리
		request.setAttribute("menucount_cooking", menucount_cooking);

		int menucount_soup = jungsan_view_Service.menucount_soup(); // 메뉴 국물
		request.setAttribute("menucount_soup", menucount_soup);
		///////////////////////////////////////// 어제///////////////////////////////////////////
		int befor_drink = jungsan_view_Service.befor_drink(); // 메뉴 국물
		request.setAttribute("befor_drink", befor_drink);

		int befor_cooking = jungsan_view_Service.befor_cooking(); // 메뉴 국물
		request.setAttribute("befor_cooking", befor_cooking);

		int befor_soup = jungsan_view_Service.befor_soup(); // 메뉴 국물
		request.setAttribute("befor_soup", befor_soup);
		///////////////////////////////////////// 지난주///////////////////////////////////////////
		int last_week_drink = jungsan_view_Service.last_week_drink(); // 메뉴 국물
		request.setAttribute("last_week_drink", last_week_drink);

		int last_week_cooking = jungsan_view_Service.last_week_cooking(); // 메뉴 국물
		request.setAttribute("last_week_cooking", last_week_cooking);

		int last_week_soup = jungsan_view_Service.last_week_soup(); // 메뉴 국물
		request.setAttribute("last_week_soup", last_week_soup);
		////////////////// 요일///////////
		String to_date = jungsan_input_Service.to_date(); // 요일 표시
		request.setAttribute("to_date", to_date);

		int Monday = jungsan_view_Service.Monday();
		request.setAttribute("Monday", Monday);
		int Tuesday = jungsan_view_Service.Tuesday();
		request.setAttribute("Tuesday", Tuesday);
		int Wednesday = jungsan_view_Service.Wednesday();
		request.setAttribute("Wednesday", Wednesday);
		int Thursday = jungsan_view_Service.Thursday();
		request.setAttribute("Thursday", Thursday);
		int Friday = jungsan_view_Service.Friday();
		request.setAttribute("Friday", Friday);
		int Saturday = jungsan_view_Service.Saturday();
		request.setAttribute("Saturday", Saturday);
		int Sunday = jungsan_view_Service.Sunday();
		request.setAttribute("Sunday", Sunday);
		/* 오늘시간 별 매출 */
		int today_one_Oclock = jungsan_view_Service.today_one_Oclock();
		request.setAttribute("today_one_Oclock", today_one_Oclock);
		int today_two_Oclock = jungsan_view_Service.today_two_Oclock();
		request.setAttribute("today_two_Oclock", today_two_Oclock);
		int today_three_Oclock = jungsan_view_Service.today_three_Oclock();
		request.setAttribute("today_three_Oclock", today_three_Oclock);
		int today_four_Oclock = jungsan_view_Service.today_four_Oclock();
		request.setAttribute("today_four_Oclock", today_four_Oclock);
		int today_five_Oclock = jungsan_view_Service.today_five_Oclock();
		request.setAttribute("today_five_Oclock", today_five_Oclock);
		int today_six_Oclock = jungsan_view_Service.today_six_Oclock();
		request.setAttribute("today_six_Oclock", today_six_Oclock);
		int today_seven_Oclock = jungsan_view_Service.today_seven_Oclock();
		request.setAttribute("today_seven_Oclock", today_seven_Oclock);
		int today_eight_Oclock = jungsan_view_Service.today_eight_Oclock();
		request.setAttribute("today_eight_Oclock", today_eight_Oclock);
		int today_nine_Oclock = jungsan_view_Service.today_nine_Oclock();
		request.setAttribute("today_nine_Oclock", today_nine_Oclock);
		int today_ten_Oclock = jungsan_view_Service.today_ten_Oclock();
		request.setAttribute("today_ten_Oclock", today_ten_Oclock);
		int today_eleven_Oclock = jungsan_view_Service.today_eleven_Oclock();
		request.setAttribute("today_eleven_Oclock", today_eleven_Oclock);
		int today_twelve_Oclock = jungsan_view_Service.today_twelve_Oclock();
		request.setAttribute("today_twelve_Oclock", today_twelve_Oclock);
		int today_thirteen_Oclock = jungsan_view_Service.today_thirteen_Oclock();
		request.setAttribute("today_thirteen_Oclock", today_thirteen_Oclock);
		int today_fourteen_Oclock = jungsan_view_Service.today_fourteen_Oclock();
		request.setAttribute("today_fourteen_Oclock", today_fourteen_Oclock);
		int today_fifteen_Oclock = jungsan_view_Service.today_fifteen_Oclock();
		request.setAttribute("today_fifteen_Oclock", today_fifteen_Oclock);
		int today_sixteen_Oclock = jungsan_view_Service.today_sixteen_Oclock();
		request.setAttribute("today_sixteen_Oclock", today_sixteen_Oclock);
		int today_seventeen_Oclock = jungsan_view_Service.today_seventeen_Oclock();
		request.setAttribute("today_seventeen_Oclock", today_seventeen_Oclock);
		int today_eighteen_Oclock = jungsan_view_Service.today_eighteen_Oclock();
		request.setAttribute("today_eighteen_Oclock", today_eighteen_Oclock);
		int today_nineteen_Oclock = jungsan_view_Service.today_nineteen_Oclock();
		request.setAttribute("today_nineteen_Oclock", today_nineteen_Oclock);
		int today_twenty_Oclock = jungsan_view_Service.today_twenty_Oclock();
		request.setAttribute("today_twenty_Oclock", today_twenty_Oclock);
		int today_twentyone_Oclock = jungsan_view_Service.today_twentyone_Oclock();
		request.setAttribute("today_twentyone_Oclock", today_twentyone_Oclock);
		int today_twentytwo_Oclock = jungsan_view_Service.today_twentytwo_Oclock();
		request.setAttribute("today_twentytwo_Oclock", today_twentytwo_Oclock);
		int today_twentythree_Oclock = jungsan_view_Service.today_twentythree_Oclock();
		request.setAttribute("today_twentythree_Oclock", today_twentythree_Oclock);
		int today_zero_Oclock = jungsan_view_Service.today_zero_Oclock();
		request.setAttribute("today_zero_Oclock", today_zero_Oclock);
		/* 어제 시간별 매출 */
		int yesterday_one_Oclock = jungsan_view_Service.yesterday_one_Oclock();
		request.setAttribute("yesterday_one_Oclock", yesterday_one_Oclock);
		int yesterday_two_Oclock = jungsan_view_Service.yesterday_two_Oclock();
		request.setAttribute("yesterday_two_Oclock", yesterday_two_Oclock);
		int yesterday_three_Oclock = jungsan_view_Service.yesterday_three_Oclock();
		request.setAttribute("yesterday_three_Oclock", yesterday_three_Oclock);
		int yesterday_four_Oclock = jungsan_view_Service.yesterday_four_Oclock();
		request.setAttribute("yesterday_four_Oclock", yesterday_four_Oclock);
		int yesterday_five_Oclock = jungsan_view_Service.yesterday_five_Oclock();
		request.setAttribute("yesterday_five_Oclock", yesterday_five_Oclock);
		int yesterday_six_Oclock = jungsan_view_Service.yesterday_six_Oclock();
		request.setAttribute("yesterday_six_Oclock", yesterday_six_Oclock);
		int yesterday_seven_Oclock = jungsan_view_Service.yesterday_seven_Oclock();
		request.setAttribute("yesterday_seven_Oclock", yesterday_seven_Oclock);
		int yesterday_eight_Oclock = jungsan_view_Service.yesterday_eight_Oclock();
		request.setAttribute("yesterday_eight_Oclock", yesterday_eight_Oclock);
		int yesterday_nine_Oclock = jungsan_view_Service.yesterday_nine_Oclock();
		request.setAttribute("yesterday_nine_Oclock", yesterday_nine_Oclock);
		int yesterday_ten_Oclock = jungsan_view_Service.yesterday_ten_Oclock();
		request.setAttribute("yesterday_ten_Oclock", yesterday_ten_Oclock);
		int yesterday_eleven_Oclock = jungsan_view_Service.yesterday_eleven_Oclock();
		request.setAttribute("yesterday_eleven_Oclock", yesterday_eleven_Oclock);
		int yesterday_twelve_Oclock = jungsan_view_Service.yesterday_twelve_Oclock();
		request.setAttribute("yesterday_twelve_Oclock", yesterday_twelve_Oclock);
		int yesterday_thirteen_Oclock = jungsan_view_Service.yesterday_thirteen_Oclock();
		request.setAttribute("yesterday_thirteen_Oclock", yesterday_thirteen_Oclock);
		int yesterday_fourteen_Oclock = jungsan_view_Service.yesterday_fourteen_Oclock();
		request.setAttribute("yesterday_fourteen_Oclock", yesterday_fourteen_Oclock);
		int yesterday_fifteen_Oclock = jungsan_view_Service.yesterday_fifteen_Oclock();
		request.setAttribute("yesterday_fifteen_Oclock", yesterday_fifteen_Oclock);
		int yesterday_sixteen_Oclock = jungsan_view_Service.yesterday_sixteen_Oclock();
		request.setAttribute("yesterday_sixteen_Oclock", yesterday_sixteen_Oclock);
		int yesterday_seventeen_Oclock = jungsan_view_Service.yesterday_seventeen_Oclock();
		request.setAttribute("yesterday_seventeen_Oclock", yesterday_seventeen_Oclock);
		int yesterday_eighteen_Oclock = jungsan_view_Service.yesterday_eighteen_Oclock();
		request.setAttribute("yesterday_eighteen_Oclock", yesterday_eighteen_Oclock);
		int yesterday_nineteen_Oclock = jungsan_view_Service.yesterday_nineteen_Oclock();
		request.setAttribute("yesterday_nineteen_Oclock", yesterday_nineteen_Oclock);
		int yesterday_twenty_Oclock = jungsan_view_Service.yesterday_twenty_Oclock();
		request.setAttribute("yesterday_twenty_Oclock", yesterday_twenty_Oclock);
		int yesterday_twentyone_Oclock = jungsan_view_Service.yesterday_twentyone_Oclock();
		request.setAttribute("yesterday_twentyone_Oclock", yesterday_twentyone_Oclock);
		int yesterday_twentytwo_Oclock = jungsan_view_Service.yesterday_twentytwo_Oclock();
		request.setAttribute("yesterday_twentytwo_Oclock", yesterday_twentytwo_Oclock);
		int yesterday_twentythree_Oclock = jungsan_view_Service.yesterday_twentythree_Oclock();
		request.setAttribute("yesterday_twentythree_Oclock", yesterday_twentythree_Oclock);
		int yesterday_zero_Oclock = jungsan_view_Service.yesterday_zero_Oclock();
		request.setAttribute("yesterday_zero_Oclock", yesterday_zero_Oclock);

		return "jungsan/View_jungsan";
	}

	/* 결산 현황 & 결산 마감 나누어지는 중간지점 */

	@RequestMapping("Day_DeadLine.html") // 결산 마감 맵핑
	public String Day_DeadLine(HttpServletRequest request, @ModelAttribute Jungsan_view_DTO dto) {

		jungsan_view_Service.Show_list(dto);

		jungsan_view_Service.update_state(dto);
		
		HashMap map = new HashMap();

		List<Jungsan_view_DTO> jungsan_state = jungsan_view_Service.jungsan_state(map);
		request.setAttribute("jungsan_state", jungsan_state);

		int expenditure = jungsan_view_Service.expenditure();
		request.setAttribute("expenditure", expenditure);
		
		int worketime = jungsan_view_Service.worketime();
		request.setAttribute("worketime", worketime);
		
		int parttime = jungsan_view_Service.parttime();
		request.setAttribute("parttime", parttime);
		
		int employee = jungsan_view_Service.employee();
		request.setAttribute("employee", employee);

		int personnel = jungsan_view_Service.personnel();
		request.setAttribute("personnel", personnel);
		
		int befor_cash = jungsan_view_Service.befor_cash(); // 어제 현금
		request.setAttribute("befor_cash", befor_cash);

		int befor_card = jungsan_view_Service.befor_card(); // 어제 카드
		request.setAttribute("befor_card", befor_card);

		int today_cash = jungsan_view_Service.today_cash(); // 현재 현금
		request.setAttribute("today_cash", today_cash);

		int today_card = jungsan_view_Service.today_card(); // 현재 카드
		request.setAttribute("today_card", today_card);

		int menucount_drink = jungsan_view_Service.menucount_drink(); // 메뉴 주류
		request.setAttribute("menucount_drink", menucount_drink);

		int menucount_cooking = jungsan_view_Service.menucount_cooking(); // 메뉴 요리
		request.setAttribute("menucount_cooking", menucount_cooking);

		int menucount_soup = jungsan_view_Service.menucount_soup(); // 메뉴 국물
		request.setAttribute("menucount_soup", menucount_soup);

		return "jungsan/Day_DeadLine";
	}

	@RequestMapping("Day_DeadLineForm.html") // 인서트 맵핑
	public String Day_DeadLineForm(HttpServletRequest request, @ModelAttribute Jungsan_Input_DTO dto) {
		// 인서트
		jungsan_input_Service.insert_daily(dto);
		request.setAttribute("insert_daily", insert_daily);
		return "redirect:Daily.html";
	}

	/* 리스트 맵핑들 */

	@RequestMapping("Daily.html") // 일마감
	public String day_list(HttpServletRequest request, Jungsan_Input_DTO dto) {

		jungsan_input_Service.Show_difference(dto); // 현상황 확인후 기본값 입력

		jungsan_input_Service.update_difference(dto); // 변경
		int to_difference = jungsan_input_Service.to_difference(); // 메뉴 국물
		request.setAttribute("to_difference", to_difference);

		HashMap map = new HashMap();

		String postdatepicker = request.getParameter("postdatepicker");
		if (postdatepicker != null) {
			map.put("postdatepicker", "%" + postdatepicker.substring(2) + "%");
		}
		List<Jungsan_Input_DTO> getjungsan_inputList = jungsan_input_Service.getjungsan_inputList(map); // 조회

		request.setAttribute("getjungsan_inputList", getjungsan_inputList); // 조회한걸 담음

		return "jungsan/Daily"; // 주소 이동
	}

	@RequestMapping("pop/Daily.html") // 일마감
	public String popday_list(HttpServletRequest request, Jungsan_Input_DTO dto) {

		HashMap map = new HashMap();

		List<Jungsan_Input_DTO> getjungsan_inputList = jungsan_input_Service.getjungsan_inputList(map); // 조회

		request.setAttribute("getjungsan_inputList", getjungsan_inputList); // 조회한걸 담음

		return "views/jungsan/Daily"; // 주소 이동
	}

	@RequestMapping("Monthly.html") // 월마감
	public String MonthList(HttpServletRequest request, @ModelAttribute Jungsan_Input_DTO dto) {

		jungsan_input_Service.update_Monthly(dto); // 리스트 수정

		jungsan_input_Service.update_difference_Month(dto);// 차액 수정

		HashMap map = new HashMap();

		int differenceList = jungsan_input_Service.differenceList();
		request.setAttribute("differenceList", differenceList);

		List<Jungsan_Input_DTO> MonthList = jungsan_input_Service.MonthList(map); // 조회
		request.setAttribute("MonthList", MonthList); // 조회한걸 담음

		int Jan = jungsan_input_Service.Jan();
		request.setAttribute("Jan", Jan);

		int Feb = jungsan_input_Service.Feb();
		request.setAttribute("Feb", Feb);

		int Mar = jungsan_input_Service.Mar();
		request.setAttribute("Mar", Mar);

		int Apr = jungsan_input_Service.Apr();
		request.setAttribute("Apr", Apr);

		int May = jungsan_input_Service.May();
		request.setAttribute("May", May);

		int Jun = jungsan_input_Service.Jun();
		request.setAttribute("Jun", Jun);

		int Jul = jungsan_input_Service.Jul();
		request.setAttribute("Jul", Jul);

		int Aug = jungsan_input_Service.Aug();
		request.setAttribute("Aug", Aug);

		int Sept = jungsan_input_Service.Sept();
		request.setAttribute("Sept", Sept);

		int Ock = jungsan_input_Service.Ock();
		request.setAttribute("Ock", Ock);

		int Nov = jungsan_input_Service.Nov();
		request.setAttribute("Nov", Nov);

		int Dec = jungsan_input_Service.Dec();
		request.setAttribute("Dec", Dec);

		return "jungsan/Monthly";
	}

	/* 업데이트 금일 매출관련 사항만 변경 가능 */
	@RequestMapping("UpdateForm.html")
	public String update(HttpServletRequest request, @ModelAttribute Jungsan_Input_DTO dto) {
		int update = jungsan_input_Service.update(dto); // 업데이트 실행
		request.setAttribute("update", update); // 1개 결과 담음

		return "jungsan/UpdateForm"; // 주소 이동
	}

	@RequestMapping("Update.html") // 일마감
	public String day_listupdate(Jungsan_Input_DTO dto) {
		int update = jungsan_input_Service.update(dto);
		return "redirect:Daily.html"; // 주소 이동
	}
}
