package com.dao;

import java.util.ArrayList;

import com.entity.*;

/**
 * @version ʱ�䣺2018��5��27�� ����5:00:11
 *
 */
public interface IM_categoryDao {
	//�鸸���
	ArrayList<IM_categoryDao> getParent();
	//���ݸ�id�������
	ArrayList<IM_categoryDao> getChlids(int pid);
	
	//�������id�����
	IM_categoryDao getCate(int id);
}
