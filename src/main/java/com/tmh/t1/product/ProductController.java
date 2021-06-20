package com.tmh.t1.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsVO;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	//store list, select
	
	@Autowired
	private ProductService productService;
	
	//eb_프로덕트 판매중지
	@GetMapping("delete")
	public String getList(ProductVO productVO)throws Exception{
		
		return "redirect:./";
	}
	
	//eb_ProductUpdate 파라미터: 상품번호
	@GetMapping("update")
	public String setProductUpdate(ProductVO productVO, Model model)throws Exception{
		Map<String, Object> map = productService.getProductInfo(productVO);
		
		model.addAttribute("productVO", (ProductVO)map.get("productVO"));
		model.addAttribute("categoryVO", (CategoryVO)map.get("categoryVO"));
		model.addAttribute("options", (List<OptionsVO>)map.get("options"));
		return "product/productUpdate";
	}
	
	@PostMapping("update")
	public String setProductUpdate(ProductVO productVO,String categoryID, OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		
		Long result = productService.setUpdateProduct(productVO, categoryID, optionsVO, files, rep);
		
		if(result<1) {
			
		}
		return "redirect:/";
	}
	
	
	//eb_productList category클릭하면 해당상품뜨는 메서드
	@GetMapping("prodFromCat")
	public String getProdFromCat(String categoryID, String brandNum, Model model)throws Exception{
		Map<String, String> map = new HashMap<String, String>();
		map.put("categoryID", categoryID);
		//brandHome에서 카테고리 선택하는 경우 필요
		map.put("brandNum", brandNum);
		List<ProductVO> list=productService.getProdFromCat(map);
		model.addAttribute("productList", list);
		model.addAttribute("productListSize", list.size());
		return "template/productList";
	}
	
	//eb_Productinsert start
	@GetMapping("insert")
	public String setProduct(Model model,Authentication auth)throws Exception{
		//brand가 가지고 있는 카테고리(대분류)를 가져욤
		List<CategoryVO> categoryOne =productService.getCategoryOne(auth);
		model.addAttribute("categoryOne", categoryOne);
		System.out.println("프로덕트 인서트 화면 열림");
		return "product/productInsert";
	}
	
	//eb_Productinsert category
	//대분류 선택하면 중분류, 중분류 선택하면 소분류 카테고리를 가져오는 메서드(ajax호출)
	@GetMapping("getCategoryNext")
	public String getCategoryNext(Model model, int categoryID)throws Exception{
		List<CategoryVO>categoryNext = productService.getNextCategory(categoryID);
		model.addAttribute("category", categoryNext);
		return "product/categoryForm";
	}
	//eb_Productinsert fin
	@PostMapping("insert")
	public String setProduct(Authentication auth,ProductVO productVO,String categoryID, OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		productService.setProduct(auth, productVO,categoryID, optionsVO, files, rep);
		System.out.println("프로덕트 인서트 성공");
		return "redirect:/";
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

	//select -> cart로 넘어가야 하는 값
//	brandNum - product
//	productNum - product
//	optionNum - options
	@GetMapping("productselect2")
	public void getSelect2(ProductVO productVO, Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("vo", productVO);

		List<BrandVO> brandar = productService.getBrandList(productVO);
		String brandN = brandar.get(0).getBrandName().toString();
		model.addAttribute("brand", brandN);
		

		List<OptionsVO> optionsar = productService.getOptionsList(productVO);
		model.addAttribute("optionsar", optionsar); 
		int opsize = optionsar.size();
		model.addAttribute("opsize", opsize);
		String optionK = optionsar.get(1).getOptionKinds().toString();
		model.addAttribute("optionK", optionK); 
		
	}
	
}
