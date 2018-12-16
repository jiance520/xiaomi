package com.entity;
/**
 * @version 时间：2018年5月27日 下午3:10:19
 *
 */
public class M_user {
	  private long u_id;// number(10) primary key not null, --	用户id	否	主键
	  private String username;// varchar2(50) unique not null, --	用户名	否	唯一，可用于登陆
	  private String password;// varchar2(50) not null, --	用户密码	否	
	  private String email;//	varchar2(50) not null, --	邮箱	否	可用于登陆
	  private String phone;//	varchar2(11) unique not null, --	手机号	否	唯一，验证手机号之后可以进行登陆
	  private String id_card;//	varchar2(18) unique, --	身份证		唯一
	  private String address;//	varchar2(500), --	收货地址		
	  private int level;// number(1), --		用户级别		管理员（可读可写不可删）为1，超级管理员为0，普通用户为2
	  private String nickname;//	varchar2(50), --	昵称		个性昵称，不可用于登陆
	  private int status;//	number(1), --	用户状态		1正常,0已注册未激活
	  private long money;//	number(10), --	米币		
	  private int platform;//	number(1), --	注册平台		1手机，2邮箱，3第三方
	  private String question;//	varchar2(500), --	密保问题		
	  private String answer;//	varchar2(500) -- 答案	  
	public M_user() {
		super();
	}
	public M_user(long u_id, String username, String password,
			String email, String phone, String id_card, String address,
			int level, String nickname, int status, long money, int platform,
			String question, String answer) {
		super();
		this.u_id = u_id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.id_card = id_card;
		this.address = address;
		this.level = level;
		this.nickname = nickname;
		this.status = status;
		this.money = money;
		this.platform = platform;
		this.question = question;
		this.answer = answer;
	}
	public long getU_id() {
		return u_id;
	}
	public void setU_id(long u_id) {
		this.u_id = u_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public long getMoney() {
		return money;
	}
	public void setMoney(long money) {
		this.money = money;
	}
	public int getPlatform() {
		return platform;
	}
	public void setPlatform(int platform) {
		this.platform = platform;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "M_category [u_id=" + u_id + ", username=" + username
				+ ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", id_card=" + id_card + ", address=" + address
				+ ", level=" + level + ", nickname=" + nickname + ", status="
				+ status + ", money=" + money + ", platform=" + platform
				+ ", question=" + question + ", answer=" + answer + "]";
	}
	  
}
