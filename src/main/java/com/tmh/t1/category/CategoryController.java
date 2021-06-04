package com.tmh.t1.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/store/**")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("category")
	public void selectCategory()throws Exception{
//		ModelAndView mv = new ModelAndView();
		
	}
}
