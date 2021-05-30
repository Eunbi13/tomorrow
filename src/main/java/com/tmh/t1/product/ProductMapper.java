package com.tmh.t1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	//list
	public List<ProductVO> getList(ProductVO productVO)throws Exception;
	
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception;

}
