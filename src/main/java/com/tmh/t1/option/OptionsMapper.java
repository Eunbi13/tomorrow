package com.tmh.t1.option;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OptionsMapper {
	//eb_productUpdate 상품의 옵션들 정보 불러오기
	public List<OptionsVO> getProdOptions(Long productNum) throws Exception;
	
	//eb_productInsert 옵션 추가하기
	public Long setOption(OptionsVO optionVO)throws Exception;
	//eb_OptionsManager 상품의 옵션 중간 테이블(product_options)에 삽입
	public Long setProduct_Options(Map<String, Long> map)throws Exception;
	//eb_setOption optionUpdate에서 사용 옵션 추가하기 전에 상품과 관련된 옵션 전부 삭제 
	public Long deleteOptinos(Long productNum) throws Exception;
	
}