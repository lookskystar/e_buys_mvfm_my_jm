package com.yayadou.ebuy.action.admin;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.yayadou.ebuy.dto.GoodsType;
import com.yayadou.ebuy.service.GoodsTypeService;

/**
 * 商品类型
 * @author Administrator
 */
@Controller
@RequestMapping("/admin")
public class GoodsTypeAction {
	@Resource(name="goodsTypeService")
	private GoodsTypeService goodsTypeService;
	@RequestMapping("/getGoodsTypeList")
	public String getGoodsTypeList(HttpServletRequest request){
		List<GoodsType> goodsTypeList=goodsTypeService.getGoodsTypeList();	
		request.setAttribute("goodsTypeList", goodsTypeList);
		return "behindWeb/goodstype/goodstypeList.jsp";
	}
}
