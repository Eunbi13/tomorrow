package com.tmh.t1.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	@GetMapping("getTwoCategory")
	public String getTwoFromThree(String brandNum, String categoryID, Model model)throws Exception{
		Map<String, String> map = new  HashMap<String, String>();
		map.put("brandNum",brandNum);
		map.put("categoryID", categoryID);
		List<CategoryVO> twoCategory = categoryService.getTwoFromThree(map);
		model.addAttribute("twoCategory", twoCategory);
		
		return "/brand/brandHome_selectCategory";
	}
}
