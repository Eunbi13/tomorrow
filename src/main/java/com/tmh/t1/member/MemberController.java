package com.tmh.t1.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	
	
	
	@GetMapping("memberJoin")
	public String memberJoin(Model model) throws Exception{
		model.addAttribute("title", "JoinPage");
		return "member/memberJoin";
	}
	
	@PostMapping("memberJoin")
	public String memberJoin(Model model, MemberVO memberVO) throws Exception{
		model.addAttribute("title", "JoinPage");
		System.out.println(memberVO.getEmail());
		System.out.println(memberVO.getPassword());
		System.out.println(memberVO.getUserName());
		return "redirect:/";
	}
	
	@GetMapping("memberLogin")
	public String memberLogin(Model model) throws Exception{
		model.addAttribute("title", "LoginPage");
		return "member/memberJoin";
	}
}
