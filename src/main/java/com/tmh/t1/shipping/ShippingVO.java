package com.tmh.t1.shipping;

import lombok.Data;

@Data
public class ShippingVO {
	
	private Long shipNum;
	
	private String shipTitle;
	
	private String shipName;
	
	private String shipPhone;
	
	private String shipAddress;
	
	private boolean isDefault;
	
	private String username;

}
