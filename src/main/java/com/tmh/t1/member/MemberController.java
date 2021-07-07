package com.tmh.t1.member;

import java.util.Calendar;
import java.util.Enumeration;
import java.util.Random;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.util.FileManager;

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
	public String memberUpdate(Authentication auth,MultipartFile profileImage, Model model, @Valid MemberVO memberVO, Errors errors)throws Exception{
		
		//사용자가 별명(username)을 변경 하는 경우
		if(!auth.getName().equals(memberVO.getUsername())) {
			System.out.println("username change");
			if(memberService.usernameErrors(memberVO, errors)) {
				//이미 있는 이름이므로 view로 돌아간다.
				return "member/memberUpdate";
				
			}
		}
		String filename =memberService.memberUpdate(auth, memberVO,  profileImage);
		//session에 담기는 정보 수정
		MemberVO mem=(MemberVO)auth.getPrincipal();
		mem.setUsername(memberVO.getUsername());
		mem.setHomePage(memberVO.getHomePage());
		mem.setGender(memberVO.getGender());
		mem.setBirthDay(memberVO.getBirthDay());
		mem.setIntro(memberVO.getIntro());
		mem.setProfileImage(filename);
		
		return "redirect:/member/myPage";
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
	public String memberJoin(@Valid MemberVO memberVO, Errors errors, Model model) throws Exception{
		//valid 이메일, 패스워드 에러
		if(memberService.memberErrors(memberVO, errors)) {
			return "member/memberJoin";
		}
		//valid별명(username) 에러
		if(memberService.usernameErrors(memberVO, errors)) {
			return "member/memberJoin";
		}
		Long result = memberService.memberJoin(memberVO);
		if(result<1) {
			return "member/memberJoin";
		}
		
		return "redirect:/member/login";
	}

}
