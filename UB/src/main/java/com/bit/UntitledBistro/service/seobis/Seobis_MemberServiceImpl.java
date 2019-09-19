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

	@Override
	public void Seobis_MemberInsert(Seobis_MemberDTO seobis_MemberDTO_dto) {  //멤버 추가
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberInsert(seobis_MemberDTO_dto);
	}

	@Override
	public List<Seobis_MemberDTO> Seobis_MemberList(HashMap<String, Object> map) {    //멤버 리스트
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_MemberList(map);
	}

	@Override
	public int Seobis_MemberListCount() {  //멤버카운트(글갯수)
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_MemberListCount();
	}
	
	@Override
	public void Seobis_MemberDelete(Seobis_MemberDTO seobis_MemberDTO_dto) {  //멤버 삭제
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberDelete(seobis_MemberDTO_dto);
	}

	@Override
	public void Seobis_MemberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {	//멤버 수정
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberUpdate(seobis_MemberDTO_dto);
	}
}
