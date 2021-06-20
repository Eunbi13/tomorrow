package com.tmh.t1.orders;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.tmh.t1.cart.CartVO;



@Service
public class OrdersService {
	
	 @Autowired
	 private OrdersMapper ordersMapper;
	
	public OrdersVO getSelect(OrdersVO ordersVO)throws Exception{ 
		
		return ordersMapper.getSelect(ordersVO);
	}
	
	public List<OrdersVO> getList(OrdersVO ordersVO)throws Exception{
		return ordersMapper.getList(ordersVO);
	}
	
	public int setInsert(OrdersVO ordersVO, List<CartVO> carts)throws Exception{
		System.out.println("service");
		
		System.out.println(	"orderVO.getItemsPrice();"+ordersVO.getItemsPrice());
		System.out.println("orderVO.getShippingFee():"+ordersVO.getShippingFee());
		System.out.println("orderVO.getPayment():"+ordersVO.getPayment());
		System.out.println(	"orderVO.getUsername:"+ordersVO.getUsername());
	
			
		
		int result = ordersMapper.setInsert(ordersVO);
		
		
		System.out.println("service: "+ordersVO.getOrderNum());

		for(CartVO cartVO: carts) {
			   //DB 에 넣어보자!!
			   cartVO.setOrderNum(ordersVO.getOrderNum());
			   System.out.println("cartVO.getOrderNum()"+cartVO.getOrderNum());
		   }
		
		
		
	   
		
		
		
		System.out.println("result:"+result);
		return result;
	}
	
	public int setDelete(OrdersVO ordersVO)throws Exception{
		return ordersMapper.setDelete(ordersVO);
	}
	
	

}
