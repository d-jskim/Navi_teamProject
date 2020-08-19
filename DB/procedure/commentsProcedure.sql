-- 1. 댓글 호출
create or replace procedure SELECTALLCOMMENTS(P_GOODS_NO in comments.goods_no%type,
																					SELECTALLCOMMENTS_RES out SYS_REFCURSOR)
as
begin
	open SELECTALLCOMMENTS_RES for
	select c.comments_no, c.goods_no, c.member_no, c.contents, TO_CHAR(c.comments_date, 'yyyy-MM-dd') as "COMMENTS_DATE", 
	TO_CHAR(c.updated_date, 'yyyy-MM-dd') as "UPDATED_DATE", c.comments_level
	, m.member_image, m.username
	from comments c, member m
	where c.member_no = m.member_no and goods_no = P_GOODS_NO
	order by comments_no;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTALLCOMMENTS(5, :res);
print res;

-- 2. 댓글 입력 
create or replace procedure DOCOMMENT(P_GOODS_NO in comments.goods_no%type,
																	P_MEMBER_NO in comments.member_no%type,
																	P_CONTENTS in comments.contents%type,
																	P_COMMENTS_LEVEL in comments.comments_level%type)
as
begin
	insert into comments(comments_no, goods_no, member_no, contents, comments_date, comments_level)
	values(comments_seq.nextval, P_GOODS_NO, P_MEMBER_NO, P_CONTENTS, sysdate, P_COMMENTS_LEVEL);
end;
/

-- 3. 댓글 삭제
create or replace procedure DELETECOMMENT(P_COMMENTS_NO in comments.comments_no%type)
as
begin
	delete comments where comments_no = P_COMMENTS_NO;
end;
/

