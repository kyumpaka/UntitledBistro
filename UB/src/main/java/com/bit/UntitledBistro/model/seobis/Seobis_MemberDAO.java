package com.bit.UntitledBistro.model.seobis;

import java.util.HashMap;
import java.util.List;

public interface Seobis_MemberDAO {
	public List<Seobis_MemberDTO> Seobis_MemberList(HashMap<String, Object> map);   //회원 리스트
	public void Seobis_MemberInsert(Seobis_MemberDTO seobis_MemberDTO_dto);   //회원 추가
	public int Seobis_MemberListCount(); // 글 갯수
	public void Seobis_MemberDelete(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 삭제
	public void Seobis_MemberUpdate(Seobis_MemberDTO seobis_MemberDTO_dto); //회원 수정
}
