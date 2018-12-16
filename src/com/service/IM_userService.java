package com.service;

import java.util.*;

import com.entity.*;

public interface IM_userService {
	//新增前台用户
	int addNormalUser(M_user m_user);
	//登录
	M_user ifLogin(String username,String password);
	//按userId查用户
	M_user getUser(String u_id);
	
}
