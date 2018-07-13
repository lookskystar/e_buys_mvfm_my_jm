package com.yayadou.ebuy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yayadou.ebuy.dao.GoodsTypeDao;
import com.yayadou.ebuy.dto.GoodsType;
import com.yayadou.ebuy.service.GoodsTypeService;

@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService{
	@Resource(name="goodsTypeDao")
	private GoodsTypeDao goodsTypeDao;
	
	@Override
	public List<GoodsType> getGoodsTypeList() {
		return goodsTypeDao.getGoodsTypeList();
	}
}
