package com.bit.UntitledBistro.service.seobis;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDAO;
import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
import com.bit.UntitledBistro.model.seobis.Seobis_ReserveDTO;

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
	public void Seobis_MemberDelete(Seobis_MemberDTO seobis_MemberDTO_dto) {  //멤버 삭제
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberDelete(seobis_MemberDTO_dto);
	}

	@Override
	public void Seobis_MemberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {	//멤버 수정
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_MemberUpdate(seobis_MemberDTO_dto);
	}
	
	@Override
	public Seobis_MemberDTO Seobis_MemberSelect(String member_id) {    //멤버 읽기
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_MemberSelect(member_id);
	}

	@Override
	public void Seobis_PointUpdate(Seobis_MemberDTO seobis_MemberDTO_dto) {         //포인트 수정
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_PointUpdate(seobis_MemberDTO_dto);
	}
	
	@Override
	public int Seobis_ReserveAdd(Seobis_ReserveDTO seobis_ReserveDTO_dto) {     //예약 추가
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_ReserveAdd(seobis_ReserveDTO_dto);
	}

	@Override
	public List<Seobis_ReserveDTO> Seobis_ReserveSelect() {      //예약 읽기
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_ReserveSelect();
	}
	
	@Override
	public int Seobis_MemberListCount(String reserve_member_id) {        //예약 체크
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reserve_member_id", reserve_member_id);
		return seobis_MemberDAO.Seobis_MemberListCount(map);
	}
	
	@Override
	public int Seobis_ReserveUpdate(Seobis_ReserveDTO seobis_ReserveDTO_dto) {            //예약 수정
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		return seobis_MemberDAO.Seobis_ReserveUpdate(seobis_ReserveDTO_dto);
	}

	@Override
	public Seobis_ReserveDTO Seobis_ReserveSelectByNum(String reserve_num) {
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("reserve_num", reserve_num);
		
		return seobis_MemberDAO.Seobis_ReserveSelectByNum(map);
	}

	@Override
	public void Seobis_ReserveDelete(Seobis_ReserveDTO seobis_ReserveDTO_dto) {
		Seobis_MemberDAO seobis_MemberDAO = SqlSession.getMapper(Seobis_MemberDAO.class);
		seobis_MemberDAO.Seobis_ReserveDelete(seobis_ReserveDTO_dto);
	}

	/*
	 * @Override public Seobis_ReserveDTO Seobis_ReserveCalendar(String member_id) {
	 * // 캘린더 예약 Seobis_MemberDAO seobis_MemberDAO =
	 * SqlSession.getMapper(Seobis_MemberDAO.class); return
	 * seobis_MemberDAO.Seobis_ReserveCalendar(member_id); }
	 * 
	 * @Override public List<Seobis_ReserveDTO> Seobis_ReserveCalendarList(String
	 * member_id) { //캘린더 리스트 Seobis_MemberDAO seobis_MemberDAO =
	 * SqlSession.getMapper(Seobis_MemberDAO.class); return
	 * seobis_MemberDAO.Seobis_ReserveCalendarList(member_id); }
	 */
	
}
