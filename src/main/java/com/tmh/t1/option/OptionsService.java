package com.tmh.t1.option;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OptionsService {
	@Autowired
	private OptionsMapper optionsMapper;
	
	public List<OptionsVO> getProdOptions(Long productNum)throws Exception{
		//product_options 정보
		return optionsMapper.getProdOptions(productNum);
	}
	
}
