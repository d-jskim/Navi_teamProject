-- drop sequence member_seq;
create sequence member_seq increment by 1 start with 1;
-- drop table member;
create table member(
	member_no number(5) primary key,
	email varchar2(30) not null unique,
	password varchar2(30) not null,
	username varchar2(20) not null unique,
	name varchar2(20) not null,
	birthdate date not null,
	address varchar2(70) not null,
	gender varchar2(10) not null,
	member_image varchar2(40),
	join_date date default sysdate
);
insert into member(member_no, email, password, username, name, birthdate, address, gender)
values(member_seq.nextval, 'admin@gmail.com', '1234', 'admin', '관리자', to_date('1999-12-31', 'yyyy-mm-dd'), '서울시 서초구', 'male');
insert into member(member_no, email, password, username, name, birthdate, address, gender)
values(member_seq.nextval, 'mini@gmail.com', '1234', 'user', '사용자', to_date('1996-12-25', 'yyyy-mm-dd'), '서울시 구로구', 'male');
insert into member(member_no, email, password, username, name, birthdate, address, gender)
values(member_seq.nextval, 'jane@gmail.com', '1234', 'jane', 'Jane', to_date('1992-06-01', 'yyyy-mm-dd'), '서울시 서초구', 'female');
-- select * from member;
-- drop sequence empty_goods_seq;
create sequence empty_goods_seq increment by 1 start with 1;
-- drop table empty_goods;
create table empty_goods(
	goods_no number(5) primary key,
	goods_name varchar2(40) not null,
	goods_image varchar2(40) not null,
	goods_category varchar2(50) not null,
	goods_price number(7) not null,
	empty_date date not null,
	empty_reason varchar2(100) not null,
	empty_way varchar2(100) not null,
	memo varchar2(500) not null,
	post_date date default sysdate,
	member_no number(5),
	constraint fk_member_no foreign key(member_no) references member(member_no) on delete cascade
);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '커피잔', 'cup.jpg', '생활/가공식품', 20000, to_date('2020-08-10', 'yyyy-mm-dd'),
'커피잔이 너무 많아서', '나눔', '5년 전에 집들이 선물로 친구에게서 받았다. 고마운 마음만 간직하고 보내야지.', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '의자', 'brokenChair.jpg', '가구/인테리어', 50000, to_date('2020-08-11', 'yyyy-mm-dd'),
'의자 다리가 부러져서', '처분', '화이트 색상이라 더러워지지 않게 조심해서 썼는데 망가져서 버릴 수 밖에 없다.', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '스탠드 조명', 'floorLamp.jpg', '디지털/가전', 70000, to_date('2020-08-12', 'yyyy-mm-dd'),
'생각보다 잘 사용하지 않음', '나눔', '동생이 자취방에서 사용한다길래 주기로 함.', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '잡지', 'magazine.jpg', '도서/티켓/음반', 12000, to_date('2020-08-14', 'yyyy-mm-dd'),
'샀을 때만 재밌게 보고 다시 보지 않음', '처분', '이제 잡지 구독도 끊어야지.', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '여름옷', 'clothes.jpg', '남성패션/잡화', 90000, to_date('2020-08-15', 'yyyy-mm-dd'),
'스타일이 변해서 잘 안 입는 옷들', '기부', '세탁 후 잘 포장해서 아름다운 가게에 기부함', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '가을옷', 'clothesFemale.jpg', '여성의류', 120000, to_date('2020-08-11', 'yyyy-mm-dd'),
'잘 안 입어서', '처분', '낡아서 헌옷수거함에 넣었음', 3);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '원피스', 'dress.jpg', '여성의류', 70000, to_date('2020-08-11', 'yyyy-mm-dd'),
'사이즈가 작아짐', '기부', '아름다운 가게에 기부', 3);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '물감', 'paintTools.jpg', '기타 중고물품', 30000, to_date('2020-08-13', 'yyyy-mm-dd'),
'몇 개월 동안 사용하지 않음', '처분', '컬러링 유행할 때 사서 좀 하다가 바빠져서 안 하게 됨.', 3);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '외국 동전', 'foreignCoins.jpg', '기타 중고물품', 2000, to_date('2020-08-14', 'yyyy-mm-dd'),
'코로나때문에 외국 여행 못하고 자리만 차지해서', '기부', '다음에는 현지에서 다 쓰고 와야지.', 3);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '니트', 'knit.jpg', '기타 중고물품', 55000, to_date('2020-08-14', 'yyyy-mm-dd'),
'보풀이 많이 생겨서', '기부', '세탁법을 좀 알아봐야지.', 3);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, '무선이어폰', 'earphone.jpg', '디지털/가전', 70000, to_date('2020-08-15', 'yyyy-mm-dd'),
'고장나서', '처분', '드디어 에어팟을 살 때가 왔다ㅋㅋ.', 3);
-- select * from empty_goods;
-- drop sequence grade_seq;
create sequence grade_seq increment by 1 start with 1;
-- drop table grade;
create table grade (
	member_no number(5),
	grade varchar2(20) default '새싹' not null,
	empty_point number(5) default 0,
    share_point number(5) default 0,
    constraint fk2_member_no foreign key(member_no) references member(member_no) on delete cascade
);
insert into grade (member_no, empty_point, share_point)
values(1, 500, 500);
insert into grade (member_no, empty_point, share_point)
values(2, 20, 10);
insert into grade (member_no, empty_point, share_point)
values(3, 20, 10);
UPDATE GRADE
SET GRADE = CASE
WHEN (share_point + empty_point BETWEEN 0 AND 100) THEN '새싹'
WHEN (share_point + empty_point BETWEEN 101 AND 200) THEN '나무'
WHEN (share_point + empty_point > 200) THEN '숲'
END;
-- select * from grade;
-- drop table sharing CASCADE CONSTRAINTS;
create table sharing(
	goods_no number(5) CONSTRAINT share_gno_fk REFERENCES empty_goods(goods_no),
	member_no number(5) CONSTRAINT share_mno_fk REFERENCES member(member_no),
	status varchar2(20) default '나눔중',
	share_date date default sysdate	
);
-- drop table likes;
create table likes(
	goods_no number(5),
	member_no number(5),
	constraint fk_member_no_in_likes foreign key(member_no) references member(member_no) on delete no action,
	constraint fk_goods_no_in_likes foreign key(goods_no) references empty_goods(goods_no) on delete no action
);
-- drop sequence comments_seq;
create sequence comments_seq increment by 1 start with 1;
-- drop table comments;
create table comments(
	comments_no number(5) primary key,
	goods_no number(5) not null,
	member_no number(5) not null,
	contents varchar2(200),
	comments_date date not null,
	updated_date date,
	comments_level number(5) default 1,
	constraint fk_member_no_in_comment foreign key(member_no) references member(member_no) on delete no action,
	constraint fk_goods_no_in_comment foreign key(goods_no) references empty_goods(goods_no) on delete no action
);

commit;
