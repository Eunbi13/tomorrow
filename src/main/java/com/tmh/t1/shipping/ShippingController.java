package com.tmh.t1.shipping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;





@Controller
@RequestMapping("/shipping/**")
public class ShippingController {
	
	@Autowired
	private ShippingService shippingService;
	
	//셀렉트
		@GetMapping("shippingSelect")
		public ModelAndView getSelect(ShippingVO shippingVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			shippingVO = shippingService.getSelect(shippingVO);
			mv.addObject("dto", shippingVO);
			mv.setViewName("shpping/shippingSelect");
			return mv;
		}
	
	//리스트
	@GetMapping("shippingList")
	public ModelAndView getList(ShippingVO shippingVO, HttpSession session, ModelAndView mv)throws Exception{
	//	MemberVO memberVO= (MemberVO) session.getAttribute("member");
	//	shippingVO.setUsername(memberVO.getUsername());
		
		List<ShippingVO> ar = shippingService.getList(shippingVO);
		
		
		mv.addObject("list", ar);
		mv.addObject("vo", shippingVO);
		mv.setViewName("shipping/shippingList");
		return mv;
	}
	
	//삽입
		@GetMapping("shippingInsert")
		public void setInsert(ShippingVO shippingVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			mv.addObject("dto", shippingVO);
			mv.setViewName("shipping/shippingInsert");
		}
		
		@PostMapping("shippingInsert")
		public String setInsert(ShippingVO shippingVO, Model model)throws Exception{
			int result = shippingService.setInsert(shippingVO);

			return "redirect:./shippingList";
			
		}
		
		//삭제
		@RequestMapping("shippingDelete")
		public ModelAndView setDelete(ShippingVO shippingVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			int result = shippingService.setDelete(shippingVO);
			
			String message = "삭제에 실패하였습니다";
			String path = "./shippingList";
			
			if(result>0) {
				message="삭제 되었습니다";
			}
			mv.addObject("msg", message);
			mv.addObject("path", path);
			mv.setViewName("common/commonResult");
			return mv;
		}
		
		//수정
		@GetMapping("shippingUpdate")
		public void setUpdate(ShippingVO shippingVO, Model model)throws Exception{
			shippingVO = shippingService.getSelect(shippingVO);
			model.addAttribute("vo", shippingVO);
		}
		
		@PostMapping("shippingUpdate")
		public String setUpdate(ShippingVO shippingVO)throws Exception{
			int result = shippingService.setUpdate(shippingVO);
			return "redirect:./shippingList";
		}
		
		
		
		

}
