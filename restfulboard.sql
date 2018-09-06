drop SEQUENCE seq_article;
drop SEQUENCE seq_board;
drop SEQUENCE seq_comment;
drop SEQUENCE seq_user;

drop table t_board cascade constraints;
drop table t_article cascade constraints;
drop table t_comment cascade constraints;
drop table t_user cascade constraints; 

Create SEQUENCE seq_article nocache;
Create SEQUENCE seq_board INCREMENT BY 10 START WITH 100 nocache;
Create SEQUENCE seq_comment nocache;
Create SEQUENCE seq_user nocache;

CREATE TABLE t_user
(
	usr_no number NOT NULL,
	usr_id varchar2(20) NOT NULL UNIQUE,
	usr_pw varchar2(128) NOT NULL,
	usr_name varchar2(30) NOT null,
	usr_info varchar2(1000),
	usr_level number(1) default 1 not null,
	usr_status number(1) default 0 not null,
	usr_regdate date default sysdate not null,
	usr_lastlogin date default sysdate not null,
	usr_logcnt number(7) default 0 not null,
	usr_ip varchar2(35),
	usr_zipcode varchar2(7),
	usr_address varchar2(100),
	usr_address_detail varchar2(60),
	PRIMARY KEY (usr_no)
); 

CREATE TABLE t_board
(
	boa_no number not null,
	boa_name varchar2(20) not null,
	boa_status number(1) default 1 not null,
	usr_no number not null,
	primary key (boa_no)
);



CREATE TABLE t_article
(
   art_no number NOT NULL,
   art_title varchar2(200) NOT NULL,
   art_content varchar2(4000) NOT NULL,
   art_like number(5) DEFAULT 0 NOT NULL,
   art_dislike number(5) DEFAULT 0 NOT NULL,
   art_regdate date DEFAULT sysdate NOT NULL,
   art_readcnt number(5) DEFAULT 0 NOT NULL,
   art_com_cnt number(4) DEFAULT 0 NOT NULL,
   art_ip varchar2(35),
   usr_no number NOT NULL,
   boa_no number NOT NULL,
   PRIMARY KEY (art_no)
);

create table t_comment
(
	com_no number not null,
	com_content varchar2(1000) not null,
	com_regdate date default sysdate not null,
	com_like number(5) default 0 not null, 
	com_dislike number(5) default 0 not null, 
	com_ip varchar2(35),
	art_no number not null,
	usr_no number not null,
	primary key (com_no)
);

ALTER TABLE t_comment
   ADD FOREIGN KEY (art_no)
   REFERENCES t_article (art_no)
;


ALTER TABLE t_article
   ADD FOREIGN KEY (boa_no)
   REFERENCES t_board (boa_no)
;


ALTER TABLE t_article
   ADD FOREIGN KEY (usr_no)
   REFERENCES t_user (usr_no)
;


ALTER TABLE t_board
   ADD FOREIGN KEY (usr_no)
   REFERENCES t_user (usr_no)
;


ALTER TABLE t_comment
   ADD FOREIGN KEY (usr_no)
   REFERENCES t_user (usr_no)
;
	
	
/* Create Records*/
insert into t_user(usr_no, usr_id, usr_pw, usr_name, usr_info)
values(seq_user.nextval, 'next','비밀번호','신해철','쵝오의 뮤지션');
insert into t_user(usr_no, usr_id, usr_pw, usr_name, usr_info) values(seq_user.nextval, 'taiji', '비밀번호','서태지','굿 뮤지션'); 
 
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, '자유 게시판', 1);
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, '공지 사항', 2);
insert into t_board(boa_no, boa_name, usr_no) values(seq_board.nextval, 'Q&A 게시판', 1);

commit

update t_user set usr_pw = '150a14ed5bea6cc731cf86c41566ac427a8db48ef1b9fd626664b3bfbb99071fa4c922f33dde38719b8c8354e2b7ab9d77e0e67fc12843920a712e73d558e197';

select * from t_board;
select * from t_user;

select b.boa_no, b.boa_name, 
       u.usr_no as "userVO.usr_no",
       u.usr_id as "userVO.usr_id", 
       u.usr_name as "userVO.usr_name"
from   t_board b inner join T_USER u
on     b.usr_no = u.usr_no
where  b.boa_status = 1
order  by b.boa_name asc;

select a.art_no, a.art_title, a.art_content, a.art_like, a.art_dislike, a.art_regdate, a.art_readcnt, a.art_com_cnt, a.art_ip, a.boa_no, u.usr_no as "userVO.usr_no", u.usr_name as "userVO.usr_name", u.usr_id as "userVO.usr_id"
   from t_article a inner join t_user u
   on a.usr_no = u.usr_no
   where a.art_no = 2
   order by a.art_no desc

select usr_name, usr_id, usr_level, usr_status
from T_USER
where usr_id='next' and usr_pw = '150a14ed5bea6cc731cf86c41566ac427a8db48ef1b9fd626664b3bfbb99071fa4c922f33dde38719b8c8354e2b7ab9d77e0e67fc12843920a712e73d558e197'

select * from t_article;

update from T_ARTICLE set art_content = #{art_content}
where art_no = #{art_no}


update from T_ARTICLE set art_tilte = '첫글', art_content = 'ㅁㄴㅇㄹ'
	where art_no = 1 and usr_no = 2