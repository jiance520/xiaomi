package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:26:11
 *
 */
public class M_rate {
	  private long rate_id;//	number(10) primary key not null,--	折扣id	否	主键
	  private int ratio;//	number(3) not null,--	折率	否	0-100 ,0 是免费，100是不打折
	  private String rate_name;//	varchar2(100) not null,--	活动名称	否	
	  private String jump_href;//	varchar2(500) not null--	跳转地址	否	
	public M_rate() {
		super();
	}
	public M_rate(long rate_id, int ratio, String rate_name, String jump_href) {
		super();
		this.rate_id = rate_id;
		this.ratio = ratio;
		this.rate_name = rate_name;
		this.jump_href = jump_href;
	}
	public long getRate_id() {
		return rate_id;
	}
	public void setRate_id(long rate_id) {
		this.rate_id = rate_id;
	}
	public int getRatio() {
		return ratio;
	}
	public void setRatio(int ratio) {
		this.ratio = ratio;
	}
	public String getRate_name() {
		return rate_name;
	}
	public void setRate_name(String rate_name) {
		this.rate_name = rate_name;
	}
	public String getJump_href() {
		return jump_href;
	}
	public void setJump_href(String jump_href) {
		this.jump_href = jump_href;
	}
	@Override
	public String toString() {
		return "M_rate [rate_id=" + rate_id + ", ratio=" + ratio
				+ ", rate_name=" + rate_name + ", jump_href=" + jump_href + "]";
	}
	  
}
