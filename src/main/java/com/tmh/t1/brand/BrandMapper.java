package com.tmh.t1.brand;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BrandMapper {

	
	public Long signBrand(BrandVO brandVO) throws Exception;
	public Long setBrand_Category(Map<String, String> map)throws Exception;
}
