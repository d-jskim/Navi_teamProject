-- 1. 좋아요 호출
create or replace procedure SELECTALLLIKES(P_GOODS_NO in likes.goods_no%type,
																					SELECTALLLIKES_RES out SYS_REFCURSOR)
as
begin
	open SELECTALLLIKES_RES for
	select l.goods_no, l.member_no, m.username
	from  likes l, member m
	where l.member_no = m.member_no
	and goods_no = P_GOODS_NO
	order by l.member_no;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTALLLIKES(4, :res);
print res;

-- 2. 좋아요 입력 
create or replace procedure DOLIKE(P_GOODS_NO in likes.goods_no%type,
																	P_MEMBER_NO in likes.member_no%type)
as
begin
	insert into likes(goods_no, member_no)
	values(P_GOODS_NO, P_MEMBER_NO);
end;
/

-- 3. 좋아요 삭제
create or replace procedure DOUNLIKE(P_GOODS_NO in likes.goods_no%type,
																	P_MEMBER_NO in likes.member_no%type)
as
begin
	delete likes where goods_no = P_GOODS_NO and member_no = P_MEMBER_NO;
end;
/

