package com.yayadou.ebuy.dto;

import javax.persistence.Entity;

import org.springframework.stereotype.Component;

/**
 * OrderItem 数据传输类
 * @author hanfeili
 * @email 1783322568@qq.com
 * @date 2018-06-15 11:08:40
 * @version 1.0
 */
@Component("orderItem")
public class OrderItem implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int orderId;
	private int goodsId;
	private int orderNum;

	/** setter and getter method */
	public void setOrderId(int orderId){
		this.orderId = orderId;
	}
	public int getOrderId(){
		return this.orderId;
	}
	public void setGoodsId(int goodsId){
		this.goodsId = goodsId;
	}
	public int getGoodsId(){
		return this.goodsId;
	}
	public void setOrderNum(int orderNum){
		this.orderNum = orderNum;
	}
	public int getOrderNum(){
		return this.orderNum;
	}

}