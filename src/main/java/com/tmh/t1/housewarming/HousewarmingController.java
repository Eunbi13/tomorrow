package com.tmh.t1.housewarming;

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
public class HousewarmingController {
	
	@Autowired
	private HousewarmingService housewarmingService;
	
	@Value("${housewarming.filePath}")
	private String filePath;
	
	@GetMapping("list")
	public void getList(Model model) throws Exception {
		List<HousewarmingVO> ar = housewarmingService.getList();
		model.addAttribute("list", ar);
	}
	
	@GetMapping("select")
	public void getSelect(HousewarmingVO housewarmingVO, Model model) throws Exception {
		housewarmingVO = housewarmingService.getSelect(housewarmingVO);
		model.addAttribute("vo", housewarmingVO);
	}
	
	@GetMapping("insert")
	public void setInsert(Model model, HttpSession session, Authentication auth) throws Exception {
		String username = auth.getName();
		System.out.println("************USER NAME : " + username + "******************");
		HousewarmingVO housewarmingVO = new HousewarmingVO();
		housewarmingVO.setUsername(username);
		model.addAttribute("vo", housewarmingVO);
	}
	
	@PostMapping("insert")
	public String setInsert(HousewarmingVO housewarmingVO, MultipartFile file) throws Exception {
		int result = housewarmingService.setInsert(housewarmingVO, file);
		System.out.println("Insert : " + result);
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public void setUpdate(HousewarmingVO housewarmingVO, Model model) throws Exception {
		housewarmingVO = housewarmingService.getSelect(housewarmingVO);
		model.addAttribute("vo", housewarmingVO);
//		model.addAttribute("action", "update");
//		return "board/form";
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(HousewarmingVO housewarmingVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = housewarmingService.setUpdate(housewarmingVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("delete")
	public String setDelete(HousewarmingVO housewarmingVO) throws Exception {
		int result = housewarmingService.setDelete(housewarmingVO);
		return "redirect:./list";
	}

}
