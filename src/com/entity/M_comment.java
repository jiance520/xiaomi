package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:18:55
 *
 */
public class M_comment {
	  private long co_id;//	number(10) primary key not null,--	����id	��	����
	  private long p_id;//	number(10) not null,--	��Ʒid	��	���
	  private String co_name;//	varchar2(50),--	������		
	  private String co_content;//	varchar2(500),--	��������		
	  private String co_create_time;//	date,--	����ʱ��		sysdate
	public M_comment() {
		super();
	}
	public M_comment(long co_id, long p_id, String co_name, String co_content,
			String co_create_time) {
		super();
		this.co_id = co_id;
		this.p_id = p_id;
		this.co_name = co_name;
		this.co_content = co_content;
		this.co_create_time = co_create_time;
	}
	public long getCo_id() {
		return co_id;
	}
	public void setCo_id(long co_id) {
		this.co_id = co_id;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getCo_content() {
		return co_content;
	}
	public void setCo_content(String co_content) {
		this.co_content = co_content;
	}
	public String getCo_create_time() {
		return co_create_time;
	}
	public void setCo_create_time(String co_create_time) {
		this.co_create_time = co_create_time;
	}
	@Override
	public String toString() {
		return "M_comment [co_id=" + co_id + ", p_id=" + p_id + ", co_name="
				+ co_name + ", co_content=" + co_content + ", co_create_time="
				+ co_create_time + "]";
	}
	  
}
