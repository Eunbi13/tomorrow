package com.tmh.t1.cart;

import java.util.List;

import com.tmh.t1.brand.BrandVO;
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
	
	private Long brandShipping;
	
	private Long cartPrice;
	
	private Long unitPrice;
	
	private String unitName;
	
	public ProductVO getProductVO() {
		return productVO;
	}

	public void setProductVO(ProductVO productVO) {
		this.productVO = productVO;
	}

	private ProductVO productVO;
	
	private String carrierId;
	
	private Long trackId;
	
	private BrandVO brandVO;
	
	// 취소인지 환불인지 구분
	private String kind;
	
	
	
	
	
	

}
