package com.bit.UntitledBistro.model.balju;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Balju_DAOimpl implements Balju_DAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// namespace = "매퍼경로"; 생략 후 직접 입력 balju. [ namespace + ".메소드명 ]
	
	@Override
	public void insert_Balju_Plan1() {
		sqlSession.insert("balju.insert_Balju_Plan1");
	}

	@Override
	public void insert_Balju_Plan2(Balju_PlanDTO BPdto) {
		sqlSession.insert("balju.insert_Balju_Plan2", BPdto);
	}

	@Override
	public void insert_Balju1() {
		sqlSession.insert("balju.insert_Balju1"); 

	}

	@Override
	public void insert_Balju2(Balju_DTO Bdto) {
		sqlSession.insert("balju.insert_Balju2", Bdto);

	}

	
	//품목 새창 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_list(Item_DTO Idto) {
		return sqlSession.selectList("balju.item_list", Idto);
	}
	//품목 재고현황 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_resultList(Item_DTO Idto) {
		return sqlSession.selectList("balju.item_resultList", Idto);
	}

	@Override
	public List<Map<String, String>> balju_Plan_list(Balju_PlanDTO BPdto) {
		return sqlSession.selectList("balju.balju_Plan_list", BPdto);
		
	}

	@Override
	public List<Map<String, String>> balju_Result(Balju_DTO Bdto) {
		return sqlSession.selectList("balju.balju_Result", Bdto); 
	}

	@Override
	public List<Map<String,String>> balju_Result_Search(Balju_DTO Bdto){
		return sqlSession.selectList("balju.balju_Result_Search", Bdto);
	}
	
	@Override
	public List<Map<String, String>> balju_Mng_List(Balju_DTO Bdto) {
		return sqlSession.selectList("balju.balju_Mng_List", Bdto);
	}
	
	@Override
	public List<Map<String,String>> balju_Mng_Filter(Balju_DTO Bdto){
		return sqlSession.selectList("balju.balju_Mng_Filter", Bdto);
	}
	
	@Override
	public void balju_Plan_modi(Balju_PlanDTO BPdto) {
		sqlSession.update("balju.balju_Plan_modi", BPdto); 
	}

	@Override
	public void balju_Modi(Balju_DTO Bdto) {
		sqlSession.update("balju.balju_Modi", Bdto);
	}
	
	@Override
	public void End_Balju(Balju_DTO Bdto) {
		sqlSession.update("balju.End_Balju", Bdto);
	}
	
	@Override
	public void orderListInItemUpdate(int  order_ordin_num) {
		sqlSession.update("balju.orderListInItemUpdate", order_ordin_num);
	}

	@Override
	public void Delete_Balju_Plan1(Balju_PlanDTO BPdto) {
		sqlSession.delete("balju.Delete_Balju_Plan1", BPdto);

	}

	@Override
	public void Delete_Balju_Plan2(Balju_PlanDTO BPdto) {
		sqlSession.delete("balju.Delete_Balju_Plan2", BPdto);

	}

	@Override
	public void Delete_Balju1(Balju_DTO Bdto) {
		sqlSession.delete("balju.Delete_Balju1", Bdto);

	}

	@Override
	public void Delete_Balju2(Balju_DTO Bdto) {
		sqlSession.delete("balju.Delete_Balju2", Bdto);

	}
	
	//BookMark 영역
	@Override
	public void insert_BookMark(Item_DTO Idto) {
		sqlSession.insert("balju.insert_BookMark", Idto);
		
	}

	@Override
	public void BookMark_Modi(Item_DTO Idto) {
		sqlSession.update("balju.BookMark_Modi", Idto);
		
	}

	@Override
	public void Delete_BookMark(Item_DTO Idto) {
		sqlSession.delete("balju.Delete_BookMark", Idto);
		
	}

	@Override
	public List<Map<String, String>> item_BookMark(Item_DTO Idto) {
		return sqlSession.selectList("balju.item_BookMark", Idto);
	}

	@Override
	public List<Map<String, String>> BPlan_Load(Balju_PlanDTO BPdto) {
		return sqlSession.selectList("balju.BPlan_Load", BPdto);
	}

	@Override
	public List<Map<?, ?>> BPlan_Search(Balju_PlanDTO BPdto) {
		return sqlSession.selectList("balju.BPlan_Search", BPdto); 
	}

	

}
