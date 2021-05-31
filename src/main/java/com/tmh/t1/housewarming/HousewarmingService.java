package com.tmh.t1.housewarming;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tmh.t1.util.FileManager;

@Service
@Transactional(rollbackFor = Exception.class)
public class HousewarmingService {
	
	@Autowired
	HousewarmingMapper housewarmingMapper;
	@Autowired
	private FileManager fileManager;
	
//	@Value("${housewarming.filePath}")
	private String filePath;
	
	// List
	public List<HousewarmingVO> getList() throws Exception {
		return housewarmingMapper.getList();
	}

	// Select
	public HousewarmingVO getSelect(HousewarmingVO housewarmingVO) throws Exception {
		housewarmingMapper.setHitUpdate(housewarmingVO);
		return housewarmingMapper.getSelect(housewarmingVO);
	}
	
	// Insert
	public int setInsert(HousewarmingVO housewarmingVO, MultipartFile [] files) throws Exception {
		int result = housewarmingMapper.setInsert(housewarmingVO);
		
		if(result<1) {
			throw new Exception();
		}
		
		String filePath= this.filePath;
		
		for(MultipartFile multipartFile:files) {
			if(multipartFile.getSize()==0) {
				continue;
			}
			String fileName= fileManager.save(multipartFile, filePath);
			System.out.println(fileName);
			HwFileVO hwFileVO = new HwFileVO();
			hwFileVO.setFileName(fileName);
			hwFileVO.setOriginName(multipartFile.getOriginalFilename());
			hwFileVO.setHwNum(hwFileVO.getHwNum());
			housewarmingMapper.setFileInsert(hwFileVO);
		}
		return result;
	}
	
	// Update
	public int setUpdate(HousewarmingVO housewarmingVO) throws Exception {
		int result = housewarmingMapper.setUpdate(housewarmingVO);
		return result;
	}

	// Delete
	public int setDelete(HousewarmingVO housewarmingVO) throws Exception {
		int result = housewarmingMapper.setDelete(housewarmingVO);
		return result;
	}
	

}