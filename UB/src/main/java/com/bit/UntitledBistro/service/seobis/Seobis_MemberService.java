package com.bit.UntitledBistro.service.seobis;

import java.util.HashMap;
import java.util.List;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;
import com.bit.UntitledBistro.model.seobis.Seobis_ReserveDTO;

public interface Seobis_MemberService {
	public List<Seobis_MemberDTO> Seobis_MemberList(HashMap<String, Object> map);   //회원 리스트
	public void Seobis_MemberInsert(Seobis_MemberDTO seobis_MemberDTO_dto);   //회원 추가
	public void Seobis_MemberDelete(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 삭제
	public void Seobis_MemberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 수정
	public Seobis_MemberDTO Seobis_MemberSelect(String member_id); // 회원 읽기
	public void Seobis_PointUpdate(Seobis_MemberDTO seobis_MemberDTO_dto); //포인트 수정
	public int Seobis_MemberListCount(String reserve_member_id); //예약 카운트 비교
	
	public int Seobis_ReserveAdd(Seobis_ReserveDTO seobis_ReserveDTO_dto); // 예약 추가
	public int Seobis_ReserveUpdate(Seobis_ReserveDTO seobis_ReserveDTO_dto); //예약 수정
	public List<Seobis_ReserveDTO> Seobis_ReserveSelect(); // 예약 읽기
	public void Seobis_ReserveDelete(Seobis_ReserveDTO seobis_ReserveDTO_dto); //예약 삭제
	public Seobis_ReserveDTO Seobis_ReserveSelectByNum(String reserve_num);
}