package com.tmh.t1.housewarming.hwCount;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

public interface HwCountService {
	
	// List
	public List<HwCountVO> getList(HwCountVO hwCountVO) throws Exception;

	// Insert
	public int setInsert(HwCountVO hwCountVO) throws Exception;

}
