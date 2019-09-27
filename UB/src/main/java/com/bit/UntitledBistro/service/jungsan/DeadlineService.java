package com.bit.UntitledBistro.service.jungsan;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.jungsan.DeadlineDTO;

public interface DeadlineService {
	public List<DeadlineDTO> getdeadlineList(HashMap map);
	public int day_profit();
	public int month_profit();
	public int day_expenditure();
	public int month_expenditure();
	public int day_refund();
	public int day_worktime();
	public int month_worktime();
	public int day_max_profit();
	public int month_max_profit();
	public void insert_deadline();
	public void update_deadline();
}
