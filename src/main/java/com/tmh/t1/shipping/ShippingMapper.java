package com.tmh.t1.shipping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ShippingMapper {
	
	public ShippingVO getDefaultSelect(ShippingVO shippingVO)throws Exception;
	
	public Long getDefaultNum(ShippingVO shippingVO)throws Exception;
	
	public Long getMinNum(ShippingVO shippingVO)throws Exception;
	//Select
	public ShippingVO getSelect(ShippingVO shippingVO)throws Exception;
	//List
	public List<ShippingVO> getList(ShippingVO shippingVO)throws Exception;
	//Insert
	public int setInsert(ShippingVO shippingVO)throws Exception;
	//Delete
	public int setDelete(ShippingVO shippingVO)throws Exception;
	//Update
	public int setUpdate(ShippingVO shippingVO)throws Exception;
	//배송지 입력, 수정시 기본배송지 지정할 경우, 원래 기본배송지이던 배송지의 default를 false로 바꾼다. 
	public int setDefaultUpdate(ShippingVO shippingVO)throws Exception;
	
}
