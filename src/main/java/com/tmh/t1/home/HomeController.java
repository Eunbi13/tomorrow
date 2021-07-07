package com.tmh.t1.home;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String index() {
		//랜덤하게 카테고리 뜨도록 설정
		Random random = new Random();
		int num=random.nextInt(2);
		if(num>0) {
			return "redirect:/product/productlist";
		}else {
			return "redirect:/housewarming/list";
		}
	}
	
	@GetMapping("/403")
	public String accessDenied() {
		return "template/error/403";
	}
	
}
