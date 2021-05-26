package com.tmh.t1.member;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.Length;
import lombok.Data;

@Data
public class MemberVO {
	@NotEmpty
	@Email
	private String email;
	@NotEmpty
	@Length(max=15, min=2)
	private String username;
	@NotEmpty
	@Length(max=15, min=8)
	private String password;
	@NotEmpty
	private String passwordCheck;
	private boolean enabled;
	
	
	private String homePage;
	private String gender;
	private String intro;
	private String profileImage;

	
//권한 부분은 수정 필요
//brandVO 
}
