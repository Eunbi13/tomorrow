package com.tmh.t1.housewarming.hwTag;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.member.MemberVO;

@Controller
@RequestMapping("/housewarming/**")
public class HwTagController {
	
	@Autowired
	private HwTagService hwTagService;
	
	@GetMapping("selectTag")
	public void getSelect(HwTagVO hwTagVO, Model model) throws Exception {
		hwTagVO = hwTagService.getSelect(hwTagVO);
		model.addAttribute("vo", hwTagVO);
	}
	
	@PostMapping("selectTag")
	public String setInsert(HwTagVO hwTagVO) throws Exception {
		int result = hwTagService.setInsert(hwTagVO);
		System.out.println("Insert : " + result);
		return "redirect:./list";
	}

}
