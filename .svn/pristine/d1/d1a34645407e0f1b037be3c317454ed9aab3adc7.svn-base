package com.yayadou.ebuy.dao.impl;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.yayadou.ebuy.dao.GoodsTypeDao;
import com.yayadou.ebuy.dto.GoodsType;

@Repository("goodsTypeDao")
public class GoodsTypeDaoImpl extends BaseDao implements GoodsTypeDao {
	
	@Override
	public List<GoodsType> getGoodsTypeList() {
		SqlSession session = getSqlSession();
		List<GoodsType> goodsTypeList=session.selectList(NAMESPACE_NAME+"getGoodsTypeList");
		closeSqlSession();
		return goodsTypeList;
	}
}
