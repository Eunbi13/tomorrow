package com.tmh.t1.brand;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.tmh.t1.category.CategoryVO;

@Controller
@RequestMapping("/brand/**")
public class BrandController {

	@Autowired
	private BrandService brandService;
	
	@GetMapping("home")
	public String brandHome(BrandVO brandVO)throws Exception{
		
		
		
		return "/brand/brandHome";
	}
	
//판매자 등록
	@GetMapping("signBrand")
	public String signBrand(Model model)throws Exception{
		model.addAttribute("brandVO", new BrandVO());
		
		List<CategoryVO> category = brandService.getCategory();
		for(CategoryVO ar : category) {
			System.out.println(ar.getCategory_detail_NM());
			System.out.println(ar.getCategoryID());
		}
		model.addAttribute("categories", category);
		
		return "/brand/signBrandFrom";
	}
	
	@PostMapping("signBrand")
	public String signBrand(@Valid BrandVO brandVO, Errors errors, Authentication auth, MultipartFile files, Model model)throws Exception{
	
		if(errors.hasErrors()) {
			System.out.println("에러발생");
			System.out.println(errors.getErrorCount());
			System.out.println(errors.getAllErrors());
			return "/brand/signBrandFrom";
		}
		
		Long result=brandService.signBrand(brandVO, auth, files);
		System.out.println("브랜드 신청: "+result);
		if(result>0) {
			model.addAttribute("msg", "신청되었습니다.");
			model.addAttribute("path", "/");
			return "/common/commonResult";
		}
		
		model.addAttribute("msg", "신청할 수 없습니다.");
		model.addAttribute("path", "/brand/signBrandFrom");
		return "/common/commonResult";
	}
	
	
}
