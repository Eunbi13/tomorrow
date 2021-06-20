package com.tmh.t1.shipping;

import lombok.Data;


public class ShippingVO {
	
   
	
	private Long shipNum;
	
	private String shipTitle;
	
	private String shipName;
	
	private String shipPhone;
	
	private String shipAddress;
	
	 private String shipDetailAddress;
	
	private boolean isDefault;

	private String postcode;
	
	private String username;

	public Long getShipNum() {
		return shipNum;
	}

	public void setShipNum(Long shipNum) {
		this.shipNum = shipNum;
	}

	public String getShipTitle() {
		return shipTitle;
	}

	public void setShipTitle(String shipTitle) {
		this.shipTitle = shipTitle;
	}

	public String getShipName() {
		return shipName;
	}

	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	public String getShipPhone() {
		return shipPhone;
	}

	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}

	public String getShipAddress() {
		return shipAddress;
	}

	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	public boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getShipDetailAddress() {
		return shipDetailAddress;
	}

	public void setShipDetailAddress(String shipDetailAddress) {
		this.shipDetailAddress = shipDetailAddress;
	}
	

	
}
