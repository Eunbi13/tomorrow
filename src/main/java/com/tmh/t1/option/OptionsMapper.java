package com.tmh.t1.option;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OptionsMapper {
	//eb_productUpdate 상품의 옵션들 정보 불러오기
	public List<OptionsVO> getProdOptions(Long productNum) throws Exception;
	//eb_productInsert 옵션 추가하기
	public Long setOption(OptionsVO optionVO)throws Exception;
	//eb_productInsert 옵션 ref 업데이트하기
	public Long updateOption(OptionsVO optionsVO)throws Exception;
}
