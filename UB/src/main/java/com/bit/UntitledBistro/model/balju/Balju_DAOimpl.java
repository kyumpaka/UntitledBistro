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
	
	// namespace = "매퍼경로"; 생략 후 직접 입력 balju.
	
	@Override
	public void insert_Balju_Plan1(Balju_PlanDTO BPdto) {
		sqlSession.insert("balju.insert_Balju_Plan1", BPdto);
	}

	@Override
	public void insert_Balju_Plan2(Balju_PlanDTO BPdto) {
		sqlSession.insert("balju.insert_Balju_Plan2", BPdto);

	}

	@Override
	public void insert_Balju1(Balju_DTO Bdto) {
		sqlSession.insert("balju.insert_Balju1", Bdto); 

	}

	@Override
	public void insert_Balju2(Balju_DTO Bdto) {
		sqlSession.insert("balju.insert_Balju2", Bdto);

	}

	@Override
	public void insert_Balju_Save1(Balju_SaveDTO BSdto) {
		sqlSession.insert("balju.insert_Balju_Save1", BSdto);

	}

	@Override
	public void insert_Balju_Save2(Balju_SaveDTO BSdto) {
		sqlSession.insert("balju.insert_Balju_Save2", BSdto);

	}
	
	//품목 새창 리스트 불러오기용
	@Override
	public List<Map<String, String>> item_list(Item_DTO Idto) {
		return sqlSession.selectList("item_list", Idto);
	}
	
	@Override
	public List<Map<String, String>> balju_Dummy(Balju_PlanDTO BPdto) {
		return sqlSession.selectList("balju_Dummy", BPdto);
	}

	@Override
	public List<Map<String, String>> balju_Plan_list(Balju_PlanDTO BPdto) {
		return sqlSession.selectList("balju.balju_Plan_list", BPdto);
		
	}

	@Override
	public List<Map<String, String>> balju_List(Balju_DTO Bdto) {
		return sqlSession.selectList("balju.balju_List", Bdto); 
	}

	@Override
	public List<Map<String, String>> balju_Save_list(Balju_SaveDTO BSdto) {
		return sqlSession.selectList("balju.balju_Save_list", BSdto);
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
	public void balju_Save_modi(Balju_SaveDTO BSdto) {
		sqlSession.update("balju.balju_Save_modi", BSdto);

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

	@Override
	public void Delete_Balju_Save1(Balju_SaveDTO BSdto) {
		sqlSession.delete("balju.Delete_Balju_Save1", BSdto);

	}

	@Override
	public void Delete_Balju_Save2(Balju_SaveDTO BSdto) {
		sqlSession.delete("balju.Delete_Balju_Save2", BSdto);

	}

}
