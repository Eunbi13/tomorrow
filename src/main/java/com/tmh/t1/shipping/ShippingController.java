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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;





@Controller
@RequestMapping("/shipping/**")
public class ShippingController {
	
	@Autowired
	private ShippingService shippingService;
	
	//minkyung_가장 작은 shipNum을 찾아(기본 배송지가 없는 경우, 가장 먼저 쓰던 배송지를 불러온다)
	@ResponseBody
	@GetMapping("minNum")
	public Long getMinNum(ShippingVO shippingVO)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		shippingVO.setUsername(username);
		return shippingService.getMinNum(shippingVO);
	}
	
	//minkyung_배송지 선택
    @ResponseBody
	@GetMapping("shippingSelect")
	public ModelAndView getSelect(ShippingVO shippingVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
	    shippingVO = shippingService.getSelect(shippingVO);
	    System.out.println("뭘까 shippingVO.getShipNum()"+shippingVO.getShipNum());
	    
	    mv.addObject("shippingVO", shippingVO);
	
		return mv;
	}

   //minkyung_배송지 리스트
    @ResponseBody
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
	
        //minkyung_배송지 추가
		@GetMapping("shippingInsert")
		public void setInsert(ShippingVO shippingVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			mv.addObject("dto", shippingVO);
			mv.setViewName("shipping/shippingInsert");
		}
		
		@ResponseBody
		@PostMapping("shippingInsert")
		public int setInsert(ShippingVO shippingVO, Model model)throws Exception{
			System.out.println("shippingInsert 입장성공");
			System.out.println(shippingVO.getIsDefault());
			System.out.println(shippingVO.getShipName());
		
			int result = shippingService.setInsert(shippingVO);
			
			System.out.println("입력성공");
			return result;
		}
		
		//minkyung_배송지 삭제
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
		
		//minkyung_배송지 수정
		@GetMapping("shippingUpdate")
		public void setUpdate(ShippingVO shippingVO, Model model)throws Exception{
			shippingVO = shippingService.getSelect(shippingVO);
			model.addAttribute("shipVO", shippingVO);
		}
		@ResponseBody
		@PostMapping("shippingUpdate")
		public int setUpdate(ShippingVO shippingVO)throws Exception{
			System.out.println("shippingupdate 입장성공");
			int result = shippingService.setUpdate(shippingVO);
			System.out.println("shippingupdate 입력 성공");
	     return result;
		}
		
		
		//배송지 입력, 수정시 기본배송지 지정할 경우, 원래 기본배송지이던 배송지의 default를 false로 바꾼다. 
		@ResponseBody
		@PostMapping("shippingDefaultUpdate")
		public int setDefaultUpdate(ShippingVO shippingVO)throws Exception{
			int result = shippingService.setDefaultUpdate(shippingVO);
			System.out.println("default update 입력 성공");
			return result;
		}
		
		
		
		

}
