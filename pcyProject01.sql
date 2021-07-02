--------------------------------------------------------
--  파일이 생성됨 - 일요일-10월-22-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table WHFANPAGE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHFANPAGE" 
   (	"NO" NUMBER, 
	"WNAME" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"VIEWCNT" NUMBER, 
	"WDATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHGALLERY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHGALLERY" 
   (	"TABLENO" NUMBER, 
	"WNAME" VARCHAR2(20 BYTE), 
	"TABLEDATE" DATE, 
	"TITLE" VARCHAR2(50 BYTE), 
	"FNAME" VARCHAR2(50 BYTE), 
	"VIEWCNT" NUMBER, 
	"CONTENT" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHGSW_RECORDS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHGSW_RECORDS" 
   (	"SEASON" NUMBER, 
	"WINS" VARCHAR2(10 BYTE), 
	"LOSSES" VARCHAR2(10 BYTE), 
	"RESULT" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHGSWPP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHGSWPP" 
   (	"ID" VARCHAR2(10 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"FNAME" VARCHAR2(30 BYTE), 
	"BIRTHDAY" VARCHAR2(50 BYTE), 
	"SCHOOL" VARCHAR2(50 BYTE), 
	"BODY" VARCHAR2(50 BYTE), 
	"POSITION" VARCHAR2(20 BYTE), 
	"AWARD" VARCHAR2(100 BYTE), 
	"VIDEO" VARCHAR2(100 BYTE), 
	"BNUMBER" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHMEMBER
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHMEMBER" 
   (	"ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"PASSWD" VARCHAR2(20 BYTE), 
	"PHONENUMBER" VARCHAR2(20 BYTE), 
	"ZIPCODE" VARCHAR2(20 BYTE), 
	"ADDRESS1" VARCHAR2(50 BYTE), 
	"ADDRESS2" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHQNATABLE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHQNATABLE" 
   (	"IDX" NUMBER(10,0), 
	"NAME" VARCHAR2(20 BYTE), 
	"TITLE" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(500 BYTE), 
	"GRPNO" NUMBER(10,0), 
	"INDENT" NUMBER(10,0) DEFAULT 0, 
	"ANSNUM" NUMBER(10,0) DEFAULT 0, 
	"PASSWD" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHREPLY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHREPLY" 
   (	"RNUM" NUMBER, 
	"WNAME" VARCHAR2(20 BYTE), 
	"NO" NUMBER, 
	"CONTENT" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHREVIEWS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHREVIEWS" 
   (	"NO" NUMBER, 
	"ICON" VARCHAR2(30 BYTE), 
	"WNAME" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(100 BYTE), 
	"PASSWD" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHSMTABLE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHSMTABLE" 
   (	"TABLENO" NUMBER(10,0), 
	"TITLE" VARCHAR2(30 BYTE), 
	"TABLEDATE" DATE, 
	"TABLEVIEW" NUMBER(10,0) DEFAULT 0, 
	"CONTENT" VARCHAR2(50 BYTE) DEFAULT NULL, 
	"MOVIE" VARCHAR2(100 BYTE) DEFAULT 'https://'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table WHT_MENU
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."WHT_MENU" 
   (	"MENU_ID" NUMBER, 
	"MENU_NM" VARCHAR2(45 BYTE), 
	"MENU_URL" VARCHAR2(45 BYTE), 
	"MENU_CLASS" VARCHAR2(45 BYTE), 
	"USE_YN" VARCHAR2(5 BYTE), 
	"SORT_NO" NUMBER, 
	"COLLAPSE_YN" VARCHAR2(5 BYTE), 
	"DEPTH" NUMBER, 
	"PARENT_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.WHFANPAGE
SET DEFINE OFF;
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (3,'user1','커리 PSG 방문','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/DIGKJJYXYAAsKi9.jpg" style="width: 848px; height: 1200px;" /><br />
	<br />
	<span style="font-size:24px;"><span style="background-color:#00ffff;">ㅎㅎㅎㅎㅎㅎㅎㅎ</span></span></div>
',2,to_date('17/09/09','RR/MM/DD'));
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (1,'admin','워리어스 경기 짤 - 1','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/1504883860.gif" style="width: 549px; height: 360px;" /><br />
	<br />
	<em><strong><span style="font-size:22px;"><span style="font-family:맑은고딕;"><span style="color: rgb(30, 30, 30);">덕 맥키츠키<br />
	<br />
	<img alt="" src="/sample/ckstorage/images/1504883860%20(1).gif" style="width: 672px; height: 378px;" /></span></span></span></strong></em><br />
	<br />
	<img alt="" src="/sample/ckstorage/images/1504883860%20(2).gif" style="width: 672px; height: 378px;" /><br />
	<br />
	<strong><em><span style="font-size:22px;"><span style="color: rgb(30, 30, 30); font-family: Gulim, 굴림;"><span style="background-color:#ffff00;">가드->포워드가 아닌 포워드->가드 엘리웁 ㄷㄷ</span></span></span></em></strong></div>
',13,to_date('17/09/09','RR/MM/DD'));
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (2,'admin','워리어스 경기 짤 - 2','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/1504884648.gif" style="width: 672px; height: 378px;" /><br />
	<br />
	<img alt="" src="/sample/ckstorage/images/1504884648%20(1).gif" style="width: 672px; height: 378px;" /><br />
	<br />
	<span style="font-family:dotum;"><em><span style="font-size:26px;"><span style="color: rgb(30, 30, 30);"><span style="background-color:#dda0dd;">커리의 더블클러치 ㄷㄷ</span></span></span></em></span></div>
',5,to_date('17/09/09','RR/MM/DD'));
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (4,'admin',' 워리어스 샐러리 ver 1.1','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/1504889455.jpg" style="width: 838px; height: 442px;" /><br />
	<br />
	<span style="color:#2f4f4f;"><em><span style="font-family: Gulim, 굴림; font-size: 24px;">초록색은 선수옵션, 빨간색은 팀옵션, 노란색은 캡홀드입니다</span></em></span></div>
<p style="padding: 0px; margin: 0px; color: rgb(30, 30, 30); font-family: Gulim, 굴림; font-size: 13px; text-align: center;">
	<span style="color:#2f4f4f;"><em><span style="font-size: 24px;">커리의 연봉은 근사값이며, 듀란트(19-20) 와 조던벨의 연봉은 임의책정했습니다.</span></em></span><br />
	<br />
	<em style="color: rgb(47, 79, 79);"><span style="font-size: 24px;">미미신의 어마어마한 계약으로 팀 페이롤이 줄었습니다!</span></em></p>
<p style="padding: 0px; margin: 0px; color: rgb(30, 30, 30); font-family: Gulim, 굴림; font-size: 13px; text-align: center;">
	<span style="color:#2f4f4f;"><em><span style="font-size: 24px;">하지만 탐슨을 계약하기 위해선 이궈달라의 트레이드가 여전히 필요합니다.</span></em></span></p>
',10,to_date('17/09/09','RR/MM/DD'));
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (5,'user2','138밀에 사치세 40밀ㄷㄷ','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/1504890075.jpg" style="width: 750px; height: 499px;" /></div>
<div style="text-align: center;">
	<span style="font-size:26px;"><em><span style="color: rgb(30, 30, 30); font-family: Gulim, 굴림;">19년에 탐슨 맥스 주면 셀캡 170밀ㅋㅋ</span></em></span><br />
	<br />
	<em style="font-size: 26px;"><span style="color: rgb(30, 30, 30); font-family: Gulim, 굴림;">사실상 탐슨을 트레이드로 보낼 생각인가보네</span></em></div>
<div style="text-align: center;">
	<br style="color: rgb(30, 30, 30); font-family: Gulim, 굴림; font-size: 13px;" />
	<span style="font-size:26px;"><em><span style="color: rgb(30, 30, 30); font-family: Gulim, 굴림;">아님 3년쯤에 보낼 생각일수도 있고 ㅜㅜ</span></em></span></div>
',11,to_date('17/09/09','RR/MM/DD'));
Insert into SYSTEM.WHFANPAGE (NO,WNAME,TITLE,CONTENT,VIEWCNT,WDATE) values (6,'user2','중국가서 열심히 하는 탐두순 gif.','<div style="text-align: center;">
	<img alt="" src="/sample/ckstorage/images/1504890331.gif" style="width: 555px; height: 297px;" /><br />
	<br />
	<img alt="" src="/sample/ckstorage/images/1504890332.gif" style="width: 328px; height: 558px;" /><br />
	<br />
	<span style="font-size:26px;"><em><span style="background-color:#ffff00;">ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</span></em></span></div>
',10,to_date('17/09/09','RR/MM/DD'));
REM INSERTING into SYSTEM.WHGALLERY
SET DEFINE OFF;
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (1,'admin',to_date('17/07/24','RR/MM/DD'),'르브론 제임스 레이업','james01.gif',50,'화려한 르브론 제임스 레이업');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (2,'admin',to_date('17/07/26','RR/MM/DD'),'(NBA) 르브론 트레블링 ','james02.gif',4,'좌우로 심판들이 뻔히 보고있는데 아무도 안붐... ㅜㅜ');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (3,'admin',to_date('17/07/26','RR/MM/DD'),'미국에서 논란 중인 NBA 더티 플레이 01','dirty01.gif',7,'NBA 더티 플레이 01');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (4,'admin',to_date('17/07/26','RR/MM/DD'),'미국에서 논란 중인 NBA 더티 플레이 02','dirty02.gif',5,'NBA 더티 플레이 02');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (5,'admin',to_date('17/07/26','RR/MM/DD'),'커리 연속 fake 3점','curry01.gif',12,'커리 연속 fake 3점!!!');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (6,'admin',to_date('17/07/26','RR/MM/DD'),'커리가 파이널만가면 힘든 이유','curry02.gif',10,'반칙을 안 부르는...ㅜㅜ');
Insert into SYSTEM.WHGALLERY (TABLENO,WNAME,TABLEDATE,TITLE,FNAME,VIEWCNT,CONTENT) values (7,'admin',to_date('17/07/26','RR/MM/DD'),'커리 드리블 & 슛','curry03.gif',17,'환상적인 드리블 및 슛');
REM INSERTING into SYSTEM.WHGSW_RECORDS
SET DEFINE OFF;
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2017,'67','15','콘퍼런스 : 1위, 파이널 : 우승');
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2016,'73','9','콘퍼런스 : 1위, 파이널 : 준우승');
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2015,'67','15','콘퍼런스 : 1위, 파이널 : 우승');
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2014,'51','31','콘퍼런스 : 6위');
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2013,'47','35','콘퍼런스 : 6위');
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2012,'23','43',null);
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2010,'26','56',null);
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2009,'29','53',null);
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2008,'48','34',null);
Insert into SYSTEM.WHGSW_RECORDS (SEASON,WINS,LOSSES,RESULT) values (2007,'42','40','콘퍼런스 : 8위');
REM INSERTING into SYSTEM.WHGSWPP
SET DEFINE OFF;
Insert into SYSTEM.WHGSWPP (ID,NAME,FNAME,BIRTHDAY,SCHOOL,BODY,POSITION,AWARD,VIDEO,BNUMBER) values ('playerA','스테판 커리 (Stephen Curry II)','sc01.jpg','1988년 3월 14일 (29세)','데이비슨(Davidson) 대학교','191cm(6''3"), 86Kg(190 lbs)','포인트 가드(PG)','NBA 챔피언 2회 (2015, 2017) <br /> 정규시즌 MVP 2회 (2015,2016)','https://www.youtube.com/embed/HdMogIXidSE','30번');
Insert into SYSTEM.WHGSWPP (ID,NAME,FNAME,BIRTHDAY,SCHOOL,BODY,POSITION,AWARD,VIDEO,BNUMBER) values ('playerC','클레이 알렉산더 톰슨
(Klay Alexander Thompson)','kt01.jpg','1990년 2월 8일 (27세)','워싱턴 주립대학교','201.3cm (6'' 7.25"),  93kg (205 lb)','슈팅 가드(SG)','Three-Point Contest champion (2016) <br /> NBA All-Star 3회 (2015-2017) ','https://www.youtube.com/embed/8ZMyT2naAyU','11번');
Insert into SYSTEM.WHGSWPP (ID,NAME,FNAME,BIRTHDAY,SCHOOL,BODY,POSITION,AWARD,VIDEO,BNUMBER) values ('playerB','케빈 웨인 듀란트 (Kevin Wayne Durant)','kd01.jpg','1988년 9월 29일 (28세)','텍사스 대학교','213cm (7'' 0"), 108kg (240 lbs)','스몰 포워드(SF)','정규시즌 MVP (2014) <br /> NBA Finals MVP 1회 (2017)','https://www.youtube.com/embed/-dffraBY_ao','35번');
REM INSERTING into SYSTEM.WHMEMBER
SET DEFINE OFF;
Insert into SYSTEM.WHMEMBER (ID,NAME,PASSWD,PHONENUMBER,ZIPCODE,ADDRESS1,ADDRESS2) values ('admin','박찬유','pcygogo','010-4198-4196','03396','서울 은평구 대조동 9-50','제이타워4 904호');
Insert into SYSTEM.WHMEMBER (ID,NAME,PASSWD,PHONENUMBER,ZIPCODE,ADDRESS1,ADDRESS2) values ('user1','홍길동','123','010-7777-7777','13536','경기 성남시 분당구 판교역로 4 (백현동)','122-35');
Insert into SYSTEM.WHMEMBER (ID,NAME,PASSWD,PHONENUMBER,ZIPCODE,ADDRESS1,ADDRESS2) values ('user2','가길동','123','010-7777-7777','03048','서울 종로구 청와대로 1 (세종로)','Blue house');
REM INSERTING into SYSTEM.WHQNATABLE
SET DEFINE OFF;
Insert into SYSTEM.WHQNATABLE (IDX,NAME,TITLE,CONTENT,GRPNO,INDENT,ANSNUM,PASSWD) values (6,'답변자','[답변]커리에 대해서','1988년 3월 14일 한국나이로 30살, 미국나이로는 29살입니다.',1,1,1,'pcygogo');
Insert into SYSTEM.WHQNATABLE (IDX,NAME,TITLE,CONTENT,GRPNO,INDENT,ANSNUM,PASSWD) values (1,'질문자1','커리에 대해서','커리의 나이는 어떻게 되나요?',1,0,0,'123');
Insert into SYSTEM.WHQNATABLE (IDX,NAME,TITLE,CONTENT,GRPNO,INDENT,ANSNUM,PASSWD) values (2,'질문자2','NBA에 관해서','NBA는 총 몇개 팀인가요?',2,0,0,'123');
Insert into SYSTEM.WHQNATABLE (IDX,NAME,TITLE,CONTENT,GRPNO,INDENT,ANSNUM,PASSWD) values (5,'답변자','[답변]NBA에 관해서','총 30개 팀입니다',2,1,1,'123');
REM INSERTING into SYSTEM.WHREPLY
SET DEFINE OFF;
Insert into SYSTEM.WHREPLY (RNUM,WNAME,NO,CONTENT) values (2,'user2',1,'역쉬 GSW 선수들 입니다!!!! ㅎㄷㄷ');
Insert into SYSTEM.WHREPLY (RNUM,WNAME,NO,CONTENT) values (1,'user1',2,'ㄷㄷㄷ 하네요!!! ');
Insert into SYSTEM.WHREPLY (RNUM,WNAME,NO,CONTENT) values (3,'user2',4,'ㅎㄷㄷ 하네요!!!!');
Insert into SYSTEM.WHREPLY (RNUM,WNAME,NO,CONTENT) values (4,'admin',6,'ㅋㅋㅋㅋㅋ 먹고 살기 힘드네요 ㅜㅜ ㅋㅋㅋ ㅎㄷㄷ');
REM INSERTING into SYSTEM.WHREVIEWS
SET DEFINE OFF;
Insert into SYSTEM.WHREVIEWS (NO,ICON,WNAME,CONTENT,PASSWD) values (1,'images/main/emo01.gif','홍길동','생각보다 잘 만들었네요!! 놀랐습니다!!! ^.^','123');
Insert into SYSTEM.WHREVIEWS (NO,ICON,WNAME,CONTENT,PASSWD) values (2,'images/main/emo02.gif','김태희','생각보다는 괜찮네요 ㅋㅋㅋ','123');
Insert into SYSTEM.WHREVIEWS (NO,ICON,WNAME,CONTENT,PASSWD) values (3,'images/main/emo05.gif','이병헌','발로 만들어도 이거보다 잘 만들겠네요 ㅜㅜ 아쉬워요','123');
REM INSERTING into SYSTEM.WHSMTABLE
SET DEFINE OFF;
Insert into SYSTEM.WHSMTABLE (TABLENO,TITLE,TABLEDATE,TABLEVIEW,CONTENT,MOVIE) values (1,'스테판 커리 스페셜 영상 01',to_date('17/06/26','RR/MM/DD'),29,'스테판 커리 2015-2016 스페셜 영상','https://www.youtube.com/embed/NzR70dZErdQ');
Insert into SYSTEM.WHSMTABLE (TABLENO,TITLE,TABLEDATE,TABLEVIEW,CONTENT,MOVIE) values (2,'스테판 커리 스페셜 02',to_date('17/06/27','RR/MM/DD'),13,'스페탄 커리 3점슛 하이라이트','https://www.youtube.com/embed/_gpv9UwXUoI');
Insert into SYSTEM.WHSMTABLE (TABLENO,TITLE,TABLEDATE,TABLEVIEW,CONTENT,MOVIE) values (3,'케빈 듀란트 스페셜 영상 01',to_date('17/06/29','RR/MM/DD'),26,'케빈 듀란트 스페셜 영상 01','https://www.youtube.com/embed/GIFiWKFSsh0');
Insert into SYSTEM.WHSMTABLE (TABLENO,TITLE,TABLEDATE,TABLEVIEW,CONTENT,MOVIE) values (4,'케빈 듀란트 스페셜 영상 02',to_date('17/07/11','RR/MM/DD'),25,'혼자서 다하는 KD 케빈듀란트 스페셜','https://www.youtube.com/embed/bVes6myy5c4');
REM INSERTING into SYSTEM.WHT_MENU
SET DEFINE OFF;
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (1,'HOME','main.do','pe-7s-home','Y',1,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (2,'GOLDEN STAGE WARRIORS','teamInfo.do','pe-7s-culture','Y',2,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (3,'RECORD OF WARRIORS','record.do','pe-7s-albums','Y',3,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (4,'PlAYER PROFILE','componentsExamples','pe-7s-add-user','Y',4,'Y',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (5,'PROFILE PAGE','playerProfile.do',null,'Y',1,'N',2,4);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (6,'FAQ OF NBA','qnaTable01.do','fa fa-question','Y',6,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (7,'Q&A','qnaTable02.do','fa fa-question-circle','Y',7,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (8,'SPECIAL MOVIES','specialMovie.do','pe-7s-ball','Y',8,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (9,'GALLERY','gallery.do','pe-7s-photo','Y',9,'N',1,null);
Insert into SYSTEM.WHT_MENU (MENU_ID,MENU_NM,MENU_URL,MENU_CLASS,USE_YN,SORT_NO,COLLAPSE_YN,DEPTH,PARENT_ID) values (10,'FAN PAGE','fanPage.do','pe-7s-ball','Y',5,'N',1,null);
--------------------------------------------------------
--  DDL for Index WHFANPAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHFANPAGE_PK" ON "SYSTEM"."WHFANPAGE" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WHGALLERY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHGALLERY_PK" ON "SYSTEM"."WHGALLERY" ("TABLENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index GSW_RECORDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."GSW_RECORDS_PK" ON "SYSTEM"."WHGSW_RECORDS" ("SEASON") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WHGSWPP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHGSWPP_PK" ON "SYSTEM"."WHGSWPP" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WHMEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHMEMBER_PK" ON "SYSTEM"."WHMEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index QNATABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."QNATABLE_PK" ON "SYSTEM"."WHQNATABLE" ("IDX") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPLY_PK" ON "SYSTEM"."WHREPLY" ("RNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WHREVIEWS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHREVIEWS_PK" ON "SYSTEM"."WHREVIEWS" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index SMTABLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SMTABLE_PK" ON "SYSTEM"."WHSMTABLE" ("TABLENO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index WHT_MENU_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."WHT_MENU_PK" ON "SYSTEM"."WHT_MENU" ("MENU_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table WHFANPAGE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHFANPAGE" MODIFY ("NO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHFANPAGE" ADD CONSTRAINT "WHFANPAGE_PK" PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHGALLERY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHGALLERY" MODIFY ("TABLENO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHGALLERY" ADD CONSTRAINT "WHGALLERY_PK" PRIMARY KEY ("TABLENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHGSW_RECORDS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHGSW_RECORDS" ADD CONSTRAINT "GSW_RECORDS_PK" PRIMARY KEY ("SEASON")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
 
  ALTER TABLE "SYSTEM"."WHGSW_RECORDS" MODIFY ("SEASON" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHGSW_RECORDS" MODIFY ("WINS" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHGSW_RECORDS" MODIFY ("LOSSES" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHGSWPP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHGSWPP" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHGSWPP" ADD CONSTRAINT "WHGSWPP_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHMEMBER
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHMEMBER" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHMEMBER" ADD CONSTRAINT "WHMEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHQNATABLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHQNATABLE" ADD CONSTRAINT "QNATABLE_PK" PRIMARY KEY ("IDX")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("IDX" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("NAME" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("TITLE" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("GRPNO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHQNATABLE" MODIFY ("PASSWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHREPLY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHREPLY" ADD CONSTRAINT "REPLY_PK" PRIMARY KEY ("RNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
 
  ALTER TABLE "SYSTEM"."WHREPLY" MODIFY ("RNUM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHREVIEWS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHREVIEWS" MODIFY ("NO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHREVIEWS" ADD CONSTRAINT "WHREVIEWS_PK" PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table WHSMTABLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHSMTABLE" ADD CONSTRAINT "SMTABLE_PK" PRIMARY KEY ("TABLENO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
 
  ALTER TABLE "SYSTEM"."WHSMTABLE" MODIFY ("TABLENO" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHSMTABLE" MODIFY ("TITLE" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHSMTABLE" MODIFY ("TABLEDATE" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHSMTABLE" MODIFY ("CONTENT" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHSMTABLE" MODIFY ("MOVIE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table WHT_MENU
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."WHT_MENU" MODIFY ("MENU_ID" NOT NULL ENABLE);
 
  ALTER TABLE "SYSTEM"."WHT_MENU" ADD CONSTRAINT "WHT_MENU_PK" PRIMARY KEY ("MENU_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
