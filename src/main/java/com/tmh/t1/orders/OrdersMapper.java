package com.tmh.t1.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;


@Mapper
public interface OrdersMapper {
	
	public OrdersVO getSelect(OrdersVO ordersVO)throws Exception;
	
	public List<OrdersVO> getList(OrdersVO ordersVO)throws Exception;
	
	public int setInsert(OrdersVO ordersVO)throws Exception;
	
	public int setDelete(OrdersVO ordesVO)throws Exception;
	
	public int setUpdate(OrdersVO ordesVO)throws Exception;
	

}
