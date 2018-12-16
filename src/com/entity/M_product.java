package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:04:49
 *
 */
public class M_product {
	  private long p_id;//	number(10) primary key not null,--	��Ʒid	��	����
	  private long c_id;//	number(10) not null,--	��Ʒ��������	��	���
	  private String p_name;//	varchar2(50) not null,--	��Ʒ����	��	
	  private double market_price;//	number(10,2),--	ԭ��		
	  private double shop_price;//	number(10,2),--	�̳Ǽ�		
	  private long rate_id;//	number(10),--	�ۿ�id		
	  private int rate_flag;//	number(1),--	�Ƿ����		1 ���� 0 ������
	  private String image;//	varchar2(50),--	����ͼ		
	  private String description;//	varchar2(500),--	��Ʒ����		
	  private int flag;//	number(1),--	��Ʒ״̬		1 ���� 0 �¼�
	  private long inventory;//	number(10),--	���		
	  private String p_create_time;//	date,--	��Ʒ�ϼ�ʱ��		sysdate
	  private int postage;//	number(1),--	�Ƿ����		1 ���� 0 ������
	  private String express;//	varchar2(100),--	��ݹ�˾	
	public M_product() {
		super();
	}
	public M_product(long p_id, long c_id, String p_name, double market_price,
			double shop_price, long rate_id, int rate_flag, String image,
			String description, int flag, long inventory, String p_create_time,
			int postage, String express) {
		super();
		this.p_id = p_id;
		this.c_id = c_id;
		this.p_name = p_name;
		this.market_price = market_price;
		this.shop_price = shop_price;
		this.rate_id = rate_id;
		this.rate_flag = rate_flag;
		this.image = image;
		this.description = description;
		this.flag = flag;
		this.inventory = inventory;
		this.p_create_time = p_create_time;
		this.postage = postage;
		this.express = express;
	}
	public long getP_id() {
		return p_id;
	}
	public void setP_id(long p_id) {
		this.p_id = p_id;
	}
	public long getC_id() {
		return c_id;
	}
	public void setC_id(long c_id) {
		this.c_id = c_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(double market_price) {
		this.market_price = market_price;
	}
	public double getShop_price() {
		return shop_price;
	}
	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}
	public long getRate_id() {
		return rate_id;
	}
	public void setRate_id(long rate_id) {
		this.rate_id = rate_id;
	}
	public int getRate_flag() {
		return rate_flag;
	}
	public void setRate_flag(int rate_flag) {
		this.rate_flag = rate_flag;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public long getInventory() {
		return inventory;
	}
	public void setInventory(long inventory) {
		this.inventory = inventory;
	}
	public String getP_create_time() {
		return p_create_time;
	}
	public void setP_create_time(String p_create_time) {
		this.p_create_time = p_create_time;
	}
	public int getPostage() {
		return postage;
	}
	public void setPostage(int postage) {
		this.postage = postage;
	}
	public String getExpress() {
		return express;
	}
	public void setExpress(String express) {
		this.express = express;
	}
	@Override
	public String toString() {
		return "M_product [p_id=" + p_id + ", c_id=" + c_id + ", p_name="
				+ p_name + ", market_price=" + market_price + ", shop_price="
				+ shop_price + ", rate_id=" + rate_id + ", rate_flag="
				+ rate_flag + ", image=" + image + ", description="
				+ description + ", flag=" + flag + ", inventory=" + inventory
				+ ", p_create_time=" + p_create_time + ", postage=" + postage
				+ ", express=" + express + "]";
	}
	  
}
