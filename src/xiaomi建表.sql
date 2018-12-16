-- ɾ����������
drop sequence u_id_seq;
drop sequence c_id_seq;
drop sequence p_id_seq;
drop sequence pi_id_seq;
drop sequence o_id_seq;
drop sequence od_id_seq;
drop sequence col_id_seq;
drop sequence co_id_seq;
drop sequence r_id_seq;
drop sequence l_id_seq;
drop sequence m_id_seq;
drop sequence mi_id_seq;
drop sequence rate_id_seq;
-- ������������
create sequence u_id_seq start with 1 increment by 1;
create sequence c_id_seq start with 1 increment by 1;
create sequence p_id_seq start with 100 increment by 1;
create sequence pi_id_seq start with 100 increment by 1;
create sequence o_id_seq start with 100 increment by 1;
create sequence od_id_seq start with 100 increment by 1;
create sequence col_id_seq start with 100 increment by 1;
create sequence co_id_seq start with 100 increment by 1;
create sequence r_id_seq start with 100 increment by 1;
create sequence l_id_seq start with 1 increment by 1;
create sequence m_id_seq start with 100 increment by 1;
create sequence mi_id_seq start with 100 increment by 1;
create sequence rate_id_seq start with 100 increment by 1;
-- insert into M_user(u_id) values(u_id_seq.nextval);
-- ɾ�����б�
drop table M_rate;
drop table M_mumi_image;
drop table M_mumi;
drop table M_links;
drop table M_reply;
drop table M_comment;
drop table M_collection;
drop table M_order_details;
drop table M_orders;
drop table M_product_image;
drop table M_product;
drop table M_category;
drop table M_user;
--1�û���
create table M_user
( 
  u_id number(10) primary key not null, --	�û�id	��	����
  username varchar2(50) unique not null, --	�û���	��	Ψһ�������ڵ�½
  password varchar2(50) not null, --	�û�����	��	
  email	varchar2(50) not null, --	����	��	�����ڵ�½
  phone	varchar2(11) unique not null, --	�ֻ���	��	Ψһ����֤�ֻ���֮����Խ��е�½
  id_card	varchar2(18) unique, --	���֤		Ψһ
  address	varchar2(500), --	�ջ���ַ		
  "level" number(1) default 2, --		�û�����		����Ա���ɶ���д����ɾ��Ϊ1����������ԱΪ0����ͨ�û�Ϊ2
  nickname	varchar2(50), --	�ǳ�		�����ǳƣ��������ڵ�½
  status	number(1) default 0, --	�û�״̬		1����,0��ע��δ����
  money	number(10) default 0, --	�ױ�		
  platform	number(1), --	ע��ƽ̨		1�ֻ���2���䣬3������
  question	varchar2(500), --	�ܱ�����		
  answer	varchar2(500) -- ��
);
comment on table m_user is '�û���';
comment on column m_user.u_id is '�û�id';
--2�����
create table M_category(
  c_id	number(10) primary key not null,--	����id	��	����
  c_name	varchar2(50) not null,--	��������	��
  c_parent_id	number(10) null,--	������id	��	
  c_nav	number(1) default 0, --�Ƿ��ڵ�������ʾ	��	Ĭ��0����ʾ,1��ʾ
  c_file_name varchar2(500) -- ����ͼƬ·��
);
--3��Ʒ��
create table M_product(
  p_id	number(10) primary key not null,--	��Ʒid	��	����
  c_id	number(10) not null,--	��Ʒ��������	��	���
  p_name	varchar2(50) not null,--	��Ʒ����	��	
  market_price	number(10,2),--	ԭ��		
  shop_price	number(10,2),--	�̳Ǽ�		
  rate_id	number(10),--	�ۿ�id		
  rate_flag	number(1),--	�Ƿ����		1 ���� 0 �����ۣ��ؼ۲�Ʒ
  image	varchar2(50),--	����ͼ	(�Լ�����������һ����ͼ�������Сͼ���ͼ��ͼƬ��)	
  description	varchar2(500),--	��Ʒ����		
  flag	number(1),--	��Ʒ״̬		1 ���� 0 �¼�
  inventory	number(10),--	���		
  p_create_time	date,--	��Ʒ�ϼ�ʱ��		sysdate,��Ʒ�ϼ�����
  postage	number(1),--	�Ƿ����		1 ���� 0 ������
  express	varchar2(100),--	��ݹ�˾	
  p_comment number(10),--��Ʒ������(�Լ�������������)
  p_collect number(10),--��Ʒ�ղ���(�Լ���������Ҷ�ϲ��
  p_sales number(10),--��Ʒ����(�Լ�������������
  foreign key(c_id) references m_category(c_id)
);
--4��ƷͼƬ��
create table M_product_image(
  pi_id	number(10) primary key not null,--	ͼƬid	��	����
  p_id	number(10) not null,--	��Ʒid	��	���
  p_file_name	varchar2(500) not null,--	ͼƬ·��	��	
  p_flag	number(1),--	ͼƬ����		1 ��ͼ  0 Сͼ
  p_color	varchar2(50),--	��ɫ		
  foreign key(p_id) references m_product(p_id)
);
-- 5������
create table M_orders(
  o_id	varchar2(20) primary key not null,--	����id	��	����
  u_id	number(10) not null,--	�û�id	��	���
  o_name	varchar2(20),--	�ջ���		
  o_telphone	varchar2(20),--	�ջ��˵绰		
  o_address	varchar2(200),--	�ջ���ַ		
  o_ordertime	date,--	��������ʱ��		sysdate
  o_total	number(10,2),--	�����ܶ�		(���иôν��׵Ĳ�Ʒ)
  o_state	number(1),--	����״̬(�Ƿ񸶿������ȷ�ϣ�)		
  foreign key(u_id) references m_user(u_id)
);
--6���������
create table M_order_details(
  od_id	number(10) primary key not null,--	��������id	��	����
  od_count	number(10),--	��Ʒ����		
  od_subtotal	number(10,2),--	��ƷС��		(ͬһ��Ʒ)
  p_id	number(10),--	��Ʒid	��	���
  o_id	varchar2(20),--	��������id	��	���	
  foreign key(p_id) references m_product(p_id),
  foreign key(o_id) references m_orders(o_id)
);
--7�ղر�
create table M_collection(
  col_id	number(10) primary key not null,--	�ղ�id	��	����
  p_id	number(10) not null,--	��Ʒid	��	���
  u_id	number(10) not null,--	�û�id	��	���
  foreign key(p_id) references m_product(p_id),
  foreign key(u_id) references m_user(u_id)
);
--8���۱�
create table M_comment(
  co_id	number(10) primary key not null,--	����id	��	����
  p_id	number(10) not null,--	��Ʒid	��	���
  co_name	varchar2(50),--	������		
  co_content	varchar2(500),--	��������		
  co_create_time	date,--	����ʱ��		sysdate
  foreign key(p_id) references m_product(p_id)
);
--9�ظ���
create table M_reply(
  r_id	number(10) primary key not null,--	�ظ�id	��	����
  co_id	number(10) not null,--	����id	��	���
  r_name	varchar2(50),--	�ظ���		
  r_content	varchar2(500),--	�ظ�����		
  r_create_time	date,--	�ظ�ʱ��		sysdate
  foreign key(co_id) references m_comment(co_id)
);
--10������
create table M_links(
  l_id	number(10) primary key not null,--	����id	��	����
  l_name	varchar2(50),--	��������		
  l_link	varchar2(500),--	������ַ		
  l_position	number(3)--	��ʾλ��		
);
--11�����
create table M_mumi(
  m_id	number(10) primary key not null,--	����id	��	����
  m_title	varchar2(100) not null,--	�������	��	
  m_money	number(10) not null,--	����۸�	��	
  m_filename	varchar2(500)--	����ͼƬ·��	��		
);
--12����ͼƬ��
create table M_mumi_image(
  mi_id	number(10) primary key not null,--	ͼƬid	��	����
  m_id	number(10) not null,--	����id	��	���
  mi_file_name	varchar2(500) not null,--	ͼƬ·��	��	
  mi_flag	number(1),--	ͼƬ����	��	1 ��ͼ  0 Сͼ
  mi_color	varchar2(50),	--��ɫ	��	
  foreign key(m_id) references m_mumi(m_id)
);
--13�ۿ۱�
create table M_rate(
  rate_id	number(10) primary key not null,--	�ۿ�id	��	����
  ratio	number(3) not null,--	����	��	0-100 ,0 ����ѣ�100�ǲ�����
  rate_name	varchar2(100) not null,--	�����	��	
  jump_href	varchar2(500) not null--	��ת��ַ	��	
);

-- ����һ������
insert into M_category values(c_id_seq.nextval,'�����ֻ�',default,default,default);
insert into M_category values(c_id_seq.nextval,'���������ƽ��',default,default,default);
insert into M_category values(c_id_seq.nextval,'·����������Ӳ��',default,default,default);
insert into M_category values(c_id_seq.nextval,'���߰塢�ƶ���Դ����',default,default,default);
insert into M_category values(c_id_seq.nextval,'����������洢��',default,default,default);
insert into M_category values(c_id_seq.nextval,'����������Ĥ',default,default,default);
insert into M_category values(c_id_seq.nextval,'�������Ի����',default,default,default);
insert into M_category values(c_id_seq.nextval,'С�����ʽ',default,default,default);
-- �����������
insert into M_category values(c_id_seq.nextval,'С��Note',1,default,'images/minote.jpg');
insert into M_category values(c_id_seq.nextval,'С��4',1,default,'images/mi4.jpg');
insert into M_category values(c_id_seq.nextval,'����',1,1,'images/redmi2.jpg');
insert into M_category values(c_id_seq.nextval,'����Note',1,1,'images/redminote.jpg');
insert into M_category values(c_id_seq.nextval,'��Լ��',1,1,'images/heyue.jpg');
insert into M_category values(c_id_seq.nextval,'���ݻ���ѡ���',1,0,'images/typeacc.jpg');

insert into M_category values(c_id_seq.nextval,'С�׵���',2,1,'images/mitv.jpg');
insert into M_category values(c_id_seq.nextval,'С�׺���',2,1,'images/mibox.jpg');
insert into M_category values(c_id_seq.nextval,'С��ƽ��',2,1,'images/mipad.jpg');

insert into M_category values(c_id_seq.nextval,'С��·����',3,1,'images/T1PRJgBmKT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'·����mini',3,1,'images/T1bjCTBy_v1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'С���ֻ�',3,1,'images/T1KjZ_B4bT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�˶����',3,1,'images/T1tZhQB4KT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'����������о',3,1,'images/T1iIhvB7WT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�����',3,1,'images/T1t.bgByAT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'Ѫѹ��',3,1,'images/T18YL_BmLT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'���ܲ���',3,1,'images/T1XHD_BCxT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'������',3,default,'images/T1NUYvBCEv1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'С���ƶ���Դ',4,default,'images/T17DxvB4_T1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'���߰�',4,default,'images/T12.CgB4WT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'Ʒ���ƶ���Դ',4,default,'images/T1OwLvB5AT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'���',4,default,'images/T1QJKvBvJT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�����',4,default,'images/T1DUEvBKxT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�߲�',4,default,'images/T1dAAvBKLT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'С��ͷ��ʽ����',5,default,'images/T1CfKTBQZT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'С�׻�������',5,default,'images/T1DM__B4dT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'С����������',5,default,'images/T1HHVvBKYv1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'Ʒ�ƶ���',5,default,'images/T1wwDgB4JT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'����',5,default,'images/T1qjYgBXYT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�洢��',5,default,'images/T1dmKgB7JT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'������/������',6,default,'images/T1.qETBXAv1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'��Ĥ',6,default,'images/T1uGJvBCdT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'������',6,default,'images/T1UrhvBjKT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'�׼�',7,default,'images/T1BrhvBbDT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'���',7,default,'images/T1d3bvBbKT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'��ֽ',7,default,'images/T14CZgB5hT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�ֻ�֧��',7,default,'images/T13rCvBjhT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'����������',7,default,'images/T1FvDvB7ET1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'����',8,default,'images/T14DJvBXK_1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'����',8,default,'images/T1hlEvB5AT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'С������',8,default,'images/T173VvB7KT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�����ܱ�',8,default,'images/T15SZvB4Av1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'����Ƶ��',8,default,'images/T1aex_BKbT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'�����ֱ�',8,default,'images/T1pGA_BTET1RXrhCrK!40x40.jpg');

-- 3����������Ʒ,һ����ʹ���ϼ���Ʒ
insert into M_product values(p_id_seq.nextval,48,'�۵�����˫���',59,59,default,0,'images/T1NR__BKJT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,331,0,0);
insert into M_product values(p_id_seq.nextval,47,'�����ֻ�U��������',49.9,49.9,default,0,'images/T1ehLgBmET1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,7735,0,0);
insert into M_product values(p_id_seq.nextval,32,'ƻ��Lightning to USB������',39,39,default,0,'images/T1iPEgB5KT1RXrhCrK!220x220.jpg',default,1,200,sysdate,1,default,1624,0,0);
insert into M_product values(p_id_seq.nextval,39,'С���ֻ�4 ���ν��Ƥ���Ʊ�����',49,49,default,0,'images/T10z_gBgxT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,2965,0,0);
-- 3�����ؼ۲�Ʒ
insert into M_product values(p_id_seq.nextval,50,'���ֳ����װ',187.9,168,100,1,'images/T1QELvB7dv1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'���бر���װ',108,128.7,101,1,'images/T1lbxgB7LT1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'����������װ',78,98,102,1,'images/T1M8CvByAv1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'С�׿����װ',59,79,103,1,'images/T1ipAvB_ZT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,0,0);
--3�����ղذ񣬴�Ҷ�ϲ��
insert into M_product values(p_id_seq.nextval,24,'iHealth����Ѫѹ��',199,199,default,0,'images/T1YI__BCWT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,4,0);
insert into M_product values(p_id_seq.nextval,29,'С���ƶ���Դ5000mAh',49,49,default,0,'images/T1pZbvBTET1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,3,0);
insert into M_product values(p_id_seq.nextval,34,'С�׻���������׼��',99,99,default,0,'images/T1o0h_B5VT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,2,0);
insert into M_product values(p_id_seq.nextval,37,'С������������',129,129,default,0,'images/T1gCJgB_dT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,1,0);
--4����ͼƬ��һ����ʹ���ϼ���Ʒ���� ����һ��������ƷͼƬ
insert into M_product_image values(pi_id_seq.nextval,100,'images/T1NR__BKJT1RXrhCrK!220x220.jpg',1,'��ɫ');
insert into M_product_image values(pi_id_seq.nextval,101,'images/T1ehLgBmET1RXrhCrK!220x220.jpg',1,'��ɫ');
insert into M_product_image values(pi_id_seq.nextval,102,'images/T1iPEgB5KT1RXrhCrK!220x220.jpg',1,'��ɫ');
insert into M_product_image values(pi_id_seq.nextval,103,'images/T10z_gBgxT1RXrhCrK!220x220.jpg',1,'��ɫ');
--4����ͼƬ��һ����ʹ���ϼ���Ʒ���� ����һ���ؼ۲�ƷͼƬ
insert into M_product_image values(pi_id_seq.nextval,120,'images/T1QELvB7dv1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,121,'images/T1lbxgB7LT1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,122,'images/T1M8CvByAv1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,123,'images/T1ipAvB_ZT1RXrhCrK!220x220.jpg',1,'��ɫ');
--4����ͼƬ��һ����ʹ���ϼ���Ʒ���� ���ղذ񣬴�Ҷ�ϲ��
insert into M_product_image values(pi_id_seq.nextval,124,'images/T1YI__BCWT1RXrhCrK!220x220.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,125,'images/T1pZbvBTET1RXrhCrK!220x220.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,126,'images/T1o0h_B5VT1RXrhCrK!220x220.jpg',1,'��ɫ');
insert into M_product_image values(pi_id_seq.nextval,127,'images/T1gCJgB_dT1RXrhCrK!220x220.jpg',1,'��ɫ');

-- 8�������۱�,�����԰����
insert into M_comment values(co_id_seq.nextval,100,'������Ц','�о���Ĳ���ͦ�õģ��������۵����ֿ��Էſ�ʹ�ã��ܺã�',sysdate);
insert into M_comment values(co_id_seq.nextval,101,'������Ц','�ﳬ��ֵ���ֻ��������ã�ֵ�ù���',sysdate);
insert into M_comment values(co_id_seq.nextval,102,'������Ц','ƻ��Lightning to USB������ ��ԭװ��Ʒ��һ�������죬�Լ۱ȸߣ���',sysdate);
insert into M_comment values(co_id_seq.nextval,103,'������Ц','С���ֻ�4 ���ν��Ƥ���Ʊ����� �ָв�������Ҳ�ã����Ϻܺ�',sysdate);

-- 13 �����ۿۣ��
insert into M_rate values(rate_id_seq.nextval,(168/187.9)*100,'�ؼ۲�Ʒ','GoodAction?p_id=104');
insert into M_rate values(rate_id_seq.nextval,(108/128.7)*100,'�ؼ۲�Ʒ','GoodAction?p_id=105');
insert into M_rate values(rate_id_seq.nextval,(78/98)*100,'�ؼ۲�Ʒ','GoodAction?p_id=106');
insert into M_rate values(rate_id_seq.nextval,(59/79)*100,'�ؼ۲�Ʒ','GoodAction?p_id=107');
-- ����ظ���

--�ύ
commit;