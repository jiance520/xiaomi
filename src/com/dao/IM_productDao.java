package com.dao;

import java.util.ArrayList;

import com.entity.M_product;

/**
 * @version ʱ�䣺2018��5��27�� ����4:52:18
 *
 */
public interface IM_productDao {
//����Ʒ�����Ҳ�Ʒ
	ArrayList<M_product> getProductForName(String name);
	//����Ʒid�Ҳ�Ʒ
	M_product getProductById(int id);
	//�����id�Ҳ�Ʒ
	ArrayList<M_product> getProductForChild(int cid);
}
