package com.tmh.t1.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/product/**")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("category")
	public void getCategory(CategoryVO categoryVO, Model model)throws Exception{
		// 
	}
	
	
}
