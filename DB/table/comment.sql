-- 시퀀스 삭제
drop sequence comments_seq;
-- 시퀀스 생성
create sequence comments_seq increment by 1 start with 1;
-- 댓글 테이블 삭제
drop table comments;
-- 댓글 테이블
create table comments(
	comments_no number(5) primary key,
	goods_no number(5) not null,
	member_no number(5) not null,
	contents varchar2(200),
	comments_date date not null,
	updated_date date,
	comments_level number(5) default 1,
	constraint fk_member_no_in_comment foreign key(member_no) references member(member_no),
	constraint fk_goods_no_in_comment foreign key(goods_no) references empty_goods(goods_no)
);
-- 샘플 데이터
insert into comments(comments_no, goods_no, member_no, contents, comments_date, comments_level)
values(comments_seq.nextval, 5, 1, '댓글01', sysdate, 1);
insert into comments(comments_no, goods_no, member_no, contents, comments_date, comments_level)
values(comments_seq.nextval, 5, 2, '댓글02', sysdate, 1);
insert into comments(comments_no, goods_no, member_no, contents, comments_date, comments_level)
values(comments_seq.nextval, 5, 1, '댓글02_01', sysdate, 1);
insert into comments(comments_no, goods_no, member_no, contents, comments_date, comments_level)
values(comments_seq.nextval, 5, 2, '댓글02_02', sysdate, 1);

update comments set comments_level = 1;

-- 데이터 확인
select * from comments order by comments_no;
-- 데이터 삭제
delete from 