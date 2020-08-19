-- 시퀀스 삭제
drop sequence member_seq;
-- 시퀀스 생성
create sequence member_seq increment by 1 start with 1;
-- 회원 테이블 삭제
drop table member;
-- 회원 테이블 생성
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
-- 샘플데이터 입력 (관리자)
insert into member(member_no, email, password, username, name, birthdate, address, gender)
values(member_seq.nextval, 'admin@gmail.com', '1234', 'admin', '관리자', to_date('1999-12-31', 'yyyy-mm-dd'), '서울시 서초구', 'male');
-- 샘플데이터 입력 (사용자)
insert into member(member_no, email, password, username, name, birthdate, address, gender)
values(member_seq.nextval, 'mini@gmail.com', '1234', 'user', '사용자', to_date('1996-12-25', 'yyyy-mm-dd'), '서울시 구로구', 'male');
-- 데이터 확인
select * from member;
-- 데이터 삭제
delete from member;
