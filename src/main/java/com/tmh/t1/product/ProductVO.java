package com.tmh.t1.product;


import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	private Long productNum;
	private Long brandNum;
	private String productName;
	private Long productPrice;
	private String categoryNum;
	private String productPic;
	private String title;
	private String contents;
	private double discount;
	private Long shippingFee;
	
	
}
