package com.tmh.t1.product;

import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.brand.BrandVO;
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
		List<CategoryVO> categoryOne =productService.getCategoryOne(auth);
		model.addAttribute("categoryOne", categoryOne);
		return "product/insertProduct";
	}
	
	@GetMapping("getCategoryNext")
	public String getCategoryNext(Model model, int categoryID)throws Exception{
		List<CategoryVO>categoryNext = productService.getNextCategory(categoryID);
		model.addAttribute("category", categoryNext);
		model.addAttribute("detail", "@@");
		return "product/categoryForm";
	}
	
	
	@PostMapping("insert")
	public String setProduct(Authentication auth,ProductVO productVO,String categoryID, OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
//		System.out.println(optionsVO.getOptionKinds());//1,1 이런식으로 들어옴 흠,,, 파싱해야겠는데?
//		System.out.println(optionsVO.getOptionName());
//		System.out.println(optionsVO.getOptionPrice());
//		System.out.println(optionsVO.toString());
		System.out.println("얘가 문제일듯 "+categoryID);
//		System.out.println("step: "+optionsVO.getStep());
		productService.setProduct(auth, productVO,categoryID, optionsVO, files, rep);
		
		System.out.println("성공");
		return "redirect:/";
		//return "/option/optionInsert.";
	}
	
	@GetMapping("productlist")
	public void getProductList(ProductVO productVO, Model model)throws Exception {
		List<ProductVO> productar = productService.getProductList(productVO);
		model.addAttribute("productlist", productar);
		
		List<BrandVO> brandar = productService.getBrandList(productVO);
		model.addAttribute("brand", brandar);
		
		List<OptionsVO> optionsar = productService.getOptionsList(productVO);
		model.addAttribute("options", optionsar);
	}
	
	@GetMapping("productselect")
	public void getSelect(ProductVO productVO, Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("vo", productVO);
	}
	

	@GetMapping("productselect2")
	public void getSelect2(ProductVO productVO, Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("vo", productVO);
		
		List<BrandVO> brandar = productService.getBrandList(productVO);
		model.addAttribute("brand", brandar);
		
		List<OptionsVO> optionsar = productService.getOptionsList(productVO);
		model.addAttribute("options", optionsar);
	}
	
}
