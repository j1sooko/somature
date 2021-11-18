
DROP SEQUENCE id_seq;

CREATE SEQUENCE id_seq
	INCREMENT BY 1
	START WITH 1;

DROP TABLE PostReveiw CASCADE CONSTRAINTS PURGE;

DROP TABLE Region CASCADE CONSTRAINTS PURGE;

DROP TABLE Dong CASCADE CONSTRAINTS PURGE;

DROP TABLE Gu CASCADE CONSTRAINTS PURGE;

DROP TABLE Si CASCADE CONSTRAINTS PURGE;

DROP TABLE SearchKeyword CASCADE CONSTRAINTS PURGE;

DROP TABLE Message CASCADE CONSTRAINTS PURGE;

DROP TABLE Favorite CASCADE CONSTRAINTS PURGE;

DROP TABLE Transaction CASCADE CONSTRAINTS PURGE;

DROP TABLE Post CASCADE CONSTRAINTS PURGE;

DROP TABLE Buyer CASCADE CONSTRAINTS PURGE;

DROP TABLE Category CASCADE CONSTRAINTS PURGE;

DROP TABLE NotiKeword CASCADE CONSTRAINTS PURGE;

DROP TABLE Notification CASCADE CONSTRAINTS PURGE;

DROP TABLE Account CASCADE CONSTRAINTS PURGE;

CREATE TABLE Account
(
	userId               INT NOT NULL ,
	phoneNumber          VARCHAR2(15) NOT NULL ,
	emailAddress         VARCHAR2(100) NOT NULL ,
	userName             VARCHAR2(10) NOT NULL ,
	registrationNumber   VARCHAR2(14) NOT NULL ,
	password             VARCHAR2(30) NOT NULL ,
	joinDate             DATE DEFAULT  SYSDATE  NOT NULL ,
	accountId            VARCHAR2(30) NOT NULL ,
	rating               INT NOT NULL  CONSTRAINT  rating CHECK (rating BETWEEN 1 AND 5),
	nickName             VARCHAR2(10) NOT NULL 
);

CREATE UNIQUE INDEX XPKAccount ON Account
(userId   ASC);

ALTER TABLE Account
	ADD CONSTRAINT  XPKAccount PRIMARY KEY (userId);

CREATE TABLE SearchKeyword
(
	createdTime          DATE DEFAULT  SYSDATE  NOT NULL ,
	keyword              VARCHAR2(20) NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKSearchKeyword ON SearchKeyword
(userId   ASC);

ALTER TABLE SearchKeyword
	ADD CONSTRAINT  XPKSearchKeyword PRIMARY KEY (userId);

CREATE TABLE Buyer
(
	product_in_progress  VARCHAR2(100) NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKBuyer ON Buyer
(userId   ASC);

ALTER TABLE Buyer
	ADD CONSTRAINT  XPKBuyer PRIMARY KEY (userId);

CREATE TABLE Category
(
	categoryId           INT NOT NULL ,
	categoryName         VARCHAR2(20) NOT NULL 
);

CREATE UNIQUE INDEX XPKCategory ON Category
(categoryId   ASC);

ALTER TABLE Category
	ADD CONSTRAINT  XPKCategory PRIMARY KEY (categoryId);

CREATE TABLE Dong
(
	dongId               INT NOT NULL ,
	name                 VARCHAR2(100) NOT NULL ,
	guId                 INT NOT NULL 
);

CREATE UNIQUE INDEX XPKDong ON Dong
(dongId   ASC);

ALTER TABLE Dong
	ADD CONSTRAINT  XPKDong PRIMARY KEY (dongId);

CREATE TABLE Region
(
	regionId             INT NOT NULL ,
	regionName           VARCHAR2(100) NOT NULL ,
	location             INT NOT NULL ,
	dongId               INT NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKRegion ON Region
(regionId   ASC);

ALTER TABLE Region
	ADD CONSTRAINT  XPKRegion PRIMARY KEY (regionId);

CREATE TABLE Gu
(
	guId                 INT NOT NULL ,
	name                 VARCHAR2(100) NOT NULL ,
	siId                 INT NOT NULL 
);

CREATE UNIQUE INDEX XPKGu ON Gu
(guId   ASC);

ALTER TABLE Gu
	ADD CONSTRAINT  XPKGu PRIMARY KEY (guId);

CREATE TABLE NotiKeword
(
	keywordId            CHAR(18) NOT NULL ,
	keword               CHAR(18) NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKNotiKeword ON NotiKeword
(keywordId   ASC);

ALTER TABLE NotiKeword
	ADD CONSTRAINT  XPKNotiKeword PRIMARY KEY (keywordId);

CREATE TABLE Notification
(
	content              VARCHAR2(100) NOT NULL ,
	readOrNot            INT NOT NULL ,
	type                 VARCHAR2(10) NOT NULL  CONSTRAINT  notiType CHECK (type IN ('trans', 'favor', 'message', 'review')),
	createdTime          DATE NOT NULL ,
	notiId               CHAR(18) NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKNotification ON Notification
(notiId   ASC);

ALTER TABLE Notification
	ADD CONSTRAINT  XPKNotification PRIMARY KEY (notiId);

CREATE TABLE Post
(
	postId               INT NOT NULL ,
	title                VARCHAR2(50) NOT NULL ,
	description          VARCHAR2(500) NOT NULL ,
	imageUrl             VARCHAR2(300) NULL ,
	createdTime          DATE DEFAULT  SYSDATE  NOT NULL ,
	categoryId           INT NOT NULL ,
	views                INT NOT NULL ,
	status               VARCHAR2(10) NOT NULL  CONSTRAINT  status_1697923632 CHECK (status IN ('available', 'ongoing', 'completed')),
	price                INT NOT NULL  CONSTRAINT  post_price CHECK (price >= 0),
	postType             CHAR(1) NOT NULL  CONSTRAINT  post_type CHECK (postType IN ('s', 'b')),
	writerId             INT NULL 
);

CREATE UNIQUE INDEX XPKPost ON Post
(postId   ASC);

ALTER TABLE Post
	ADD CONSTRAINT  XPKPost PRIMARY KEY (postId);

CREATE TABLE PostReveiw
(
	reviewId             INT NOT NULL ,
	createdTime          DATE DEFAULT  SYSDATE  NOT NULL ,
	content              VARCHAR2(500) NOT NULL ,
	postId               INT NOT NULL ,
	score                INT NOT NULL  CONSTRAINT  score CHECK (score BETWEEN 1 AND 5),
	reviewerId           INT NOT NULL 
);

CREATE UNIQUE INDEX XPKPostReveiw ON PostReveiw
(reviewId   ASC);

ALTER TABLE PostReveiw
	ADD CONSTRAINT  XPKPostReveiw PRIMARY KEY (reviewId);

CREATE TABLE Favorite
(
	postId               INT NOT NULL ,
	favorId              CHAR(18) NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKFavorite ON Favorite
(favorId   ASC);

ALTER TABLE Favorite
	ADD CONSTRAINT  XPKFavorite PRIMARY KEY (favorId);

CREATE TABLE Si
(
	siId                 INT NOT NULL ,
	name                 VARCHAR2(100) NOT NULL 
);

CREATE UNIQUE INDEX XPKSi ON Si
(siId   ASC);

ALTER TABLE Si
	ADD CONSTRAINT  XPKSi PRIMARY KEY (siId);

CREATE TABLE Transaction
(
	transId              CHAR(18) NOT NULL ,
	transDate            DATE DEFAULT  SYSDATE  NOT NULL ,
	postId               INT NOT NULL ,
	userId               INT NOT NULL 
);

CREATE UNIQUE INDEX XPKTransaction ON Transaction
(transId   ASC);

ALTER TABLE Transaction
	ADD CONSTRAINT  XPKTransaction PRIMARY KEY (transId);

CREATE TABLE Message
(
	createdTime          DATE NOT NULL ,
	content              VARCHAR2(500) NOT NULL ,
	messengerId          INT NOT NULL ,
	receiverId           INT NOT NULL ,
	senderId             INT NOT NULL 
);

CREATE UNIQUE INDEX XPKMessage ON Message
(messengerId   ASC);

ALTER TABLE Message
	ADD CONSTRAINT  XPKMessage PRIMARY KEY (messengerId);

ALTER TABLE SearchKeyword
	ADD (CONSTRAINT 검색 FOREIGN KEY (userId) REFERENCES Account (userId));

ALTER TABLE Buyer
	ADD (CONSTRAINT R_86 FOREIGN KEY (userId) REFERENCES Account (userId) ON DELETE CASCADE);

ALTER TABLE Dong
	ADD (CONSTRAINT R_101 FOREIGN KEY (guId) REFERENCES Gu (guId));

ALTER TABLE Region
	ADD (CONSTRAINT R_16 FOREIGN KEY (dongId) REFERENCES Dong (dongId));

ALTER TABLE Region
	ADD (CONSTRAINT 활동지역 FOREIGN KEY (userId) REFERENCES Account (userId));

ALTER TABLE Gu
	ADD (CONSTRAINT R_14 FOREIGN KEY (siId) REFERENCES Si (siId));

ALTER TABLE NotiKeword
	ADD (CONSTRAINT 알림키워드_가짐 FOREIGN KEY (userId) REFERENCES Account (userId));

ALTER TABLE Notification
	ADD (CONSTRAINT 알림수신 FOREIGN KEY (userId) REFERENCES Account (userId));

ALTER TABLE Post
	ADD (CONSTRAINT 포함 FOREIGN KEY (categoryId) REFERENCES Category (categoryId));

ALTER TABLE Post
	ADD (CONSTRAINT 게시글_작성 FOREIGN KEY (writerId) REFERENCES Account (userId));

ALTER TABLE Post
	ADD (CONSTRAINT R_107 FOREIGN KEY (writerId) REFERENCES Buyer (userId) ON DELETE SET NULL);

ALTER TABLE PostReveiw
	ADD (CONSTRAINT 후기_작성 FOREIGN KEY (reviewerId) REFERENCES Account (userId));

ALTER TABLE PostReveiw
	ADD (CONSTRAINT 가짐 FOREIGN KEY (postId) REFERENCES Post (postId));

ALTER TABLE Favorite
	ADD (CONSTRAINT 관심글_설정 FOREIGN KEY (userId) REFERENCES Account (userId) ON DELETE SET NULL);

ALTER TABLE Favorite
	ADD (CONSTRAINT 관심글_담기 FOREIGN KEY (postId) REFERENCES Post (postId));

ALTER TABLE Transaction
	ADD (CONSTRAINT 거래_요청 FOREIGN KEY (userId) REFERENCES Account (userId));

ALTER TABLE Transaction
	ADD (CONSTRAINT R_116 FOREIGN KEY (postId) REFERENCES Post (postId));

ALTER TABLE Message
	ADD (CONSTRAINT 수신 FOREIGN KEY (receiverId) REFERENCES Account (userId));

ALTER TABLE Message
	ADD (CONSTRAINT R_100 FOREIGN KEY (receiverId) REFERENCES Buyer (userId));

ALTER TABLE Message
	ADD (CONSTRAINT 송신 FOREIGN KEY (senderId) REFERENCES Account (userId));
