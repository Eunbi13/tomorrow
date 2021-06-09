package com.tmh.t1.housewarming.hwReply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.util.FileManager;

@Service
@Transactional(rollbackFor = Exception.class)
public class HwReplyService {
	
	@Autowired
	private HwReplyMapper hwReplyMapper;
	
	// List
	public List<HwReplyVO> getList(HwReplyVO hwReplyVO) throws Exception {
		return hwReplyMapper.getList(hwReplyVO);
	}

	// Insert
	public int setInsert(HwReplyVO hwReplyVO) throws Exception {
		return hwReplyMapper.setInsert(hwReplyVO);
	}

}
