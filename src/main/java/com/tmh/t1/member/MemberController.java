package com.tmh.t1.member;

import java.util.Enumeration;

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

	//update
	@GetMapping("update")
	public String memberUpdate(Model model) throws Exception{
		model.addAttribute("memberVO",new MemberVO());
		return "member/memberUpdate";
	}
	@PostMapping("update")
	public String memberUpdate(Authentication auth, Model model, @Valid MemberVO memberVO, Errors errors)throws Exception{
//		if(auth.getName()!=memberVO.getUsername()) {
//			memberService.usernameErrors(memberVO, errors);
//		}
		memberService.memberUpdate(memberVO);
		System.out.println(memberVO.getBirthDay());
		
		return "member/memberPage";
	}
	
//myPage
	@GetMapping("myPage")
	public String memberPage() throws Exception{
		return "member/memberPage";
	}
	
	
//login	
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
		
		System.out.println("email: "+auth.getName());
		System.out.println("VO: "+auth.getPrincipal());
		System.out.println("auth: "+auth.getAuthorities());

		System.out.println("login성공");
		return "redirect:/";
	}	
	
//join	
	@GetMapping("memberJoin")
	public String memberJoin(Model model) throws Exception{
		model.addAttribute("memberVO",new MemberVO());
		return "member/memberJoin";
	}

	@PostMapping("memberJoin")
	public String memberJoin(Model model, @Valid MemberVO memberVO, Errors errors) throws Exception{

		if(memberService.memberErrors(memberVO, errors)) {
			return "member/memberJoin";
		}

		Long result = memberService.memberJoin(memberVO);
		System.out.println("회원가입 성공: "+result);

		return "redirect:/member/login";
	}

}
