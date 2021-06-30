package com.tmh.t1.housewarming.hwCount.hwLike;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmh.t1.housewarming.hwCount.HwCountService;
import com.tmh.t1.housewarming.hwCount.HwCountVO;

@Service
@Transactional(rollbackFor = Exception.class)
public class HwLikeService implements HwCountService {
	
	@Autowired
	private HwLikeMapper hwLikeMapper;
	
	@Override
	public List<HwCountVO> getList(HwCountVO hwCountVO) throws Exception {
		return hwLikeMapper.getList(hwCountVO);
	}

	@Override
	public int setInsert(HwCountVO hwCountVO) throws Exception {
		return hwLikeMapper.setInsert(hwCountVO);
	}


}
