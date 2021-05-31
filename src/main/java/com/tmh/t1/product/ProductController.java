package com.tmh.t1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	//store list, select
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("list")
	public void getList(ProductVO productVO, Model model)throws Exception {
		List<ProductVO> ar = productService.getList(productVO);
		model.addAttribute("list", ar);
	}
	
	@GetMapping("select")
	public ModelAndView getSelect(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = productService.getSelect(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/select");
		
		return mv;
	}
	
}
