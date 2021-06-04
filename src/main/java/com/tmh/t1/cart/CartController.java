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
import com.tmh.t1.option.OptionVO;
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
	public ModelAndView getList(CartVO cartVO, HttpSession session)throws Exception{
		ModelAndView mv= new ModelAndView();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   	cartVO.setUsername(username);
	   	System.out.println("username:"+username);
	   	
	    List<BrandVO> brandAr = cartService.getBrandList(cartVO);
	    
	    List<ProductVO> productAr = cartService.getProductList(cartVO);
	    
	     	
	   	
	   	List<CartVO> cartAr = cartService.getCartList(cartVO);

	    List<CartVO> ar =cartService.getList(cartVO);
	    
//	    ProductVO productVO = new ProductVO();
//	    
//	    Long pricePerProduct = cartService.getPricePerProduct(cartVO);
//	    
//
//	    
//	    Long priceTotalProduct = cartService.getPriceTotalProduct(cartVO);
//	    
//	    
	   
	    
	  //  System.out.println("brandAr"+brandAr);
	   // System.out.println("productAr"+productAr);
	    
	    mv.addObject("brandAr", brandAr);
	    mv.addObject("productAr", productAr);
	    mv.addObject("cartAr", cartAr);
	    mv.addObject("ar", ar);
	    mv.setViewName("cart/list");
	    
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
	public int setInsert(CartVO cartVO)throws Exception{
		return cartService.setInsert(cartVO);
	}
	
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
	
	@GetMapping("productDelete")
	public ModelAndView setProductDelete(long [] productNum)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setProductDelete(productNum);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("amountUpdate")
	public ModelAndView setAmountUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartService.setAmountUpdate(cartVO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
    
	
}
