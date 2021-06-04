package com.tmh.t1.product;



import lombok.Data;

@Data
public class ProductVO {
	private Long productNum;
	private Long brandNum;
	private String productName;
	private Long productPrice;
	private String productPic;
	private String contents;
	private double discount;
	private Long shippingFee;
	
	
}
