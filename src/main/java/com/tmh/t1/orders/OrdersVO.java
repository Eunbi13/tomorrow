package com.tmh.t1.orders;

import java.sql.Date;
import java.util.List;

import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;
import com.tmh.t1.shipping.ShippingVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class OrdersVO extends CartVO{
	
	private List<CartVO> cartList;
	private List<Long> brandNums;
	
	private ShippingVO shippingVO;


	private Long orderNum;
	private Long shipNum;
	private String username;

	private String paymentType;
	private Long itemsPrice;
	private Long shippingFee;
	private Long payment;
	private String shippingMemo;
	private Date orderDay;
	private Date updateDay;

	private String name;
	private String email;
	private String phone;
	
	private Long status;
	private Long before;
	
	
	
	
}
