package com.tmh.t1.housewarming;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional(rollbackFor = Exception.class)
public class HousewarmingService {
	
	@Autowired
	HousewarmingMapper housewarmingMapper;
	
	// List
	public List<HousewarmingVO> getList() throws Exception {
		return housewarmingMapper.getList();
	}
	
	//Select
	public HousewarmingVO getSelect(HousewarmingVO housewarmingVO) throws Exception {
		housewarmingVO = housewarmingMapper.getSelect(housewarmingVO);
		return housewarmingVO;
	}
	
	//Insert
	public int setInsert(HousewarmingVO housewarmingVO, MultipartFile [] files) throws Exception {
		int result = housewarmingMapper.setInsert(housewarmingVO);
		return result;
	}
	
	//Update
	public int setUpdate(HousewarmingVO housewarmingVO) throws Exception {
		int result = housewarmingMapper.setUpdate(housewarmingVO);
		return result;
	}

	//Delete
	public int setDelete(HousewarmingVO housewarmingVO) throws Exception {
		int result = housewarmingMapper.setDelete(housewarmingVO);
		return result;
	}
	
}
