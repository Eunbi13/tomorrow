package com.tmh.t1.orders;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.cart.CartMapper;
import com.tmh.t1.cart.CartVO;



@Service
public class OrdersService {
	
	 @Autowired
	 private OrdersMapper ordersMapper;
	 
	 @Autowired
		private CartMapper cartMapper;
	 
	public  List<BrandVO> getSelectBrandList(OrdersVO ordesVO)throws Exception{
		return ordersMapper.getSelectBrandList(ordesVO);
	}

	
	public OrdersVO getSelect(OrdersVO ordersVO)throws Exception{ 
		
		return ordersMapper.getSelect(ordersVO);
	}
	
    public OrdersVO getPage(OrdersVO ordersVO)throws Exception{ 
		
		return ordersMapper.getPage(ordersVO);
	}
	
	public  List<BrandVO> getBrandList(OrdersVO ordesVO)throws Exception{
		return ordersMapper.getBrandList(ordesVO);
	}
	
	public  List<OrdersVO> getList(OrdersVO ordesVO)throws Exception{
		return ordersMapper.getList(ordesVO);
	}

	
	public List<OrdersVO> getOrdersList(OrdersVO ordersVO)throws Exception{

		return ordersMapper.getOrdersList(ordersVO);
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
	
	
	public int setConfirmUpdate(CartVO cartVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = cartMapper.setValidityUpdate(cartVO);
		
		return result;
	}
	public int setUpdate(OrdersVO ordersVO)throws Exception{
		return ordersMapper.setUpdate(ordersVO);
	}
	public int setAjaxUpdate(OrdersVO ordersVO)throws Exception{
	    System.out.println("ajax 서비스로 넘어옴");
		return ordersMapper.setAjaxUpdate(ordersVO);
	}
	

}
