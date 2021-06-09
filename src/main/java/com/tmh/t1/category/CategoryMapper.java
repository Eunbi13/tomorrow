package com.tmh.t1.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	public List<CategoryVO> getCategory(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryOne(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO)throws Exception;
}
