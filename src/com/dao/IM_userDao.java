package com.dao;

import com.entity.M_user;

/**
 * @version ʱ�䣺2018��5��27�� ����3:54:31
 *
 */
public interface IM_userDao {
	//����ǰ̨�û�
	int addNormalUser(M_user m_user);
	//��¼
	M_user ifLogin(String username,String password);
	//��userId���û�
	M_user getUser(String u_id);
}
