package com.tmh.t1.brand;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface BrandMapper {
	//eb_signBrand 판매자번호 중복 error
	public Long getRegistrationNum(BrandVO brandVO) throws Exception;
	
	
	//eb_brandAccept(brandAccept용)
	public Long setBrandAccept(BrandVO brandVO) throws Exception;
	//eb_brandSelect(brandAccept용)
	public BrandVO selectBrand(BrandVO brandVO) throws Exception;
	//eb_brandList전체 불러오기(brandAccept용)
	public List<BrandVO> getBrandList()throws Exception;
	
	
	//eb_singBrand 판매자 신청
	public Long signBrand(BrandVO brandVO) throws Exception;
	//eb_signBrand 판매자 신청할때 카테고리 선택
	public Long setBrand_Category(Map<String, String> map)throws Exception;

	
	//eb_brandHome brand정보 불러오기
	public BrandVO getBrandInfo(BrandVO brandVO)throws Exception;
	
}
