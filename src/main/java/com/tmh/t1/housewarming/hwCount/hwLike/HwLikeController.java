package com.tmh.t1.housewarming.hwCount.hwLike;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.housewarming.hwCount.HwCountVO;
import com.tmh.t1.member.MemberVO;

@Controller
@RequestMapping("/hwLike/**")
public class HwLikeController {
	
	@Autowired
	private HwLikeService hwLikeService;
	
	@GetMapping("hwLikeList")
	public void getList(HwCountVO hwCountVO, Model model) throws Exception {
		List<HwCountVO> ar = hwLikeService.getList(hwCountVO);
		model.addAttribute("list", ar);
	}
	
	@PostMapping("hwLikeInsert")
	public ModelAndView setInsert(HwLikeVO hwLikeVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = hwLikeService.setInsert(hwLikeVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@PostMapping("hwLikeDelete")
	public void setDelete(int hwLikeNum) throws Exception {
		System.out.println("Start");
		
		System.out.println("finish");
	}
}
