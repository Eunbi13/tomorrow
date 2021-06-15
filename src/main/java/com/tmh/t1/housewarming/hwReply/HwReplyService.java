package com.tmh.t1.housewarming.hwReply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.housewarming.HousewarmingVO;
import com.tmh.t1.util.FileManager;

@Service
@Transactional(rollbackFor = Exception.class)
public class HwReplyService {
	
	@Autowired
	private HwReplyMapper hwReplyMapper;
	
//	public int setReply(HwReplyVO hwReplyVO)throws Exception{
//		//부모글의 ref, step, depth 조회
//		HousewarmingVO housewarmingVO = hwReplyMapper.getSelect(hwReplyVO);
//		HwReplyVO parent = (HwReplyVO)housewarmingVO;
//		System.out.println(parent.getRef());
//		System.out.println(parent.getStep());
//		System.out.println(parent.getDepth());
//		
//		hwReplyVO.setRef(parent.getRef());
//		hwReplyVO.setStep(parent.getStep()+1);
//		hwReplyVO.setDepth(parent.getDepth()+1);
//		
//		int result = hwReplyMapper.setReplyUpdate(parent);
//		result = hwReplyMapper.setReply(hwReplyVO);
//		
//		return result;
//	}
	
	// List
	public List<HwReplyVO> getList(HwReplyVO hwReplyVO) throws Exception {
		return hwReplyMapper.getList(hwReplyVO);
	}

	// Insert
	public int setInsert(HwReplyVO hwReplyVO) throws Exception {
		return hwReplyMapper.setInsert(hwReplyVO);
	}

}
