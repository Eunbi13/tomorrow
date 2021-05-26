package com.tmh.t1.member;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
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
		
		return "redirect:/";
	}
	
	@GetMapping("memberLogin")
	public String memberLogin(Model model) throws Exception{
		model.addAttribute("title", "LoginPage");
		return "member/memberJoin";
	}
}
