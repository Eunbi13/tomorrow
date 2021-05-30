package com.tmh.t1.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.shipping.ShippingService;
import com.tmh.t1.shipping.ShippingVO;

@Controller
@RequestMapping("/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ShippingService shippingService;
	
	@GetMapping("select")
	public ModelAndView getSelect(OrderVO orderVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		orderVO =orderService.getSelect(orderVO);
		
		mv.addObject("orderVO", orderVO);
        return mv;
	}
	
	@GetMapping("list")
	public ModelAndView getList(OrderVO orderVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<OrderVO> ar = orderService.getList(orderVO);
		
		mv.addObject("orderList", ar);
		return mv;

	}
	
	
	@GetMapping("insert")
	public ModelAndView setInsert(OrderVO orderVO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		//MemberVO memberVO=(MemberVO)session.getAttribute("member");
		//디폴트 배송지 가져오기
		ShippingVO shippingVO= new ShippingVO();
		shippingVO.setUsername("id1");
		shippingVO.setShipNum(1L);
		//shippingVO=shippingService.getSelect(shippingVO);
		System.out.println(shippingVO);
		//List<ShippingVO> shipArr =shippingService.getList(shippingVO);
		//아이디는 input hidden에 넣기 
		orderVO.setUserName("id1");
		//orderVO.setUserName(memberVO);
		// 1.장바구니에서 결제 -> cartVO validity=true 인 것만 가져오기..
		
		// 2.바로결제 -> 상품번호 가져오기 
		
	
		//mv.addObject("shipArr", shipArr);
		
		mv.addObject("shippingVO", shippingVO);
		mv.addObject("orderVO", orderVO);
		
		return mv;
	}
	
	@PostMapping("insert")
	public String setInsert(OrderVO orderVO)throws Exception{
		int result =orderService.setInsert(orderVO);
		return "../";
	}
	
	
	@GetMapping("delete")
	public ModelAndView setDelete(OrderVO orderVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = orderService.setDelete(orderVO);
		String message="삭제 실패";
		String path="./";
		
		if(result>0) {
			message="삭제 성공";
			path="./list";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");
		return mv;
	}

}
