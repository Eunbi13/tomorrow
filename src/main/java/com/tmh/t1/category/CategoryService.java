package com.tmh.t1.category;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	public List<CategoryVO> getCategory(CategoryVO categoryVO) throws Exception{
		return categoryMapper.getCategory(categoryVO);
	}

	public CategoryVO selectCategoryOne(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryOne(categoryVO);
	}
	
	public CategoryVO selectCategoryTwo(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryTwo(categoryVO);
	}
	
	public CategoryVO selectCategoryThree(CategoryVO categoryVO) throws Exception{
		return categoryMapper.selectCategoryThree(categoryVO);
	}
	
	//eb_brandHome ajax에서 사용 소>중 찾기 파라미터로 브랜드넘이랑 카테고리 아이디 받고 있음-->
	public List<CategoryVO> getTwoFromThree(Map<String, String> map) throws Exception{
		return categoryMapper.getTwoFromThree(map);	
	};
		
	
	
//	//eb_brandHome에서 카테고리 클릭하면 상품도 뜨고 해당 상품들의 카테고리 이름이 뜨게 할 것이다.
//	public List<CategoryVO> getBrandCategory(List<Integer> productNums)throws Exception{
//		return categoryMapper.getBrandCategory(productNums);
//	}
}
