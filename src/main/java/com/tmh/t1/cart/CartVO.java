package com.tmh.t1.cart;

import java.util.List;

import com.tmh.t1.option.OptionsVO;
import com.tmh.t1.product.ProductVO;

import lombok.Data;

@Data
public class CartVO {
	
    private Long orderNum;
	
	private String valid;
	
	private List<OptionsVO> optionList;
	
	private Long cartNum;
	
	private String username;
	
	private Long brandNum;
	
	private Long productNum;
	
	private Long optionNum;
	
	private Long amount;
	
	private Long validity;
	
	private boolean isFree;
	
	private Long cartPrice;
	
	private Long unitPrice;
	
	private String unitName;
	
	private ProductVO productVO;
	
	

}
