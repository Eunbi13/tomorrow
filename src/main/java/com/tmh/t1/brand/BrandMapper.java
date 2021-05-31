package com.tmh.t1.brand;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BrandMapper {
	
	public Long signBrand(BrandVO brandVO) throws Exception;
	
}
