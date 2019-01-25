SET NAMES UTF8;
DROP DATABASE IF EXISTS food;
CREATE DATABASE food CHARSET=UTF8;
USE food;

/*管理员*/
CREATE TABLE food_admin(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    aname VARCHAR(32) UNIQUE,
    apwd VARCHAR(64)
);
INSERT INTO food_admin VALUES
(NULL,'admin',PASSWORD('123456')),
(NULL,'boss',PASSWORD('999999'));

/*全局设置*/
/*设置*/
DROP TABLE IF EXISTS food_settings;
Create Table food_settings(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    appName VARCHAR(32),
    apiUrl VARCHAR(64),
	adminUrl VARCHAR(64),
	appUrl VARCHAR(64),
	icp VARCHAR(64),
	copyright VARCHAR(128)
);
INSERT INTO food_settings VALUES
(NULL,'小肥牛','http://127.0.0.1:8090','http://127.0.0.1:8091','http://127.0.0.1:8092','京ICP备08000853号-75','Copyright © 2017达内科技有限公司版权所有');

/*桌态表*/
DROP TABLE IF EXISTS food_table;
CREATE TABLE food_table(
    tid  INT PRIMARY KEY AUTO_INCREMENT,
    tname VARCHAR(32),
	type VARCHAR(32),
	status INT
);
INSERT INTO food_table VALUES
(NULL,'福满堂','6-8人桌',1),
(NULL,'金镶玉','4人桌',2),
(NULL,'寿齐天','10人桌',3),
(NULL,'全家福','2人桌',0);

/*桌台预定信息*/
DROP TABLE IF EXISTS food_reservation;
CREATE TABLE food_reservation(
    rid  INT PRIMARY KEY AUTO_INCREMENT,
    contactName VARCHAR(32),
	phone VARCHAR(32),
	contactTime BIGINT,
	dinnertime BIGINT,
    tableId INT,
    FOREIGN KEY 
);
INSERT INTO food_reservation VALUES
(NULL,'丁丁','13501234567',1548404810420,1548410400000),
(NULL,'当当','13501234567',1548404820420,1548410400000),
(NULL,'东东','13501234567',1548404830420,1548410400000),
(NULL,'花花','13501234567',1548404840420,1548410400000);

/*菜品类别*/
DROP TABLE IF EXISTS food_category;
CREATE TABLE food_category(
  cid  INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(32)
);
INSERT INTO food_category VALUES
(NULL,'肉类'),
(NULL,'丸滑类'),
(NULL,'海鲜河鲜'),
(NULL,'蔬菜豆制品'),
(NULL,'菌菇类');

/*菜品*/
DROP TABLE IF EXISTS food_dish;
CREATE TABLE food_dish(
    did  INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
	imgUrl VARCHAR(128),
	price DECIMAL(6,2),
	detail VARCHAR(128),
	categoryId INT,
    FOREIGN KEY(categoryId) REFERENCES food_category(cid)
);

INSERT INTO food_dish VALUES
(100000,'草鱼片','CE7I9470.jpg',35,'选鲜活草鱼，切出鱼片冷鲜保存。锅开后再煮1分钟左右即可食用。',1),
(NULL,'脆皮肠','CE7I9017.jpg',25,'锅开后再煮3分钟左右即可食用。',1);

/*订单*/
DROP TABLE IF EXISTS food_order;
CREATE TABLE food_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    startTime BIGINT,
    endTime BIGINT,
    customerCount INT,
    tableId INT,
    FOREIGN KEY(tableId) REFERENCES food_table(tid)
);
INSERT INTO food_order VALUES(1,1548404810420,1548405810420,3,1);

/*订单详情*/
DROP TABLE IF EXISTS food_order_detail;
CREATE TABLE food_order_detail(
    did INT PRIMARY KEY AUTO_INCREMENT,
    dishId INT, /*菜品编号*/
    dishCount INT, /*分数*/
    customerName VARCHAR(32),  /*顾客名称*/
    orderId INT,  /*订单编号*/
    FOREIGN KEY(dishId) REFERENCES food_dish(did),
    FOREIGN KEY(orderId) REFERENCES food_order(oid)
);
INSERT INTO food_order_detail VALUES
(NULL,100001,1,'丁丁',1);