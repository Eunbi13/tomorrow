package com.tmh.t1.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;


@Mapper
public interface OrderMapper {
	
	public OrderVO getSelect(OrderVO orderVO)throws Exception;
	
	public List<OrderVO> getList(OrderVO orderVO)throws Exception;
	
	public int setInsert(OrderVO orderVO)throws Exception;
	
	public int setDelete(OrderVO orderVO)throws Exception;
	

}
