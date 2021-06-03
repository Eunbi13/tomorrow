package com.tmh.t1.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.option.OptionVO;
import com.tmh.t1.product.ProductVO;

@Service
public class CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
    public Long getPriceTotalProduct(CartVO cartVO)throws Exception{
	   return cartMapper.getPriceTotalProduct(cartVO);
	   
    }
	
	public Long getPricePerProduct(CartVO cartVO)throws Exception{
		
		return cartMapper.getPricePerProduct(cartVO);
	}
	
	public List<ProductVO> getProductList(CartVO cartVO)throws Exception{
		List<ProductVO>  productList = cartMapper.getProductList(cartVO);
		
		return productList;
	}
	
	public List<CartVO> getCartList(CartVO cartVO)throws Exception{
	  
       List<CartVO> optionList= cartMapper.getCartList(cartVO);
       for(CartVO vo: optionList) {
    	  System.out.println("vo.getCartNum():"+vo.getCartNum()); 
    	  System.out.println("vo.getProductNum():"+vo.getProductNum());
    	  System.out.println("vo.getCartPrice():"+vo.getCartPrice()); 
    	  
    	  List<OptionVO> optList = vo.getOptionList();
    	  for(OptionVO optVO: optList) {
    		  System.out.println("optVO.getOptionNum()"+optVO.getOptionNum());
    	  }
    	   
       }
       
       return optionList;
	}
	
	public List<BrandVO> getBrandList(CartVO cartVO)throws Exception{
		return cartMapper.getBrandList(cartVO);
	}
	
    public CartVO getSelect(CartVO cartVO)throws Exception{
    	return cartVO = cartMapper.getSelect(cartVO);
    }
	
	public List<CartVO> getList(CartVO cartVO)throws Exception{
		return cartMapper.getList(cartVO);
	}
	
	public int setInsert(CartVO cartVO)throws Exception{
		long amount =cartVO.getAmount();
		long optionPrice = cartVO.getOptionPrice();
		cartVO.setCartPrice(amount*optionPrice);
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
