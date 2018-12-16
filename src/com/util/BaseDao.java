package com.util;

import java.sql.*;

public class BaseDao {

	protected Connection con = null;
	
	protected void init(){
		con = JdbcUtil.getConn();
	}
	
	protected void close(){
		JdbcUtil.closeConn();
	}
}
