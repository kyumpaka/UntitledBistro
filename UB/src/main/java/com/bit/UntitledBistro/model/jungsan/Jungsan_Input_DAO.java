package com.bit.UntitledBistro.model.jungsan;

import java.util.HashMap;
import java.util.List;

public interface Jungsan_Input_DAO {

	public List<Jungsan_Input_DTO> getjungsan_inputList(HashMap map);		//day리스트 출력
	public void insert_daily(Jungsan_Input_DTO dto); 						//인설트
	public int update(Jungsan_Input_DTO dto);								//update
	public List<Jungsan_Input_DTO> MonthList(HashMap map);  				//month리스트 출력
	public void insert_Monthly(Jungsan_Input_DTO dto);						//월마감 인서트
	public String to_date();
}
