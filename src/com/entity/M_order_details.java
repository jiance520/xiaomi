package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:15:50
 *
 */
public class M_order_details {
	  private long od_id;//	number(10) primary key not null,--	订单详情id	否	主键
	  private long od_count;//	number(10),--	商品数量		
	  private double od_subtotal;//	number(10,2),--	商品小计		
	  private long p_id;//	number(10),--	商品id	否	外键
	  private String o_id;//	varchar2(20),--	所属订单id	否	外键	
	public M_order_details() {
		super();
	}
	public M_order_details(long od_id, long od_count, double od_subtotal,
			long p_id, String o_id) {
		super();
		this.od_id = od_id;
		this.od_count = od_count;
		this.od_subtotal = od_subtotal;
		this.p_id = p_id;
		this.o_id = o_id;
	}
	public long getOd_id() {
		return od_id;
	}
	public void setOd_id(long od_id) {
		this.od_id = od_id;
	}
	public long getOd_count() {
		return od_count;
	}
	public void setOd_count(long od_count) {
		this.od_count = od_count;
	}
	public double getOd_subtotal() {
		return od_subtotal;
	}
	public void setOd_subtotal(double od_subtotal) {
		this.od_subtotal = od_subtotal;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	@Override
	public String toString() {
		return "M_order_details [od_id=" + od_id + ", od_count=" + od_count
				+ ", od_subtotal=" + od_subtotal + ", p_id=" + p_id + ", o_id="
				+ o_id + "]";
	}
	  
}
