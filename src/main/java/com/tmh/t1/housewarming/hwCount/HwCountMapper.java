package com.tmh.t1.housewarming.hwCount;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HwCountMapper {
	
	// List
	public List<HwCountVO> getList(HwCountVO hwCountVO) throws Exception;
	
	// Insert
	public int setInsert(HwCountVO hwCountVO) throws Exception;
	
	// Delete
	public int setDelete(HwCountVO hwCountVO) throws Exception;


}
