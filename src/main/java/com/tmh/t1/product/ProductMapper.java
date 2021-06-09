package com.tmh.t1.product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.brand.BrandVO;
import com.tmh.t1.category.CategoryVO;
import com.tmh.t1.option.OptionsVO;

@Mapper
public interface ProductMapper {
	
	//insert
	public Long getBrandNum(String username)throws Exception;
	public Long setProduct(ProductVO productVO)throws Exception;
	public Long setImages(ProductImagesVO imagesVO)throws Exception;
	
	public Long setProduct_category(Map<String, Long> map)throws Exception;
	public Long setProduct_Options(Map<String, Long> map)throws Exception;
	
	//list
	public List<ProductVO> getProductList(ProductVO productVO)throws Exception;
	public List<BrandVO> getBrandList(ProductVO productVO)throws Exception;
	public List<OptionsVO> getOptionsList(ProductVO productVO)throws Exception;
	//select
	public ProductVO getSelect(ProductVO productVO)throws Exception;
	
}
