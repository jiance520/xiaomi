package com.service;

import java.util.*;

import com.entity.*;

public interface IM_userService {
	//����ǰ̨�û�
	int addNormalUser(M_user m_user);
	//��¼
	M_user ifLogin(String username,String password);
	//��userId���û�
	M_user getUser(String u_id);
	
}
