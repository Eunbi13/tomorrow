package com.tmh.t1.housewarming.hwReply;

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

import com.tmh.t1.member.MemberVO;
import com.tmh.t1.util.Pager;

@Controller
@RequestMapping("/hwReply/**")
public class HwReplyController {
	
	@Autowired
	private HwReplyService hwReplyService;
	
	@GetMapping("hwReplyList")
	public void getList(HwReplyVO hwReplyVO, Model model, Pager pager) throws Exception {
		System.out.println(hwReplyVO.getHwNum());
		List<HwReplyVO> ar = hwReplyService.getList(pager);
		model.addAttribute("list", ar);
	}
	
	@PostMapping("hwReplyInsert")
	public ModelAndView setInsert(HwReplyVO hwReplyVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = hwReplyService.setInsert(hwReplyVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}

	@PostMapping("hwReplyDelete")
	@ResponseBody
	public void setDelete(int hwReplyNum) throws Exception {
		System.out.println("Start");
		
		System.out.println("finish");
	}
}
