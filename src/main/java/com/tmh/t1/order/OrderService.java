package com.tmh.t1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class OrderService {
	
	 @Autowired
	 private OrderMapper orderMapper;
	
	public OrderVO getSelect(OrderVO orderVO)throws Exception{
		
		return orderMapper.getSelect(orderVO);
	}
	
	public List<OrderVO> getList(OrderVO orderVO)throws Exception{
		return orderMapper.getList(orderVO);
	}
	
	public int setInsert(OrderVO orderVO)throws Exception{
		return orderMapper.setInsert(orderVO);
	}
	
	public int setDelete(OrderVO orderVO)throws Exception{
		return orderMapper.setDelete(orderVO);
	}

}
