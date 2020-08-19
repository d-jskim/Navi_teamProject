-- 좋아요 테이블 삭제
drop table likes;
-- 좋아요 테이블
create table likes(
	goods_no number(5),
	member_no number(5),
	constraint fk_member_no_in_likes foreign key(member_no) references member(member_no),
	constraint fk_goods_no_in_likes foreign key(goods_no) references empty_goods(goods_no)
);
-- 샘플 데이터 추가
insert into likes(goods_no, member_no) values(1, 1);
insert into likes(goods_no, member_no) values(1, 2);
insert into likes(goods_no, member_no) values(4, 1);
insert into likes(goods_no, member_no) values(4, 2);
insert into likes(goods_no, member_no) values(4, 14);
insert into likes(goods_no, member_no) values(4, 15);
-- 데이터 확인
select * from likes;
-- 첫 번째 게시글의 좋아요 개수 확인
select goods_no, count(*) from likes group by goods_no having goods_no = 1;
-- 데이터 삭제

