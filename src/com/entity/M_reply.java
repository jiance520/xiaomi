package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:20:29
 *
 */
public class M_reply {
	  private long r_id;//	number(10) primary key not null,--	�ظ�id	��	����
	  private long co_id;//	number(10) not null,--	����id	��	���
	  private String r_name;//	varchar2(50),--	�ظ���		
	  private String r_content;//	varchar2(500),--	�ظ�����		
	  private String r_create_time;//	date,--	�ظ�ʱ��		sysdate
	public M_reply() {
		super();
	}
	public M_reply(long r_id, long co_id, String r_name, String r_content,
			String r_create_time) {
		super();
		this.r_id = r_id;
		this.co_id = co_id;
		this.r_name = r_name;
		this.r_content = r_content;
		this.r_create_time = r_create_time;
	}
	public long getR_id() {
		return r_id;
	}
	public void setR_id(long r_id) {
		this.r_id = r_id;
	}
	public long getCo_id() {
		return co_id;
	}
	public void setCo_id(long co_id) {
		this.co_id = co_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_create_time() {
		return r_create_time;
	}
	public void setR_create_time(String r_create_time) {
		this.r_create_time = r_create_time;
	}
	@Override
	public String toString() {
		return "M_reply [r_id=" + r_id + ", co_id=" + co_id + ", r_name="
				+ r_name + ", r_content=" + r_content + ", r_create_time="
				+ r_create_time + "]";
	}
	  
}
