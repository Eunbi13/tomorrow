package com.tmh.t1.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OrderMapper {
	
	public OrderVO getSelect(OrderVO orderVO)throws Exception;
	
	public List<OrderVO> getList(OrderVO orderVO)throws Exception;
	
	public int setInsert(OrderVO orderVO)throws Exception;
	
	public int setDelete(OrderVO orderVO)throws Exception;

}
