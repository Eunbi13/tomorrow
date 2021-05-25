package com.tmh.t1.shipping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ShippingService {

	@Autowired
	private ShippingMapper shippingMapper;
	
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
	
}
