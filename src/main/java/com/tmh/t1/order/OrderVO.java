package com.tmh.t1.order;

import java.sql.Date;
import java.util.List;

import com.tmh.t1.cart.CartVO;

import lombok.Data;

@Data
public class OrderVO {
	
	private List<CartVO> cartsList;

	private Long orderNum;
	private Long shipNum;
	private String username;
	private List<Long> cartNum;  //나중에 List로 바꾸기..  아마 삭제?
	private String paymentType;
	private Long itemsPrice;
	private Long shippingFee;
	private Long payment;
	private String shippingMemo;
	private Date orderDay;
	private String status;
	private String productNum;
	private String name;
	private String email;
	private String phone;
	
}
