package com.tmh.t1.shipping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShippingService {

	@Autowired
	private ShippingMapper shippingMapper;
	
	
	public ShippingVO getDefaultSelect(ShippingVO shippingVO)throws Exception{
		return shippingMapper.getDefaultSelect(shippingVO);
	}
	
	public Long getDefaultNum(ShippingVO shippingVO)throws Exception{
		return shippingMapper.getDefaultNum(shippingVO);
	}
	
	public Long getMinNum(ShippingVO shippingVO)throws Exception{
		return shippingMapper.getMinNum(shippingVO);
	}
	
	public ShippingVO getSelect(ShippingVO shippingVO)throws Exception{
		return shippingMapper.getSelect(shippingVO);
	}
	
	public List<ShippingVO> getList(ShippingVO shippingVO)throws Exception{
		return shippingMapper.getList(shippingVO);
	}
	
	public int setInsert(ShippingVO shippingVO)throws Exception{
		return shippingMapper.setInsert(shippingVO);
	}
	
	public int setDelete(ShippingVO shippingVO)throws Exception{
		return shippingMapper.setDelete(shippingVO);
	}
	
	public int setUpdate(ShippingVO shippingVO)throws Exception{
		return shippingMapper.setUpdate(shippingVO);
	}
	
	//배송지 입력, 수정시 기본배송지 지정할 경우, 원래 기본배송지이던 배송지의 default를 false로 바꾼다. 
    public int setDefaultUpdate(ShippingVO shippingVO)throws Exception{
    	return shippingMapper.setDefaultUpdate(shippingVO);
    }
	
}
