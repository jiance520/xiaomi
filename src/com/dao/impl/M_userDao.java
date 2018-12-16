package com.dao.impl;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dao.IM_userDao;
import com.entity.M_user;
import com.util.BaseDao;

/**
 * @version 时间：2018年5月27日 下午5:30:49
 *
 */
public class M_userDao extends BaseDao implements IM_userDao{

	@Override
	public int addNormalUser(M_user u2) {
		init();
		int num = 0;
		String sql = " insert into M_user values(u_id_seq.nextval, ?, ?, ?, ?,default,default,default,default,default,default,default,default,default) ";
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, u2.getUsername());
			stmt.setString(2, u2.getPassword());
			stmt.setString(3, u2.getEmail());
			stmt.setString(4, u2.getPhone	());
//			stmt.setString(5, u2.getId_card());
//			stmt.setString(6, u2.getAddress());
//			stmt.setString(7, u2.getBirthday());
			
			num = stmt.executeUpdate();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		
		return num;
	}

	@Override
	public M_user ifLogin(String username, String password) {
		return null;
	}

	@Override
	public M_user getUser(String u_id) {
		return null;
	}

}
