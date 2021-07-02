package com.tmh.t1.housewarming.hwTag;

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
public class HwTagService {
	
	@Autowired
	private HwTagMapper hwTagMapper;

	// Select
	public HwTagVO getSelect(HwTagVO hwTagVO) throws Exception {
		return hwTagMapper.getSelect(hwTagVO);
	}
	
	// Insert
	public int setInsert(HwTagVO hwTagVO) throws Exception {
		int result = hwTagMapper.setInsert(hwTagVO);
		
		if(result<1) {
			throw new Exception();
		}
		
		return result;
	}
	
}
