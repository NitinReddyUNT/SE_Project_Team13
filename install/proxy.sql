/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - proxy
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`proxy` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proxy`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `username` varchar(200) default NULL,
  `password` varchar(200) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`username`,`password`) values ('Admin','Admin');


/*Table structure for table `csp` */

DROP TABLE IF EXISTS `csp`;

CREATE TABLE `csp` (
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `csp` */

insert  into `csp`(`username`,`password`) values ('CSP','CSP');

/*Table structure for table `download` */

DROP TABLE IF EXISTS `download`;

CREATE TABLE `download` (
  `id` int(11) NOT NULL auto_increment,
  `userid` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `filename` varchar(100) default NULL,
  `date` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `download` */

insert  into `download`(`id`,`userid`,`username`,`filename`,`date`) values (2,'1','test','abstract.txt','2023-04-21 12:09:41');


/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) NOT NULL auto_increment,
  `owner` varchar(1000) default NULL,
  `filename` varchar(100) default NULL,
  `filedata` longtext,
  `skey` varchar(1000) default NULL,
  `cipher` longtext,
  `date` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `file` */

insert  into `file`(`id`,`owner`,`filename`,`filedata`,`skey`,`cipher`,`date`) values (10,'1','test.txt','test','test','test','2023-04-21 11:50:01');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `mkey` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`id`,`username`,`password`,`email`,`dob`,`location`,`gender`,`mobile`,`mkey`) values (1,'test','123','test@gmail.com','2023-08-28','Denton','Male','9640257292','78655');

/*Table structure for table `server` */

DROP TABLE IF EXISTS `server`;

CREATE TABLE `server` (
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `server` */

insert  into `server`(`username`,`password`) values ('Server','Server');

/*Table structure for table `ta` */

DROP TABLE IF EXISTS `ta`;

CREATE TABLE `ta` (
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ta` */

insert  into `ta`(`username`,`password`) values ('Authority','Authority');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(1000) default NULL,
  `password` varchar(1000) default NULL,
  `email` varchar(1000) default NULL,
  `dob` varchar(100) default NULL,
  `location` varchar(100) default NULL,
  `gender` varchar(100) default NULL,
  `mobile` varchar(100) default NULL,
  `mskey` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`dob`,`location`,`gender`,`mobile`,`mskey`) values (1,'testuser','123','testuser@gmail.com','06/07/1995','denton','male','987543210','78665');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
