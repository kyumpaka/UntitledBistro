package com.bit.UntitledBistro.model.seobis;

import java.util.HashMap;

public interface Seobis_MemberDAO {
	//public Seobis_MemberDTO Seobis_MemberList(HashMap<String, Object> map);   //회원 리스트
	public void Seobis_MemberInsert(Seobis_MemberDTO Seobis_MemberDTO_dto);   //회원 추가
}
