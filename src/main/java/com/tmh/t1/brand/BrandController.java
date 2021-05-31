package com.tmh.t1.brand;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/brand/**")
public class BrandController {

	@Autowired
	private BrandService brandService;

	@GetMapping("signBrand")
	public String signBrand(Model model)throws Exception{
		model.addAttribute("brandVO", new BrandVO());
		return "/brand/signBrandFrom";
	}
	
	@PostMapping("signBrand")
	public String signBrand(@Valid BrandVO brandVO, Errors errors, Authentication auth)throws Exception{
		if(errors.hasErrors()) {
			return "/brand/signBrandFrom";
		}
		
		brandService.signBrand(brandVO, auth);
		
		return "redirect:/";
	}
	
	
}
