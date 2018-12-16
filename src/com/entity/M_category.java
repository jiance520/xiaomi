package com.entity;
/**
 * @version 时间：2018年5月27日 下午4:26:23
 *
 */
public class M_category {
	  private long c_id;//	number(10) primary key not null,--	分类id	否	主键
	  private String c_name;//	varchar2(50) not null,--	分类名称	否	
	  private long c_parent_id;//	number(10) null,--	父分类id	是	
	  private int c_nav;//	number(1)	--是否在导航条显示	否	默认0不显示,1显示
	public M_category() {
		super();
	}
	public M_category(long c_id, String c_name, long c_parent_id, int c_nav) {
		super();
		this.c_id = c_id;
		this.c_name = c_name;
		this.c_parent_id = c_parent_id;
		this.c_nav = c_nav;
	}
	public long getC_id() {
		return c_id;
	}
	public void setC_id(long c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public long getC_parent_id() {
		return c_parent_id;
	}
	public void setC_parent_id(long c_parent_id) {
		this.c_parent_id = c_parent_id;
	}
	public int getC_nav() {
		return c_nav;
	}
	public void setC_nav(int c_nav) {
		this.c_nav = c_nav;
	}
	@Override
	public String toString() {
		return "M_category [c_id=" + c_id + ", c_name=" + c_name
				+ ", c_parent_id=" + c_parent_id + ", c_nav=" + c_nav + "]";
	}
	  
}
