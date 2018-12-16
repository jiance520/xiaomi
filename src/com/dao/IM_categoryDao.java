package com.dao;

import java.util.ArrayList;

import com.entity.*;

/**
 * @version 时间：2018年5月27日 下午5:00:11
 *
 */
public interface IM_categoryDao {
	//查父类别
	ArrayList<IM_categoryDao> getParent();
	//根据父id找子类别
	ArrayList<IM_categoryDao> getChlids(int pid);
	
	//根据类别id找类别
	IM_categoryDao getCate(int id);
}
