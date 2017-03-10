/* 创建IMPS数据库 */
create database if not exists imps character set UTF8;

/* 使用当前数据库 */
use imps;

/* 
   如下所有表中几乎所有表都具有siteid字段，目的是为了保持：
   1、与父亲区域表的透明性 
   2、参与上级检索，提高检索速度
*/

/* 用户站点信息 */
create table if not exists site
(
	id	char(64) not null,						/* 本站点ID			*/
	pid	char(64) default '',					/* 父亲站点ID		*/
	islocal tinyint default 0,					/* 是否本地站点		*/
	name char(32) default '', 					/* 软件名称			*/
	address char(255) default '',				/* 站点地址			*/
	telephone char(16) default '',				/* 固定电话			*/
	longtitude float default 0,					/* 站点经度			*/
	latitude float default 0,					/* 站点纬度			*/
	createtime datetime default now(),			/* 创建时间			*/
	registertime datetime default '1970-01-01',	/* 注册时间			*/
	ip int default 0,							/* 公网IP整形存储	*/
	port int default 0,							/* 公网设备端口		*/
	port2 int default 0,						/* 公网备用端口		*/
	status tinyint default 0,					/* 是否禁用[禁止下级]*/
	lasttime datetime default now(),			/* 最后活跃时间		*/
	invitecode char(64) default '',				/* 上级赋予邀请码	*/
	localcode char(16) default '',				/* 站点行政代码		*/
	username char(32) default '',				/* 连接上级用户名	*/
	password char(32) default '',				/* 连接上级密 码	*/
	personidtype smallint default 0,			/* 管理员证件类型	*/
	personid char(32) default '',				/* 管理员证件号码	*/
	personname char(32) default '',				/* 管理员姓名		*/
	personsex tinyint default 0,				/* 性别男女0男1女	*/
	personcellphone char(16) default '',		/* 移动手机			*/
	personemail char(64) default '',			/* email			*/
	pichost char(64) default '',				/* 管理员图片主机	*/
	picdir varchar(512) default '',				/* 管理员图片目录 	*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='soft user right control';

/* 添加主外键*/
alter table site add constraint pk_site primary key(id);

/* 添加组合索引-常用检索列：name createtime registertime localcode*/
alter table site add index index_site_createtime_registertime_localcode(createtime,registertime,localcode);
alter table site add index index_site_name(name);
alter table site add index index_site_localcode(localcode);

/* 
 删除索引 
 DROP INDEX index_name ON table
 */

/* 创建软件序列号 */
create table if not exists softkey
(
	siteid	char(64) not null,			/* 站点ID			*/
	softid	char(64) not null, 			/* 软件ID			*/
	softkey	char(64) not null,			/* 软件序列号		*/
	company	char(128) not null,			/* 公司名称			*/
	machineip int default 0,			/* 机器IP地址		*/
	machiemac char(32) default '', 		/* 机器Mac地址		*/
	starttime datetime default now(),	/* 开始时间			*/
	endtime	datetime default now(),		/* 结束时间			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''  /* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='soft user right control';

/* 添加主外键*/
alter table softkey add constraint pk_softkey primary key(siteid,softid,softkey);
alter table softkey add constraint fk_softkey_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table softkey add index index_softkey_softid_softkey(softid,softkey);
alter table softkey add index index_softkey_company_machiemac(company,machiemac);

/* 人员信息表 */
create table if not exists person
(
	idtype smallint not null,			/* 证件类型			*/
	id  char(32) not null,				/* 证件号码			*/
	name char(32) not null,				/* 人员名称			*/
	sex tinyint,						/* 性别男女0男1女	*/
	idunit char(64),					/* 发证机关			*/
	birthday datetime default now(),	/* 出生日期			*/
	birthaddress char(128) default '',	/* 出生地址 		*/
	picturehost char(64) default '',	/* 图片主机			*/
	picturedir varchar(255) default '',	/* 图片主机子目录	*/
	nation tinyint default 0,			/* 国籍				*/
	ethic smallint default 0,			/* 种族				*/
	telephone char(16) default '',		/* 固定电话			*/
	cellphone char(16) default '',		/* 移动手机			*/
	risklevel smallint default 0,		/* 危险等级			*/
	ismarry	tinyint default 0,			/* 是否已婚			*/
	recordtype tinyint default 0,		/* 信息登记方式0刷卡1手动*/
	email char(64) default '',			/* email			*/
	qq char(16) default '',				/* qq				*/
	remark char(64),					/* 人员备注信息		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='organizasion information record';

/* 添加主外键*/
alter table person add constraint pk_person primary key(idtype, id);

/* 添加索引*/
alter table person add index index_person_name_sex_birthday_risklevel(name,sex,birthday,risklevel);
alter table person add index index_person_sex(sex);
alter table person add index index_person_risklevel(risklevel);
alter table person add index index_person_cellphone(cellphone);


/* 创建机构信息表 -出租屋、酒店、工厂、车站等机构*/
create table if not exists organizasion
(
	siteid char(64) not null,			/* 站点ID			*/
	localcode char(64) default '',		/* 本地行政区编码	*/
	orgid char(64) not null,			/* 组织ID			*/
	name  char(128) not null,			/* 组织名称			*/
	address char(255) not null,			/* 地址				*/
	code char(64) not null,				/* 出租屋登记编号	*/
	orgtype smallint default 0,			/* 组织类型-出租屋类型-自建地|商业用地|公共场所*/
	totalroom int default 0,			/* 单位单元总房间数 */
	policecode char(64) default '',		/* 所属警务处代码	*/
	policename char(128) default '',	/* 所属警务处名称	*/
	pichost char(64) default '',		/* 组织图片主机		*/
	picdir varchar(512) default '',		/* 组织对应图片目录 host+dir组成图片url，如果为http协议则可组成：http://127.0.0.1:8080/images/test.png */
	remark char(128) default '',		/* 组织描述			*/
	owneridtype smallint default 0,		/* 组织管理者证件类型*/
	ownerid char(32) default '',		/* 证件号码			*/
	longtitude float default 0,			/* 位置：经度		*/
	latitude float default 0,			/* 位置：纬度		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='organizasion information record';

/* 添加主外键*/
alter table organizasion add constraint pk_organizasion primary key(orgid);
alter table organizasion add constraint fk_organizasion_person foreign key(owneridtype,ownerid) references person(idtype,id) on delete set null on update cascade;
alter table organizasion add constraint fk_organizasion_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table organizasion add index index_organizasion_name_localcode(name,localcode);
alter table organizasion add index index_organizasion_policename_policecode(policename,policecode);
alter table organizasion add index index_organizasion_owneridtype_ownerid(owneridtype,ownerid);

/* 机构自定义区域 -多建立一张表-利用表的外键关系自动删除*/
create table if not exists pointex
(
	siteid char(64) not null,			/* 站点ID			*/
	orgid char(64) not null,			/* 区域ID			*/
	pointindex int default 0,			/* 点索引			*/
	longtitude float default 0,			/* 经度				*/
	latitude float default 0,			/* 纬度				*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='custom organizasion area point information';

/* 添加主外键*/
alter table pointex add constraint pk_pointex primary key(orgid,pointindex);
alter table pointex add constraint fk_pointex_organizasion foreign key(orgid) references organizasion(orgid) on delete cascade on update cascade;
alter table pointex add constraint fk_pointex_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 创建单位信息*/
create table if not exists unit
(
	siteid char(64) not null,			/* 站点ID			*/
	unitid char(64) not null,			/* 单元ID			*/
	orgid char(64) not null,			/* 所属组织ID		*/
	buildno tinyint default 0,			/* 单元在第几栋楼	*/
	unitno tinyint default 0,			/* 单元编号			*/
	name char(64) default '',			/* 单元名称			*/
	floors smallint default 0,			/* 单元层数			*/
	rooms smallint default 0,			/* 每层房间数		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='organizasion unit information';

/* 添加主外键*/
alter table unit add constraint pk_unit primary key(unitid);
alter table unit add constraint fk_unit_organizasion foreign key(orgid) references organizasion(orgid) on delete cascade on update cascade;
alter table unit add constraint fk_unit_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 
* 创建User注册验证码表 
*
* 如果是房东：
* 1、选择登记的出租屋，填写基本信息并提交注册
* 2、系统确认出租屋户主是提交人员身份信息一致则注册成功，否则注册失败
* 如果是住户：
* 1、选择居住的出租屋，填写基本信息并提交注册	
* 2、系统确认用户居住在该出租屋则注册成功，否则注册失败
* 如果是站点管理员：
* 1、用户信息由管理员通过系统提供接口创建
* 
 */
create table if not exists register
(
	siteid char(64) not null,			/* 站点ID			*/
	username char(64) not null,			/* 注册的用户名,保证在站点的唯一性*/
	password char(64) not null,			/* 密 码			*/
	
	isloader tinyint default 0,			/* 是否房东			*/
	idtype smallint not null,			/* 证件类型			*/
	id  char(32) not null,				/* 证件号码			*/
	name char(32) not null,				/* 人员名称			*/
	sex tinyint default 0,				/* 性别男女0男1女	*/
	idunit char(64) default '',			/* 发证机关			*/
	birthday datetime default now(),	/* 出生日期			*/
	birthaddress char(128) default '',	/* 出生地址 		*/
	picturehost char(64) default '',	/* 图片主机			*/
	picturedir varchar(255) default '',	/* 图片主机子目录	*/
	nation tinyint default 0,			/* 国籍				*/
	ethic smallint default 0,			/* 种族				*/
	telephone char(16) default '',		/* 固定电话			*/
	cellphone char(16) default '',		/* 移动手机			*/
	risklevel smallint default 0,		/* 危险等级			*/
	ismarry	tinyint default 0,			/* 是否已婚			*/
	recordtype tinyint default 0,		/* 信息登记方式0刷卡1手动*/
	email char(64) default '',			/* email			*/
	qq char(16) default '',				/* qq				*/
	
	orgid char(64) not null,			/* 居住在哪一出租屋或管理哪一出租屋*/
	passed tinyint default 0,			/* 是否通过审核		*/

	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''  /* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user register information';

/* 添加主外键*/
alter table register add constraint pk_register primary key(siteid,username);
alter table register add constraint fk_register_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table register add index index_register_username(username);
alter table register add index index_register_idtype_id(idtype,id);
alter table register add index index_register_name_sex(name,sex);

/* 
*用户信息表 
*如果是站点用户
*	创建用户时基本信息必须已经添加到系统中[输入完身份证自动显示详细信息到界面] 
*如果是非站点用户
*	可以使用针对系统用户创建接口进行添加[最好普通用户通过注册接口进行注册，以免增加管理员负担]
*/
create table if not exists user
(
	siteid char(64) not null,			/* 站点ID			*/
	username char(16) not null,			/* 用户名			*/
	password char(64) not null,			/* 密 码				*/
	type tinyint default 0,				/* 1、站点用户、2房东、3住户*/
	subtype tinyint default 0,			/* 站点用户类型：1管理员2操作员*/
	enable tinyint default 0,			/* 用户禁用状态		*/
	registertime datetime default now(),/* 注册时间			*/
	
	personidtype smallint default 0,	/* 人员证件类型		*/
	personid char(32) default '',		/* 证件号码			*/
	
	publickey varchar(2048) default '',	/* 公钥				*/
	privatekey varchar(2048) default '',/* 私钥				*/
	aeskey varchar(256) default '',		/* 128、192、256	*/
	
	token char(64) default '',			/* 用户token		*/
	lasttime datetime default now(),	/* 最后访问时间		*/
	
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user information table';

/* 添加主外键*/
alter table user add constraint pk_user primary key(siteid,username);
alter table user add constraint fk_user_site foreign key(siteid) references site(id) on delete no action on update cascade;
/*---需建立人员表的触发器删除用户----*/

/* 添加索引*/
alter table user add index index_user_name(username);
alter table user add index index_user_personidtype_personid(personidtype,personid);

/* 系统角色信息表*/
create table if not exists roles(
	type int default 0,					/* 角色类型			*/
	name char(32) default '',			/* 角色名			*/
	description char(64) default '',	/* 角色描述			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='system roles information';

/* 添加主外键*/
alter table roles add constraint pk_roles primary key(type);

/* 用户角色表 */
create table if not exists userroles(
	siteid char(64) not null,			/* 站点ID			*/
	username char(16) not null,			/* 用户名			*/
	roletype int default 0,				/* 角色类型			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user roles relationship table';

/* 添加主外键*/
alter table userroles add constraint pk_userroles primary key(siteid,username,roletype);
/* 添加外键 */
alter table userroles add constraint fk_userroles_user foreign key(siteid,username) references user(siteid,username) on delete cascade on update cascade;
alter table userroles add constraint fk_userroles_rolses foreign key(roletype) references roles(type) on delete cascade on update cascade;

/* 系统权限表*/
create table if not exists rights(
	id char(64) not null,				/* 权限ID			*/
	mainright bigint default 0,			/* 主模块权限		*/
	subright bigint default 0,			/* 子模块权限		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='system role information';

/* 添加主外键*/
alter table rights add constraint pk_roles primary key(id);

/* 角色权限表*/
create table if not exists rolesrights(
	roletype int default 0,				/* 角色类型			*/
	rightid char(64) not null,			/* 权限ID			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='system role rights table';

/* 添加主外键*/
alter table rolesrights add constraint pk_rolesrights primary key(roletype,rightid);
/* 添加外键 */
alter table rolesrights add constraint fk_rolesrights_roles foreign key(roletype) references roles(type) on delete cascade on update cascade;
alter table rolesrights add constraint fk_rolesrights_rights foreign key(rightid) references rights(id) on delete cascade on update cascade;

/* 区域信息表 */
create table if not exists region
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 区域行政编码(6位)*/
	name char(64) not null,				/* 区域名称			*/
	pid char(64) not null,				/* 父区域ID			*/
	type tinyint default 0,				/* 区域类型			*/
	iscustom tinyint default 0,			/* 是否自定义区域自定义区域有point数组	*/
	pichost char(64) default '',		/* 区域图片主机		*/
	picdir varchar(512) default '',		/* 区域对应图片目录 */
	remark char(128) default '',		/* 备注信息			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='region information table';

/* 添加主外键*/
alter table region add constraint pk_region primary key(id);
alter table region add constraint fk_region_region foreign key(pid) references region(id) on delete cascade on update cascade;
alter table region add constraint fk_region_site foreign key(siteid) references site(id) on delete no action on update cascade;


/* 自定义区域 */
create table if not exists point
(
	siteid char(64) not null,			/* 站点ID			*/
	regionid char(64) not null,			/* 区域ID			*/
	pointindex int default 0,			/* 点索引			*/
	longtitude float default 0,			/* 经度				*/
	latitude float default 0,			/* 纬度				*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='custom area point information';

/* 添加主外键*/
alter table point add constraint pk_point primary key(regionid,pointindex);
alter table point add constraint fk_point_region foreign key(regionid) references region(id) on delete cascade on update cascade;
alter table point add constraint fk_point_site foreign key(siteid) references site(id) on delete no action on update cascade;


/* 设备信息*/
create table if not exists device
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 设备ID			*/
	manufacture int default 0,			/* 设备厂家			*/
	type int default 0,					/* 设备型号			*/
	serial char(64) default '',			/* 设备序列号		*/
	ip int default 0,					/* 设备IP			*/
	port int default 0,					/* 设备端口			*/
	port2 int default 0,				/* 设备端口2		*/
	username char(32) default '',		/* 用户名			*/
	password char(32) default '',		/* 密  码			*/
	channels int default 0,				/* 通道数目			*/
	version char(32) default '',		/* 设备版本			*/
	softversion char(32) default '',	/* 软件版本			*/
	nvasid char(64) default '',			/* 接入服务器ID		*/
	isfree tinyint default 1,			/* 是否空闲-连接	*/
	linkip int default 0,				/* 如果连接,连接IP多少*/
	linkport int default 0,				/* 连接端口是多少	*/
	ispublic tinyint default 0,			/* 是否公共设备,如果是都可以看*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='device base information';

/* 添加主外键*/
alter table device add constraint pk_device primary key(id);
alter table device add constraint fk_device_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table device add index index_device_siteid_manufacture_type_ip(siteid,manufacture,type, ip);
alter table device add index index_device_nvasid(nvasid);


/* 电视墙信息表*/
create table if not exists tvwall
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 电视墙ID			*/
	name char(32) not null,				/* 电视墙名称		*/
	trow tinyint default 0,				/* 多少行			*/
	tcol tinyint default 0,				/* 多少列			*/
	resolution tinyint default 0,		/* 分辨率类型		*/
	formattype tinyint default 0,		/* 格式类型PAL或NTSC*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tvwall parameter information';

/* 添加主外键*/
alter table tvwall add constraint pk_tvwall primary key(id);
alter table tvwall add constraint fk_tvwall_site foreign key(siteid) references site(id) on delete no action on update cascade;


/* 电视墙屏幕表 */
create table if not exists tvwallscreen
(
	siteid char(64) not null,			/* 站点ID			*/
	tvwallid char(64) not null,			/* 电视墙ID			*/
	id varchar(64) not null,			/* 屏幕ID			*/
	ischild tinyint default 0,			/* 是否子屏幕		*/
	parentid varchar(64) default '',	/* 父屏幕ID			*/
	screenindex tinyint,				/* 屏幕索引			*/
	screentype tinyint,					/* 屏幕类型：常规或关注*/
	decorderid char(64) default '',		/* 屏幕绑定的解码器ID*/
	decorderchannel tinyint default 0,	/* 绑定解码器的通道 */
	decorderouttype tinyint default 0,	/* 解码器的输出类型	*/
	decorderoutchannel tinyint default 0,		/* 解码器的输出通道	*/
	srow tinyint default 0,						/* 屏幕分屏行数		*/
	scol tinyint default 0,						/* 屏幕分屏列数		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tvwall screen parameter information';

/* 添加主外键*/
alter table tvwallscreen add constraint pk_tvwallscreen primary key(id);
alter table tvwallscreen add constraint fk_tvwallscreen_tvwall foreign key(tvwallid) references tvwall(id) on delete cascade on update cascade;
alter table tvwallscreen add constraint fk_tvwallscreen_site foreign key(siteid) references site(id) on delete no action on update cascade;


/* 常规解码配置 */
create table if not exists decodeconfig
(
	siteid char(64) not null,			/* 站点ID			*/
	screenid char(64) not null,			/* 屏幕ID			*/
	windowindex tinyint default 0,		/* 屏幕的哪一个窗口 */
	deviceid char(64) not null,			/* 解码设备ID		*/
	channel tinyint default 0,			/* 解码哪个通道		*/
	streamtype tinyint default 0,		/* 实时流类型		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tvwall screen decoe configuration information';

/* 添加主外键*/
alter table decodeconfig add constraint pk_decodeconfig primary key(screenid,windowindex,deviceid,channel);
alter table decodeconfig add constraint fk_decodeconfig_device foreign key(deviceid) references device(id) on delete no action on update cascade;
alter table decodeconfig add constraint fk_decodeconfig_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 设备通道分析策略*/
create table if not exists strategy
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 策略ID			*/
	deviceid char(64) not null,			/* 设备ID			*/
	channel smallint default 0,			/* 设备通道			*/
	scenetype int default 0,			/* 场景类型			*/
	actiontype int default 0,			/* 联动类型			*/
	isenable tinyint default 0,			/* 是否启用			*/
	sensitivity int default 0,			/* 灵敏度			*/
	graphtype tinyint default 0,		/* 场景点数组类型1线2三角形4正方形5多边形 */
	isring tinyint default 0,			/* 是否响铃			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='device analysis strategy';

/* 添加主外键*/
alter table strategy add constraint pk_strategy primary key(id);
alter table strategy add constraint fk_strategy_device foreign key(deviceid) references device(id) on delete cascade on update cascade;
alter table strategy add constraint fk_strategy_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table strategy add index index_strategy_deviceid_channel_scenetype_isenable(deviceid,channel,scenetype,isenable);


/* 策略有效时间段*/
create table if not exists timespan
(
	siteid char(64) not null,			/* 站点ID			*/
	strategyid char(64) not null,		/* 策略ID			*/
	id char(64) not null,				/* 时间段ID			*/
	weekday int default 1,				/* 周1-7(日) 1~7	*/
	isallday tinyint default 0,			/* 是否全天			*/
	starthour tinyint default 0,		/* 开始时间：时		*/
	startminute tinyint default 0,		/* 开始时间：分		*/
	startsecond tinyint default 0,		/* 开始时间：秒		*/
	endhour tinyint default 0,			/* 结束时间：时		*/
	endminute tinyint default 0,		/* 结束时间：分		*/
	endsecond tinyint default 0,		/* 结束时间：秒		*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='strategy time span configuration'; 

/* 添加主外键*/
alter table timespan add constraint pk_timespan primary key(id);
alter table timespan add constraint fk_timespan_device foreign key(strategyid) references strategy(id) on delete cascade on update cascade;
alter table timespan add constraint fk_timespan_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 场景参数点数组*/
create table if not exists strategypoint
(
	siteid char(64) not null,			/* 站点ID			*/
	strategyid char(64) not null,		/* 策略ID			*/
	id char(64) not null,				/* 策略点ID			*/
	xpos int default 0,					/* x位置			*/
	ypos int default 0,					/* y位置			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='strategy scene area configuration'; 

/* 添加主外键*/
alter table strategypoint add constraint pk_strategypoint primary key(id);
alter table strategypoint add constraint fk_strategypoint_strategy foreign key(strategyid) references strategy(id) on delete cascade on update cascade;
alter table strategypoint add constraint fk_strategypoint_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 录像抓拍联动参数表*/
create table if not exists recordaction
(
	siteid char(64) not null,			/* 站点ID			*/
	strategyid char(64) not null,		/* 策略ID			*/
	id char(64) not null,				/* 录像抓拍联动ID	*/
	iscapture tinyint default 0,		/* 是否抓拍			*/
	capturetimes tinyint default 0,		/* 连抓几张图		*/
	capturegap float default 1,			/* 连抓的时间间隔	*/
	recordsvrid char(64) not null,		/* 录像服务器ID		*/
	recordtime tinyint default 10,		/* 录像时长			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='record or capture action parameter'; 

/* 添加主外键*/
alter table recordaction add constraint pk_recordaction primary key(id);
alter table recordaction add constraint fk_recordaction_strategy foreign key(strategyid) references strategy(id);
alter table recordaction add constraint fk_recordaction_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 电视墙联动参数表*/
create table if not exists tvwallaction
(
	siteid char(64) not null,			/* 站点ID			*/
	strategyid char(64) not null,		/* 场景参数ID		*/
	id char(64) not null,				/* 电视墙联动ID		*/
	tvwallid char(64) not null,			/* 联动电视墙ID		*/
	tvwalltype tinyint default 0,		/* 联动电视墙类型	*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tvwall action parameter'; 

/* 添加主外键*/
alter table tvwallaction add constraint pk_tvwallaction primary key(id);
alter table tvwallaction add constraint fk_tvwallaction_strategy foreign key(strategyid) references strategy(id);
alter table tvwallaction add constraint fk_tvwallaction_tvwallid foreign key(tvwallid) references tvwall(id);
alter table tvwallaction add constraint fk_tvwallaction_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 以出租屋为例：人员居住信息表-房屋出租表-部分信息荣誉目的是为了删除后仍有记录*/
create table if not exists rentinfo
(
	siteid char(64) not null,			/* 站点ID			*/
	personidtype smallint not null,		/* 组织管理者证件类型*/
	personid char(32) default '',		/* 证件号码			*/
	orgid char(64) not null,			/* 组织ID-如出租屋	*/
	name  char(128) not null,			/* 组织名称			*/
	address char(255) default '',		/* 地址				*/
	orgtype smallint default 0,			/* 组织类型-出租屋类型-自建地|商业用地|其他*/
	policecode char(64) default '',		/* 所属警务处代码	*/
	policename char(128) default '',	/* 所属警务处名称	*/
	owneridtype smallint,				/* 组织管理者证件类型*/
	ownerid char(32) default '',		/* 证件号码			*/
	rentfloor smallint default 0,		/* 居住楼号			*/
	rentroom char(16) not null,			/* 居住房间号		*/
	rentway tinyint default 0,			/* 居住方式0日租1月租2年租*/
	starttime datetime default '1970-01-01',/* 签约时间-开始时间*/
	rentstatus tinyint default 1,		/* 是否正在居住1正在居住0离开*/
	endtime datetime default now(),		/* 离开时间			*/	
	isout tinyint default 0,			/* 是否外出 		*/
	deposit float default 0,			/* 押金				*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='person rent information record';

/* 添加主外键*/
alter table rentinfo add constraint pk_rentinfo primary key(personidtype,personid,orgid);
alter table rentinfo add constraint fk_rentinfo_person foreign key(personidtype,personid) references person(idtype,id) on delete no action on update cascade;
alter table rentinfo add constraint fk_rentinfo_organizasion foreign key(orgid) references organizasion(orgid) on delete no action on update cascade;
alter table rentinfo add constraint fk_rentinfo_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table rentinfo add index index_rentinfo_idtype_id_starttime_endtime_rentstatus(personidtype,personid,starttime,endtime,rentstatus);
alter table rentinfo add index index_rentinfo_starttime_endtime_rentstatus_isout(starttime,endtime,rentstatus,isout);


/* 人员缴费记录表 */
create table if not exists feerecord
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 缴费记录ID		*/
	personidtype smallint not null,		/* 组织管理者证件类型*/
	personid char(32) not null,			/* 证件号码			*/
	orgid char(64) default '',			/* 组织者ID如出租屋ID*/
	rentfloor smallint default 0,		/* 居住楼号			*/
	rentroom char(16) default '',		/* 居住的房间号		*/
	paytime datetime default now(),		/* 本次结账时间		*/
	waterfee float default 0,			/* 水费				*/
	elecfee	float default 0,			/* 电费				*/
	propertyfee float default 0,		/* 物业费			*/
	gasfee float default 0,				/* 燃气费			*/
	webfee float default 0,				/* 网络费			*/
	tvfee float default 0,				/* 电视费			*/
	garbagefee float default 0,			/* 垃圾处理费		*/
	otherfee float default 0,			/* 其他费用			*/
	otherfeedetail varchar(1024),		/* 其他费用详情		*/
	payway tinyint default 0,			/* 支付方式			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='person pay record information record';

/* 添加主外键*/
alter table feerecord add constraint pk_feerecord primary key(id);
alter table feerecord add constraint fk_feerecord_person foreign key(personidtype,personid) references person(idtype,id) on delete cascade on update cascade;
alter table feerecord add constraint fk_feerecord_organizasion foreign key(orgid) references organizasion(orgid) on delete set null on update cascade;
alter table feerecord add constraint fk_feerecord_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table feerecord add index index_feerecord_personidtype_personid_orgid_paytime(personidtype,personid,orgid,paytime);


/* 门信息*/
create table if not exists door
(
	siteid char(64) not null,			/* 站点ID			*/
	unitid char(64) not null,			/* 单元ID			*/
	doorid char(64) not null,			/* 门ID				*/
	doorname char(64) not null,			/* 门名称			*/
	doorno tinyint default 0,			/* 门序号			*/
	isopen tinyint default 0,			/* 是否打开			*/
	deviceid char(64) default '',		/* 关联的门禁设备	*/
	incamera char(64) default '',		/* 进门关联的摄像头 */
	inchannel tinyint default 0,		/* 进门关联的摄像头通道*/
	instreamtype tinyint default 0,		/* 进门关联视频码流类型*/
	outcamera char(64) default '',		/* 出门关联的摄像头 */
	outchannel tinyint default 0,		/* 出门关联的摄像头通道*/
	outstreamtype tinyint default 0,	/* 出门关联视频码流类型*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='door information';

/* 添加主外键*/
alter table door add constraint pk_door primary key(doorid);
alter table door add constraint fk_door_device foreign key(deviceid) references device(id) on delete set null on update cascade;
alter table door add constraint fk_door_unit foreign key(unitid) references unit(unitid) on delete cascade on update cascade;
alter table door add constraint fk_door_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 卡片信息*/
create table if not exists card
(
	siteid char(64) not null,			/* 站点ID			*/
	id char(64) not null,				/* 卡号				*/
	category tinyint default 0,			/* 卡片种类IC或ID或身份证*/
	type tinyint default 1,				/* 卡片类型1普通卡2残疾卡3黑名单卡4巡更卡5胁迫卡6超级卡7来宾卡*/
	isloader tinyint default 1,			/* 是否为首卡		*/
	password char(16) default '',		/* 卡密码开门-双保险*/
	status tinyint default 1,			/* 是否使用			*/
	personidtype smallint not null,		/* 组织管理者证件类型*/
	personid char(32) not null,			/* 证件号码			*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='card information';

/* 添加主外键*/
alter table card add constraint pk_card primary key(siteid,id);
alter table card add constraint fk_card_person foreign key(personidtype,personid) references person(idtype,id) on delete cascade on update cascade;
alter table card add constraint fk_card_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table card add index index_card_id_category(id,category,status);
alter table card add index index_card_type(type,status);
alter table card add index index_card_personidtype_personid_status(personidtype,personid,status);


/* 卡片权限信息*/
create table if not exists cardright
(
	siteid char(64) not null,			/* 站点ID			*/
	cardid char(64) not null,			/* 卡号				*/
	doorid char(64) not null,			/* 门ID				*/
	starttime datetime default now(),	/* 开始时间			*/
	endtime datetime default now(),		/* 结束时间			*/
	maxtimes int default 0,				/* 最大刷卡次数		*/
	swiptimes int default 0,			/* 已经刷了多少次	*/
	type tinyint default 0,				/* 短租|月租|长期授权*/
	reserver1 int default 0,			/* 保留字段			*/
	reserver2 int default 0,			/* 保留字段			*/
	reserver3 varchar(1024) default ''	/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='card right information';

/* 添加主外键*/
alter table cardright add constraint pk_cardright primary key(siteid,cardid,doorid);
alter table cardright add constraint fk_cardright_door foreign key(doorid) references door(doorid) on delete cascade on update cascade;
alter table cardright add constraint fk_cardright_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table cardright add index index_cardright_cardid_doorid(cardid,doorid);


/* 车牌识别报警*/
create table if not exists carnumeralarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 车牌图片主机		*/					
	capturedir varchar(512) default '',			/* 车牌图片目录 	*/
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	
	driverno tinyint default 0,					/* 触发车道号		*/
	vehicletype int default 0,					/* 车辆类型			*/
	direction tinyint default 0,				/* 0表示从上往下，1表示从下往上*/
	platetype tinyint default 0,				/* 车牌类型			*/
	platecolor tinyint default 0,				/* 车牌颜色			*/
	platebright tinyint default 0,				/* 车牌亮度			*/
	license char(16) default '',				/* 车牌号码			*/
	believe char(32) default '',				/* 置信度：车牌"浙A12345",置信度为,20,30,40,50,60,70*/
    vehicletype2 int default 0,					/* 0其它车型1小型车2大型车3表示行人触发4二轮车5三轮车*/	
	carcolordepth tinyint default 0,			/* 车身颜色深浅		*/
	carcolor tinyint default 0,					/* 车身颜色			*/
	speed int default 0,						/* 车行驶速度km/h   */
	carlength int default 0,					/* 车身长度			*/
	illegaltype tinyint default 0,				/*违规类型，0-正常，1-低速，2-超速，3-逆行，4-闯红灯,5-压车道线,6-不按导向，7-路口滞留，
                            8-机占非，9-违法变道，10-不按车道 11-违反禁令，12-路口停车，13-绿灯停车, 14-未礼让行人(违法代码1357), 
    15-违章停车，16-违章掉头,17-占用应急车道,18-禁右,19-禁左,20-压黄线,21-未系安全带,22-行人闯红灯,23-加塞*/
	vehiclelogo int default 0,					/* 车辆品牌类型		*/
	vehiclesublogo int default 0,				/* 车辆品牌子类型	*/
	vehiclemodel tinyint default 0,				/* 车辆子品牌年款0-未知，参考"车辆子品牌年款.xlsx"*/
	backpichost char(64) default '',			/* 背景图片主机		*/
	backpicdir varchar(512) default '',			/* 背景图片目录		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/			
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='car number identify information' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table carnumeralarm add constraint pk_carnumeralarm primary key(id,alarmtime);
-- alter table carnumeralarm add constraint fk_carnumeralarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table carnumeralarm add index index_carnumeralarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table carnumeralarm add index index_carnumeralarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);
alter table carnumeralarm add index index_carnumeralarm_alarmtime_license_logo_sublogo_model(alarmtime,license,vehiclelogo,vehiclesublogo,vehiclemodel);
alter table carnumeralarm add index index_carnumeralarm_illegaltype(illegaltype);


/* 周界报警*/
create table if not exists linealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',    		/* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	
	isenable tinyint default 0,					/* 是否开启			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/			
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='linealarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table linealarm add constraint pk_linealarm primary key(id,alarmtime);
-- alter table linealarm add constraint fk_linealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table linealarm add index index_linealarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table linealarm add index index_linealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);

/* 逗留报警*/
create table if not exists stayalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	
	isenable tinyint default 0,					/* 是否开启			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stayalarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table stayalarm add constraint pk_stayalarm primary key(id,alarmtime);
-- alter table stayalarm add constraint fk_stayalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table stayalarm add index index_stayalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table stayalarm add index index_stayalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 楼道报警*/
create table if not exists flooralarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	
	isenable tinyint default 0,					/* 是否开启			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='flooralarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table flooralarm add constraint pk_flooralarm primary key(id,alarmtime);
-- alter table flooralarm add constraint fk_flooralarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table flooralarm add index index_flooralarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table flooralarm add index index_flooralarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);

/* 电梯报警*/
create table if not exists liftalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	isenable tinyint default 0,					/* 是否开启			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='liftalarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table liftalarm add constraint pk_liftalarm primary key(id,alarmtime);
-- alter table liftalarm add constraint fk_liftalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table liftalarm add index index_liftalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table liftalarm add index index_liftalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 火焰检测报警*/
create table if not exists firealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255),						/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	isenable tinyint default 0,					/* 是否开启			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='firealarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table firealarm add constraint pk_firealarm primary key(id,alarmtime);
-- alter table firealarm add constraint fk_firealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table firealarm add index index_firealarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table firealarm add index index_firealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 物品看护(丢失)|物品遗留报警*/
create table if not exists goodsalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	isenable tinyint,							/* 是否开启			*/
	islost tinyint,								/* 是否是物品丢失报警*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='goodsalarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table goodsalarm add constraint pk_goodsalarm primary key(id,alarmtime);
-- alter table goodsalarm add constraint fk_goodsalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table goodsalarm add index index_goodsalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table goodsalarm add index index_goodsalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 烟感报警*/
create table if not exists smokealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='smoke alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table smokealarm add constraint pk_smokealarm primary key(id,alarmtime);
-- alter table smokealarm add constraint fk_smokealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table smokealarm add index index_smokealarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table smokealarm add index index_smokealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 破玻报警*/
create table if not exists brokenalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='broken alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table brokenalarm add constraint pk_brokenalarm primary key(id,alarmtime);
-- alter table brokenalarm add constraint fk_brokenalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table brokenalarm add index index_brokenalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table brokenalarm add index index_brokenalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 防拆报警*/
create table if not exists tearalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	handleuser char(32) default '',				/* 处理用户			*/
	handletime datetime default now(),			/* 处理时间			*/
	handletype int default 0,					/* 处理类型			*/
	handleremark char(255) default '',			/* 处理备注			*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='uninstall alarm alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table tearalarm add constraint pk_tearalarm primary key(id,alarmtime);
-- alter table tearalarm add constraint fk_tearalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table tearalarm add index index_tearalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table tearalarm add index index_tearalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);

/* 人流量统计*/
create table if not exists personflowalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	inputnumber int default 0,					/* 进入人数			*/
	outputnumber int default 0,					/* 出去人数			*/
	uploadmode tinyint default 0,				/* 多少分钟统计一次,默认为小时*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='person flow alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table personflowalarm add constraint pk_personflowalarm primary key(id,alarmtime);
-- alter table personflowalarm add constraint fk_personflowalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table personflowalarm add index index_personflowalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table personflowalarm add index index_personflowalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);

/* 视频质量统计*/
create table if not exists videoqosalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int,							/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	alarmtype int default 0,					/* 视频质量问题类型	*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='video QOS alarm record' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table videoqosalarm add constraint pk_videoqosalarm primary key(id,alarmtime);
-- alter table videoqosalarm add constraint fk_videoqosalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table videoqosalarm add index index_videoqosalarm_deviceip_channel_alarmtime_alarmtype_siteid(deviceip,channel,alarmtime,alarmtype,siteid);
alter table videoqosalarm add index index_videoqosalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);

/* 设备上下线记录 */
create table if not exists onlinealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	isonline tinyint default 0,					/* 是否上线			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='device online or offline alarm' partition by range columns(alarmtime)
(
  partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table onlinealarm add constraint pk_onlinealarm primary key(id,alarmtime);
-- alter table onlinealarm add constraint fk_onlinealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table onlinealarm add index index_onlinealarm_deviceip_channel_alarmtime_isonline_siteid(deviceip,channel,alarmtime,isonline,siteid);
alter table onlinealarm add index index_onlinealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 刷卡开门记录 */
create table if not exists inoutalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/
	
	carid char(16) default '',					/* 卡片ID			*/
	isout tinyint default 0,					/* 是否出门			*/
	personidtype smallint not null,				/* 识别的人员证件类型*/
	personid char(32) not null,					/* 识别的人员证件号码*/
	personname char(32) not null,				/* 人员名字			*/
	personethic tinyint default 0,				/* 人员种族			*/
	risktype tinyint default 0,					/* 人员危险程度		*/
	cellphone char(16) default '',				/* 人员手机号码		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='video inline or offline alarm record' partition by range columns(alarmtime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table inoutalarm add constraint pk_inoutalarm primary key(id,alarmtime);
-- alter table inoutalarm add constraint fk_inoutalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table inoutalarm add index index_inoutalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table inoutalarm add index index_inoutalarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);
alter table inoutalarm add index index_inoutalarm_alarmtime_carid(alarmtime,carid);
alter table inoutalarm add index index_inoutalarm_alarmtime_personidtype_personid(alarmtime,personidtype,personid);
alter table inoutalarm add index index_inoutalarm_alarmtime_risktype_personethic(alarmtime,risktype,personethic);

/* 人脸黑名单 */
create table if not exists faceblacklist
(
	siteid char(64) not null,					/* 站点ID			*/
	personidtype smallint not null,				/* 识别的人员证件类型*/
	personid char(32) not null,					/* 识别的人员证件号码*/
	personname char(32) not null,				/* 人员名称			*/
	personsex tinyint default 0,				/* 性别男女0男1女	*/
	birthday datetime default now(),			/* 出生日期			*/
	picturehost char(64) default '',			/* 图片主机			*/
	picturedir1 char(255) default '',			/* 图片1主机子目录	*/
	picturedir2 char(255) default '',			/* 图片2主机子目录	*/
	picturedir3 char(255) default '',			/* 图片2主机子目录	*/
	province char(8) default '',				/* 省份				*/
	city char(8) default '',					/* 城市				*/
	casetype char(32) default '',				/* 案件类型			*/
	remark1 char(32) default '',				/* 标签1			*/
	remark2 char(32) default '',				/* 标签2			*/
	remark3 char(32) default '',				/* 标签3			*/
	remark4 char(32) default '',				/* 标签4			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='face black list';

/* 添加主外键*/
alter table faceblacklist add constraint pk_faceblacklist primary key(siteid,personidtype,personid);
alter table faceblacklist add constraint fk_faceblacklist_site foreign key(siteid) references site(id) on delete no action on update cascade;


/* 人脸识别记录 */
create table if not exists facealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	capturehost char(64) default '',            /* 抓拍图片主机		*/					
	capturedir varchar(512) default '',			/* 抓拍对应图片目录 */
	recordhost char(64) default '',				/* 录像文件主机		*/
	recorddir varchar(512) default '',			/* 录像文件子目录	*/

	xpos float default 0,						/* 人脸X坐标		*/
	ypos float default 0,						/* 人脸Y坐标		*/
	width float default 0,						/* 人脸图宽度		*/
	height float default 0,						/* 人脸图高度		*/
	sex tinyint default 0,						/* 人脸识别性别		*/
	color tinyint default 0,					/* 人脸识别人种颜色 */
	age tinyint default 0,						/* 人脸识别年龄段	*/
	isglass tinyint default 0,					/* 是否带眼镜		*/
	backpichost char(64) default '',			/* 背景图主机		*/
	backpicdir varchar(512) default '',			/* 背景图目录		*/
	personidtype smallint not null,				/* 识别的人员证件类型*/
	personid char(32) not null,					/* 识别的人员证件号码*/
	personname char(32) not null,				/* 人员名字			*/
	personethic tinyint default 0,				/* 人员种族			*/
	risktype tinyint default 0,					/* 人员危险程度		*/
	cellphone char(16) default '',				/* 人员手机号码		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='face regconization QOS alarm record' partition by range columns(alarmtime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table facealarm add constraint pk_facealarm primary key(id,alarmtime);
-- alter table facealarm add constraint fk_facealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table facealarm add index index_facealarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table facealarm add index index_facealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);
alter table facealarm add index index_facealarm_alarmtime_personidtype_personid(alarmtime,personidtype,personid);
alter table facealarm add index index_facealarm_risktype_personethic(risktype,personethic);
alter table facealarm add index index_facealarm_cellphone(cellphone);


/* Wifi探针记录 */
create table if not exists wifialarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	
	macaddr char(64) default '',				/* mac地址			*/
	connecttime datetime default now(),			/* 连接时间			*/
	cellphonetype char(64) default '',			/* 手机型号			*/
	cellphone char(16) default '',				/* 手机号码			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='wifi detected alarm record' partition by range columns(alarmtime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table wifialarm add constraint pk_wifialarm primary key(id,alarmtime);
-- alter table wifialarm add constraint fk_wifialarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table wifialarm add index index_wifialarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table wifialarm add index index_wifialarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);
alter table wifialarm add index index_wifialarm_alarmtime_macaddr_connecttime(alarmtime,macaddr,connecttime);

/* 执法仪SOS记录 */
create table if not exists lawenforcealarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	isopen tinyint default 0,					/* 报警时开或关闭	*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='law enforcement alarm record' partition by range columns(alarmtime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table lawenforcealarm add constraint pk_lawenforcealarm primary key(id,alarmtime);
-- alter table lawenforcealarm add constraint fk_lawenforcealarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table lawenforcealarm add index index_lawenforcealarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);
alter table lawenforcealarm add index index_lawenforcealarm_alarmtime_longtitude_latitude_siteid(alarmtime,longtitude,latitude,siteid);


/* 远程呼叫记录 */
create table if not exists remotecallalarm
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	alarmtime datetime default now(),			/* 报警时间			*/
	manufacture int default 0,					/* 设备厂家			*/
	deviceid char(64) not null,					/* 识别设备			*/
	devicename char(32) not null,				/* 设备名称			*/
	deviceip int not null default 0,			/* 设备IP			*/
	channel tinyint default 0,					/* 通道				*/
	devicetype int default 0,					/* 设备类型			*/
	longtitude float default 0,					/* 报警位置经度		*/
	latitude float default 0,					/* 报警位置纬度		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='remote call alarm record' partition by range columns(alarmtime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table remotecallalarm add constraint pk_remotecallalarm primary key(id,alarmtime);
-- alter table remotecallalarm add constraint fk_remotecallalarm_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table remotecallalarm add index index_remotecallalarm_alarmtime_deviceip_channel_siteid(alarmtime,deviceip,channel,siteid);

/* 用户消息 */
create table if not exists message
(
	siteid char(64) not null,					/* 站点ID			*/
	sitename char(64),							/* 站点名称			*/
	username char(32) not null,					/* 用户名			*/
	msgid char(64) not null,					/* 报警ID			*/
	msgtype int default 0,						/* 消息类型			*/
	msgweight int default 0,					/* 消息权重			*/
	msgtitle char(255) default '',				/* 消息标题			*/
	msgcontent text ,							/* 消息内容			*/
	sendtime datetime default now(),			/* 消息发送时间		*/
	readcount int default 0,					/* 消息阅读量		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user message record';

/* 添加主外键*/
alter table message add constraint pk_message primary key(msgid,sendtime);
alter table message add constraint fk_message_user foreign key(siteid,username) references user(siteid,username) on delete cascade on update cascade;
alter table message add constraint fk_message_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table message add index index_message_sendtime_siteid_username_msgtype(sendtime, siteid, username, msgtype);

/* 消息附件表 */
create table if not exists attachment
(
	siteid char(64) not null,					/* 站点ID			*/
	attachid char(64) not null,					/* 附件ID			*/
	msgid char(64) not null,					/* 消息ID			*/
	attachtype int default 0,					/* 附件类型			*/
	description char(255) default '',			/* 消息描述			*/
	pichost char(64) default '',				/* 区域图片主机		*/
	picdir varchar(512) default '',				/* 区域对应图片目录 */
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user message attachment table';

/* 添加主外键*/
alter table attachment add constraint pk_attachment primary key(attachid);
alter table attachment add constraint fk_attachment_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 系统间数据同步 */
create table if not exists synchronizelog
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 系统日志ID		*/
	tablename char(32) default '',				/* 表名				*/
	operatetype tinyint default 0,				/* 操作类型			*/
	sqlstatement varchar(2048) default '',		/* 具体的操作语句	*/
	decription char(126) default '',			/* 操作描述			*/
	param text  ,								/* 操作参数			*/
	operatetime datetime default now(),			/* 操作时间			*/
	failuretimes int default 0,					/* 通过失败次数		*/
	lasttime datetime default now(),			/* 最后同步时间		*/
	status tinyint  default 0,					/* 同步状态			*/
	pichost char(64) default '',				/* 图片主机			*/
	picdir varchar(512) default '',				/* 对应图片目录 	*/
	recordhost char(64) default '',				/* 录像主机			*/
	recorddir varchar(512) default '',			/* 录像对应目录 	*/
	username char(32) default '',				/* 服务器用户名		*/
	password char(32) default '',				/* 服务器密  码		*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='synchronize local information to parent system' partition by range columns(operatetime)
(
	partition p20170221101010 values less than('2017-02-21 10:10:10')
);

/* 添加主外键*/
alter table synchronizelog add constraint pk_synchronizelog primary key(id,operatetime);
-- alter table synchronizelog add constraint fk_synchronizelog_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table synchronizelog add index index_synchronizelog_status_failuretimes_lasttime_tablename(status,failuretimes,lasttime,tablename);

/* 
授权某站点的某用户访问某站点哪些模块哪些权限以及哪些设备的哪些权限
如：授权1站点zhangsan用户拥有gis模块的点位配置权限，预览设备视频权限
权限分为两种：
1、模块权限
   电子地图
   设备管理
   人员管理
   卡片管理
   电视墙管理
   日志管理
*/
create table if not exists userright
(
	siteid char(64) not null,					/* 站点ID			*/
	username char(64) not null,					/* 用户ID			*/
	destsiteid char(64) not null,				/* 目标站点			*/
	modules int default 0,						/* 能访问的模块		*/
	moduleright int default 0, 					/* 访问模块功能权限 */
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user module right';

/* 添加主外键*/
alter table userright add constraint pk_userright primary key(siteid,username,destsiteid);
alter table userright add constraint fk_userright_user foreign key(username) references user(username) on delete cascade on update cascade;
alter table userright add constraint fk_userright_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table userright add index index_userright_username_siteid(username,siteid);


/* 用户设备 */
create table if not exists userdevice
(
	siteid char(64) not null,					/* 站点ID			*/
	username char(64) not null,					/* 用户ID			*/
	destsiteid char(64) not null,				/* 访问哪个站点设备 */
	deviceid char(64) not null,					/* 设备ID			*/
	channel tinyint default 0,					/* 设备通道			*/
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user device right';

/* 添加主外键*/
alter table userdevice add constraint pk_userdevice primary key(siteid,username,deviceid,channel);
alter table userdevice add constraint fk_userdevice_user foreign key(username) references user(username) on delete cascade on update cascade;
alter table userdevice add constraint fk_userdevice_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table userdevice add index index_userdevice_username_siteid(username,siteid);


/* 用户登录、登出，设备管理操作，告警处理操作，权限分配操作，日志查询操作，视频预览，抓拍，录像等等操作记录*/
create table if not exists operatelog
(
	siteid char(64) not null,					/* 站点ID			*/
	id char(64) not null,						/* 报警ID			*/
	operatetime datetime default now(),			/* 操作时间			*/
	operatetype int default 0,					/* 操作类型			*/
	operatedec char(128) default '',			/* 操作描述			*/
	operatemark char(128) default '',			/* 操作备注			*/
	username char(16) not null,					/* 用户名			*/
	usertype tinyint default 0,					/* 用户级别0超级管理员，1省级、2市级、3区级、4镇、5乡、6房东、7住户*/
	usersubtype tinyint default 0,				/* 管理员子类型：1管理员2操作员*/
	personidtype smallint default 0,			/* 人员证件类型		*/
	personid char(32) default '',				/* 证件号码			*/	
	reserver1 int default 0,					/* 保留字段			*/
	reserver2 int default 0,					/* 保留字段			*/
	reserver3 varchar(1024) default ''			/* 保留字段			*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='system operate log record';

/* 添加主外键*/
alter table operatelog add constraint pk_operatelog primary key(id,operatetime);
alter table operatelog add constraint fk_operatelog_user foreign key(username) references user(username) on delete no action on update cascade;
alter table operatelog add constraint fk_operatelog_site foreign key(siteid) references site(id) on delete no action on update cascade;

/* 添加索引*/
alter table operatelog add index index_operatelog_operatetime_operatetype_username(operatetime,operatetype,username);


/* ------------------------------------------------.存储过程创建 ------------------------------------------------------*/

/* ------------1、新建分区存储过程的创建 ----------------*/
-- 替换语句中断符
DELIMITER ||
-- 如果存在则删除存储过程
drop procedure if exists imps_create_partition_by_number ||

-- 创建存储过程
-- 注意：使用该存储过程必须保证相应数据库表中至少有一个手动分区
-- 创建存储过程[通过数据库名和对应表名]-建多少个分区，分区时间间隔为多少
-- databasename：创建分区的数据库
-- tablename：创建分区的表的名称
-- partition_number：一次创建多少个分区
-- partitiontype：分区类型[0按天分区，1按月分区，2按年分区]
-- gaps：分区间隔，如果分区类型为0则表示每个分区的间隔为 gaps天；
--       如果分区类型为1则表示每个分区的间隔为 gaps月
-- 			 如果分区类型为2则表示每个分区的间隔为 gaps年
create procedure imps_create_partition_by_number (in databasename varchar(50),in tablename varchar(50), in partition_number int, in partitiontype int, in gaps int)
L_END:
begin     
	declare max_partition_description varchar(255) default '';
	declare p_name varchar(255) default 0;       
	declare p_description varchar(255) default 0;   
	declare isexist_partition varchar(255) default 0; 
	declare i int default 1;

	-- 查看对应数据库对应表是否已经有手动分区[自动分区前提是必须有手动分区]
	select partition_name into isexist_partition from information_schema.partitions where table_schema = databasename and table_name = tablename limit 1;
	-- 如果不存在则打印错误并退出存储过程
	if isexist_partition <=> "" then
		select "partition table not is exist" as "ERROR";
		leave L_END;
	end if;
 
    -- 获取最大[降序获取]的分区描述[值]
    select partition_description into max_partition_description  from information_schema.partitions where table_schema = databasename and table_name = tablename order by partition_description desc limit 1;
   
    -- 如果最大分区没有,说明没有手动分区,则无法创建自动分区
    if max_partition_description <=> "" then
       select "partition table is error" as "ERROR";
       leave L_END;
    end if;

	-- 替换前后的单引号[''两个引号表示一个单引号的转义]
	-- set max_partition_description = REPLACE(max_partition_description, '''', '');
	-- 或使用如下语句
	set max_partition_description = REPLACE(max_partition_description, '\'', '');

	-- 自动创建number个分区
    while i <= partition_number do

		if (partitiontype = 0) then
			-- 每个分区按天递增,递增gaps天
			set p_description = DATE_ADD(max_partition_description, interval i*gaps day); 
		elseif (partitiontype = 1) then
			-- 每个分区按月递增,递增gaps月
			set p_description = DATE_ADD(max_partition_description, interval i*gaps month); 
		else 
			-- 每个分区按年递增,递增gaps年
			set p_description = DATE_ADD(max_partition_description, interval i*gaps year);
		end if;

		-- 删除空格
		set p_name = REPLACE(p_description, ' ', '');
		-- 如果有横杆替换为空
		set p_name = REPLACE(p_name, '-', '');
		-- 删除时间冒号
		set p_name = REPLACE(p_name, ':', '');

		-- alter table tablename add partition ( partition pname values less than ('2017-02-20 10:05:56') );
		set @sql=CONCAT('ALTER TABLE ', tablename ,' ADD PARTITION ( PARTITION p', p_name ,' VALUES LESS THAN (\'', p_description ,'\'))');
		-- set @sql=CONCAT('ALTER TABLE ', tablename ,' ADD PARTITION ( PARTITION p', p_name ,' VALUES LESS THAN (',p_description,'))');
		-- 打印sql变量
		-- select @sql;
		-- 准备sql语句
		PREPARE stmt from @sql;
		-- 执行sql语句
		EXECUTE stmt;
		-- 释放资源
		DEALLOCATE PREPARE stmt;
		-- 递增变量
		set i = (i + 1) ;

    end while;          
end ||
-- 恢复语句中断符
DELIMITER ;


/* ------------2、删除分区存储过程的创建 ----------------*/

-- 替换语句中断符
DELIMITER ||
-- 删除存储过程
drop procedure if exists imps_remove_partition ||

-- 删除分区
-- databasename：创建分区的数据库
-- tablename：创建分区的表的名称
-- dateline: 时间点，早于当前点的分区将会被删除[分区删除同时会删除数据]
-- recordnumber：删除时间点之前的几个分区
create procedure imps_remove_partition(in databasename varchar(50),in tablename varchar(50), in dateline varchar(50), in recordnumber int)
outer_label:
begin     
	declare max_partition_description varchar(255) default 0;
	declare p_description varchar(255) default 0;
	declare p_name varchar(255) default 0; 
	declare i int default 1;
	 
	while i <= recordnumber do
		-- 获取最大[降序获取]的分区描述[值]
		select partition_description into max_partition_description from information_schema.partitions where table_schema = databasename and table_name = tablename
									and STRCMP(REPLACE(partition_description, '''', ''), dateline) < 0  order by partition_description asc limit 1;
		
		if max_partition_description <=> "" then
			leave outer_label; 
		end if;
		
		set max_partition_description = REPLACE(max_partition_description, '''', '');
		set p_description = max_partition_description;

		-- 删除空格
		set p_name = REPLACE(p_description, ' ', '');
		-- 如果有横杆替换为空
		set p_name = REPLACE(p_name, '-', '');
		-- 删除时间冒号
		set p_name = REPLACE(p_name, ':', '');
		-- ALTER TABLE sale_data DROP PARTITION p201010;
	  set @sql=CONCAT('ALTER TABLE ', tablename ,' DROP PARTITION p', p_name);
		-- 打印sql变量
		-- select @sql;
		-- 准备sql语句
		PREPARE stmt from @sql;
		-- 执行sql语句
		EXECUTE stmt;
		-- 释放资源
		DEALLOCATE PREPARE stmt;
		-- 递增变量
		set i = (i + 1) ;
	end while; 	       
end ||
-- 恢复语句中断符
DELIMITER ;

/* ##############################################结束存储过程创建 ##############################################*/

/* --------------------------------------分区管理定时器---------------------------------------------*/
-- 启用定时器例程
set global event_scheduler=1;

-- 查看事件是否开启
show variables like '%event_scheduler';

/* --------------------------------------删除分区定时器---------------------------------------------*/

-- 创建新建分区定时器[每月晚上0点开始执行]
DELIMITER ||
drop event if exists auto_remove_partition_timer  ||
create event auto_remove_partition_timer  
-- 定时器完成后是否继续定时[second、minute、hour、day、month、year]
on schedule every 1 month starts date_add(CURDATE(), interval 0 hour)
-- 默认继续循环使用该定时器且创建时候默认关闭事件,需要手动开启
on completion preserve disable
do
BEGIN
	-- 删除3月前的分区
	call imps_remove_partition('imps', 'carnumeralarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'linealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'stayalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'flooralarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'liftalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'firealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'goodsalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'smokealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'brokenalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'tearalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'personflowalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'videoqosalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'onlinealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'inoutalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'facealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'wifialarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'lawenforcealarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'remotecallalarm', DATE_SUB(now(), interval 3 month), 1);
	call imps_remove_partition('imps', 'synchronizelog', DATE_SUB(now(), interval 3 month), 1);
END ||
DELIMITER ;

-- 关闭事件
-- alter event auto_remove_partition_timer on completion preserve disable;

-- 开启定时器事件
alter event auto_remove_partition_timer on completion preserve enable;

/* #########################################结束删除分区定时器###################################### */


/* --------------------------------------新建分区定时器---------------------------------------------*/
-- 创建新建分区定时器[每月晚上1点开始执行]
DELIMITER ||
drop event if exists auto_create_partition_timer  ||
create event auto_create_partition_timer  
-- 定时器完成后是否继续定时[second、minute、hour、day、month、year]
on schedule every 1 month starts date_add(CURDATE(), interval 1 hour)
-- 默认继续循环使用该定时器且创建时候默认关闭事件,需要手动开启
on completion preserve disable
do
BEGIN
	-- 每个月增加一个分区
    call imps_create_partition_by_number('imps', 'carnumeralarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'linealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'stayalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'flooralarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'liftalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'firealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'goodsalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'smokealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'brokenalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'tearalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'personflowalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'videoqosalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'onlinealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'inoutalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'facealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'wifialarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'lawenforcealarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'remotecallalarm', 1, 1, 1);
	call imps_create_partition_by_number('imps', 'synchronizelog', 1, 1, 1);
END ||
DELIMITER ;

-- 关闭事件
-- alter event auto_create_partition_timer on completion preserve disable;

-- 开启定时器事件
alter event auto_create_partition_timer on completion preserve enable;

/* #########################################结束新建分区定时器###################################### */


-- 查看数据库imps的表carnumeralarm的分区
-- SELECT partition_name, partition_description FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_NAME = 'carnumeralarm' AND TABLE_SCHEMA = 'imps';

-- 查看我的event
select * from mysql.event;

/* #########################################结束分区管理定时器#########################################*/

