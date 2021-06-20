package com.tmh.t1.orders;

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

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.cart.CartService;
import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;
import com.tmh.t1.shipping.ShippingService;
import com.tmh.t1.shipping.ShippingVO;

@Controller
@RequestMapping("/orders/**")
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ShippingService shippingService;
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("select")
	public ModelAndView getSelect(OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		ordersVO =ordersService.getSelect(ordersVO);
		List<BrandVO> brandAr = ordersService.getSelectBrandList(ordersVO);
		
		mv.addObject("brandAr", brandAr);
		mv.addObject("ordersVO", ordersVO);
        return mv;
	}
	
	@GetMapping("page")
	public ModelAndView getPage(OrdersVO ordersVO)throws Exception{
		System.out.println("page입장!!");
		ModelAndView mv = new ModelAndView();
		ordersVO =ordersService.getPage(ordersVO);
		
		mv.addObject("ordersVO", ordersVO);
        return mv;
	}
	
	
	@GetMapping("list")
	public ModelAndView getOrdersList(OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("입장!!");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		ordersVO.setUsername(username);
		
		
		System.out.println("getBefore:"+ordersVO.getBefore());
		
		CartVO cartVO = new CartVO();
		
		cartVO.setUsername(username);
		
//		ordersVO.setOrderNum(null);
		
		List<OrdersVO> ar = ordersService.getList(ordersVO);
		
    	List<BrandVO> brandAr = ordersService.getBrandList(ordersVO);
    	
		System.out.println("brandAr 완성");
		
//		List<CartVO> cartAr = ordersService.getCartList(ordersVO);
		
		List<OrdersVO> OrderAr=ordersService.getOrdersList(ordersVO);
		System.out.println("orderAr 완성");
		
		// 해당 orderNum 을 가지고, validity가 2이상인  cartVO 를 리스트로 가져온다.
		mv.addObject("ar", ar);
		mv.addObject("brandAr", brandAr);
		mv.addObject("orderAr", OrderAr);
		return mv;

	}
	
	@GetMapping("ajaxList")
	public ModelAndView getAjaxList(OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		System.out.println("입장!!");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		ordersVO.setUsername(username);
		
		
		System.out.println("getBefore:"+ordersVO.getBefore());
		System.out.println("getStatus:"+ordersVO.getStatus());
		CartVO cartVO = new CartVO();
		
		cartVO.setUsername(username);

		
		List<OrdersVO> ar = ordersService.getList(ordersVO);
		
    	List<BrandVO> brandAr = ordersService.getBrandList(ordersVO);
    	
		System.out.println("brandAr 완성");

		
		List<OrdersVO> OrderAr=ordersService.getOrdersList(ordersVO);
		System.out.println("orderAr 완성");
		
		// 해당 orderNum 을 가지고, validity가 2이상인  cartVO 를 리스트로 가져온다.
		mv.addObject("ar", ar);
		mv.addObject("brandAr", brandAr);
		mv.addObject("orderAr", OrderAr);
		return mv;
	}

	
	@GetMapping("insert")
	public void setInsert(OrdersVO ordersVO)throws Exception{
	System.out.println("겟 맵핑 입장!!");
//		//orderVO.setUserName(memberVO);
//		// 1.장바구니에서 결제 -> cartVO validity=true 인 것만 가져오기..
//		 
//		// 2.바로결제 -> 상품번호 가져오기 

	}
	@ResponseBody 
	@PostMapping("insert")
	public ModelAndView setInsert(OrdersVO ordersVO, ModelAndView mv)throws Exception{
		System.out.println("입장!!");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		ordersVO.setUsername(username);
		
		CartVO cartVO = new CartVO();
		
		cartVO.setUsername(username);
		cartVO.setValid("one");

		List<CartVO> cartAr = cartService.getCartList(cartVO);

	    System.out.println(cartAr);
	
		int result = ordersService.setInsert(ordersVO, cartAr);
		
		System.out.println("controller: "+ordersVO.getOrderNum());
		
		//디폴트 배송지 가져오기
    	ShippingVO shippingVO= new ShippingVO();
		shippingVO.setUsername(username);
		List<ShippingVO> shippingAr = shippingService.getList(shippingVO);
		if(shippingAr == null) {
			//만약 배송지가 아예없으면? 입력창 띄우기--page.jsp에서 
		} else {
			shippingVO.setIsDefault(true);
			Long DefaultNum=shippingService.getDefaultNum(shippingVO);
			shippingVO.setShipNum(DefaultNum);
			shippingVO = shippingService.getSelect(shippingVO);
			
			//만약 디폴트 배송지가 없으면? 회원의 배송지넘버중 가장 작은수를 선택해서 띄운다.
			if(shippingVO == null) {
			    shippingVO= new ShippingVO();
			    shippingVO.setUsername(username);
				Long shipNum= shippingService.getMinNum(shippingVO);
				shippingVO.setShipNum(shipNum);
				shippingVO = shippingService.getSelect(shippingVO);
			}
		
		}
		System.out.println("shippingVO:"+shippingVO);
		
		if(shippingVO != null) {
	    ordersVO.setShipNum(shippingVO.getShipNum());  
		}

        List<BrandVO> brandAr = cartService.getBrandList(cartVO);
    
        List<ProductVO> productAr = cartService.getProductList(cartVO);
    
     
      
        mv.addObject("shippingAr", shippingAr);
        mv.addObject("brandAr", brandAr);
	    mv.addObject("productAr", productAr);
	    mv.addObject("cartAr", cartAr);

        mv.addObject("shippingVO", shippingVO);
		mv.addObject("ordersVO", ordersVO);
		mv.setViewName("orders/page");
		
		return mv;
	}
	
//	@GetMapping("update")
//    public void setUpdate(OrdersVO ordersVO)throws Exception{
//	}
	
	@ResponseBody 
	@PostMapping("update")
	public ModelAndView setUpdate(OrdersVO ordersVO, ModelAndView mv)throws Exception{
		System.out.println("orders/update mapping enter!!");
		System.out.println("getName"+ordersVO.getName());
		System.out.println("getEmail"+ ordersVO.getEmail());
		System.out.println("getPhone"+ ordersVO.getPhone());


		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
		ordersVO.setUsername(username);
		int result=ordersService.setUpdate(ordersVO);
		System.out.println("almost orders/update mapping success!!");
	  
		mv.addObject("ordersVO", ordersVO);
		mv.setViewName("orders/update");
		return mv;
		
	}
	
	@ResponseBody 
	@PostMapping("ajaxUpdate")
	public int setAjaxUpdate(OrdersVO ordersVO, ModelAndView mv)throws Exception{
		System.out.println("orders/ajaxUpdate mapping enter!!");
		System.out.println("ordersVO.getShipNum():"+ordersVO.getShipNum());
		System.out.println("ordersVO.getPaymentType():"+ordersVO.getPaymentType());
		System.out.println("ordersVO.getShippingMemo():"+ordersVO.getShippingMemo());
		System.out.println("ordersV.getOrderNum()():"+ordersVO.getOrderNum());



		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
		ordersVO.setUsername(username);
		int result=ordersService.setAjaxUpdate(ordersVO);
		System.out.println("result:"+result);
		System.out.println("getItemsPrice:"+ordersVO.getItemsPrice());
		
		
	 
		return result;
		
	}
	
 
	@GetMapping("cancel")
	public ModelAndView setCancelUpdate(CartVO cartVO, OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		cartVO=cartService.getSelect(cartVO);
	
		ordersVO =ordersService.getSelect(ordersVO);
		List<BrandVO> brandAr = ordersService.getSelectBrandList(ordersVO);
		
		mv.addObject("brandAr", brandAr);
		mv.addObject("ordersVO", ordersVO);
		mv.addObject("cartVO", cartVO);
        return mv;

		
	}
	
	
	
	
	
	@ResponseBody 
	@GetMapping("delete")
	public ModelAndView setDelete(OrdersVO ordersVO)throws Exception{

		ModelAndView mv = new ModelAndView();
		
		int result = ordersService.setDelete(ordersVO);
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
