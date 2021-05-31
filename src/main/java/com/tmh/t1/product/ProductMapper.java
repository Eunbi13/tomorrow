package com.tmh.t1.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	
	//insert
	public Long getBrandNum(String username)throws Exception;
	public Long setProduct(ProductVO productVO)throws Exception;
	public Long setImages(ProductImagesVO imagesVO)throws Exception;
	
	//list
	public List<ProductVO> getList(ProductVO productVO)throws Exception;
	
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception;

}
