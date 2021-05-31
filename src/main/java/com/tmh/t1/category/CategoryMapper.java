package com.tmh.t1.category;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
//brand, product insert에서 사용중
	public List<CategoryVO> getBigCategory() throws Exception;
	
	public CategoryVO selectCategory(CategoryVO categoryVO)throws Exception;
}
