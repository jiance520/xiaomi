package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:13:47
 *
 */
public class M_orders {
	  private String o_id;//	varchar2(20) primary key not null,--	订单id	否	主键
	  private long u_id;//	number(10) not null,--	用户id	否	外键
	  private String o_name;//	varchar2(20),--	收货人		
	  private String o_telphone;//	varchar2(20),--	收货人电话		
	  private String o_address;//	varchar2(200),--	收货地址		
	  private String o_ordertime;//	date,--	订单生成时间		sysdate
	  private double o_total;//	number(10,2),--	订单总额		
	  private int o_state;//	number(1),--	订单状态	
	public M_orders() {
		super();
	}
	public M_orders(String o_id, long u_id, String o_name, String o_telphone,
			String o_address, String o_ordertime, double o_total, int o_state) {
		super();
		this.o_id = o_id;
		this.u_id = u_id;
		this.o_name = o_name;
		this.o_telphone = o_telphone;
		this.o_address = o_address;
		this.o_ordertime = o_ordertime;
		this.o_total = o_total;
		this.o_state = o_state;
	}
	public String getO_id() {
		return o_id;
	}
	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_telphone() {
		return o_telphone;
	}
	public void setO_telphone(String o_telphone) {
		this.o_telphone = o_telphone;
	}
	public String getO_address() {
		return o_address;
	}
	public void setO_address(String o_address) {
		this.o_address = o_address;
	}
	public String getO_ordertime() {
		return o_ordertime;
	}
	public void setO_ordertime(String o_ordertime) {
		this.o_ordertime = o_ordertime;
	}
	public double getO_total() {
		return o_total;
	}
	public void setO_total(double o_total) {
		this.o_total = o_total;
	}
	public int getO_state() {
		return o_state;
	}
	public void setO_state(int o_state) {
		this.o_state = o_state;
	}
	@Override
	public String toString() {
		return "M_orders [o_id=" + o_id + ", u_id=" + u_id + ", o_name="
				+ o_name + ", o_telphone=" + o_telphone + ", o_address="
				+ o_address + ", o_ordertime=" + o_ordertime + ", o_total="
				+ o_total + ", o_state=" + o_state + "]";
	}
	  
}
