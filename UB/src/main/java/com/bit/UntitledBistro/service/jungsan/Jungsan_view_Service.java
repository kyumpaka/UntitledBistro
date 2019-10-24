package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;

public interface Jungsan_view_Service {
	public int befor_cash();			//어제 현금  
	public int befor_card();			//어제 카드
	public int befor_point();			//어제 포인트
	public int today_cash();			//현재 현금  
	public int today_card();			//현재 카드
	public int today_point();			//사용 포인트
	public int menucount_drink();		//주류 갯수
	public int menucount_cooking();		//요리 메뉴 갯수
	public int menucount_soup();		//국물 메뉴 갯수
	public int befor_drink();			//어제 주류 갯수
	public int befor_cooking();			//	   요리 메뉴 갯수
	public int befor_soup();			//       국물 메뉴 갯수
	public int last_week_drink();		//지난주 주류 개수
	public int last_week_cooking();		//		요리
	public int last_week_soup();		//		국물
	public List<Jungsan_view_DTO> jungsan_state(HashMap map);			//현 매출 리스트
	public void update_state(Jungsan_view_DTO dto);						//리스트 추가
	public void insert_Initial_value(Jungsan_view_DTO dto);				//null포인트 초기값
	public void insert_Initial_value2(Jungsan_view_DTO dto);			//어제null포인트 초기값
	public void delete_state(Jungsan_view_DTO dto);						//리스트 리셋
	public int today_total();											//금일 매출
	public int before_total();											//어제의 매출
	public void Show_list(Jungsan_view_DTO dto);
						//////////요일별 매출/////////////////////
	public int Monday();
	public int Tuesday();
	public int Wednesday();
	public int Thursday();
	public int Friday();
	public int Saturday();
	public int Sunday();
	/* 오늘시간 */
	public int today_one_Oclock();
	public int today_two_Oclock();
	public int today_three_Oclock();
	public int today_four_Oclock();
	public int today_five_Oclock();
	public int today_six_Oclock();
	public int today_seven_Oclock();
	public int today_eight_Oclock();
	public int today_nine_Oclock();
	public int today_ten_Oclock();
	public int today_eleven_Oclock();
	public int today_twelve_Oclock();
	public int today_thirteen_Oclock();
	public int today_fourteen_Oclock();
	public int today_fifteen_Oclock();
	public int today_sixteen_Oclock();
	public int today_seventeen_Oclock();
	public int today_eighteen_Oclock();
	public int today_nineteen_Oclock();
	public int today_twenty_Oclock();
	public int today_twentyone_Oclock();
	public int today_twentytwo_Oclock();
	public int today_twentythree_Oclock();
	public int today_zero_Oclock();
	/* 어제 시간 */
	public int yesterday_one_Oclock();
	public int yesterday_two_Oclock();
	public int yesterday_three_Oclock();
	public int yesterday_four_Oclock();
	public int yesterday_five_Oclock();
	public int yesterday_six_Oclock();
	public int yesterday_seven_Oclock();
	public int yesterday_eight_Oclock();
	public int yesterday_nine_Oclock();
	public int yesterday_ten_Oclock();
	public int yesterday_eleven_Oclock();
	public int yesterday_twelve_Oclock();
	public int yesterday_thirteen_Oclock();
	public int yesterday_fourteen_Oclock();
	public int yesterday_fifteen_Oclock();
	public int yesterday_sixteen_Oclock();
	public int yesterday_seventeen_Oclock();
	public int yesterday_eighteen_Oclock();
	public int yesterday_nineteen_Oclock();
	public int yesterday_twenty_Oclock();
	public int yesterday_twentyone_Oclock();
	public int yesterday_twentytwo_Oclock();
	public int yesterday_twentythree_Oclock();
	public int yesterday_zero_Oclock();
	// 일마감시 지출
	public int personnel();					//인원
	public int expenditure();				//발주 가
	public int worketime();					//일한 시간
	public int parttime();					// 알바비용
	public int employee(); 					//직원비용
}
