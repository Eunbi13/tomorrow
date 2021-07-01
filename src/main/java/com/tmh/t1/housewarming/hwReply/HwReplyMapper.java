package com.tmh.t1.housewarming.hwReply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tmh.t1.util.Pager;

@Mapper
public interface HwReplyMapper {
	
	public int setReplyUpdate(HwReplyVO hwReplyVO) throws Exception;
	
	public int setReply(HwReplyVO hwReplyVO) throws Exception;
	
	// List
//	public List<HwReplyVO> getList(Pager pager, HwReplyVO hwReplyVO) throws Exception;
	public List<HwReplyVO> getList(HwReplyVO hwReplyVO) throws Exception;
	
	// Count
	public Long getTotalCount(Pager pager)throws Exception;
	
	// Insert
	public int setInsert(HwReplyVO hwReplyVO) throws Exception;
	
	// Delete
	public int setDelete(HwReplyVO hwReplyVO) throws Exception;


}
