package com.dao;

import com.entity.M_user;

/**
 * @version 时间：2018年5月27日 下午3:54:31
 *
 */
public interface IM_userDao {
	//新增前台用户
	int addNormalUser(M_user m_user);
	//登录
	M_user ifLogin(String username,String password);
	//按userId查用户
	M_user getUser(String u_id);
}
