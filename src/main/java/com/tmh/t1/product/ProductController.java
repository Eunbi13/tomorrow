package com.tmh.t1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsVO;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	//store list, select
	
	@Autowired
	private ProductService productService;
	
	//insert product 
	@GetMapping("insert")
	public String setProduct(Model model,Authentication auth)throws Exception{
		
		
		
		List<CategoryVO> bigCategory =productService.getBigCategory(auth);
		
		model.addAttribute("bigCategory", bigCategory);
		
		return "product/insertProduct";
	}
	
	@PostMapping("insert")
	public String setProduct(Authentication auth,ProductVO productVO,OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		
		productService.setProduct(auth, productVO, optionsVO, files, rep);
		
		return "/option/optionInsert.";
	}
	
	@GetMapping("productlist")
	public void getList(ProductVO productVO, Model model)throws Exception {
		List<ProductVO> ar = productService.getList(productVO);
		model.addAttribute("productlist", ar);
	}
	
	@GetMapping("productlist2")
	public void getList2(ProductVO productVO, Model model)throws Exception {
		List<ProductVO> ar = productService.getList(productVO);
		model.addAttribute("productlist2", ar);
	}
	
	@GetMapping("productselect")
	public ModelAndView getSelect(ProductVO productVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = productService.getSelect(productVO);
		mv.addObject("vo", productVO);
		mv.setViewName("product/select");
		
		return mv;
	}
	
}
