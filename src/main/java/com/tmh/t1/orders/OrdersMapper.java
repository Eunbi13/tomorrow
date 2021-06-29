package com.tmh.t1.orders;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.cart.CartVO;
import com.tmh.t1.product.ProductVO;


@Mapper
public interface OrdersMapper {
	
	public  List<BrandVO> getSelectBrandList(OrdersVO ordesVO)throws Exception;
	
	public OrdersVO getSelect(OrdersVO ordersVO)throws Exception;
	
	public OrdersVO getPage(OrdersVO ordersVO)throws Exception;
	
	public  List<OrdersVO> getOrdersList(OrdersVO ordesVO)throws Exception;
	
	public  List<OrdersVO> getList(OrdersVO ordesVO)throws Exception;
	
	public  List<CartVO> getCartList(OrdersVO ordesVO)throws Exception;
	
	public  List<BrandVO> getBrandList(OrdersVO ordesVO)throws Exception;
	
	public int setInsert(OrdersVO ordersVO)throws Exception;
	
	public int setDelete(OrdersVO ordesVO)throws Exception;
	
	public int setUpdate(OrdersVO ordesVO)throws Exception;
	
	public int setAjaxUpdate(OrdersVO ordesVO)throws Exception;
	
	
	
	

}
