package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:24:48
 *
 */
public class M_mumi_image {
	  private long mi_id;//	number(10) primary key not null,--	ͼƬid	��	����
	  private long m_id;//	number(10) not null,--	����id	��	���
	  private String mi_file;//_name	varchar2(500) not null,--	ͼƬ·��	��	
	  private  int mi_flag;//	number(1),--	ͼƬ����	��	1 ��ͼ  0 Сͼ
	  private String mi_color;//	varchar2(50),	--��ɫ	��	
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
