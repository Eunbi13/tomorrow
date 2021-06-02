package com.tmh.t1.option;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/options/**")
public class OptionsController {
	
	@GetMapping("setOption")
	public String setOption() throws Exception{
		return "options/optionForm";
	}
	
	@PostMapping("setOption")
	public void setOption(OptionsVO optionsVO)throws Exception{
		System.out.println(optionsVO.getOptionKinds());
		System.out.println(optionsVO.getOptionName());
		System.out.println(optionsVO.getOptionPrice());
	}
	
}
