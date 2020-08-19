-- 게시글 테이블 삭제
drop table sharing CASCADE CONSTRAINTS;
-- 게시글 테이블 (번호, 제목, 파일이름, 작성자, 주소, 생성일)
create table sharing(
	goods_no number(5) CONSTRAINT share_gno_fk REFERENCES empty_goods(goods_no),
	member_no number(5) CONSTRAINT share_mno_fk REFERENCES member(member_no),
	status varchar2(20) default '나눔중',
	share_date date default sysdate	
);
select * from empty_goods
select * from empty_goods where member_no = 2;
select * from sharing
select * from sharing where goods_no = 95;
-- D-day 확인 (WHERE문에서는 별칭 d_day가 적용이 안 됨 -> 계산식 그대로 넣어줌)
SELECT (TO_DATE(empty_date, 'YYYY-MM-DD') - TO_DATE(sysdate, 'YYYY-MM-DD')) AS d_day
FROM empty_goods
WHERE (TO_DATE(empty_date, 'YYYY-MM-DD') - TO_DATE(sysdate, 'YYYY-MM-DD')) > 0
ORDER BY d_day;
-- update status
UPDATE sharing
	SET status = 'share'
WHERE goods_no = 95