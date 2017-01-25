drop database qidianweb;
create database qidianweb;
use qidianweb;
/**
 * 角色表
 */
DROP TABLE IF EXISTS ROLE;
create table role(
id int(10) not null auto_increment,
name varchar(20) default null,
primary key(id)
)engine=INNODB  default charset=utf8;
insert into role(Name) values('admin');
insert into role(Name) values('teacher');
/**
 * 用户表
 */
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL auto_increment,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  email VARCHAR(80) DEFAULT NULL COMMENT '邮箱',
  job_num VARCHAR(80) DEFAULT NULL COMMENT '工号',
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into user(userName,password) values('scott',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ');
/**
 * 学习资料
 */
DROP TABLE IF EXISTS `LearningMaterials`;
CREATE TABLE `LearningMaterials` (
  `id` int(10) NOT NULL auto_increment,
  `courseName` varchar(30) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
   `path` varchar(256) default null,
   absoulteFileName varchar(256) default null,
   fileName varchar(60) default null,
   uploadTime date default null,
   uploadUserId int(10) default null,
   downloadCount int(10) default 0,
   PRIMARY KEY (`id`),
   foreign key(uploadUserId) references user(id)
)engine=INNODB default charset=utf8;

/**
 * 权限表
 */
DROP TABLE IF EXISTS ACTION;
CREATE TABLE ACTION(
ID INT(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
NAME VARCHAR(40) DEFAULT NULL COMMENT '名字',
PARENT_ID VARCHAR(40) DEFAULT NULL COMMENT '父类ID',
DESCRIPTION VARCHAR(200) DEFAULT NULL COMMENT '描述',
PRIMARY KEY(ID)
)engine=INNODB default charset=utf8;

/**
 * 组表,对权限、人员、角色分组
 */
DROP TABLE IF EXISTS GROUPTYPE;
CREATE TABLE GROUPTYPE(
ID INT(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
NAME VARCHAR(40) DEFAULT NULL COMMENT '名字',
PARENT_ID VARCHAR(40) DEFAULT NULL COMMENT '父类ID',
DESCRIPTION VARCHAR(200) DEFAULT NULL COMMENT '描述',
PRIMARY KEY(ID)
)engine=INNODB default charset=utf8;

/**
 * 角色权限表
 */
DROP TABLE IF EXISTS ROLE_ACTION;
CREATE TABLE ROLE_ACTION(
ROLE_ID INT(20) NOT NULL COMMENT '角色主键',
ACTION_ID INT(20) NOT NULL COMMENT '权限主键',
PRIMARY KEY(ROLE_ID,ACTION_ID) COMMENT '联合主键',
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(ID),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(ID)
)engine=INNODB default charset=utf8;
/**
 * 组权限表
 */
DROP TABLE IF EXISTS GROUPTYPE_ACTION;
CREATE TABLE GROUPTYPE_ACTION(
GROUPTYPE_ID INT(20) NOT NULL COMMENT '组主键',
ACTION_ID INT(20) NOT NULL COMMENT '权限主键',
ACTIONTYPE INT(1) DEFAULT 0 COMMENT '权限类型', -- 0表示可以访问，1表示不可以访问
PRIMARY KEY(GROUPTYPE_ID,ACTION_ID) COMMENT '联合主键',
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(ID),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(ID)
)engine=INNODB default charset=utf8;
/**
 * 组角色表
 */
DROP TABLE IF EXISTS GROUPTYPE_ROLE;
CREATE TABLE GROUPTYPE_ROLE(
GROUPTYPE_ID INT(10) NOT NULL COMMENT '组主键',
ROLE_ID INT(10) NOT NULL COMMENT '角色主键',
PRIMARY KEY(GROUPTYPE_ID,ROLE_ID) COMMENT '联合主键',
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(ID),
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(ID)
)engine=INNODB default charset=utf8;
/**
 * 人员权限表
 */
DROP TABLE IF EXISTS USER_ACTION;
CREATE TABLE USER_ACTION(
USER_ID INT(20) NOT NULL COMMENT '人员主键',
ACTION_ID INT(20) NOT NULL COMMENT '权限主键',
PRIMARY KEY(USER_ID,ACTION_ID) COMMENT '联合主键',
FOREIGN KEY(USER_ID) REFERENCES USER(ID),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(ID)
)engine=INNODB default charset=utf8;
/**
 * 人员角色表
 */
DROP TABLE IF EXISTS USER_ROLE;
CREATE TABLE USER_ROLE(
USER_ID INT(20) NOT NULL COMMENT '人员主键',
ROLE_ID INT(20) NOT NULL COMMENT '角色主键',
PRIMARY KEY(USER_ID,ROLE_ID) COMMENT '联合主键',
FOREIGN KEY(USER_ID) REFERENCES USER(ID),
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(ID)
)engine=INNODB default charset=utf8;
/**
 * 组人员表
 */
DROP TABLE IF EXISTS GROUPTYPE_PERSON;
CREATE TABLE GROUPTYPE_PERSON(
GROUPTYPE_ID INT(20) NOT NULL COMMENT '组主键',
USER_ID INT(20) NOT NULL COMMENT '人员主键',
PRIMARY KEY(GROUPTYPE_ID,USER_ID) COMMENT '联合主键',
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(ID),
FOREIGN KEY(USER_ID) REFERENCES USER(ID)
)COMMENT '组人员表';
insert into user_role values(1,1);
