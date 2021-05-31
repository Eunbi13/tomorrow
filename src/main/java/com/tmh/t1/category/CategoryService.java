package com.tmh.t1.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;

	public CategoryVO selectCategoryOne(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryOne(categoryVO);
	}
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryTwo(categoryVO);
	}
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryThree(categoryVO);
	}
}
