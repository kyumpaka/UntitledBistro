package com.bit.UntitledBistro.model.balju;


import java.util.List;
import java.util.Map;

public interface Balju_DAO {

	
	void insert_Balju_Plan1();
	void insert_Balju_Plan2(Balju_PlanDTO BPdto);
	void insert_Balju1();
	void insert_Balju2(Balju_DTO Bdto);

	List<Map<String,String>> balju_Plan_list(Balju_PlanDTO BPdto);
	List<Map<String,String>> balju_Result(Balju_DTO Bdto);
	List<Map<String,String>> balju_Result_Search(Balju_DTO Bdto);
	List<Map<String,String>> balju_Mng_List(Balju_DTO Bdto);
	List<Map<String,String>> balju_Mng_Filter(Balju_DTO Bdto);
	
	void balju_Plan_modi(Balju_PlanDTO BPdto);
	void balju_Modi(Balju_DTO Bdto);
	void End_Balju(Balju_DTO Bdto);
	void orderListInItemUpdate(int  order_ordin_num);
	
	void Delete_Balju_Plan1(Balju_PlanDTO BPdto);
	void Delete_Balju_Plan2(Balju_PlanDTO BPdto);
	void Delete_Balju1(Balju_DTO Bdto);
	void Delete_Balju2(Balju_DTO Bdto);
	
	//공통 품목 새창전용
	List<Map<String,String>> item_list(Item_DTO Idto);
	List<Map<String,String>> item_resultList(Item_DTO Idto);
	
	//관심품목
	void insert_BookMark(Item_DTO Idto);
	void BookMark_Modi(Item_DTO Idto);
	void Delete_BookMark(Item_DTO Idto);
	List<Map<String,String>> item_BookMark(Item_DTO Idto);
	//발주계획 불러오기 버튼
	List<Map<String,String>> BPlan_Load(Balju_PlanDTO BPdto);
	List<Map<?, ?>> BPlan_Search(Balju_PlanDTO BPdto);
}
