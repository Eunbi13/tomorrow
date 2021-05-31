package com.tmh.t1.brand;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class BrandService {
	
	@Autowired
	private BrandMapper brandMapper;
	
	public Long signBrand(BrandVO brandVO,Authentication auth) throws Exception{
		brandVO.setUsername(auth.getName());
		System.out.println(auth.getName());
		return brandMapper.signBrand(brandVO);
	}
}
