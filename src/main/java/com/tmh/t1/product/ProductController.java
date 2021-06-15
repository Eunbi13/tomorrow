package com.tmh.t1.product;

import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsVO;

@Controller
@RequestMapping("/product/**")
public class ProductController {
	//store list, select

	@Autowired
	private ProductService productService;

	//insert product 
	@GetMapping("insert")
	public String setProduct(Model model,Authentication auth)throws Exception{
		List<CategoryVO> categoryOne =productService.getCategoryOne(auth);
		model.addAttribute("categoryOne", categoryOne);
		return "product/insertProduct";
	}

	@GetMapping("getCategoryTwo")
	public String getCategoryTwo(Model model, int categoryID)throws Exception{
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCategoryID(categoryID);
		List<CategoryVO> categoryTwo = productService.getCategoryTwo(categoryVO);
		model.addAttribute("category", categoryTwo);
		model.addAttribute("detail", "중분류");
		return "product/categoryForm";
	}

	@GetMapping("getCategoryThree")
	public String getCategoryThree(Model model, int categoryID)throws Exception{
		CategoryVO categoryVO = new CategoryVO();
		categoryVO.setCategoryID(categoryID);
		List<CategoryVO> categoryThree = productService.getCategoryThree(categoryVO);
		model.addAttribute("category", categoryThree);
		model.addAttribute("detail", "소분류");
		return "product/categoryForm";
	}


	@PostMapping("insert")
	public String setProduct(Authentication auth,ProductVO productVO,String categoryID, OptionsVO optionsVO, MultipartFile [] files, MultipartFile rep)throws Exception{
		//		System.out.println(optionsVO.getOptionKinds());//1,1 이런식으로 들어옴 흠,,, 파싱해야겠는데?
		//		System.out.println(optionsVO.getOptionName());
		//		System.out.println(optionsVO.getOptionPrice());
		//		System.out.println(optionsVO.toString());
		System.out.println("얘가 문제일듯 "+categoryID);
		//		System.out.println("step: "+optionsVO.getStep());
		productService.setProduct(auth, productVO,categoryID, optionsVO, files, rep);

		System.out.println("성공");
		return "redirect:/";
		//return "/option/optionInsert.";
	}

	@GetMapping("productlist")
	public void getProductList(ProductVO productVO, Model model)throws Exception {
		List<ProductVO> productar = productService.getProductList(productVO);
		model.addAttribute("productlist", productar);

		List<BrandVO> brandar = productService.getBrandList(productVO);
		//		String brandN = brandar.get(0).getBrandName().toString();
		//		model.addAttribute("brand", brandN);
		model.addAttribute("brandar", brandar);

	}
	


	@GetMapping("productselect")
	public void getSelect(ProductVO productVO, Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("vo", productVO);
	}


	@GetMapping("productselect2")
	public void getSelect2(ProductVO productVO, Model model)throws Exception{
		productVO = productService.getSelect(productVO);
		model.addAttribute("vo", productVO);

		List<BrandVO> brandar = productService.getBrandList(productVO);
		String brandN = brandar.get(0).getBrandName().toString();
		model.addAttribute("brand", brandN);
		String brandUrl = brandar.get(0).getBrandName().toString();
		model.addAttribute("brandUrl", brandUrl);

		List<OptionsVO> optionsar = productService.getOptionsList(productVO);
		model.addAttribute("optionsar", optionsar); 
		int opsize = optionsar.size();
		model.addAttribute("opsize", opsize);
		String optionK = optionsar.get(1).getOptionKinds().toString();
		model.addAttribute("optionK", optionK); //option 종류 (색상, 사이즈...)
		String optionN = optionsar.get(2).getOptionName().toString();
		model.addAttribute("optionN", optionN); //각 option 항목 (xl, l, m , s, 검정)
		String optionP = optionsar.get(3).getOptionPrice();
		model.addAttribute("optionP", optionP); // option 추가금 (ex +1000, 0)
		String priceP = productVO.getDiscountPrice().toString(); 
		int op=Integer.parseInt(optionP); //option에 저장된 가격
		int pp=Integer.parseInt(priceP); //product에 저장된 가격 
		int price = op+pp; //product 가격 + option 가격
		System.out.println("op+pp :"+ op+pp);
		model.addAttribute("price", price); 
		model.addAttribute("op", op);
		model.addAttribute("pp", pp);
		
		//optionP 출력시 제대로 데이터가 나오는데 optionP를 op로 변경한 것을 출력하면 원래 값에 상관없이 0이 떠서요 ㅠㅠ
//		**************
//		optionK :색상/사이즈
//		optionN :베이지 M
//		optionP :1000 = op
//		priceP :12700 = pp
//		price :12700 = op+ pp
//		op :0 <<<
//		pp :12700
//		**************
//		optionK :색상/사이즈
//		optionN :베이지 S
//		optionP :0
//		priceP :12700
//		price :12700
//		op :0  <<<
//		pp :12700
//		**************
		for(int i=0; i<opsize; i++) { //list?
			OptionsVO optionsVO = optionsar.get(i);
			System.out.println("optionK :"+optionsVO.getOptionKinds());
			System.out.println("optionN :"+optionsVO.getOptionName());
			System.out.println("optionP :"+optionsVO.getOptionPrice());
			System.out.println("priceP :"+priceP);
			System.out.println("price :"+price);
			System.out.println("op :"+op);
			System.out.println("pp :"+pp);
			System.out.println("**************");
			};
	}

}
