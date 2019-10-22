package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;
import com.bit.UntitledBistro.model.jungsan.Jungsan_view_DTO;

public interface Jungsan_Input_Service {
	public List<Jungsan_Input_DTO> getjungsan_inputList(HashMap map);
	public void insert_daily(Jungsan_Input_DTO dto); 	
	public int update(Jungsan_Input_DTO dto);
	public List<Jungsan_Input_DTO> MonthList(HashMap map); 
	public void update_Monthly(Jungsan_Input_DTO dto);	
	public String to_date();
	public void insert_Initial_value(Jungsan_Input_DTO dto);
	public int Benchmark();
	public void Show_Month(Jungsan_Input_DTO dto);
	public int count_difference();											//컬럼수
	public void insert_difference(Jungsan_Input_DTO dto);					//초기값
	public void update_difference(Jungsan_Input_DTO dto);					//일차액
	public void update_difference_Month(Jungsan_Input_DTO dto);				//월차액
	public void Show_difference(Jungsan_Input_DTO dto);						//difference데이터 유무파악
	public int to_difference();												
	public List<Jungsan_Input_DTO> differenceList(HashMap map); 				
}
