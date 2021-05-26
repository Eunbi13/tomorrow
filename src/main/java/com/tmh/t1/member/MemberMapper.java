package com.tmh.t1.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	
	public Long memberJoin(MemberVO memberVO)throws Exception;
	public Long emailCheck(MemberVO memberVO)throws Exception;
	public Long usernameCheck(MemberVO memberVO)throws Exception;
	
	
	
}
