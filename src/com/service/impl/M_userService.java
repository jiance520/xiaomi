package com.service.impl;

import com.dao.IM_userDao;
import com.dao.impl.M_userDao;
import com.entity.M_user;
import com.service.IM_userService;

/**
 * @version ʱ�䣺2018��5��27�� ����10:13:43
 *
 */
public class M_userService implements IM_userService{
	private IM_userDao dao = new M_userDao();
	
	public int addNormalUser(M_user u2) {
		
		return dao.addNormalUser(u2);
	}

	
	public M_user ifLogin(String userId, String password) {
		
		return dao.ifLogin(userId, password);
	}

	
	public M_user getUser(String userId) {
		
		return dao.getUser(userId);
	}
}
