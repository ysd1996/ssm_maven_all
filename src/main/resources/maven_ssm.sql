/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.7.20-log : Database - maven_ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`maven_ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `maven_ssm`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` varchar(128) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`NAME`,`nickname`,`phoneNum`,`email`) values 
('E61D65F673D54F68B0861025C69773DB','张三','小三','18888888888','zs@163.com');

/*Table structure for table `order_traveller` */

DROP TABLE IF EXISTS `order_traveller`;

CREATE TABLE `order_traveller` (
  `orderId` varchar(128) NOT NULL,
  `travellerId` varchar(128) NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_traveller` */

insert  into `order_traveller`(`orderId`,`travellerId`) values 
('0E7231DC797C486290E8713CA3C6ECCC','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),
('2FF351C4AC744E2092DCF08CFD314420','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),
('5DC6A48DD4E94592AE904930EA866AFA','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),
('A0657832D93E4B10AE88A2D4B70B1A28','3FE27DF2A4E44A6DBC5D0FE4651D3D3E'),
('3081770BC3984EF092D9E99760FDABDE','EE7A71FB6945483FBF91543DBE851960'),
('55F9AF582D5A4DB28FB4EC3199385762','EE7A71FB6945483FBF91543DBE851960'),
('96CC8BD43C734CC2ACBFF09501B4DD5D','EE7A71FB6945483FBF91543DBE851960'),
('CA005CF1BE3C4EF68F88ABC7DF30E976','EE7A71FB6945483FBF91543DBE851960'),
('E4DD4C45EED84870ABA83574A801083E','EE7A71FB6945483FBF91543DBE851960');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` varchar(128) NOT NULL,
  `orderNum` varchar(20) NOT NULL,
  `orderTime` datetime DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` varchar(128) DEFAULT NULL,
  `memberId` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`orderNum`,`orderTime`,`peopleCount`,`orderDesc`,`payType`,`orderStatus`,`productId`,`memberId`) values 
('0E7231DC797C486290E8713CA3C6ECCC','12345','2018-02-03 12:00:00',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),
('2FF351C4AC744E2092DCF08CFD314420','67890','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),
('3081770BC3984EF092D9E99760FDABDE','55555','2018-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),
('55F9AF582D5A4DB28FB4EC3199385762','33333','2021-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),
('5DC6A48DD4E94592AE904930EA866AFA','54321','2018-02-03 12:00:00',2,'没什么',0,1,'676C5BD1D35E429A8C2E114939C5685A','E61D65F673D54F68B0861025C69773DB'),
('96CC8BD43C734CC2ACBFF09501B4DD5D','22222','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),
('A0657832D93E4B10AE88A2D4B70B1A28','98765','2018-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB'),
('CA005CF1BE3C4EF68F88ABC7DF30E976','44444','2018-02-03 12:00:00',2,'没什么',0,1,'9F71F01CB448476DAFB309AA6DF9497F','E61D65F673D54F68B0861025C69773DB'),
('E4DD4C45EED84870ABA83574A801083E','11111','2020-02-03 12:00:00',2,'没什么',0,1,'12B7ABF2A4C544568B0A7C69F36BF8B7','E61D65F673D54F68B0861025C69773DB');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `permission` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(128) NOT NULL,
  `productNum` varchar(50) NOT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `cityName` varchar(50) DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `productPrice` double DEFAULT NULL,
  `productDesc` varchar(500) DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`productNum`,`productName`,`cityName`,`DepartureTime`,`productPrice`,`productDesc`,`productStatus`) values 
('12B7ABF2A4C544568B0A7C69F36BF8B7','itcast-003','上海五日游','上海','2018-10-04 14:30:00',1800,'魔都我来了',0),
('676C5BD1D35E429A8C2E114939C5685A','itcast-002','北京三日游','北京','2018-10-10 10:10:00',1200,'不错的旅行',1),
('9F71F01CB448476DAFB309AA6DF9497F','itcast-001','北京三日游','北京','2018-10-10 10:10:00',1200,'不错的旅行',1),
('c43f7fa2-2730-485d-8381-e6600e81ab0e','ysd-002','巫山小三峡','重庆市江北区','2021-06-10 15:15:00',650,'小三峡 ，即小三峡旅游风景区，1991年，被评为“中国旅游胜地四十佳”、2004年11月评为“国家AAAA级旅游景区”，2007年5月被评为“国家AAAAA级旅游景区”。同时还被评为“中国国家级重点风景名胜区”，“重庆文明景区”，“重庆安全景区”，被名人誉为“中华奇观”，“天下绝景”。',1),
('f0532660-0114-4932-b4f8-dae9bd55197a','ysd-001','重庆一日游','重庆','2021-06-08 23:10:00',1000,'重庆一日游',1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `roleDesc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role` */

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `permissionId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `role_permission` */

/*Table structure for table `traveller` */

DROP TABLE IF EXISTS `traveller`;

CREATE TABLE `traveller` (
  `id` varchar(128) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `traveller` */

insert  into `traveller`(`id`,`NAME`,`sex`,`phoneNum`,`credentialsType`,`credentialsNum`,`travellerType`) values 
('3FE27DF2A4E44A6DBC5D0FE4651D3D3E','张龙','男','13333333333',0,'123456789009876543',0),
('EE7A71FB6945483FBF91543DBE851960','张小龙','男','15555555555',0,'987654321123456789',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `phoneNum` varchar(20) DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*Table structure for table `users_role` */

DROP TABLE IF EXISTS `users_role`;

CREATE TABLE `users_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
