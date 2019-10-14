package com.bit.UntitledBistro.model.seobis;

import java.util.HashMap;
import java.util.List;


public interface Seobis_MemberDAO {
	public List<Seobis_MemberDTO> Seobis_MemberList(HashMap<String, Object> map);   //회원 리스트
	public void Seobis_MemberInsert(Seobis_MemberDTO seobis_MemberDTO_dto);   //회원 추가
	public void Seobis_MemberDelete(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 삭제
	public int Seobis_MemberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 수정
	public Seobis_MemberDTO Seobis_MemberSelect(String member_id); // 회원 읽기
	
	/*
	 * public Seobis_ReserveDTO Seobis_ReserveCalendar(String member_id); // 캘린더 예약
	 * public List<Seobis_ReserveDTO> Seobis_ReserveCalendarList(String member_id);
	 * //캘린더 리스트 public String Seobis_ClickCalendar(String member_id); // 캘린더 클릭
	 */	
	
	/*
	 * public Seobis_ReserveDTO Seobis_ReservePoint(String member_id); // 포인트 읽기
	 * 
	 */}
