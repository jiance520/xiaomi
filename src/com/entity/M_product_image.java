package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:12:05
 *
 */
public class M_product_image {
	  private long pi_id;//	number(10) primary key not null,--	ͼƬid	��	����
	  private long p_id;//	number(10) not null,--	��Ʒid	��	���
	  private String p_file_name;//	varchar2(500) not null,--	ͼƬ·��	��	
	  private int p_flag;//	number(1),--	ͼƬ����		1 ��ͼ  0 Сͼ
	  private String p_color;//	varchar2(50),--	��ɫ	
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
