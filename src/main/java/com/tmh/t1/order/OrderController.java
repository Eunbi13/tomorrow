package com.tmh.t1.order;

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

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.cart.CartService;
import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;
import com.tmh.t1.shipping.ShippingService;
import com.tmh.t1.shipping.ShippingVO;

@Controller
@RequestMapping("/order/**")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ShippingService shippingService;
	
	@Autowired
	private CartService cartService;
	
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
		//List<OrderVO> ar = orderService.getList(orderVO);
		
		//mv.addObject("orderList", ar);
		return mv;

	}
//	
//	@GetMapping("page")
//	public ModelAndView getPage(OrderVO orderVO)throws Exception{
//		
//		//디폴트 배송지 가져오기
//				ShippingVO shippingVO= new ShippingVO();
////				shippingVO.setUsername(username);
//				shippingVO.setDefault(true);
//				shippingVO=shippingService.getDefaultSelect(shippingVO);
//				//만약 디폴트 배송지가 없으면? 회원의 배송지넘버중 가장 작은수를 선택해서 띄운다.
//
//				//만약 배송지가 아예없으면? 입력창 띄우
//				if(shippingVO == null) {
//					
//				}
//			    orderVO.setShipNum(shippingVO.getShipNum()); 
//		
//		
////		 List<BrandVO> brandAr = cartService.getBrandList(orderVO);
////		    
////		 List<ProductVO> productAr = cartService.getProductList(orderVO);
////		    
////		     
////        List<CartVO> cartAr = cartService.getCartList(orderVO);
//		
//        	orderVO = orderService.getSelect(orderVO);
//	}
//	
	
	@GetMapping("insert")
	public void setInsert(OrderVO orderVO)throws Exception{
	
		//orderVO.setUserName(memberVO);
		// 1.장바구니에서 결제 -> cartVO validity=true 인 것만 가져오기..
		
		// 2.바로결제 -> 상품번호 가져오기 
		
		

	}
	
	@PostMapping("insert")
	public ModelAndView setInsert(OrderVO orderVO, ModelAndView mv)throws Exception{
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		orderVO.setUsername(username);
		
		CartVO cartVO = new CartVO();
		
		cartVO.setUsername(username);
		cartVO.setValid("one");

		List<CartVO> cartAr = cartService.getCartList(cartVO);

	    System.out.println(cartAr);
	
		int result = orderService.setInsert(orderVO, cartAr);
		

		mv.addObject("orderVO", orderVO);
		mv.setViewName("./page");
		
		return mv;
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
