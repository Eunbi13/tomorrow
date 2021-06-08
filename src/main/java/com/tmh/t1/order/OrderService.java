package com.tmh.t1.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.tmh.t1.cart.CartVO;



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
	
	public int setInsert(OrderVO orderVO, List<CartVO> carts)throws Exception{
		System.out.println("service");
		
		System.out.println(	"orderVO.getItemsPrice();"+orderVO.getItemsPrice());
		System.out.println("orderVO.getShippingFee():"+orderVO.getShippingFee());
		System.out.println("orderVO.getPayment():"+orderVO.getPayment());
	
			
		
		int result = orderMapper.setInsert(orderVO);
		

		for(CartVO cartVO: carts) {
			   
			   cartVO.setOrderNum(orderVO.getOrderNum());
			   System.out.println("cartVO.getOrderNum()"+cartVO.getOrderNum());
		   }
		
		System.out.println("service: "+orderVO.getOrderNum());
		
	   
		
		
		
		System.out.println("result:"+result);
		return result;
	}
	
	public int setDelete(OrderVO orderVO)throws Exception{
		return orderMapper.setDelete(orderVO);
	}
	
	

}
