package com.tmh.t1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
    public CartVO getSelect(CartVO cartVO)throws Exception{
    	return cartVO = cartMapper.getSelect(cartVO);
    }
	
	public List<CartVO> getList(CartVO cartVO)throws Exception{
		return cartMapper.getList(cartVO);
	}
	
	public int setInsert(CartVO cartVO)throws Exception{
		return cartMapper.setInsert(cartVO);
	}
	
	public int setOptionDelete(CartVO cartVO)throws Exception{
		return cartMapper.setOptionDelete(cartVO);
	}
	
	public int setProductDelete(CartVO cartVO)throws Exception{
		return cartMapper.setProductDelete(cartVO);
	}
	
	public int setUpdate(CartVO cartVO)throws Exception{
		return cartMapper.setUpdate(cartVO);
	}


}
