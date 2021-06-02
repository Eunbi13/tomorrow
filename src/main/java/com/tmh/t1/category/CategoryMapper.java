package com.tmh.t1.category;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {

	
	public CategoryVO selectCategory(CategoryVO categoryVO)throws Exception;
}
