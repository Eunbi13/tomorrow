package com.tmh.t1.member;

import org.hibernate.validator.constraints.Length;

import lombok.Data;

@Data
public class MemberVO {
	private String email;
	@Length(max = 15, min = 2)
	private String userName;
	private String password;
	private boolean enabled;
	
	
	private String homePage;
	private String gender;
	private String intro;
	private String profileImage;

	
//권한 부분은 수정 필요
//brandVO 
}
