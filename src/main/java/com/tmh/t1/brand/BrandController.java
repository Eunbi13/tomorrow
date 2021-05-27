package com.tmh.t1.brand;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/brand/**")
public class BrandController {

	@GetMapping("signBrand")
	public String signBrand()throws Exception{
		return "/brand/signBrandFrom";
	}
	
	
}
