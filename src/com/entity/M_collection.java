package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:17:47
 *
 */
public class M_collection {
	  private long col_id;//	number(10) primary key not null,--	收藏id	否	主键
	  private long p_id;//	number(10) not null,--	商品id	否	外键
	  private long u_id;//	number(10) not null,--	用户id	否	外键
	public M_collection() {
		super();
	}
	public M_collection(long col_id, long p_id, long u_id) {
		super();
		this.col_id = col_id;
		this.p_id = p_id;
		this.u_id = u_id;
	}
	public long getCol_id() {
		return col_id;
	}
	public void setCol_id(long col_id) {
		this.col_id = col_id;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	@Override
	public String toString() {
		return "M_collection [col_id=" + col_id + ", p_id=" + p_id + ", u_id="
				+ u_id + "]";
	}
	  
}
