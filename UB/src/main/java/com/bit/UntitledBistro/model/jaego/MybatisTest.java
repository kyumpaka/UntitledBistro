package com.bit.UntitledBistro.model.jaego;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisTest {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void test() {
		mybatis.getConnection();
		System.out.println("연결이 되는구나!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	}
}
