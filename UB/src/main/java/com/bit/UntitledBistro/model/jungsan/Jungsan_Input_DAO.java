package com.bit.UntitledBistro.model.jungsan;

import java.util.HashMap;
import java.util.List;

public interface Jungsan_Input_DAO {

	public List<Jungsan_Input_DTO> getjungsan_inputList(HashMap map); // day리스트 출력

	
	public void insert_daily(Jungsan_Input_DTO dto); // 인설트

	public int update(Jungsan_Input_DTO dto); // update

	public List<Jungsan_Input_DTO> MonthList(HashMap map); // month리스트 출력

	public void update_Monthly(Jungsan_Input_DTO dto); // 월 리스트 업데이트

	public String to_date();

	public int count_difference(); // 컬럼수

	public void insert_difference(Jungsan_Input_DTO dto); // 초기값

	public void update_difference(Jungsan_Input_DTO dto); // 일차액

	public void update_difference_Month(Jungsan_Input_DTO dto); // 월차액

	public void Show_difference(Jungsan_Input_DTO dto); // difference데이터 유무파악

	public int to_difference();

	public int differenceList();


	//////////// 매월 데이터
	public int Jan();

	public int Feb();

	public int Mar();

	public int Apr();

	public int May();

	public int Jun();

	public int Jul();

	public int Aug();

	public int Sept();

	public int Ock();

	public int Nov();

	public int Dec();


	
	
}
