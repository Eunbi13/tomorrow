package com.tmh.t1.brand;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.cart.CartVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.orders.OrdersVO;
import com.tmh.t1.product.ProductVO;

@Controller
@RequestMapping("/brand/**")
public class BrandController {

	@Autowired
	private BrandService brandService;
	
	@GetMapping("validShipUpdate") 
	public void setValidShipUpdate (CartVO cartVO)throws Exception{
		 
	}
	
	
	//minkyung_brandOrder_상태 변경
	@PostMapping("validShipUpdate") 
	public ModelAndView setValidShipUpdate (CartVO cartVO, ModelAndView mv)throws Exception{
		System.out.println("validShipUpdate enter");
		 int result=brandService.setValidShipUpdate(cartVO);
		    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
			UserDetails userDetails = (UserDetails)principal; 
			String username = userDetails.getUsername();
		 
		 
		   String message="주문상태 변경 실패했습니다.";
		   String path="./";
			
			if(result>0) {
				message="주문상태가 변경되었습니다.";
				path="./brandOrder?username="+username;
			}
			
			mv.addObject("msg", message);
			mv.addObject("path", path);
	
			
			mv.setViewName("common/commonResult");
		 return mv;
	} 
	
	//minkyung_brandOrder_orderDtail_modal
	@GetMapping("cartSelect") 
    public ModelAndView getCartSelect (CartVO cartVO)throws Exception{
		 ModelAndView mv = new ModelAndView();
		 System.out.println("cartSelect입장");
		 cartVO=brandService.getCartSelect(cartVO);
		  mv.addObject("cartVO", cartVO);
		 return mv;
	}
	
	//minkyung_brandOrder
	//브랜드 주문조회 처리 페이지
	@GetMapping("brandOrder") 
	public ModelAndView brandOrder(BrandVO brandVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//접속되어있는 username을 가져와서 brandVO에 넣어준다.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	    brandVO.setUsername(username); 
	    //brandVO의 username을 이용해 brandNum을 알아내서 다시 brandVO에 brandNum을 넣는다. 
	    BrandVO brandVO2=brandService.getBrandInfo(brandVO);
	    brandVO.setBrandNum(brandVO2.getBrandNum());
	    
	    List<OrdersVO> ar = brandService.getCartList(brandVO);
	    List<OrdersVO> orderAr = brandService.getOrderList(brandVO);
	
	    brandVO	=brandService.getBrandInfo(brandVO);
	
		
	    mv.addObject("brandVO", brandVO);
    	mv.addObject("ar", ar);

    	mv.addObject("orderAr", orderAr);
    	
    	// 각 주문상태 갯수 구하기
    	brandVO.setStatus((long)2);
    	List<OrdersVO> ar2 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)3);
    	List<OrdersVO> ar3 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)4);
    	List<OrdersVO> ar4 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)6);
    	List<OrdersVO> ar6 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)8);
    	List<OrdersVO> ar8 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)9);
    	List<OrdersVO> ar9 = brandService.getCartList(brandVO);
    	brandVO.setStatus((long)10);
    	List<OrdersVO> ar10 = brandService.getCartList(brandVO);
    	mv.addObject("ar2", ar2);
    	mv.addObject("ar3", ar3);
    	mv.addObject("ar4", ar4);
    	mv.addObject("ar6", ar6);
    	mv.addObject("ar8", ar8);
    	mv.addObject("ar9", ar9);
    	mv.addObject("ar10", ar10);
    	
		return mv;
	}
	
	//minkyung_brandOrder
	//브랜드 주문조회 처리 페이지 ajax로 갱신
	@GetMapping("ajaxBrandOrder") 
	public ModelAndView ajaxBrandOrder(BrandVO brandVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		//접속되어있는 username을 가져와서 brandVO에 넣어준다.
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	    brandVO.setUsername(username); 
	    //brandVO의 username을 이용해 brandNum을 알아내서 다시 brandVO에 brandNum을 넣는다. 
	    BrandVO brandVO2=brandService.getBrandInfo(brandVO);
	    brandVO.setBrandNum(brandVO2.getBrandNum());
	    
	    List<OrdersVO> ar = brandService.getCartList(brandVO);
	    List<OrdersVO> orderAr = brandService.getOrderList(brandVO);
	
	    brandVO	=brandService.getBrandInfo(brandVO);
	
		
	    mv.addObject("brandVO", brandVO);
    	mv.addObject("ar", ar);

    	mv.addObject("orderAr", orderAr);
		return mv;
		
	}
	
	//eb_brandAccept(brandAccept용)
	@PostMapping("accept")
	public String setBrandAccept(BrandVO brandVO)throws Exception{
		Long result = brandService.setBrandAccept(brandVO);
		if(result<1) {
			return "/brand/brandSelect";
		}
		return "redirect:./list";
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
