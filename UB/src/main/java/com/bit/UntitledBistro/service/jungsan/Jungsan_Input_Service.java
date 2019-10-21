package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.jungsan.Jungsan_Input_DTO;

public interface Jungsan_Input_Service {
	public List<Jungsan_Input_DTO> getjungsan_inputList(HashMap map);
	public void insert_daily(Jungsan_Input_DTO dto); 	
	public int update(Jungsan_Input_DTO dto);
	public List<Jungsan_Input_DTO> MonthList(HashMap map); 
	public void insert_Monthly(Jungsan_Input_DTO dto);	
	public String to_date();
}
