package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:24:48
 *
 */
public class M_mumi_image {
	  private long mi_id;//	number(10) primary key not null,--	图片id	否	主键
	  private long m_id;//	number(10) not null,--	主题id	否	外键
	  private String mi_file;//_name	varchar2(500) not null,--	图片路径	否	
	  private  int mi_flag;//	number(1),--	图片类型	否	1 大图  0 小图
	  private String mi_color;//	varchar2(50),	--颜色	否	
	public M_mumi_image() {
		super();
	}
	public M_mumi_image(long mi_id, long m_id, String mi_file, int mi_flag,
			String mi_color) {
		super();
		this.mi_id = mi_id;
		this.m_id = m_id;
		this.mi_file = mi_file;
		this.mi_flag = mi_flag;
		this.mi_color = mi_color;
	}
	public long getMi_id() {
		return mi_id;
	}
	public void setMi_id(long mi_id) {
		this.mi_id = mi_id;
	}
	public long getM_id() {
		return m_id;
	}
	public void setM_id(long m_id) {
		this.m_id = m_id;
	}
	public String getMi_file() {
		return mi_file;
	}
	public void setMi_file(String mi_file) {
		this.mi_file = mi_file;
	}
	public int getMi_flag() {
		return mi_flag;
	}
	public void setMi_flag(int mi_flag) {
		this.mi_flag = mi_flag;
	}
	public String getMi_color() {
		return mi_color;
	}
	public void setMi_color(String mi_color) {
		this.mi_color = mi_color;
	}
	@Override
	public String toString() {
		return "M_mumi_image [mi_id=" + mi_id + ", m_id=" + m_id + ", mi_file="
				+ mi_file + ", mi_flag=" + mi_flag + ", mi_color=" + mi_color
				+ "]";
	}
	  
}
