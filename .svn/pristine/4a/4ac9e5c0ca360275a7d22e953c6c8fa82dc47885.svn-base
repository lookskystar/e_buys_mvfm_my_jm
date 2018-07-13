package com.yayadou.ebuy.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yayadou.ebuy.dao.GoodsDao;
import com.yayadou.ebuy.dto.Goods;
import com.yayadou.ebuy.service.GoodsService;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{

	@Resource(name="goodsDao")
	private GoodsDao goodsDao;
	
	@Override
	public int addGoods(Goods goods) {
		return goodsDao.addGoods(goods);
	}
}
