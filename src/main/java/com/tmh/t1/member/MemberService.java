package com.tmh.t1.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Errors;

@Service
public class MemberService implements UserDetailsService{
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public boolean memberErrors(MemberVO memberVO, Errors errors)throws Exception{
		boolean check = errors.hasErrors();
		
		if(!memberVO.getPassword().equals(memberVO.getPasswordCheck())) {
			//password check
			errors.rejectValue("passwordCheck", "memberVO.password.NotEqual");
			check=true;
		}
		
		if(memberMapper.emailCheck(memberVO)>0) {
			//email check 0보다 클경우 중복데이터
			errors.rejectValue("email", "memberVO.email.has");
			check=true;
		}
		
		if(memberMapper.usernameCheck(memberVO)>0) {
			//userName check 0보다 클경우 중복데이터
			errors.rejectValue("username", "memberVO.username.has");
			check=true;
		}
		
		return check;
	}
//======join=====	
	@Transactional(rollbackFor = Exception.class)
	public Long memberJoin(MemberVO memberVO)throws Exception{
		
		memberVO.setPassword(passwordEncoder.encode(memberVO.getPassword()));
		
		Long result = memberMapper.memberJoin(memberVO);
		if(result<1) {
			throw new Exception();
		}
		return result;
	}
//======Login=====	
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
