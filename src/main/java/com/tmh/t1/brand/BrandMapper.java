package com.tmh.t1.brand;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BrandMapper {
//error
	public Long getRegistrationNum(BrandVO brandVO) throws Exception;
	
	public Long signBrand(BrandVO brandVO) throws Exception;
	public Long setBrand_Category(Map<String, String> map)throws Exception;

	
	
	public BrandVO getBrandInfo(BrandVO brandVO)throws Exception;
	
}
