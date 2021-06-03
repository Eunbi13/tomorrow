package com.tmh.t1.cart;

import java.util.List;

import com.tmh.t1.option.OptionVO;

import lombok.Data;

@Data
public class CartVO {
	
	private List<OptionVO> optionList;
	
	private Long cartNum;
	
	private String username;
	
	private Long brandNum;
	
	private Long productNum;
	
	private Long optionNum;
	
	private Long amount;
	
	private boolean validity;
	
	private boolean isBundled;
	
	private boolean isFree;
	
	private Long cartPrice;
	
	private Long optionPrice;
	
	
	private String optionKinds;
	private String optionName;

	
	private Long pricePerProduct; 
	    
	private Long priceTotalProduct;

}
