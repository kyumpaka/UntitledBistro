package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.jungsan.JungsanDTO;

public interface JungsanService {
	public List<JungsanDTO> getjungsanList(HashMap map);
	public int befor_cash();
	public int befor_card();
	public int today_cash();
	public int today_card();
	public int total_cash();
	public int total_card();
	public int timeto_jungsan();
}
