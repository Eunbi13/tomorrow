package com.tmh.t1.shipping;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ShippingMapper {
	
	public ShippingVO getDefaltSelect(ShippingVO shippingVO)throws Exception;
	
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
	
}
