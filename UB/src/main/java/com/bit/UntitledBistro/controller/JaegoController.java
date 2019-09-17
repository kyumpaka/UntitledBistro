package com.bit.UntitledBistro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.UntitledBistro.model.jaego.MybatisTest;

@Controller
@RequestMapping(value = "/jaego")
public class JaegoController {
	@Autowired
	private MybatisTest mybatis;
	
	
	@RequestMapping(value = "/mybatis")
	public String mybatis() {
		mybatis.test();
		return "jaego/test";
	}
}
