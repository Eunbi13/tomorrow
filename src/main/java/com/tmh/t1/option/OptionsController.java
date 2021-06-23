package com.tmh.t1.option;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/options/**")
public class OptionsController {
	@Autowired
	private OptionsService optionsService;
	
	//eb_optionUpdate 
	@GetMapping("update")
	public String setOption(Model model, Long productNum) throws Exception{
		//product_options 정보
		List<OptionsVO> options = optionsService.getProdOptions(productNum);
		model.addAttribute("options", options);
		model.addAttribute("productNum", productNum);
		return "options/optionUpdate";
	}
	
	@PostMapping("update")
	public String setOption(OptionsVO optionsVO, Long productNum)throws Exception{
		Long result = optionsService.setOptions(optionsVO,productNum);
		if(result<1) {
			return "options/optionUpdate";
		}
		return "redirect:/product/productselect2?productNum="+productNum;
	}

	
}
