package com.entity;
/**
 * @version ʱ�䣺2018��5��27�� ����3:10:19
 *
 */
public class M_user {
	  private long u_id;// number(10) primary key not null, --	�û�id	��	����
	  private String username;// varchar2(50) unique not null, --	�û���	��	Ψһ�������ڵ�½
	  private String password;// varchar2(50) not null, --	�û�����	��	
	  private String email;//	varchar2(50) not null, --	����	��	�����ڵ�½
	  private String phone;//	varchar2(11) unique not null, --	�ֻ���	��	Ψһ����֤�ֻ���֮����Խ��е�½
	  private String id_card;//	varchar2(18) unique, --	���֤		Ψһ
	  private String address;//	varchar2(500), --	�ջ���ַ		
	  private int level;// number(1), --		�û�����		����Ա���ɶ���д����ɾ��Ϊ1����������ԱΪ0����ͨ�û�Ϊ2
	  private String nickname;//	varchar2(50), --	�ǳ�		�����ǳƣ��������ڵ�½
	  private int status;//	number(1), --	�û�״̬		1����,0��ע��δ����
	  private long money;//	number(10), --	�ױ�		
	  private int platform;//	number(1), --	ע��ƽ̨		1�ֻ���2���䣬3������
	  private String question;//	varchar2(500), --	�ܱ�����		
	  private String answer;//	varchar2(500) -- ��	  
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
