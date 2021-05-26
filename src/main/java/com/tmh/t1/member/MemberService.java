package com.tmh.t1.member;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;

@Service
public class MemberService {
	
	
	
	public boolean memberErrors(MemberVO memberVO, Errors errors)throws Exception{
		boolean check = errors.hasErrors();
		
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			errors.rejectValue("passwordCheck", "memberVO.password.NotEqual");
			check=true;
		}
		
		return check;
	}
}
