package com.tmh.t1.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tmh.t1.product.ProductVO;


@Controller
@RequestMapping("/product/**")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("category")
	public void getCategory(CategoryVO categoryVO, Model model)throws Exception{
		// 
	}
	
	@GetMapping("categorylist")
	public void getCategory(ProductVO productVO, CategoryVO categoryVO, Model model)throws Exception {
		//brand가 가지고 있는 카테고리(대분류)를 가져욤
			List<CategoryVO> categoryOne =categoryService.getCategory(categoryVO);
			model.addAttribute("categoryOne", categoryOne);
	}
	
	
}
