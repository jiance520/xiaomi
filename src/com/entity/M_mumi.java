package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:23:34
 *
 */
public class M_mumi {
	 private long m_id;//	number(10) primary key not null,--	����id	��	����
	 private String  m_title;//	varchar2(100) not null,--	�������	��	
	 private long m_money;//	number(10) not null,--	����۸�	��	
	 private String m_filename;//	varchar2(500)--	����ͼƬ·��	��
	public M_mumi() {
		super();
	}
	public M_mumi(long m_id, String m_title, long m_money, String m_filename) {
		super();
		this.m_id = m_id;
		this.m_title = m_title;
		this.m_money = m_money;
		this.m_filename = m_filename;
	}
	public long getM_id() {
		return m_id;
	}
	public void setM_id(long m_id) {
		this.m_id = m_id;
	}
	public String getM_title() {
		return m_title;
	}
	public void setM_title(String m_title) {
		this.m_title = m_title;
	}
	public long getM_money() {
		return m_money;
	}
	public void setM_money(long m_money) {
		this.m_money = m_money;
	}
	public String getM_filename() {
		return m_filename;
	}
	public void setM_filename(String m_filename) {
		this.m_filename = m_filename;
	}
	@Override
	public String toString() {
		return "M_mumi [m_id=" + m_id + ", m_title=" + m_title + ", m_money="
				+ m_money + ", m_filename=" + m_filename + "]";
	}
	 
}
