package com.bit.UntitledBistro.model.jungsan;

import java.util.HashMap;
import java.util.List;

public interface Jungsan_view_DAO {

	public List<Jungsan_view_DTO> getjungsan_viewList(HashMap map);		//리스트 출력
	public int befor_cash();			//어제 현금  
	public int befor_card();			//어제 카드
	public int befor_code();			//어제 메뉴
	public int today_cash();			//현재 현금  
	public int today_card();			//현재 카드
	public int today_code();			//현재 메뉴
	public int today_point();			//사용 포인트
	public int today_refund();			//환불 일단 생략 합치고 추후 생각
	public int menucount_total();		//메뉴 총 갯수
	public int menucount_drink();		//주류 갯수
	public int menucount_cooking();		//요리 메뉴 갯수
	public int menucount_soup();		//국물 메뉴 갯수

}
