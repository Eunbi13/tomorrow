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

import com.tmh.t1.product.ProductVO;

@Controller
@RequestMapping("/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
    @GetMapping("select")
    public CartVO getSelect(CartVO cartVO)throws Exception{
	    	return cartVO = cartService.getSelect(cartVO);
	    }
    
	@GetMapping("list")	
	public ModelAndView getList(CartVO cartVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   	cartVO.setUsername(username);
	   	cartVO.setValid("zero");
	   	System.out.println("username:"+username);
	   	
	    List<BrandVO> brandAr = cartService.getBrandList(cartVO);
	    
	    List<ProductVO> productAr = cartService.getProductList(cartVO);
	    
	   	List<CartVO> cartAr = cartService.getCartList(cartVO);
	   	
	   	long a =cartAr.size();
	   	if(a == 0) {
	   		
	   	  mv.setViewName("cart/empty");
	   		
	   	} else {

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
	
	//상세페이지에서 장바구니 버튼을 눌릴때 cartVO Insert
	@PostMapping("insert")
	public ModelAndView setInsert(Long [] brandNum, Long [] productNum, Long [] unitPrice, String [] unitName, Long [] cartPrice, Long [] amount)throws Exception{
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
			cartVO.setUsername(username);
			
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
			
			
		}
	    
	    ModelAndView mv = new ModelAndView();
	    
	       //동일한 옵션이 없는 List를 service로 보내 insert 하기
	    int result = cartService.setInsert(ar);
	    
	    
	       String message="장바구니로 이동합니다.";
		   String path="./list";
			
			
			mv.addObject("msg", message);
			mv.addObject("path", path);
	
			
			mv.setViewName("common/commonResult");
			
		 return mv;
	}
	
	
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
	@ResponseBody 
	@GetMapping("productDelete")
	public ModelAndView setProductDelete(long [] productNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setProductDelete(productNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
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
	
	@ResponseBody 
	@PostMapping("brandShipUpdate")
	public int setBrandShipUpdate(CartVO cartVO)throws Exception{
		System.out.println("setBrandShip Update입장");
		int result= cartService.setBrandShipUpdate(cartVO);
		
		return result;
	}
	
	
	
	
	
	@ResponseBody 
	@PostMapping("amountUpdate")
	public ModelAndView setAmountUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setAmountUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@ResponseBody 
	@PostMapping("orderUpdate")
	public ModelAndView setOrderUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   	cartVO.setUsername(username);
	   	System.out.println("OrderNum"+cartVO.getOrderNum());
	   
		int result = cartService.setOrderUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
    
	
}
