package com.tmh.t1.category;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	
	public List<CategoryVO> getCategory(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryOne(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO)throws Exception;
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO)throws Exception;
	
	//<!--은비 brandInsert에서 사용 -->
	public List<CategoryVO> getBigCategory() throws Exception;
	//<!-- 은비 productInsert에서 사용 -->
	//brandHome에서도 사용
	public List<CategoryVO> getCategoryOne(Map<String, String> map) throws Exception;
	public List<CategoryVO> getNextCategory(CategoryVO categoryVO)throws Exception;
	
	//수정할지도 모름
	public List<CategoryVO> getCategoryID(Long BrandNum)throws Exception;
	public List<CategoryVO> getBrandCategory(List<Integer> categoryIDs)throws Exception;
}
