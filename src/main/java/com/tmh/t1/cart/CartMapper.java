package com.tmh.t1.cart;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.product.ProductVO;



@Mapper
public interface CartMapper {
//	public Long getPriceTotalProduct(CartVO cartVO)throws Exception;
//	
//	public Long getPricePerProduct(CartVO cartVO)throws Exception;
	
	public List<ProductVO> getProductList(CartVO cartVO)throws Exception;
	
	public List<CartVO> getCartList(CartVO cartVO)throws Exception;
	
	public List<BrandVO> getBrandList(CartVO cartVO)throws Exception;
	
	public CartVO getSelect(CartVO cartVO)throws Exception;
	
	public List<CartVO> getList(CartVO cartVO)throws Exception;
	
	public int setInsert(CartVO cartVO)throws Exception;
	
	public int setOptionDelete(CartVO cartVO)throws Exception;
	
	public int setProductDelete(CartVO cartVO)throws Exception;
	
	public int setValidityUpdate(CartVO cartVO)throws Exception;
	
	public int setUnValidityUpdate(CartVO cartVO)throws Exception;
	
	public int setAmountUpdate(CartVO cartVO)throws Exception;

}
