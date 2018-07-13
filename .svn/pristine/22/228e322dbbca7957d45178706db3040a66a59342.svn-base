package com.yayadou.ebuy.dto;

import javax.persistence.Entity;

import org.springframework.stereotype.Component;

/**
 * Timlimited 数据传输类
 * @author hanfeili
 * @email 1783322568@qq.com
 * @date 2018-06-15 11:08:40
 * @version 1.0
 */
@Component("timlimited")
public class Timlimited implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private java.util.Date limitDate;
	private int goodsId;
	private String isEnd;

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setLimitDate(java.util.Date limitDate){
		this.limitDate = limitDate;
	}
	public java.util.Date getLimitDate(){
		return this.limitDate;
	}
	public void setGoodsId(int goodsId){
		this.goodsId = goodsId;
	}
	public int getGoodsId(){
		return this.goodsId;
	}
	public void setIsEnd(String isEnd){
		this.isEnd = isEnd;
	}
	public String getIsEnd(){
		return this.isEnd;
	}

}