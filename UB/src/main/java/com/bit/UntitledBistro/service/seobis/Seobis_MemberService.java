package com.bit.UntitledBistro.service.seobis;

import java.util.HashMap;

import com.bit.UntitledBistro.model.seobis.Seobis_MemberDTO;

public interface Seobis_MemberService {
	//public Seobis_MemberDTO Seobis_MemberList(HashMap<String, Object> map);   //회원 리스트
	public void Seobis_MemberInsert(Seobis_MemberDTO Seobis_MemberDTO_dto);   //회원 추가
}
