package com.tmh.t1.cart;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;


@Mapper
public interface CartMapper {
	
	public CartVO getSelect(CartVO cartVO)throws Exception;
	
	public List<CartVO> getList(CartVO cartVO)throws Exception;
	
	public int setInsert(CartVO cartVO)throws Exception;
	
	public int setOptionDelete(CartVO cartVO)throws Exception;
	
	public int setProductDelete(CartVO cartVO)throws Exception;
	
	public int setUpdate(CartVO cartVO)throws Exception;

}
