package com.tmh.t1.housewarming;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/housewarming/**")
public class HousewarmingController {
	
	@GetMapping("list")
	public void getList() throws Exception {
		
	}

}
