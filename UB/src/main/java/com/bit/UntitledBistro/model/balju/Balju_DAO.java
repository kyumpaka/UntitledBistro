package com.bit.UntitledBistro.model.balju;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public interface Balju_DAO {

	
	void insert_Balju_Plan1(Balju_PlanDTO BPdto);
	void insert_Balju_Plan2(Balju_PlanDTO BPdto);
	void insert_Balju1(Balju_DTO Bdto);
	void insert_Balju2(Balju_DTO Bdto);
	void insert_Balju_Save1(Balju_SaveDTO BSdto);
	void insert_Balju_Save2(Balju_SaveDTO BSdto);

	List<Map<String,String>> balju_Plan_list(Balju_PlanDTO BPdto);
	List<Map<String,String>> balju_List(Balju_DTO Bdto);
	List<Map<String,String>> balju_Save_list(Balju_SaveDTO BSdto);
	List<Map<String,String>> balju_Dummy(Balju_PlanDTO BPdto);
	
	//공통 품목 새창전용
	List<Map<String,String>> item_list(Item_DTO Idto);
	
	
	void balju_Plan_modi(Balju_PlanDTO BPdto);
	void balju_Modi(Balju_DTO Bdto);
	void balju_Save_modi(Balju_SaveDTO BSdto);
	
	void Delete_Balju_Plan1(Balju_PlanDTO BPdto);
	void Delete_Balju_Plan2(Balju_PlanDTO BPdto);
	void Delete_Balju1(Balju_DTO Bdto);
	void Delete_Balju2(Balju_DTO Bdto);
	void Delete_Balju_Save1(Balju_SaveDTO BSdto);
	void Delete_Balju_Save2(Balju_SaveDTO BSdto);
	
	
}
