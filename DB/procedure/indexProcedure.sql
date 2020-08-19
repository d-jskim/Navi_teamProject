-- 1. 인덱스 내 게시판 호출
create or replace procedure SELECTALLINDEX(SELECTALLINDEX_RES out SYS_REFCURSOR)
as
begin
		open SELECTALLINDEX_RES for
		select * from (
		select distinct g.goods_no, g.goods_name, g.goods_image, g.goods_category, g.goods_price, TO_CHAR(g.empty_date, 'yyyy-MM-dd') as "EMPTY_DATE", g.empty_reason, g.empty_way, g.memo, TO_CHAR(g.post_date, 'yyyy-MM-dd') "POST_DATE", g.member_no , 
		(select 0 from dual) as "LIKES_COUNT",
		(select 0 from dual) as "COMMENTS_COUNT"
		from empty_goods g
		order by g.goods_no desc
		) where rownum <= 3;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTALLINDEX(:res);
print res;

