drop database qidianweb;
create database qidianweb;
use qidianweb;
/**
 * 角色表
 */
DROP TABLE IF EXISTS ROLE;
create table role(
roleId int(10) not null auto_increment,
name varchar(20) default null,
description varchar(200) default null,
primary key(roleId)
)engine=INNODB  default charset=utf8;
insert into role(Name) values('admin');
insert into role(Name) values('teacher');
insert into role(Name) values('student');
/**
 * 用户表
 */
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) NOT NULL auto_increment,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  grade varchar(30) default null comment '年级',
  courseName varchar(30) default null comment '科目',
  email VARCHAR(80) DEFAULT NULL COMMENT '邮箱',
  job_num VARCHAR(80) DEFAULT NULL COMMENT '工号',
   PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into user(userName,password) values('scott',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ');
insert into user(userName,password,grade,courseName) values('ouwenfa',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','小学','数学');
insert into user(userName,password,grade,courseName) values('hello',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','初中','物理');
insert into user(userName,password,grade,courseName) values('jianyongqi',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','高中','语文');
insert into user(userName,password,grade,courseName) values('xiaotianshi',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','高中','数学');
insert into user(userName,password,grade,courseName) values('liuchu',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','初中','英语');
insert into user(userName,password,grade,courseName) values('jianjieying',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','高中','英语');
insert into user(userName,password,grade,courseName) values('xiaomogui',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','高中','化学');
insert into user(userName,password,grade,courseName) values('liudehua',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','初中','政治');
insert into user(userName,password,grade,courseName) values('wangbaoqiang',' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ','高中','物理');
/**
 * 学习资料
 */
DROP TABLE IF EXISTS `LearningMaterials`;
CREATE TABLE `LearningMaterials` (
  `lId` int(10) NOT NULL auto_increment,
  `courseName` varchar(30) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
   `path` varchar(256) default null,
   absoulteFileName varchar(256) default null,
   fileName varchar(60) default null,
   uploadTime date default null,
   uploadUserId int(10) default null,
   downloadCount int(10) default 0,
   PRIMARY KEY (`lId`),
   foreign key(uploadUserId) references user(userId)
)engine=INNODB default charset=utf8;

/**
 * 权限表
 */
DROP TABLE IF EXISTS ACTION;
CREATE TABLE ACTION(
actionId INT(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
NAME VARCHAR(40) DEFAULT NULL COMMENT '名字',
PARENT_ID VARCHAR(40) DEFAULT NULL COMMENT '父类ID',
DESCRIPTION VARCHAR(200) DEFAULT NULL COMMENT '描述',
PRIMARY KEY(actionId)
)engine=INNODB default charset=utf8;

/**
 * 组表,对权限、人员、角色分组
 */
DROP TABLE IF EXISTS GROUPTYPE;
CREATE TABLE GROUPTYPE(
groupId INT(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
NAME VARCHAR(40) DEFAULT NULL COMMENT '名字',
PARENT_ID VARCHAR(40) DEFAULT NULL COMMENT '父类ID',
DESCRIPTION VARCHAR(200) DEFAULT NULL COMMENT '描述',
PRIMARY KEY(groupId)
)engine=INNODB default charset=utf8;
/**
 * 图片表
 */
DROP TABLE IF EXISTS IMAGE;
CREATE TABLE IMAGE(
imageId INT(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
USER_ID int(10) DEFAULT NULL COMMENT '关联人物',
SAVEPATH VARCHAR(300) DEFAULT NULL COMMENT '保存路径',
RELATIVEPATH VARCHAR(200) DEFAULT NULL COMMENT '相对路径',
DESCRIPTION VARCHAR(200) DEFAULT NULL COMMENT '描述',
PRIMARY KEY(imageId),
FOREIGN KEY(USER_ID) REFERENCES USER(userId)
)engine=INNODB default charset=utf8;
insert into IMAGE (user_id,savepath,relativepath,description) values(1,null,'/plugins/img/teacher1.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(2,null,'/plugins/img/teacher2.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(3,null,'/plugins/img/teacher3.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(4,null,'/plugins/img/teacher4.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(5,null,'/plugins/img/teacher_5.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(6,null,'/plugins/img/teacher_6.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(7,null,'/plugins/img/teacher_7.jpg',null);
insert into IMAGE (user_id,savepath,relativepath,description) values(8,null,'/plugins/img/teacher_8.jpg',null);

/**
 * 角色权限表
 */
DROP TABLE IF EXISTS ROLE_ACTION;
CREATE TABLE ROLE_ACTION(
ROLE_ID INT(20) NOT NULL COMMENT '角色主键',
ACTION_ID INT(20) NOT NULL COMMENT '权限主键',
PRIMARY KEY(ROLE_ID,ACTION_ID) COMMENT '联合主键',
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(roleId),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(actionId)
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
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(groupId),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(actionId)
)engine=INNODB default charset=utf8;
/**
 * 组角色表
 */
DROP TABLE IF EXISTS GROUPTYPE_ROLE;
CREATE TABLE GROUPTYPE_ROLE(
GROUPTYPE_ID INT(10) NOT NULL COMMENT '组主键',
ROLE_ID INT(10) NOT NULL COMMENT '角色主键',
PRIMARY KEY(GROUPTYPE_ID,ROLE_ID) COMMENT '联合主键',
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(groupId),
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(roleId)
)engine=INNODB default charset=utf8;
/**
 * 人员权限表
 */
DROP TABLE IF EXISTS USER_ACTION;
CREATE TABLE USER_ACTION(
USER_ID INT(20) NOT NULL COMMENT '人员主键',
ACTION_ID INT(20) NOT NULL COMMENT '权限主键',
PRIMARY KEY(USER_ID,ACTION_ID) COMMENT '联合主键',
FOREIGN KEY(USER_ID) REFERENCES USER(userId),
FOREIGN KEY(ACTION_ID) REFERENCES ACTION(actionId)
)engine=INNODB default charset=utf8;
/**
 * 人员角色表
 */
DROP TABLE IF EXISTS USER_ROLE;
CREATE TABLE USER_ROLE(
USER_ID INT(20) NOT NULL COMMENT '人员主键',
ROLE_ID INT(20) NOT NULL COMMENT '角色主键',
PRIMARY KEY(USER_ID,ROLE_ID) COMMENT '联合主键',
FOREIGN KEY(USER_ID) REFERENCES USER(userId),
FOREIGN KEY(ROLE_ID) REFERENCES ROLE(roleId)
)engine=INNODB default charset=utf8;
insert into USER_ROLE values(1,1);
insert into USER_ROLE values(2,2);
insert into USER_ROLE values(3,2);
insert into USER_ROLE values(4,2);
insert into USER_ROLE values(5,2);
insert into USER_ROLE values(6,2);
insert into USER_ROLE values(7,2);
insert into USER_ROLE values(8,2);
/**
 * 组人员表
 */
DROP TABLE IF EXISTS GROUPTYPE_PERSON;
CREATE TABLE GROUPTYPE_PERSON(
GROUPTYPE_ID INT(20) NOT NULL COMMENT '组主键',
USER_ID INT(20) NOT NULL COMMENT '人员主键',
PRIMARY KEY(GROUPTYPE_ID,USER_ID) COMMENT '联合主键',
FOREIGN KEY(GROUPTYPE_ID) REFERENCES GROUPTYPE(groupId),
FOREIGN KEY(USER_ID) REFERENCES USER(userId)
)COMMENT '组人员表';



