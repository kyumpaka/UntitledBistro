package com.bit.UntitledBistro.service.balju;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bit.UntitledBistro.model.balju.Balju_DTO;
import com.bit.UntitledBistro.model.balju.Balju_PlanDTO;
import com.bit.UntitledBistro.model.balju.Item_DTO;

public interface Balju_Service {

	void insert_Balju_Plan1();
	void insert_Balju_Plan2(Balju_PlanDTO BPdto);
	void insert_Balju1();
	void insert_Balju2(Balju_DTO Bdto);


	List<Map<String,String>> balju_Plan_list(Balju_PlanDTO BPdto);
	List<Map<String,String>> balju_Result(Balju_DTO Bdto);
	List<Map<String,String>> balju_Result_Search(String DATESTART, String DATEEND);
	List<Map<String,String>> balju_Mng_List(Balju_DTO Bdto);
	List<Map<String,String>> balju_Mng_Filter(String FilterParam);

	
	void balju_Plan_modi(Balju_PlanDTO BPdto);
	void balju_Modi(Balju_DTO Bdto);
	int End_Balju(List<Map<String, String>> endRow);

	
	void Delete_Balju_Plan(Balju_PlanDTO BPdto);
	void Delete_Balju_Plan_Check(Balju_PlanDTO BPdto);
	void Delete_Balju(ArrayList<String> deleteRow);

	//공통품목 서비스부분
	List<Map<String,String>> item_list(Item_DTO Idto);
	List<Map<String,String>> item_resultList(Item_DTO idto);
	//공통품목 관심품목
	void insert_BookMark(Item_DTO idto);
	List<Map<String,String>> item_BookMark(Item_DTO idto);
	void BookMark_Modi(Item_DTO idto);
	void Delete_BookMark(ArrayList<String> DeleteList);
	//발주계획불러오기
	List<Map<String,String>>BPlan_Load(Balju_PlanDTO BPdto);
	List<Map<?,?>>BPlan_Search(ArrayList<String> SearchParam);
	
	
}
