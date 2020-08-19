-- 시퀀스 삭제
drop sequence empty_goods_seq;
-- 시퀀스 생성
create sequence empty_goods_seq increment by 1 start with 1;
-- 게시글 테이블 삭제
drop table empty_goods;
-- 게시글 테이블 (번호, 제목, 파일이름, 작성자, 주소, 생성일)
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
	constraint fk_member_no foreign key(member_no) references member(member_no)
);
-- 샘플 데이터 추가
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, 'sample01', 'sample01.jpg', '디지털/가전', 10000, to_date('2020-08-10', 'yyyy-mm-dd'),
'미니멀리스트가 되기 위해', '나눔', '메모01', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, 'sample02', 'sample02.jpg', '디지털/가전', 20000, to_date('2020-08-10', 'yyyy-mm-dd'),
'미니멀리스트가 되기 위해', '나눔', '메모02', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, 'sample03', 'sample03.jpg', '디지털/가전', 30000, to_date('2020-08-10', 'yyyy-mm-dd'),
'미니멀리스트가 되기 위해', '나눔', '메모03', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, 'sample04', 'sample04.jpg', '디지털/가전', 40000, to_date('2020-08-10', 'yyyy-mm-dd'),
'미니멀리스트가 되기 위해', '나눔', '메모04', 2);
insert into empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date,
empty_reason, empty_way, memo, member_no)
values(empty_goods_seq.nextval, 'sample05', 'sample05.jpg', '디지털/가전', 40000, to_date('2020-08-08', 'yyyy-mm-dd'),
'미니멀리스트가 되기 위해', '비움', '메모05', 1);
-- 사용자가 업로드한 전체 사진 (확인용으로 member_no = 1)
select * from empty_goods where member_no = 2;
select * from empty_goods where member_no = 1;
-- 최신 데이터 1개 레코드 가져오기 (member_no가 1인 경우)
select * from (select * from empty_goods where member_no = 2 order by goods_no desc) where rownum = 1;
-- 데이터 확인
select * from empty_goods order by goods_no;
-- 데이터 삭제
delete from empty_goods where goods_name = 'sample';