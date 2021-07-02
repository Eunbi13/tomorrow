package com.tmh.t1.category;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
	
	public List<CategoryVO> getCategory(CategoryVO categoryVO)throws Exception;
	
	public List<CategoryVO> selectCategoryOne(CategoryVO categoryVO)throws Exception;
	
	public List<CategoryVO> selectCategoryTwo(CategoryVO categoryVO)throws Exception;
	
	public List<CategoryVO> selectCategoryThree(CategoryVO categoryVO)throws Exception;
	
	//eb_productUpdate 카테고리 아이디를 파라미터로 받아서 대분류>중분류>소분류(문자열)로 출력 
	//소분류만 가능
	public String getCategoryNM(CategoryVO categoryVO)throws Exception;
	
	// eb_productUpdate에서 사용 프로덕트 번호를 파라미터로 카테고리 정보 반환 
	public CategoryVO getProdCategory(Long productNum)throws Exception;
	
	// eb brandInsert에서 사용, 대분류 카테고리 조회
	public List<CategoryVO> getBigCategory() throws Exception;
	//eb productInsert & brandHome 에서 사용
	//brand가 가입시 선택한 대분류만 조회
	public List<CategoryVO> getCategoryOne(Map<String, String> map) throws Exception;
	//eb categoryID를 기반으로 다음단계(대->중->소) 카테고리 조회
	public List<CategoryVO> getNextCategory(CategoryVO categoryVO)throws Exception;
	
	//eb_brandHome ajax에서 사용 소>중 찾기 파라미터로 브랜드넘이랑 카테고리 아이디 받고 있음-->
	public List<CategoryVO> getTwoFromThree(Map<String, String> map) throws Exception;
	
	
	
	//수정할지도 모름
	public List<CategoryVO> getCategoryID(Long BrandNum)throws Exception;
	//사용안함
	public List<CategoryVO> getBrandCategory(List<Long> productNums)throws Exception;
}
