package com.tmh.t1.brand;

import java.util.List;
import java.util.Map;

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
import com.tmh.t1.product.ProductVO;

@Controller
@RequestMapping("/brand/**")
public class BrandController {

	@Autowired
	private BrandService brandService;
	
	//eb_brandOrder
	@GetMapping("cart")
	public String brandOrder()throws Exception{
		return "/brand/brandOrder";
	}
	
	//eb_brandAccept(brandAccept용)
	@PostMapping("accept")
	public String setBrandAccept(BrandVO brandVO)throws Exception{
		Long result = brandService.setBrandAccept(brandVO);
		if(result<1) {
			return "/brand/brandSelect";
		}
		return "redirect:./brandList";
	}
	
	//eb_brandSelect 브랜드 리스트에서 a태그로 접속(brandAccept용)
	//accept 수락&미수락 처리 페이지
	@GetMapping("select")
	public String brandSelect(Model model, BrandVO brandVO)throws Exception{
		brandVO = brandService.selectBrand(brandVO);
		model.addAttribute("vo", brandVO);
		return "/brand/brandSelect";
	}
	
	//eb_brandList 브랜드 리스트(brandAccept용)
	@GetMapping("list")
	public String getBrandList(Model model)throws Exception{
		//brandList전체 불러오기
		List<BrandVO> list = brandService.getBrandList();
		System.out.println(list.toString());
		model.addAttribute("list", list);
		return "/brand/brandList";
	}
	
	
	
	//eb_brandHome
	@GetMapping("home")
	public String brandHome(BrandVO brandVO, Model model)throws Exception{
		 brandVO = brandService.getBrandInfo(brandVO);
		 
		//product LIST
		List<ProductVO> productList = brandService.getBrandHomeList(brandVO);
		//category List
		List<CategoryVO> one = brandService.getBrandCategory(brandVO);

		model.addAttribute("brandVO", brandVO);
		model.addAttribute("productList", productList);
		model.addAttribute("productListSize", productList.size());
		model.addAttribute("one", one);
		
		return "/brand/brandHome";
	}
	
	//eb_signBrand 일반 맴버에서 판매자 신청
	@GetMapping("signBrand")
	public String signBrand(Model model)throws Exception{
		model.addAttribute("brandVO", new BrandVO());
		//카테고리 대분류 불러오기
		List<CategoryVO> category = brandService.getBigCategory();
		model.addAttribute("categories", category);
		
		return "/brand/signBrandFrom";
	}
	
	@PostMapping("signBrand")
	public String signBrand(@Valid BrandVO brandVO, Errors errors, Authentication auth, MultipartFile files, Model model)throws Exception{
		//판매자 번호 중복여부 
		if(brandService.brandError(errors, brandVO)) {
			System.out.println("에러발생");
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
