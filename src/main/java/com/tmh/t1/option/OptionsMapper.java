package com.tmh.t1.option;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface OptionsMapper {
	public Long setOption(OptionsVO optionVO)throws Exception;
	public Long updateOption(OptionsVO optionsVO)throws Exception;
}
