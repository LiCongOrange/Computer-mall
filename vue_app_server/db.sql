#vue_app_server/db.sql
#1:进入库  xz
USE xz;
#2:创建表 xz_news
#技巧1:库名;表名;列表;全英文小写字母
CREATE TABLE xz_news(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(50),
  ctime DATETIME,
  point INT,
  img_url VARCHAR(255),
  content VARCHAR(255) 
);
INSERT INTO xz_news VALUES(1,'123',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(2,'124',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(3,'1233',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(4,'124',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(5,'125',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(6,'126',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(7,'127',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(8,'128',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(9,'129',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(11,'1231',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(12,'1232',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(13,'1233',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(14,'1234',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(15,'1235',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(16,'1236',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(17,'1237',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(18,'1238',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(19,'1239',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(21,'12322',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");
INSERT INTO xz_news VALUES(22,'12322',now(),0,
"http://127.0.0.1:3000/img/1.jpg","..");

#货币 小数计算误差
#价格 购物车合计 
#double DECIMAL(10,2)
#严格   将货币转换分单位  1.99 -> 199
#显示  1.99
#3:添加20条记录
#4:查询

CREATE TABLE xz_comment(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nid INT,
    user_name VARCHAR(25),
    ctime DATETIME,
    content VARCHAR(120)
);


#添加15条数据
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'sada');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'123');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'344');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'223');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'444');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'555');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'666');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'777');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'888');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'999');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'000');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'adadad');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'123312');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'342423');
INSERT INTO xz_comment VALUES(null,1,'dongdong',now(),'6346346');