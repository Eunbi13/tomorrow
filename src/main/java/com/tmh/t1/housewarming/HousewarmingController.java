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
	public void getSelect(HousewarmingVO housewarmingVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		housewarmingVO = housewarmingService.getSelect(housewarmingVO);
		mv.addObject("vo", housewarmingVO);
	}
	
	@GetMapping("insert")
	public void setInsert(Model model, HttpSession session) throws Exception {
		model.addAttribute("vo", new HousewarmingVO());
		model.addAttribute("action", "insert");
	}
	
	@PostMapping("insert")
	public String setInsert(HousewarmingVO housewarmingVO, MultipartFile file)throws Exception{
		int result = housewarmingService.setInsert(housewarmingVO, file);
		System.out.println("Insert : " + result);
		return "redirect:./list";
	}

}
