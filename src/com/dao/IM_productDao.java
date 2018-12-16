package com.dao;

import java.util.ArrayList;

import com.entity.M_product;

/**
 * @version 时间：2018年5月27日 下午4:52:18
 *
 */
public interface IM_productDao {
//按产品描述找产品
	ArrayList<M_product> getProductForName(String name);
	//按产品id找产品
	M_product getProductById(int id);
	//子类别id找产品
	ArrayList<M_product> getProductForChild(int cid);
}
