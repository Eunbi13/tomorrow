package com.tmh.t1.cart;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
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
	
	
	
//	@GetMapping("doPlusJson")
//	@ResponseBody
//	public Map<String, Long> plusJson(long num1, long num2) {
//		
//		long rs = num1+num2;
//		return rs;
//	}
	
	@GetMapping("insert")
	public void setInsert(CartVO cartVO)throws Exception{
		
	}
	
	@PostMapping("insert")
	public int setInsert(CartVO [] cartVOs)throws Exception{
		
		return cartService.setInsert(cartVOs);
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
