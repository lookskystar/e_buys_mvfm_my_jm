package com.yayadou.ebuy.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yayadou.ebuy.dao.GoodsDao;
import com.yayadou.ebuy.dto.Goods;

@Repository("goodsDao")
public class GoodsDaoImpl extends BaseDao implements GoodsDao{

	@Override
	public int addGoods(Goods goods) {
		SqlSession session = getSqlSession();
		int count=session.insert(NAMESPACE_NAME+"addGoods",goods);
		closeSqlSession();
		return count;		
	}
}
