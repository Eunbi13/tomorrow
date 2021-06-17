package com.tmh.t1.member;

import java.util.Calendar;
import java.util.Enumeration;
import java.util.Random;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//eb_회원 탈퇴
	@GetMapping("delete")
	public String memberDelete()throws Error{
		return "member/memberDelete";
	}
	@PostMapping("delete")
	public String memberPage(MemberVO memberVO) throws Exception{
		Long result=memberService.memberDelete(memberVO);
		System.out.println("성공: "+result);
		return "redirect:/";
	}
	//eb_회원정보 수정(설정)
	@GetMapping("update")
	public String memberUpdate(Model model) throws Exception{
		model.addAttribute("memberVO",new MemberVO());
		return "member/memberUpdate";
	}
	@PostMapping("update")
	public String memberUpdate(Authentication auth, Model model, @Valid MemberVO memberVO, Errors errors)throws Exception{
		//별명(username)이 변경되었을 경우
		if(!auth.getName().equals(memberVO.getUsername())) {
			if(memberService.usernameErrors(memberVO, errors)) {
				return "member/memberUpdate";
			}
		}
		
		memberService.memberUpdate(memberVO);
		
		return "redirect:/member/memberPage";
	}
	
	//eb_마이페이지
	@GetMapping("myPage")
	public String memberPage() throws Exception{
		return "member/memberPage";
	}
	
	//eb_로그인
	@GetMapping("login")
	public String memberLogin() throws Exception{
		return "member/memberLogin";
	}
	
	@PostMapping("login")
	public String memberFailed() throws Exception{
		return "member/memberLogin";
	}

	@GetMapping("memberLoginResult")
	public String memberLoginResult(Authentication auth)throws Exception{
		//eb_로그인 성공시 홈으로
		return "redirect:/";
	}	
	
	//eb_회원가입
	@GetMapping("memberJoin")
	public String memberJoin(Model model) throws Exception{
		model.addAttribute("memberVO",new MemberVO());
		return "member/memberJoin";
	}

	@PostMapping("memberJoin")
	public String memberJoin(Model model, @Valid MemberVO memberVO, Errors errors) throws Exception{
		//valid 이메일, 패스워드 에러
		if(memberService.memberErrors(memberVO, errors)) {
			return "member/memberJoin";
		}
		//valid별명(username) 에러
		if(memberService.usernameErrors(memberVO, errors)) {
			return "member/memberUpdate";
		}
		Long result = memberService.memberJoin(memberVO);
		System.out.println("회원가입 성공: "+result);

		return "redirect:/member/login";
	}

}
