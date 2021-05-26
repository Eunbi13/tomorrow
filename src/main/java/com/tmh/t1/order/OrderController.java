package com.tmh.t1.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/**")
public class OrderController {
	
	@GetMapping("insert")
	public void setInsert ()throws Exception{
		
	}

}
