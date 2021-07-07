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
import com.tmh.t1.cart.CartMapper;
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
	
	
	//minkyung_주문상세보기
	@GetMapping("select")
	public ModelAndView getSelect(OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		ordersVO =ordersService.getSelect(ordersVO);
		List<BrandVO> brandAr = ordersService.getSelectBrandList(ordersVO);
		
		mv.addObject("brandAr", brandAr);
		mv.addObject("ordersVO", ordersVO);
        return mv;
	}
	
	//minkyung_주문/결제 페이지
	@GetMapping("page")
	public ModelAndView getPage(OrdersVO ordersVO)throws Exception{
		System.out.println("page입장!!");
		ModelAndView mv = new ModelAndView();
		ordersVO =ordersService.getPage(ordersVO);
		
		mv.addObject("ordersVO", ordersVO);
        return mv;
	}
	
	//minkyung_주문배송내역 조회
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

		
		List<OrdersVO> ar = ordersService.getList(ordersVO);
		
    	List<BrandVO> brandAr = ordersService.getBrandList(ordersVO);
		System.out.println("brandAr 완성");
		// 해당 orderNum 을 가지고, validity가 2이상인  cartVO 를 리스트로 가져온다.
		List<OrdersVO> orderAr=ordersService.getOrdersList(ordersVO);

		mv.addObject("ar", ar);
		mv.addObject("brandAr", brandAr);
		mv.addObject("orderAr", orderAr);
		
		ordersVO.setStatus((long)2);
		List<CartVO> ar2 = ordersService.getCartList(ordersVO);
		ordersVO.setStatus((long)3);
		List<CartVO> ar3 = ordersService.getCartList(ordersVO);
		ordersVO.setStatus((long)4);
		List<CartVO> ar4 = ordersService.getCartList(ordersVO);
		ordersVO.setStatus((long)5);
		List<CartVO> ar5 = ordersService.getCartList(ordersVO);
		ordersVO.setStatus((long)6);
		List<CartVO> ar6 = ordersService.getCartList(ordersVO);
	
		
		mv.addObject("ar2", ar2);
		mv.addObject("ar3", ar3);
		mv.addObject("ar4", ar4);
		mv.addObject("ar5", ar5);
		mv.addObject("ar6", ar6);
		
		
		return mv;
	}
	
	
	// minkyung_주문배송내역 조회: orders/list.jsp에서 기간,주문상태별 검색 시 리스트 갱신
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
		
		List<OrdersVO> OrderAr=ordersService.getOrdersList(ordersVO);
		
		// 해당 orderNum 을 가지고, validity가 2이상인  cartVO 를 리스트로 가져온다.
		mv.addObject("ar", ar);
		mv.addObject("brandAr", brandAr);
		mv.addObject("orderAr", OrderAr);
		return mv;
	}

	
	// minkyung_주문배송내역 조회: orders/list.jsp에서 기간,주문상태별 검색 시  상태별 숫자 갱신
		@GetMapping("ajaxNum")
		public ModelAndView getAjaxNum(OrdersVO ordersVO)throws Exception{
			ModelAndView mv = new ModelAndView();
			System.out.println("입장!!");
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
			UserDetails userDetails = (UserDetails)principal; 
			String username = userDetails.getUsername();
			ordersVO.setUsername(username);
			System.out.println("getBefore:"+ordersVO.getBefore());
			
			
			ordersVO.setStatus((long)2);
			List<CartVO> ar2 = ordersService.getCartList(ordersVO);
			ordersVO.setStatus((long)3);
			List<CartVO> ar3 = ordersService.getCartList(ordersVO);
			ordersVO.setStatus((long)4);
			List<CartVO> ar4 = ordersService.getCartList(ordersVO);
			ordersVO.setStatus((long)5);
			List<CartVO> ar5 = ordersService.getCartList(ordersVO);
			ordersVO.setStatus((long)6);
			List<CartVO> ar6 = ordersService.getCartList(ordersVO);
		
			
			mv.addObject("ar2", ar2);
			mv.addObject("ar3", ar3);
			mv.addObject("ar4", ar4);
			mv.addObject("ar5", ar5);
			mv.addObject("ar6", ar6);
			
			
			return mv;
		}
	
	@GetMapping("insert")
	public void setInsert(OrdersVO ordersVO)throws Exception{

	}
	
	// minkyung_ 장바구니에서 결제페이지로 이동
	@ResponseBody 
	@PostMapping("insert")
	public ModelAndView setInsert(OrdersVO ordersVO, ModelAndView mv)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		ordersVO.setUsername(username);
		
		CartVO cartVO = new CartVO();
		
		cartVO.setUsername(username);
		cartVO.setValid("one");

		List<CartVO> cartAr = cartService.getCartList(cartVO);

		int result = ordersService.setInsert(ordersVO);
		
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
	
	// minkyung_결제페이지에셔 결제버튼 누를시 시행
	@GetMapping("update")
	public ModelAndView setUpdate(OrdersVO ordersVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
		ordersVO.setUsername(username);
		mv.addObject("ordersVO", ordersVO);
		mv.setViewName("orders/update");
		return mv;
	}
	
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
	
	// minkyung_주문배송조회에서 취소/환불/교환 신청시
	@GetMapping("cancel")
	public ModelAndView setCancelUpdate(CartVO cartVO, int kind)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		String sel="취소";
		
		if(kind==2) {
			sel="환불";
		} else if(kind==3) {
			sel="교환";
		}
		
		cartVO=cartService.getSelect(cartVO);
	
		mv.addObject("sel", sel);
		mv.addObject("cartVO", cartVO);
        return mv;
	}
	
	// 취소, 반품, 교환
	@PostMapping("cancel")
	public ModelAndView setCancelUpdate(CartVO cartVO, ModelAndView mv)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
		cartVO.setUsername(username);
		int result =cartService.setCancelUpdate(cartVO);
		String message="신청 실패";
		String path="./";
		
		if(result>0) {
			message="신청 성공";
			path="./update?status=11";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		mv.addObject("cartVO", cartVO);
		
		mv.setViewName("common/commonResult");

		
        return mv;
	}
	
	// orders/select 나  orders/list에서 구매 확정 클릭시
	@GetMapping("confirm")
	public ModelAndView setConfirmUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		cartVO.setValidity((long)6);
		int result = ordersService.setConfirmUpdate(cartVO);
		String message="구매확정 실패";
		String path="./";
		
		if(result>0) {
			message="구매확정 성공";
			path="./list";
		}
		
		mv.addObject("msg", message);
		mv.addObject("path", path);
		
		mv.setViewName("common/commonResult");

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
