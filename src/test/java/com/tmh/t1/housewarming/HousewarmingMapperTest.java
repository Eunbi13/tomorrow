package com.tmh.t1.housewarming;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class HousewarmingMapperTest {

	@Autowired
	private HousewarmingMapper housewarmingMapper;
	
//	@Test
	void getListTest() throws Exception {
		
		List<HousewarmingVO> ar = housewarmingMapper.getList();
		
		for(HousewarmingVO housewarmingVO:ar) {
			System.out.println(housewarmingVO.toString());
		}
		
		System.out.println(ar.size());
		assertNotEquals(0, ar.size());
		
	}
	
	@Test
	void setInsertTest() throws Exception {
		
		for(int i=0;i<30;i++) {
			HousewarmingVO housewarmingVO = new HousewarmingVO();
			housewarmingVO.setSpace("space"+i);
			housewarmingVO.setSpaceSize(i+100);
			housewarmingVO.setWork("work"+i);
			housewarmingVO.setField("field"+i);
			housewarmingVO.setFamilyType("familyType"+i);
			housewarmingVO.setArea("area"+i);
			housewarmingVO.setStyle("style"+i);
			housewarmingVO.setPeriod("period"+i);
			housewarmingVO.setBudget(i);
			housewarmingVO.setTotalTone("totalTone"+i);
			housewarmingVO.setWallColor("wallColor"+i);
			housewarmingVO.setBottomColor("bottomColor"+i);
			housewarmingVO.setDetail("detail"+i);
			housewarmingVO.setLink("link"+i);
			housewarmingVO.setCopyright("copyright"+i);
			housewarmingVO.setCoverImg(0L);
			housewarmingVO.setTitle("title"+i);
			housewarmingVO.setUsername("user02");
			housewarmingVO.setContents("contents"+i);
			housewarmingVO.setHit(0L);
			housewarmingMapper.setInsert(housewarmingVO);
		}
		System.out.println("Finish");
	}

}
