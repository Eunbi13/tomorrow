package com.tmh.t1.housewarming.hwReply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HwReplyMapper {
	
	// List
	public List<HwReplyVO> getList(HwReplyVO hwReplyVO) throws Exception;
	
	// Insert
	public int setInsert(HwReplyVO hwReplyVO) throws Exception;
	
	// Delete
	public int setDelete(HwReplyVO hwReplyVO) throws Exception;


}
