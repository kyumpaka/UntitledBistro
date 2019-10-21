package com.bit.UntitledBistro.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccess implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<String>();
		// 로그인한 계정 권한 가져오기
		for(Object roleName : authentication.getAuthorities().toArray()) {
			roleNames.add(String.valueOf(roleName));
		}
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath()+"/erp?empregister_empnum="+authentication.getName());
			return;
		}
		
		if(roleNames.contains("ROLE_MEMBER") || roleNames.contains("ROLE_MANAGER")) {
			response.sendRedirect(request.getContextPath()+"/jumun/posMain.do");
			return;
		}
		
		response.sendRedirect(request.getContextPath());
	}

}
