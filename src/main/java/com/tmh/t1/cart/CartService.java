package com.tmh.t1.cart;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.option.OptionsVO;
import com.tmh.t1.product.ProductVO;

@Service
public class CartService { 
	
	@Autowired
	private CartMapper cartMapper;
	
    
	
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
    	  
    	  List<OptionsVO> optList = vo.getOptionList();
    	  for(OptionsVO optVO: optList) {
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
	
	public int setInsert(CartVO [] cartVOs)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   
	   	System.out.println("username:"+username);
	   	int result =0;
		
		for(int i=0; i< cartVOs.length;i++) {
			CartVO cartVO = new CartVO();
			cartVO = cartVOs[i];
			cartVO.setUsername(username);
			
			
			result = cartMapper.setInsert(cartVO);
		}
		return result;
	}
	
	public int setOptionDelete(Long cartNum)throws Exception{
		CartVO cartVO = new CartVO();
		cartVO.setCartNum(cartNum);
		return cartMapper.setOptionDelete(cartVO);
	}
	
	public int setProductDelete(long [] productNum)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
	   
	   	System.out.println("username:"+username);
	   	
		int result=0;
		
		for(int i=0; i<productNum.length;i++) {
			CartVO cartVO = new CartVO();
			long num = productNum[i];
			cartVO.setProductNum(num);
			System.out.println("productNum"+num);
			cartVO.setUsername(username);
			
			
			result = cartMapper.setProductDelete(cartVO);
		}
		
		return result;
	}
	
	public int setValidityUpdate(long [] productNum, long [] unProductNum)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		
		
		int result=0;
		
		if(productNum !=null) {  //null 처리
		
			for(int i=0; i<productNum.length;i++) {
				CartVO cartVO = new CartVO();
				long num = productNum[i];
				cartVO.setProductNum(num);
				System.out.println("1로 변한 productNum"+num);
				cartVO.setUsername(username);
				cartVO.setValid("one");
				
				result = cartMapper.setValidityUpdate(cartVO);
				System.out.println("service:setValidityUpdate: ProductNum mapper성공!");
			}
		}
		
		
		if(unProductNum != null) {
		 
			for(int i=0; i<unProductNum.length;i++) {
				CartVO cartVO = new CartVO();
				long num = unProductNum[i];
				cartVO.setProductNum(num);
				System.out.println("0 으로 변한 productNum"+num);
				cartVO.setUsername(username);
				cartVO.setValid("zero");
				
				result = cartMapper.setValidityUpdate(cartVO);
				System.out.println("service:setValidityUpdate: unProductNum mapper성공!");
			}
		
		}
		System.out.println("service:setValidityUpdate끝 부분");
		
		
		return result;
	}
	
	
	public int setAmountUpdate(CartVO cartVO)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		cartVO.setUsername(username);
		
		return cartMapper.setAmountUpdate(cartVO);
	}
	
	public int setOrderUpdate(CartVO cartVO)throws Exception{
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
		UserDetails userDetails = (UserDetails)principal; 
		String username = userDetails.getUsername();
		cartVO.setUsername(username);
		
		return cartMapper.setOrderUpdate(cartVO);
	}


}
