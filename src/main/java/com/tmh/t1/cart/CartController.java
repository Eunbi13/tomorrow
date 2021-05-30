package com.tmh.t1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
		cartVO.setUsername("id1");
		System.out.println("cartVO"+cartVO);
	   // List<CartVO> ar =cartService.getList(cartVO);
	    
	    //mv.addObject("cartList", ar);
	    mv.setViewName("cart/list");
	    
	    return mv;
		
	}
	
	@GetMapping("insert")
	public int setInsert(CartVO cartVO)throws Exception{
		return cartService.setInsert(cartVO);
	}
	
	@GetMapping("optionDelete")
	public int setOptionDelete(CartVO cartVO)throws Exception{
		return cartService.setOptionDelete(cartVO);
	}
	
	@GetMapping("productDelete")
	public int setProductDelete(CartVO cartVO)throws Exception{
		return cartService.setProductDelete(cartVO);
	}
	
	@GetMapping("update")
	public int setUpdate(CartVO cartVO)throws Exception{
		return cartService.setUpdate(cartVO);
	}


}
