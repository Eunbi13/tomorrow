package com.tmh.t1.option;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OptionsService {
	@Autowired
	private OptionsMapper optionsMapper;
	@Autowired
	private OptionsManager optionsManager;
	
	//eb_optionUpdate GetMapping에서 옵션 정보 가져오기
	public List<OptionsVO> getProdOptions(Long productNum)throws Exception{
		//product_options 정보
		return optionsMapper.getProdOptions(productNum);
	}
	//eb_optionUpdate PostMapping 옵션 삭제&저장
	public Long setOptions(OptionsVO optionsVO, Long productNum)throws Exception{
		//product과 관련된 옵션 전부 삭제
		Long result=optionsMapper.deleteOptinos(productNum);
		//option다시 삽입
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("productNum", productNum);
		result = optionsManager.optionSave(optionsVO, map);
		return result;
	}
	
}
