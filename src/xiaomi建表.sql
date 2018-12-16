-- 删除所有序列
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
-- 创建所有序列
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
-- 删除所有表
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
--1用户表
create table M_user
( 
  u_id number(10) primary key not null, --	用户id	否	主键
  username varchar2(50) unique not null, --	用户名	否	唯一，可用于登陆
  password varchar2(50) not null, --	用户密码	否	
  email	varchar2(50) not null, --	邮箱	否	可用于登陆
  phone	varchar2(11) unique not null, --	手机号	否	唯一，验证手机号之后可以进行登陆
  id_card	varchar2(18) unique, --	身份证		唯一
  address	varchar2(500), --	收货地址		
  "level" number(1) default 2, --		用户级别		管理员（可读可写不可删）为1，超级管理员为0，普通用户为2
  nickname	varchar2(50), --	昵称		个性昵称，不可用于登陆
  status	number(1) default 0, --	用户状态		1正常,0已注册未激活
  money	number(10) default 0, --	米币		
  platform	number(1), --	注册平台		1手机，2邮箱，3第三方
  question	varchar2(500), --	密保问题		
  answer	varchar2(500) -- 答案
);
comment on table m_user is '用户表';
comment on column m_user.u_id is '用户id';
--2分类表
create table M_category(
  c_id	number(10) primary key not null,--	分类id	否	主键
  c_name	varchar2(50) not null,--	分类名称	否
  c_parent_id	number(10) null,--	父分类id	是	
  c_nav	number(1) default 0, --是否在导航条显示	否	默认0不显示,1显示
  c_file_name varchar2(500) -- 分类图片路径
);
--3商品表
create table M_product(
  p_id	number(10) primary key not null,--	商品id	否	主键
  c_id	number(10) not null,--	商品所属分类	否	外键
  p_name	varchar2(50) not null,--	商品名称	否	
  market_price	number(10,2),--	原价		
  shop_price	number(10,2),--	商城价		
  rate_id	number(10),--	折扣id		
  rate_flag	number(1),--	是否打折		1 打折 0 不打折，特价产品
  image	varchar2(50),--	缩略图	(自己话，这里用一个大图？，多个小图或大图在图片表)	
  description	varchar2(500),--	商品详情		
  flag	number(1),--	商品状态		1 正常 0 下架
  inventory	number(10),--	库存		
  p_create_time	date,--	商品上架时间		sysdate,新品上架区域
  postage	number(1),--	是否包邮		1 包邮 0 不包邮
  express	varchar2(100),--	快递公司	
  p_comment number(10),--商品评价数(自己新增，热评榜)
  p_collect number(10),--商品收藏数(自己新增，大家都喜欢
  p_sales number(10),--商品销量(自己新增，销量榜
  foreign key(c_id) references m_category(c_id)
);
--4商品图片表
create table M_product_image(
  pi_id	number(10) primary key not null,--	图片id	否	主键
  p_id	number(10) not null,--	商品id	否	外键
  p_file_name	varchar2(500) not null,--	图片路径	否	
  p_flag	number(1),--	图片类型		1 大图  0 小图
  p_color	varchar2(50),--	颜色		
  foreign key(p_id) references m_product(p_id)
);
-- 5订单表
create table M_orders(
  o_id	varchar2(20) primary key not null,--	订单id	否	主键
  u_id	number(10) not null,--	用户id	否	外键
  o_name	varchar2(20),--	收货人		
  o_telphone	varchar2(20),--	收货人电话		
  o_address	varchar2(200),--	收货地址		
  o_ordertime	date,--	订单生成时间		sysdate
  o_total	number(10,2),--	订单总额		(所有该次交易的产品)
  o_state	number(1),--	订单状态(是否付款？发货，确认？)		
  foreign key(u_id) references m_user(u_id)
);
--6订单详情表
create table M_order_details(
  od_id	number(10) primary key not null,--	订单详情id	否	主键
  od_count	number(10),--	商品数量		
  od_subtotal	number(10,2),--	商品小计		(同一产品)
  p_id	number(10),--	商品id	否	外键
  o_id	varchar2(20),--	所属订单id	否	外键	
  foreign key(p_id) references m_product(p_id),
  foreign key(o_id) references m_orders(o_id)
);
--7收藏表
create table M_collection(
  col_id	number(10) primary key not null,--	收藏id	否	主键
  p_id	number(10) not null,--	商品id	否	外键
  u_id	number(10) not null,--	用户id	否	外键
  foreign key(p_id) references m_product(p_id),
  foreign key(u_id) references m_user(u_id)
);
--8评价表
create table M_comment(
  co_id	number(10) primary key not null,--	评价id	否	主键
  p_id	number(10) not null,--	商品id	否	外键
  co_name	varchar2(50),--	评价人		
  co_content	varchar2(500),--	评论内容		
  co_create_time	date,--	评价时间		sysdate
  foreign key(p_id) references m_product(p_id)
);
--9回复表
create table M_reply(
  r_id	number(10) primary key not null,--	回复id	否	主键
  co_id	number(10) not null,--	评价id	否	外键
  r_name	varchar2(50),--	回复人		
  r_content	varchar2(500),--	回复内容		
  r_create_time	date,--	回复时间		sysdate
  foreign key(co_id) references m_comment(co_id)
);
--10友链表
create table M_links(
  l_id	number(10) primary key not null,--	友链id	否	主键
  l_name	varchar2(50),--	友链名称		
  l_link	varchar2(500),--	友链地址		
  l_position	number(3)--	显示位置		
);
--11主题表
create table M_mumi(
  m_id	number(10) primary key not null,--	主题id	否	主键
  m_title	varchar2(100) not null,--	主题标题	否	
  m_money	number(10) not null,--	主题价格	否	
  m_filename	varchar2(500)--	缩略图片路径	否		
);
--12主题图片表
create table M_mumi_image(
  mi_id	number(10) primary key not null,--	图片id	否	主键
  m_id	number(10) not null,--	主题id	否	外键
  mi_file_name	varchar2(500) not null,--	图片路径	否	
  mi_flag	number(1),--	图片类型	否	1 大图  0 小图
  mi_color	varchar2(50),	--颜色	否	
  foreign key(m_id) references m_mumi(m_id)
);
--13折扣表
create table M_rate(
  rate_id	number(10) primary key not null,--	折扣id	否	主键
  ratio	number(3) not null,--	折率	否	0-100 ,0 是免费，100是不打折
  rate_name	varchar2(100) not null,--	活动名称	否	
  jump_href	varchar2(500) not null--	跳转地址	否	
);

-- 插入一级分类
insert into M_category values(c_id_seq.nextval,'购买手机',default,default,default);
insert into M_category values(c_id_seq.nextval,'购买电视与平板',default,default,default);
insert into M_category values(c_id_seq.nextval,'路由器与智能硬件',default,default,default);
insert into M_category values(c_id_seq.nextval,'插线板、移动电源与电池',default,default,default);
insert into M_category values(c_id_seq.nextval,'耳机音箱与存储卡',default,default,default);
insert into M_category values(c_id_seq.nextval,'保护套与贴膜',default,default,default);
insert into M_category values(c_id_seq.nextval,'后盖与个性化配件',default,default,default);
insert into M_category values(c_id_seq.nextval,'小米生活方式',default,default,default);
-- 插入二级分类
insert into M_category values(c_id_seq.nextval,'小米Note',1,default,'images/minote.jpg');
insert into M_category values(c_id_seq.nextval,'小米4',1,default,'images/mi4.jpg');
insert into M_category values(c_id_seq.nextval,'红米',1,1,'images/redmi2.jpg');
insert into M_category values(c_id_seq.nextval,'红米Note',1,1,'images/redminote.jpg');
insert into M_category values(c_id_seq.nextval,'合约机',1,1,'images/heyue.jpg');
insert into M_category values(c_id_seq.nextval,'根据机型选配件',1,0,'images/typeacc.jpg');

insert into M_category values(c_id_seq.nextval,'小米电视',2,1,'images/mitv.jpg');
insert into M_category values(c_id_seq.nextval,'小米盒子',2,1,'images/mibox.jpg');
insert into M_category values(c_id_seq.nextval,'小米平板',2,1,'images/mipad.jpg');

insert into M_category values(c_id_seq.nextval,'小米路由器',3,1,'images/T1PRJgBmKT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'路由器mini',3,1,'images/T1bjCTBy_v1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'小米手环',3,1,'images/T1KjZ_B4bT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'运动相机',3,1,'images/T1tZhQB4KT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'净化器与滤芯',3,1,'images/T1iIhvB7WT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'摄相机',3,1,'images/T1t.bgByAT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'血压计',3,1,'images/T18YL_BmLT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'智能插座',3,1,'images/T1XHD_BCxT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'体重器',3,default,'images/T1NUYvBCEv1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'小米移动电源',4,default,'images/T17DxvB4_T1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'插线板',4,default,'images/T12.CgB4WT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'品牌移动电源',4,default,'images/T1OwLvB5AT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'电池',4,default,'images/T1QJKvBvJT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'充电器',4,default,'images/T1DUEvBKxT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'线材',4,default,'images/T1dAAvBKLT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'小米头戴式耳机',5,default,'images/T1CfKTBQZT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'小米活塞耳机',5,default,'images/T1DM__B4dT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'小米蓝牙耳机',5,default,'images/T1HHVvBKYv1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'品牌耳机',5,default,'images/T1wwDgB4JT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'音响',5,default,'images/T1qjYgBXYT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'存储卡',5,default,'images/T1dmKgB7JT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'保护套/保护壳',6,default,'images/T1.qETBXAv1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'贴膜',6,default,'images/T1uGJvBCdT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'防尘塞',6,default,'images/T1UrhvBjKT1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'米键',7,default,'images/T1BrhvBbDT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'后盖',7,default,'images/T1d3bvBbKT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'贴纸',7,default,'images/T14CZgB5hT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'手机支架',7,default,'images/T13rCvBjhT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'耳机环绕线',7,default,'images/T1FvDvB7ET1RXrhCrK!40x40.jpg');

insert into M_category values(c_id_seq.nextval,'米兔',8,default,'images/T14DJvBXK_1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'背包',8,default,'images/T1hlEvB5AT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'小米鼠标垫',8,default,'images/T173VvB7KT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'生活周边',8,default,'images/T15SZvB4Av1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'酷玩频道',8,default,'images/T1aex_BKbT1RXrhCrK!40x40.jpg');
insert into M_category values(c_id_seq.nextval,'蓝牙手柄',8,default,'images/T1pGA_BTET1RXrhCrK!40x40.jpg');

-- 3插入热评商品,一般是使用上架商品
insert into M_product values(p_id_seq.nextval,48,'折叠旅行双肩包',59,59,default,0,'images/T1NR__BKJT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,331,0,0);
insert into M_product values(p_id_seq.nextval,47,'米兔手机U盘升级版',49.9,49.9,default,0,'images/T1ehLgBmET1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,7735,0,0);
insert into M_product values(p_id_seq.nextval,32,'苹果Lightning to USB数据线',39,39,default,0,'images/T1iPEgB5KT1RXrhCrK!220x220.jpg',default,1,200,sysdate,1,default,1624,0,0);
insert into M_product values(p_id_seq.nextval,39,'小米手机4 变形金刚皮革纹保护壳',49,49,default,0,'images/T10z_gBgxT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,2965,0,0);
-- 3插入特价产品
insert into M_product values(p_id_seq.nextval,50,'音乐充电套装',187.9,168,100,1,'images/T1QELvB7dv1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'旅行必备套装',108,128.7,101,1,'images/T1lbxgB7LT1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'活力自拍套装',78,98,102,1,'images/T1M8CvByAv1RXrhCrK.jpg',default,1,200,sysdate,0,default,0,0,0);
insert into M_product values(p_id_seq.nextval,50,'小米快充套装',59,79,103,1,'images/T1ipAvB_ZT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,0,0);
--3插入收藏榜，大家都喜欢
insert into M_product values(p_id_seq.nextval,24,'iHealth智能血压计',199,199,default,0,'images/T1YI__BCWT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,4,0);
insert into M_product values(p_id_seq.nextval,29,'小米移动电源5000mAh',49,49,default,0,'images/T1pZbvBTET1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,3,0);
insert into M_product values(p_id_seq.nextval,34,'小米活塞耳机标准版',99,99,default,0,'images/T1o0h_B5VT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,2,0);
insert into M_product values(p_id_seq.nextval,37,'小钢炮蓝牙音箱',129,129,default,0,'images/T1gCJgB_dT1RXrhCrK!220x220.jpg',default,1,200,sysdate,0,default,0,1,0);
--4插入图片，一般是使用上架商品来， 增加一张热评产品图片
insert into M_product_image values(pi_id_seq.nextval,100,'images/T1NR__BKJT1RXrhCrK!220x220.jpg',1,'黑色');
insert into M_product_image values(pi_id_seq.nextval,101,'images/T1ehLgBmET1RXrhCrK!220x220.jpg',1,'蓝色');
insert into M_product_image values(pi_id_seq.nextval,102,'images/T1iPEgB5KT1RXrhCrK!220x220.jpg',1,'白色');
insert into M_product_image values(pi_id_seq.nextval,103,'images/T10z_gBgxT1RXrhCrK!220x220.jpg',1,'黑色');
--4插入图片，一般是使用上架商品来， 增加一张特价产品图片
insert into M_product_image values(pi_id_seq.nextval,120,'images/T1QELvB7dv1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,121,'images/T1lbxgB7LT1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,122,'images/T1M8CvByAv1RXrhCrK.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,123,'images/T1ipAvB_ZT1RXrhCrK!220x220.jpg',1,'黑色');
--4插入图片，一般是使用上架商品来， 增收藏榜，大家都喜欢
insert into M_product_image values(pi_id_seq.nextval,124,'images/T1YI__BCWT1RXrhCrK!220x220.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,125,'images/T1pZbvBTET1RXrhCrK!220x220.jpg',1,default);
insert into M_product_image values(pi_id_seq.nextval,126,'images/T1o0h_B5VT1RXrhCrK!220x220.jpg',1,'黑色');
insert into M_product_image values(pi_id_seq.nextval,127,'images/T1gCJgB_dT1RXrhCrK!220x220.jpg',1,'黑色');

-- 8插入评价表,在留言板插入
insert into M_comment values(co_id_seq.nextval,100,'米聊米笑','感觉真的不错，挺好的，即可以折叠，又可以放开使用，很好！',sysdate);
insert into M_comment values(co_id_seq.nextval,101,'米聊米笑','物超所值，手机电脑两用，值得购买！',sysdate);
insert into M_comment values(co_id_seq.nextval,102,'米聊米笑','苹果Lightning to USB数据线 跟原装线品质一样，充电快，性价比高！！',sysdate);
insert into M_comment values(co_id_seq.nextval,103,'米聊米笑','小米手机4 变形金刚皮革纹保护壳 手感不错，做工也好，贴合很好',sysdate);

-- 13 插入折扣，活动
insert into M_rate values(rate_id_seq.nextval,(168/187.9)*100,'特价产品','GoodAction?p_id=104');
insert into M_rate values(rate_id_seq.nextval,(108/128.7)*100,'特价产品','GoodAction?p_id=105');
insert into M_rate values(rate_id_seq.nextval,(78/98)*100,'特价产品','GoodAction?p_id=106');
insert into M_rate values(rate_id_seq.nextval,(59/79)*100,'特价产品','GoodAction?p_id=107');
-- 插入回复表

--提交
commit;