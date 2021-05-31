package com.tmh.t1.brand;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.category.CategoryVO;

@Mapper
public interface BrandMapper {

	public List<CategoryVO> getCategory() throws Exception;
	public Long signBrand(BrandVO brandVO) throws Exception;
	public Long setBrand_Category(Map<String, String> map)throws Exception;
}
