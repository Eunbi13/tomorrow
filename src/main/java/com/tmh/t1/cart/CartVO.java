package com.tmh.t1.cart;

import lombok.Data;

@Data
public class CartVO {
	
	private Long cartNum;
	
	private String username;
	
	private Long brandNum;
	
	private Long productNum;
	
	private Long optionNum;
	
	private Long amount;
	
	private boolean validity;
	
	private boolean isBundled;
	
	private boolean isFree;

}
