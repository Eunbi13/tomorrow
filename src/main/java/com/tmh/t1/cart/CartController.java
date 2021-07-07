package com.tmh.t1.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.tmh.t1.member.MemberVO;
import com.tmh.t1.orders.OrdersService;
import com.tmh.t1.orders.OrdersVO;
import com.tmh.t1.product.ProductVO;
import com.tmh.t1.shipping.ShippingService;
import com.tmh.t1.shipping.ShippingVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private ShippingService shippingService;
	
	//
    @GetMapping("select")
    public CartVO getSelect(CartVO cartVO)throws Exception{
	    	return cartVO = cartService.getSelect(cartVO);
	    }
    
    //minkyung_장바구니 페이지
	@GetMapping("list")	
	public ModelAndView getList(CartVO cartVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   	cartVO.setUsername(username);
	   	//장바구니에는 validity가 0과 1 인 cartVO가 표시된다. 
	   	cartVO.setValid("zero");
	   	System.out.println("username:"+username);
	   	//장바구니 안에 있는 브랜드들
	    List<BrandVO> brandAr = cartService.getBrandList(cartVO);
	    //장바구니 안에 있는 상품들 
	    List<ProductVO> productAr = cartService.getProductList(cartVO);
	    //장바구니 안에 있는 옵션들 
	   	List<CartVO> cartAr = cartService.getCartList(cartVO);
	   	
	   	long a =cartAr.size();
	   	
	   	if(a == 0) { 
	   	  //장바구니에 상품이 없는 경우, empty로 이동
	   	  mv.setViewName("cart/empty");
	   	} else {
	   	  //장바구니에 상품이 하나라도 있는 경우
	    mv.addObject("brandAr", brandAr);
	    mv.addObject("productAr", productAr);
	    mv.addObject("cartAr", cartAr);
	    mv.setViewName("cart/list");
	   	}
	    return mv;
	}
	
	

	
	@GetMapping("insert")
	public void setInsert(CartVO cartVO)throws Exception{
		
	}
	
	//minkyung_상세페이지에서 장바구니 or 바로결제 버튼을 눌릴때 cartVO Insert
	@PostMapping("insert")
	public ModelAndView setInsert(Long [] brandNum, Long [] productNum, Long [] unitPrice, String [] unitName, Long [] cartPrice, Long [] amount, Long [] validity)throws Exception{
		 // 만들어지는 cartVO를 담을 List 선언
	    List<CartVO> ar= new ArrayList<CartVO>();
	    
	    //현재 로그인 돼있는 username 가져오기
	    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
	    for(int i=0; i<brandNum.length; i++) {
	    	//새로운 cartVO 생성
			CartVO cartVO = new CartVO(); 
			cartVO.setBrandNum(brandNum[i]);
			cartVO.setProductNum(productNum[i]);
			cartVO.setUnitPrice(unitPrice[i]);
			cartVO.setUnitName(unitName[i]);
			cartVO.setCartPrice(cartPrice[i]);
			cartVO.setAmount(amount[i]);
			cartVO.setValidity(validity[i]);
			cartVO.setUsername(username);
			
					if(validity[i]==0) {
						//상세페이지에서 장바구니를 누른 경우
						//동일한 옵션이름을 가진 cartVO가 있는지 검사
						CartVO cartVO2 = cartService.getSameOption(cartVO);
					
							if(cartVO2 == null) {
							//동일한 옵션이 없다면 새로 세팅된 cartVO를 List에 넣기
								ar.add(cartVO);
							}else {
							//동일한 옵션이 있다면 그 옵션의 amount와 cartPrice를 업데이트
								Long amount2=cartVO2.getAmount();
								amount2=amount2+amount[i];
								Long unitPrice2 = cartVO2.getUnitPrice();
								Long cartPrice2 = unitPrice2 * amount2;
								
								cartVO2.setAmount(amount2);
								cartVO2.setCartPrice(cartPrice2);
								
								int result =cartService.setAmountUpdate(cartVO2);
							}
						
					} else {
					  //상세페이지에서 바로결제를 누른 경우
						ar.add(cartVO);
					}
			
		}
	    
	    ModelAndView mv = new ModelAndView();
	    
	       //동일한 옵션이 없는 List를 service로 보내 cart insert 하기
	    int result = cartService.setInsert(ar);
	    
	    if(validity[0]==0) {
	      //상세페이지에서 장바구니를 누른 경우
	       String message="장바구니로 이동합니다.";
		   String path="./list";
			
			mv.addObject("msg", message);
			mv.addObject("path", path);
			mv.setViewName("common/commonResult");
			
		    return mv;
	    } else {
	    	//상세페이지에서 바로결제를 누른 경우
	    	//바로 결제 페이지로 가기 위해 order/insert 실행
	    	OrdersVO ordersVO = new OrdersVO();
			ordersVO.setUsername(username);
			
			CartVO cartVO = new CartVO();
			cartVO.setUsername(username);
			cartVO.setValid("directPay");

			List<CartVO> cartAr = cartService.getCartList(cartVO);
			
	    //orderInsert 하기 전 
		//username, itemsPrice, shippingFee, payment을 채우고 들어가야 함.
				//총 상품비용 구하기
				 Long itemsPrice=(long)0;
				 Long shippingFee=(long)0;
				     for(CartVO vo : cartAr) {
				    	itemsPrice += (long) vo.getCartPrice();
				    	Long cartNum= (long) vo.getCartNum();
				    	
				    	CartVO cartVO2=cartService.getSelect(vo);
				    	shippingFee = (long) cartVO2.getProductVO().getShippingFee();
				     }
				 //itemsPrice 입력
			     ordersVO.setItemsPrice(itemsPrice);
			     
			     //배송비 구하기
			     if(itemsPrice>=30000) { // 총 상품 금액이 3만원 이상 일때, 배송료는 무료
			    	 ordersVO.setShippingFee((long)0);
			    	 ordersVO.setPayment((long)itemsPrice);
			    	//brandShipping Update 하기
			    	 for(CartVO vo : cartAr) {
			    	    vo.setBrandShipping((long)0);
			    	    cartService.setBrandShipUpdate(vo);
			    	 }
			     }else {// 총 상품 금액이 3만원 이하일때는 지정된 배송료를 넣어준다
			    	 ordersVO.setShippingFee((long)shippingFee);
			    	 ordersVO.setPayment((long)itemsPrice+(long)shippingFee);
			    	//brandShipping Update 하기
			    	 for(CartVO vo : cartAr) {
				    	    vo.setBrandShipping((long)shippingFee);
				    	    cartService.setBrandShipUpdate(vo);
				    	 }
		          }
		
			result = ordersService.setInsert(ordersVO);
			
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
	}
	
	
	
	 //minkyung_장바구니 페이지_옵션단위(회색박스) 삭제
	@ResponseBody 
	@GetMapping("optionDelete")
	public ModelAndView setOptionDelete(Long cartNum)throws Exception{
		System.out.println("start!!!");
		ModelAndView mv = new ModelAndView();
		int result = cartService.setOptionDelete(cartNum);
		System.out.println("finish!!");
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	 //minkyung_장바구니 페이지_상품단위 삭제(상품안에 있는 옵션 다 삭제)
	@ResponseBody 
	@GetMapping("productDelete")
	public ModelAndView setProductDelete(long [] productNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setProductDelete(productNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//minkyung_상세페이지:바로결제 클릭시,전에 바로결제 안에 있던 cartVO를 삭제한다.
	@ResponseBody 
	@GetMapping("directPayDelete")
	public ModelAndView setDirectPayDelete(CartVO cartVO)throws Exception{
		System.out.println(" directPayDelete start!!!");
		ModelAndView mv = new ModelAndView();
		int result = cartService.setDirectPayDelete(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
	//minkyung_장바구니 -> 결제페이지 넘어갈 때, 체크된 상품들만 validity를 1로, 체크 안 된 상품들은 0으로 업뎃
	//결제페이지에는 validity가 1인 상품만 표시 된다
	@ResponseBody 
	@PostMapping("validityUpdate")
	public ModelAndView setValidityUpdate(long [] cartNum, long [] unCartNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setValidityUpdate(cartNum, unCartNum);
		System.out.println("validityUpdate콘트롤러 완성! result:" +result);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//minkyung_brandShipping 업데이트: 장바구니에서 브랜드별 배송료 계산해 각 CartVO마다 업뎃 해줌
	@ResponseBody 
	@PostMapping("brandShipUpdate")
	public int setBrandShipUpdate(CartVO cartVO)throws Exception{
		int result= cartService.setBrandShipUpdate(cartVO);
		
		return result;
	}
	
	
	
	
	//minkyung_장바구니: 수량 변경시 마다 ajax로 업데이트 해줌
	@ResponseBody 
	@PostMapping("amountUpdate")
	public ModelAndView setAmountUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setAmountUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//minkyung_결제완료한 후 cartVO 업데이트:validity를 2로 변경
	@ResponseBody 
	@PostMapping("orderUpdate")
	public ModelAndView setOrderUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   	cartVO.setUsername(username);
	   	System.out.println("OrderNum"+cartVO.getOrderNum());
	 	System.out.println("getValidity"+cartVO.getValidity());
	   
		int result = cartService.setOrderUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
    
	
}
