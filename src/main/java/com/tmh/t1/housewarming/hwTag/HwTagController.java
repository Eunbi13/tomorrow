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

import com.tmh.t1.housewarming.HousewarmingService;
import com.tmh.t1.housewarming.HousewarmingVO;
import com.tmh.t1.member.MemberVO;

@Controller
//@RequestMapping("/hwTag/**")
public class HwTagController {
	
	@Autowired
	private HwTagService hwTagService;
	@Autowired
	private HousewarmingService housewarmingService;
	
	@GetMapping("/housewarming/selectTag")
	public void getSelect(HousewarmingVO housewarmingVO, HwTagVO hwTagVO, Model model) throws Exception {
		hwTagVO = hwTagService.getSelect(hwTagVO);
		model.addAttribute("tag", hwTagVO);
		housewarmingVO = housewarmingService.getSelect(housewarmingVO);
		model.addAttribute("vo", housewarmingVO);
	}
	
	@PostMapping("/hwTag/hwTagInsert")
	public ModelAndView setInsert(HwTagVO hwTagVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = hwTagService.setInsert(hwTagVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

}
