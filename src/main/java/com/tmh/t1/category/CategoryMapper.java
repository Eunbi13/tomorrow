package com.tmh.t1.category;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	public CategoryVO selectCategoryOne(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO)throws Exception;
}
