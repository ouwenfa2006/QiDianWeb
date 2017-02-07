/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : qidianweb

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-02-07 23:00:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actionId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '名字',
  `PARENT_ID` varchar(40) DEFAULT NULL COMMENT '父类ID',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of action
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `grade` varchar(40) DEFAULT NULL COMMENT '年级',
  `courseName` varchar(40) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='科目表';

-- ----------------------------
-- Records of course
-- ----------------------------

-- ----------------------------
-- Table structure for `course_sutdent`
-- ----------------------------
DROP TABLE IF EXISTS `course_sutdent`;
CREATE TABLE `course_sutdent` (
  `course_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  PRIMARY KEY (`course_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `course_sutdent_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`courseId`),
  CONSTRAINT `course_sutdent_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_sutdent
-- ----------------------------

-- ----------------------------
-- Table structure for `grouptype`
-- ----------------------------
DROP TABLE IF EXISTS `grouptype`;
CREATE TABLE `grouptype` (
  `groupId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `NAME` varchar(40) DEFAULT NULL COMMENT '名字',
  `PARENT_ID` varchar(40) DEFAULT NULL COMMENT '父类ID',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分组表';

-- ----------------------------
-- Records of grouptype
-- ----------------------------

-- ----------------------------
-- Table structure for `grouptype_action`
-- ----------------------------
DROP TABLE IF EXISTS `grouptype_action`;
CREATE TABLE `grouptype_action` (
  `GROUPTYPE_ID` int(20) NOT NULL COMMENT '组主键',
  `ACTION_ID` int(20) NOT NULL COMMENT '权限主键',
  `ACTIONTYPE` int(1) DEFAULT '0' COMMENT '权限类型',
  PRIMARY KEY (`GROUPTYPE_ID`,`ACTION_ID`) COMMENT '联合主键',
  KEY `ACTION_ID` (`ACTION_ID`),
  CONSTRAINT `grouptype_action_ibfk_1` FOREIGN KEY (`GROUPTYPE_ID`) REFERENCES `grouptype` (`groupId`),
  CONSTRAINT `grouptype_action_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `action` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grouptype_action
-- ----------------------------

-- ----------------------------
-- Table structure for `grouptype_person`
-- ----------------------------
DROP TABLE IF EXISTS `grouptype_person`;
CREATE TABLE `grouptype_person` (
  `GROUPTYPE_ID` int(20) NOT NULL COMMENT '组主键',
  `USER_ID` int(20) NOT NULL COMMENT '人员主键',
  PRIMARY KEY (`GROUPTYPE_ID`,`USER_ID`) COMMENT '联合主键',
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `grouptype_person_ibfk_1` FOREIGN KEY (`GROUPTYPE_ID`) REFERENCES `grouptype` (`groupId`),
  CONSTRAINT `grouptype_person_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='组人员表';

-- ----------------------------
-- Records of grouptype_person
-- ----------------------------

-- ----------------------------
-- Table structure for `grouptype_role`
-- ----------------------------
DROP TABLE IF EXISTS `grouptype_role`;
CREATE TABLE `grouptype_role` (
  `GROUPTYPE_ID` int(10) NOT NULL COMMENT '组主键',
  `ROLE_ID` int(10) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`GROUPTYPE_ID`,`ROLE_ID`) COMMENT '联合主键',
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `grouptype_role_ibfk_1` FOREIGN KEY (`GROUPTYPE_ID`) REFERENCES `grouptype` (`groupId`),
  CONSTRAINT `grouptype_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grouptype_role
-- ----------------------------

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imageId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `USER_ID` int(10) DEFAULT NULL COMMENT '关联人物',
  `SAVEPATH` varchar(300) DEFAULT NULL COMMENT '保存路径',
  `RELATIVEPATH` varchar(200) DEFAULT NULL COMMENT '相对路径',
  `DESCRIPTION` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`imageId`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '1', null, '/plugins/img/teacher1.jpg', null);
INSERT INTO `image` VALUES ('2', '2', null, '/plugins/img/teacher2.jpg', null);
INSERT INTO `image` VALUES ('3', '3', null, '/plugins/img/teacher3.jpg', null);
INSERT INTO `image` VALUES ('4', '4', null, '/plugins/img/teacher4.jpg', null);
INSERT INTO `image` VALUES ('5', '5', null, '/plugins/img/teacher5.jpg', null);
INSERT INTO `image` VALUES ('6', '6', null, '/plugins/img/teacher_6.jpg', null);
INSERT INTO `image` VALUES ('7', '7', null, '/plugins/img/teacher_7.jpg', null);
INSERT INTO `image` VALUES ('8', '8', null, '/plugins/img/teacher_8.jpg', null);
INSERT INTO `image` VALUES ('9', '9', null, '/plugins/img/teacher2.jpg', null);
INSERT INTO `image` VALUES ('10', '10', null, '/plugins/img/teacher3.jpg', null);
INSERT INTO `image` VALUES ('11', '11', null, '/plugins/img/teacher4.jpg', null);
INSERT INTO `image` VALUES ('12', '12', null, '/plugins/img/teacher5.jpg', null);
INSERT INTO `image` VALUES ('13', '13', null, '/plugins/img/teacher_6.jpg', null);
INSERT INTO `image` VALUES ('14', '14', null, '/plugins/img/teacher_7.jpg', null);
INSERT INTO `image` VALUES ('15', '15', null, '/plugins/img/teacher_8.jpg', null);
INSERT INTO `image` VALUES ('16', '16', null, '/plugins/img/teacher2.jpg', null);
INSERT INTO `image` VALUES ('17', '17', null, '/plugins/img/teacher3.jpg', null);
INSERT INTO `image` VALUES ('18', '18', null, '/plugins/img/teacher4.jpg', null);

-- ----------------------------
-- Table structure for `learningmaterials`
-- ----------------------------
DROP TABLE IF EXISTS `learningmaterials`;
CREATE TABLE `learningmaterials` (
  `lId` int(10) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(30) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL,
  `path` varchar(256) DEFAULT NULL,
  `absoulteFileName` varchar(256) DEFAULT NULL,
  `fileName` varchar(60) DEFAULT NULL,
  `uploadTime` date DEFAULT NULL,
  `uploadUserId` int(10) DEFAULT NULL,
  `downloadCount` int(10) DEFAULT '0',
  PRIMARY KEY (`lId`),
  KEY `uploadUserId` (`uploadUserId`),
  CONSTRAINT `learningmaterials_ibfk_1` FOREIGN KEY (`uploadUserId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='辅导资料表';

-- ----------------------------
-- Records of learningmaterials
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `text` varchar(2000) DEFAULT NULL COMMENT '内容',
  `createDate` date DEFAULT NULL COMMENT '发送时间',
  `formUser_Id` int(10) DEFAULT NULL,
  `formParent_Id` int(10) DEFAULT NULL,
  `formStudent_Id` int(10) DEFAULT NULL,
  `isNewMessage` int(1) DEFAULT '0' COMMENT '0表示新信息',
  PRIMARY KEY (`messageId`),
  KEY `formUser_Id` (`formUser_Id`),
  KEY `formParent_Id` (`formParent_Id`),
  KEY `formStudent_Id` (`formStudent_Id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`formUser_Id`) REFERENCES `user` (`userId`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`formParent_Id`) REFERENCES `parent` (`parentId`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`formStudent_Id`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息表';

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `message_parent`
-- ----------------------------
DROP TABLE IF EXISTS `message_parent`;
CREATE TABLE `message_parent` (
  `message_id` int(10) NOT NULL,
  `toParent_id` int(10) NOT NULL,
  PRIMARY KEY (`message_id`,`toParent_id`),
  KEY `toParent_id` (`toParent_id`),
  CONSTRAINT `message_parent_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`messageId`),
  CONSTRAINT `message_parent_ibfk_2` FOREIGN KEY (`toParent_id`) REFERENCES `parent` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message_parent
-- ----------------------------

-- ----------------------------
-- Table structure for `message_student`
-- ----------------------------
DROP TABLE IF EXISTS `message_student`;
CREATE TABLE `message_student` (
  `message_id` int(10) NOT NULL,
  `toStudent_id` int(10) NOT NULL,
  PRIMARY KEY (`message_id`,`toStudent_id`),
  KEY `toStudent_id` (`toStudent_id`),
  CONSTRAINT `message_student_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`messageId`),
  CONSTRAINT `message_student_ibfk_2` FOREIGN KEY (`toStudent_id`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message_student
-- ----------------------------

-- ----------------------------
-- Table structure for `message_user`
-- ----------------------------
DROP TABLE IF EXISTS `message_user`;
CREATE TABLE `message_user` (
  `message_id` int(10) NOT NULL,
  `toUser_id` int(10) NOT NULL,
  PRIMARY KEY (`message_id`,`toUser_id`),
  KEY `toUser_id` (`toUser_id`),
  CONSTRAINT `message_user_ibfk_1` FOREIGN KEY (`message_id`) REFERENCES `message` (`messageId`),
  CONSTRAINT `message_user_ibfk_2` FOREIGN KEY (`toUser_id`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message_user
-- ----------------------------

-- ----------------------------
-- Table structure for `parent`
-- ----------------------------
DROP TABLE IF EXISTS `parent`;
CREATE TABLE `parent` (
  `parentId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parentName` varchar(40) DEFAULT NULL COMMENT '名字',
  `parentPhone` bigint(20) DEFAULT NULL COMMENT '电话',
  `createDate` date DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家长表';

-- ----------------------------
-- Records of parent
-- ----------------------------

-- ----------------------------
-- Table structure for `parent_sutdent`
-- ----------------------------
DROP TABLE IF EXISTS `parent_sutdent`;
CREATE TABLE `parent_sutdent` (
  `parent_id` int(10) NOT NULL,
  `student_id` int(10) NOT NULL,
  PRIMARY KEY (`parent_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `parent_sutdent_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`parentId`),
  CONSTRAINT `parent_sutdent_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`studentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parent_sutdent
-- ----------------------------

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', null);
INSERT INTO `role` VALUES ('2', 'teacher', null);

-- ----------------------------
-- Table structure for `role_action`
-- ----------------------------
DROP TABLE IF EXISTS `role_action`;
CREATE TABLE `role_action` (
  `ROLE_ID` int(20) NOT NULL COMMENT '角色主键',
  `ACTION_ID` int(20) NOT NULL COMMENT '权限主键',
  PRIMARY KEY (`ROLE_ID`,`ACTION_ID`) COMMENT '联合主键',
  KEY `ACTION_ID` (`ACTION_ID`),
  CONSTRAINT `role_action_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`roleId`),
  CONSTRAINT `role_action_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `action` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_action
-- ----------------------------

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studentId` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sudentName` varchar(40) DEFAULT NULL COMMENT '名字',
  `PARENT_ID` int(10) DEFAULT NULL COMMENT '家长',
  `grade` varchar(40) DEFAULT NULL COMMENT '年级',
  `school` varchar(40) DEFAULT NULL COMMENT '学校',
  `studentPhone` bigint(20) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`studentId`),
  KEY `PARENT_ID` (`PARENT_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`PARENT_ID`) REFERENCES `parent` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生表';

-- ----------------------------
-- Records of student
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `grade` varchar(30) DEFAULT NULL COMMENT '年级',
  `courseName` varchar(30) DEFAULT NULL COMMENT '科目',
  `email` varchar(80) DEFAULT NULL COMMENT '邮箱',
  `job_num` varchar(80) DEFAULT NULL COMMENT '工号',
  `nickName` varchar(30) DEFAULT NULL COMMENT '昵称',
  `level` int(1) DEFAULT '0' COMMENT '等级',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'scott', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', null, null, null, null, '管理员', '0');
INSERT INTO `user` VALUES ('2', 'ouwenfa', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '小学', '数学', null, null, '欧晓晴', '0');
INSERT INTO `user` VALUES ('3', 'hello', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '物理', null, null, '简琪琪', '0');
INSERT INTO `user` VALUES ('4', 'jianyongqi', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '语文', null, null, '简泳琪', '0');
INSERT INTO `user` VALUES ('5', 'xiaotianshi', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '数学', null, null, '小天使', '0');
INSERT INTO `user` VALUES ('6', 'liuchu', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '英语', null, null, '刘处', '0');
INSERT INTO `user` VALUES ('7', 'jianjieying', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '英语', null, null, '简洁莹', '0');
INSERT INTO `user` VALUES ('8', 'xiaomogui', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '化学', null, null, '陈三', '0');
INSERT INTO `user` VALUES ('9', 'liudehua', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '政治', null, null, '张五', '0');
INSERT INTO `user` VALUES ('10', 'wangbaoqiang', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '物理', null, null, '刘六', '0');
INSERT INTO `user` VALUES ('11', 'ouwenfa1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '小学', '数学', null, null, '欧静晴', '1');
INSERT INTO `user` VALUES ('12', 'hello1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '物理', null, null, '简颖琪', '1');
INSERT INTO `user` VALUES ('13', 'jianyongqi1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '语文', null, null, '阮琪', '1');
INSERT INTO `user` VALUES ('14', 'xiaotianshi1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '数学', null, null, '小天', '1');
INSERT INTO `user` VALUES ('15', 'liuchu1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '英语', null, null, '刘贵', '1');
INSERT INTO `user` VALUES ('16', 'jianjieying1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '英语', null, null, '简莹', '1');
INSERT INTO `user` VALUES ('17', 'xiaomogui1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '化学', null, null, '张三', '0');
INSERT INTO `user` VALUES ('18', 'liudehua1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '初中', '政治', null, null, '李四', '0');
INSERT INTO `user` VALUES ('19', 'wangbaoqiang1', ' DSSkitM2mP7JjUWZ1k4GK2yoRJyumdoQ', '高中', '物理', null, null, '王五', '0');

-- ----------------------------
-- Table structure for `user_action`
-- ----------------------------
DROP TABLE IF EXISTS `user_action`;
CREATE TABLE `user_action` (
  `USER_ID` int(20) NOT NULL COMMENT '人员主键',
  `ACTION_ID` int(20) NOT NULL COMMENT '权限主键',
  PRIMARY KEY (`USER_ID`,`ACTION_ID`) COMMENT '联合主键',
  KEY `ACTION_ID` (`ACTION_ID`),
  CONSTRAINT `user_action_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`userId`),
  CONSTRAINT `user_action_ibfk_2` FOREIGN KEY (`ACTION_ID`) REFERENCES `action` (`actionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_action
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `USER_ID` int(20) NOT NULL COMMENT '人员主键',
  `ROLE_ID` int(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`USER_ID`,`ROLE_ID`) COMMENT '联合主键',
  KEY `ROLE_ID` (`ROLE_ID`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`userId`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('3', '2');
INSERT INTO `user_role` VALUES ('4', '2');
INSERT INTO `user_role` VALUES ('5', '2');
INSERT INTO `user_role` VALUES ('6', '2');
INSERT INTO `user_role` VALUES ('7', '2');
INSERT INTO `user_role` VALUES ('8', '2');
INSERT INTO `user_role` VALUES ('9', '2');
INSERT INTO `user_role` VALUES ('10', '2');
INSERT INTO `user_role` VALUES ('11', '2');
INSERT INTO `user_role` VALUES ('12', '2');
INSERT INTO `user_role` VALUES ('13', '2');
INSERT INTO `user_role` VALUES ('14', '2');
INSERT INTO `user_role` VALUES ('15', '2');
INSERT INTO `user_role` VALUES ('16', '2');
INSERT INTO `user_role` VALUES ('17', '2');
INSERT INTO `user_role` VALUES ('18', '2');
