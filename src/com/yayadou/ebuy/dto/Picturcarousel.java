package com.yayadou.ebuy.dto;

import org.springframework.stereotype.Component;

/**
 * Picturcarousel 数据传输类
 * @author hanfeili
 * @email 1783322568@qq.com
 * @date 2018-06-15 11:08:40
 * @version 1.0
 */
@Component("picturcarousel")
public class Picturcarousel implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private int id;
	private String imageUrl;
	private String requestUrl;

	/** setter and getter method */
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return this.id;
	}
	public void setImageUrl(String imageUrl){
		this.imageUrl = imageUrl;
	}
	public String getImageUrl(){
		return this.imageUrl;
	}
	public void setRequestUrl(String requestUrl){
		this.requestUrl = requestUrl;
	}
	public String getRequestUrl(){
		return this.requestUrl;
	}

}