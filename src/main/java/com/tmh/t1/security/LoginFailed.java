package com.tmh.t1.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailed implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("로그인 실패");
		
		String errorCode = exception.getClass().toString();
		errorCode=errorCode.substring(errorCode.lastIndexOf(".")+1);
		
		String message="";
		switch (errorCode) {
		case "InternalAuthenticationServiceException":
			message="없는 이메일";
			break;
		case "BadCredentialsException":
			message="비번 실수";
			break;
		default:
			message="실패";
			break;
		}
		
		request.setAttribute("message", message);
		request.getRequestDispatcher("/member/login").forward(request, response);;
	}
}
