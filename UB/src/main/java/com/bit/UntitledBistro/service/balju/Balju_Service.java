package com.bit.UntitledBistro.service.balju;

import java.util.List;

import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Balju_SaveDTO;

public interface Balju_Service {

	void Balju_Insert(Balju_DTO Bdto);
	void Balju_Plan_Insert(Balju_PlanDTO BPdto);
	void Balju_Save_Insert(Balju_SaveDTO BSdto);
	
	List<Balju_DTO> Balju_list(String ORDIN_NUM, String ORDER_NUM);
	List<Balju_PlanDTO> Balju_Plan_list(String ORPLIN_NUM, String ORDPL_ONUM);
	List<Balju_SaveDTO> Balju_Save_list(String ORSP_NUM, String ORSA_NUM);
	
	void Balju_Modify(String ORDIN_NUM, String ORDER_NUM);
	void Balju_Plan_Modify(String ORPLIN_NUM, String ORDPL_ONUM);
	void Balju_Plan_Save_Modify(String ORSP_NUM, String ORSA_NUM);
	
	void Balju_Delete(String ORDIN_NUM, String ORDER_NUM);
	void Balju_Plan_Delete(String ORPLIN_NUM, String ORDPL_ONUM);
	void Balju_Plan_Save_Delete(String ORSP_NUM, String ORSA_NUM);
	
	
}
