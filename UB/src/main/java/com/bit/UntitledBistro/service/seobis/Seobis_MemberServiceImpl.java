package com.bit.UntitledBistro.service.seobis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDAO;
import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;

@Component
public class Seobis_MemberServiceImpl implements Seobis_MemberService {
	
	@Autowired
	private SqlSession SqlSession;
	
	/*
	 * @Override public Seobis_MemberDTO Seobis_MemberList(HashMap<String, Object>
	 * map) { //회원 리스트 Seobis_MemberDAO seobis_MemberDAO =
	 * SqlSession.getMapper(Seobis_MemberDAO.class);
	 * 
	 * return seobis_MemberDAO.Seobis_MemberList(map); }
	 */

	@Override
	public void Seobis_MemberInsert(Seobis_MemberDTO Seobis_MemberDTO_dto) {
//		System.out.println("마이바티스 시작");
//		SqlSession.insert("com.bit.UntitledBistro.model.seobis.Seobis_MemberDAO.Seobis_joinUs", Seobis_MemberDTO_dto);
//		System.out.println("마이바티스 끝");
		System.out.println("ddd");
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberInsert(Seobis_MemberDTO_dto);
	}

	@Override
	public List<Seobis_MemberDTO> Seobis_MemberList(HashMap<String, Object> map) {
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_MemberList(map);
	}
	
}
