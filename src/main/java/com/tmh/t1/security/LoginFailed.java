package com.tmh.t1.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.validation.Errors;

public class LoginFailed implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		System.out.println("로그인 실패");
		
		String errorCode = exception.getClass().toString();
		errorCode=errorCode.substring(errorCode.lastIndexOf(".")+1);
		
		
		String message=""; //message.properties Key
		switch (errorCode) {
		case "InternalAuthenticationServiceException":
			message="login.email.not";
			break;
		case "BadCredentialsException":
			message="login.password.not";
			break;
		default:
			message="login.not";
			break;
		}
		
		request.setAttribute("message", message);
		request.getRequestDispatcher("/member/login").forward(request, response);
	}
}
