package com.yayadou.ebuy.dao;

import java.util.List;
import com.yayadou.ebuy.dto.GoodsType;

/**
 * ��Ʒ����ӿ�
 * @author Administrator
 */
public interface GoodsTypeDao {
	public static final String NAMESPACE_NAME="com.yayadou.ebuy.mapper.GoodsTypeMapper";
	//��ѯ������Ʒ����
	public List<GoodsType> getGoodsTypeList();
}
