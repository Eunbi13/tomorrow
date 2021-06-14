package com.tmh.t1.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	public List<CategoryVO> getCategory(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryOne(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO)throws Exception;
	
	
	public List<CategoryVO> getCategoryOne(String username) throws Exception;
	public List<CategoryVO> getCategoryTwo(CategoryVO categoryVO)throws Exception;
	public List<CategoryVO> getCategoryThree(CategoryVO categoryVO)throws Exception;
	public List<CategoryVO> getCategoryID(Long BrandNum)throws Exception;
	public List<CategoryVO> getBrandCategory(List<Integer> categoryIDs)throws Exception;
}
