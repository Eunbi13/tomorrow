package com.tmh.t1.member;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextImpl;
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
	
//========join========	
	@GetMapping("join")
	public String memberJoin(Model model) throws Exception{
		model.addAttribute("memberVO",new MemberVO());
		return "member/memberJoin";
	}
	
	@PostMapping("join")
	public String memberJoin(Model model, @Valid MemberVO memberVO, Errors errors) throws Exception{
		if(memberService.memberErrors(memberVO, errors)) {
			return "member/memberJoin";
		}
		
		Long result = memberService.memberJoin(memberVO);
		System.out.println("회원가입 성공: "+result);
		
		return "redirect:/";
	}
//=======login========	
	@GetMapping("login")
	public String memberLogin() throws Exception{
		return "member/memberLogin";
	}
	
	@GetMapping("memberLoginResult")
	public String memberLoginResult(HttpSession session, Authentication auth)throws Exception{
		
		Enumeration<String> eu=session.getAttributeNames();

		while(eu.hasMoreElements()) {
			System.out.println("이름: "+eu.nextElement());
		}
		Object obj = session.getAttribute("SPRING_SECURITY_CONTEXT");
		SecurityContextImpl sc = (SecurityContextImpl)obj;
		auth = sc.getAuthentication();
		
		System.out.println("login성공");
		return "redirect:/";
	}
	

	
}
