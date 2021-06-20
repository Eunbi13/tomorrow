package com.tmh.t1.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	//eb_회원가입
	public Long memberJoin(MemberVO memberVO)throws Exception;
	public Long setRole(Map<String, String> map)throws Exception;
	//eb_errors
	public Long emailCheck(MemberVO memberVO)throws Exception;
	public Long usernameCheck(MemberVO memberVO)throws Exception;
	//eb_로그인
	public MemberVO memberLogin(MemberVO memberVO);
	//eb_회원정보 수정
	public Long memberUpdate(MemberVO memberVO)throws Exception;
	//eb_회원탈퇴
	public Long memberDelete(MemberVO memberVO)throws Exception;
}
