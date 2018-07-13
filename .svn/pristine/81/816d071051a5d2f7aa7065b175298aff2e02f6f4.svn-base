package com.yayadou.ebuy.action.admin;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yayadou.ebuy.dao.GoodsDao;
import com.yayadou.ebuy.dto.Goods;

/**
 * 商品控制器
 * @author Administrator
 */
@Controller
@RequestMapping("/admin")
public class GoodsAction {
	@Resource(name="goodsDao")
	private GoodsDao goodsDao;
	//添加商品
	@RequestMapping("/addGoods")
	public String addGoods(Goods goods){
		int count=goodsDao.addGoods(goods);
		if(count>0){
			return "redirect:/admin/toGoodsPage.do?pageName=goodsList.jsp";
		}
		return "/admin/toGoodsPage.do?pageName=addGoods.jsp";
	}
}
