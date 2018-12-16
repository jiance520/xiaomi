package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:12:05
 *
 */
public class M_product_image {
	  private long pi_id;//	number(10) primary key not null,--	图片id	否	主键
	  private long p_id;//	number(10) not null,--	商品id	否	外键
	  private String p_file_name;//	varchar2(500) not null,--	图片路径	否	
	  private int p_flag;//	number(1),--	图片类型		1 大图  0 小图
	  private String p_color;//	varchar2(50),--	颜色	
	public M_product_image() {
		super();
	}
	public M_product_image(long pi_id, long p_id, String p_file_name,
			int p_flag, String p_color) {
		super();
		this.pi_id = pi_id;
		this.p_id = p_id;
		this.p_file_name = p_file_name;
		this.p_flag = p_flag;
		this.p_color = p_color;
	}
	public long getPi_id() {
		return pi_id;
	}
	public void setPi_id(long pi_id) {
		this.pi_id = pi_id;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public String getP_file_name() {
		return p_file_name;
	}
	public void setP_file_name(String p_file_name) {
		this.p_file_name = p_file_name;
	}
	public int getP_flag() {
		return p_flag;
	}
	public void setP_flag(int p_flag) {
		this.p_flag = p_flag;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	@Override
	public String toString() {
		return "M_product_image [pi_id=" + pi_id + ", p_id=" + p_id
				+ ", p_file_name=" + p_file_name + ", p_flag=" + p_flag
				+ ", p_color=" + p_color + "]";
	}
	  
}
