-- 1. 게시판 호출 (where 절에서 서브쿼리 두개 in 연산자 안에)
create or replace procedure SELECTALLGOODS(SELECTALLGOODS_RES out SYS_REFCURSOR)
as
begin
		open SELECTALLGOODS_RES for
		select g.goods_no, g.goods_name, g.goods_image, g.goods_category, g.goods_price, TO_CHAR(g.empty_date, 'yyyy-MM-dd') as "EMPTY_DATE", g.empty_reason, g.empty_way, g.memo, TO_CHAR(g.post_date, 'yyyy-MM-dd') "POST_DATE", g.member_no , 
		(select 0 from dual) as "LIKES_COUNT",
		(select 0 from dual) as "COMMENTS_COUNT"
		from empty_goods g
		order by g.goods_no desc;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTALLGOODS(:res);
print res;

-- 2. 세부정보 호출
create or replace procedure SELECTONEGOODS(P_GOODS_NO in empty_goods.goods_no%type,
																			SELECTONEGOODS_RES out SYS_REFCURSOR)
as
begin
		open SELECTONEGOODS_RES for
		select goods_no, goods_name, goods_image, goods_category, goods_price, TO_CHAR(empty_date, 'yyyy-MM-dd') as "EMPTY_DATE", empty_reason, empty_way, memo, TO_CHAR(post_date, 'yyyy-MM-dd') "POST_DATE", member_no
		from empty_goods
		where goods_no = P_GOODS_NO;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTONEGOODS(1, :res);
print res;

