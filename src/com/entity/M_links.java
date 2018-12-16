package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:22:01
 *
 */
public class M_links {
	  private long l_id;//	number(10) primary key not null,--	友链id	否	主键
	  private String l_name;//	varchar2(50),--	友链名称		
	  private String l_link;//	varchar2(500),--	友链地址		
	  private String l_position;//	number(3)--	显示位置
	public M_links() {
		super();
	}
	public M_links(long l_id, String l_name, String l_link, String l_position) {
		super();
		this.l_id = l_id;
		this.l_name = l_name;
		this.l_link = l_link;
		this.l_position = l_position;
	}
	public long getL_id() {
		return l_id;
	}
	public void setL_id(long l_id) {
		this.l_id = l_id;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_link() {
		return l_link;
	}
	public void setL_link(String l_link) {
		this.l_link = l_link;
	}
	public String getL_position() {
		return l_position;
	}
	public void setL_position(String l_position) {
		this.l_position = l_position;
	}
	@Override
	public String toString() {
		return "M_links [l_id=" + l_id + ", l_name=" + l_name + ", l_link="
				+ l_link + ", l_position=" + l_position + "]";
	}
	  
}
