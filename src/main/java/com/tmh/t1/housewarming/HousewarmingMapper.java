package com.tmh.t1.housewarming;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HousewarmingMapper {
	
	// List
	public List<HousewarmingVO> getList() throws Exception;

	// Select
	public HousewarmingVO getSelect(HousewarmingVO housewarmingVO) throws Exception;
	
	// Insert
	public int setInsert(HousewarmingVO housewarmingVO) throws Exception;
	
	//FileInsert
	public int setFileInsert(HwFileVO hwFileVO) throws Exception;
	
	// Update
	public int setUpdate(HousewarmingVO housewarmingVO) throws Exception;
	
	// HitUpdate
	public int setHitUpdate(HousewarmingVO housewarmingVO) throws Exception;
	
	// Delete
	public int setDelete(HousewarmingVO housewarmingVO) throws Exception;


}
