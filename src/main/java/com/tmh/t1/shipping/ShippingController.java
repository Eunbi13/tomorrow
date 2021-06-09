package com.tmh.t1.shipping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
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
		    mv.addObject("shippingVO", shippingVO);
		
			return mv;
		}
	
	//리스트
	@GetMapping("shippingList")
	public ModelAndView getList(ShippingVO shippingVO,  ModelAndView mv)throws Exception{
		System.out.println("리스트 입장!");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		shippingVO.setUsername(username);
		
		List<ShippingVO> ar = shippingService.getList(shippingVO);
	    System.out.println("리스트 성공!");
		
		mv.addObject("shippingAr", ar);
		mv.addObject("vo", shippingVO);
	
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
			System.out.println("shippingInsert 입장성공");
			System.out.println(shippingVO.getIsDefault());
			System.out.println(shippingVO.getShipName());
		
			int result = shippingService.setInsert(shippingVO);
			System.out.println("입력성공");
			return "redirect:./";
			
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
