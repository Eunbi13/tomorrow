package com.tmh.t1.option;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OptionsManager {
	@Autowired
	private OptionsMapper optionsMapper;

	//eb_optionSave테이블에 데이터 저장 
	//product_options테이블에 데이터 넣기 위해 List<Long> optionNums 반환
	public Long optionSave(OptionsVO optionsVO, Map<String, Long> map)throws Exception{
		List<Long> optionNums = new ArrayList<Long>();
		
		String [] k= optionsVO.getOptionKinds().split(",");
		String [] n = optionsVO.getOptionName().split(",");
		String [] p = optionsVO.getOptionPrice().split(",");
		String [] s = optionsVO.getStep().split(",");
		
		for(int i =0; i<k.length; i++) {
			optionsVO = new OptionsVO();
			optionsVO.setOptionKinds(k[i]);
			optionsVO.setOptionName(n[i]);
			optionsVO.setOptionPrice(p[i]);
			optionsVO.setStep(s[i]);
			
			optionsMapper.setOption(optionsVO);
			Long optionsNum=optionsVO.getOptionNum();
			System.out.println(optionsNum);
			//생성된 optionsNum 리스트에 추가
			optionNums.add(optionsNum);
		}
		Long result = 0L;
		for(Long e : optionNums) {
			map.put("optionNum", e);
			result = optionsMapper.setProduct_Options(map);
			if(result==0) {
				break;
			}
		}
		
		return result;
	}
	
}
