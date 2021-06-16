package com.tmh.t1.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	public Long memberJoin(MemberVO memberVO)throws Exception;
	public Long emailCheck(MemberVO memberVO)throws Exception;
	public Long usernameCheck(MemberVO memberVO)throws Exception;
	public Long setRole(Map<String, String> map)throws Exception;
	
	public MemberVO memberLogin(MemberVO memberVO);
	
	public Long memberUpdate(MemberVO memberVO)throws Exception;
	
}
