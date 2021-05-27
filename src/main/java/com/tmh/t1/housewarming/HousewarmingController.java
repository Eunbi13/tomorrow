package com.tmh.t1.housewarming;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/housewarming/**")
public class HousewarmingController {
	
	@Autowired
	HousewarmingService housewarmingService;
	
	@GetMapping("list")
	public void getList() throws Exception {
		
	}

}
