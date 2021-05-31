package com.tmh.t1.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;

	public CategoryVO selectCategory(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategory(categoryVO);
	}
}
