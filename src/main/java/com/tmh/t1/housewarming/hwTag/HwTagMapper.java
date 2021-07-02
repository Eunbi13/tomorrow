package com.tmh.t1.housewarming.hwTag;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HwTagMapper {
	
	// Select
	public HwTagVO getSelect(HwTagVO hwTagVO) throws Exception;
	
	// Insert
	public int setInsert(HwTagVO hwTagVO) throws Exception;
	
}
