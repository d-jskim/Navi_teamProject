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
create or replace procedure SELECTALLMEMBER(SELECTALLMEMBER_RES out SYS_REFCURSOR)
as
begin
		open SELECTALLMEMBER_RES for
		select member_no, email, password, username, name, TO_CHAR(birthdate, 'yyyy-MM-dd') AS "BIRTHDATE", address, gender, member_image, TO_CHAR(join_date, 'yyyy-MM-dd') AS "JOIN_DATE"
		from member;
end;
/
create or replace procedure DOSIGNUP(P_EMAIL in member.email%type,
															P_PASSWORD in member.password%type,
															P_USERNAME in member.username%type,
															P_NAME in member.name%type,
															P_BIRTHDATE in VARCHAR2,
															P_ADDRESS in member.address%type,
															P_GENDER in member.gender%type,
															DOSIGNUP_RES out SYS_REFCURSOR)
as
begin
		insert into member(member_no, email, password, username, name, birthdate, address, gender) 
		values(member_seq.nextval, P_EMAIL, P_PASSWORD, P_USERNAME, P_NAME, TO_DATE(P_BIRTHDATE, 'yyyy-MM-dd'), P_ADDRESS, P_GENDER);
		commit;
		open DOSIGNUP_RES for
		select member_no, email, password, username, name, TO_CHAR(birthdate, 'yyyy-MM-dd') AS "BIRTHDATE", address, gender, member_image, TO_CHAR(join_date, 'yyyy-MM-dd') AS "JOIN_DATE"
		from member where EMAIL = P_EMAIL and password = P_PASSWORD;
end;
/
create or replace procedure DODELETE(P_MEMBER_NO in member.member_no%type)
as
begin
		delete from member where member_no = P_MEMBER_NO;
		commit;
end;
/
CREATE OR REPLACE PROCEDURE selectGoods(G_NO IN empty_goods.goods_no%type,
										VO_RES OUT SYS_REFCURSOR)
AS
BEGIN
	open VO_RES for
	SELECT * FROM empty_goods WHERE goods_no = G_NO;
END;
/
CREATE OR REPLACE PROCEDURE insertGoods(
										G_NAME IN empty_goods.goods_name%type,
										G_IMAGE IN empty_goods.goods_image%type,
										G_CATEGORY IN empty_goods.goods_category%type,
										G_PRICE IN empty_goods.goods_price%type,
										E_DATE IN empty_goods.empty_date%type,
										E_REASON IN empty_goods.empty_reason%type,
										E_WAY IN empty_goods.empty_way%type,
										MEMO IN empty_goods.memo%type,
										M_NO IN empty_goods.member_no%type
										)
AS
BEGIN
	INSERT INTO empty_goods(goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, 
							empty_reason, empty_way, memo, post_date, member_no)
					 VALUES(empty_goods_seq.nextval, G_NAME, G_IMAGE, G_CATEGORY, G_PRICE, E_DATE, 
							E_REASON, E_WAY, MEMO, sysdate, M_NO);
END;
/
CREATE OR REPLACE PROCEDURE selectRecentGoods(M_NO_V IN empty_goods.member_no%type,
											  VO_RECENT OUT SYS_REFCURSOR)
AS
BEGIN
	open VO_RECENT for
	SELECT * FROM (select * from empty_goods where member_no = M_NO_V order by goods_no desc) WHERE rownum = 1;
END;
/
CREATE OR REPLACE PROCEDURE selectRecentGoods02(M_NO_V IN empty_goods.member_no%type,
											  G_NO OUT empty_goods.goods_no%type,
											  G_NAME OUT empty_goods.goods_name%type,
											  G_IMAGE OUT empty_goods.goods_image%type,
											  G_CATEGORY OUT empty_goods.goods_category%type,
											  G_PRICE OUT empty_goods.goods_price%type,
											  E_DATE OUT empty_goods.empty_date%type,
											  E_REASON OUT empty_goods.empty_reason%type,
											  E_WAY OUT empty_goods.empty_way%type,
										 	  MEMO OUT empty_goods.memo%type,
										 	  P_DATE OUT empty_goods.post_date%type,
											  M_NO OUT empty_goods.member_no%type
											  )
AS
BEGIN
	SELECT goods_no, goods_name, goods_image, goods_category, goods_price, empty_date, 
			empty_reason, empty_way, memo, post_date, member_no  
	INTO G_NO, G_NAME, G_IMAGE, G_CATEGORY, G_PRICE, E_DATE, E_REASON, E_WAY, MEMO, P_DATE, M_NO 
	FROM (select * from empty_goods where member_no = M_NO_V order by goods_no desc) WHERE rownum = 1;
END;
/
CREATE OR REPLACE PROCEDURE FIND_GRADE(	P_MEMBER_NO in member.member_no%type,
   										G_RES OUT SYS_REFCURSOR)
AS  
BEGIN  
	OPEN G_RES FOR
	select m.member_no, m.username, g.grade, m.member_image, g.empty_point, 
	g.share_point 
	from grade g
	left outer join member m on g.member_no = m.member_no
	where g.member_no = P_MEMBER_NO; 
END;
/  
CREATE OR REPLACE PROCEDURE USERPROFILE
(
P_MEMBER_NO IN MEMBER.MEMBER_NO%TYPE,
VO_RES OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN VO_RES FOR
	SELECT member_no, email, password, username, name, birthdate, address, gender
	FROM MEMBER WHERE MEMBER_NO = P_MEMBER_NO;
END;
/
CREATE OR REPLACE PROCEDURE SELECTALL(VO_RES OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN VO_RES FOR
	SELECT MEMBER.member_no, MEMBER.username, MEMBER.name
	FROM MEMBER, EMPTY_GOODS;
END;
/
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
create or replace procedure DELETECOMMENT(P_COMMENTS_NO in comments.comments_no%type)
as
begin
	delete comments where comments_no = P_COMMENTS_NO;
end;
/
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
create or replace procedure DOLIKE(P_GOODS_NO in likes.goods_no%type,
																	P_MEMBER_NO in likes.member_no%type)
as
begin
	insert into likes(goods_no, member_no)
	values(P_GOODS_NO, P_MEMBER_NO);
end;
/
create or replace procedure DOUNLIKE(P_GOODS_NO in likes.goods_no%type,
																	P_MEMBER_NO in likes.member_no%type)
as
begin
	delete likes where goods_no = P_GOODS_NO and member_no = P_MEMBER_NO;
end;
/
CREATE OR REPLACE PROCEDURE FIND_GRADE(	P_MEMBER_NO in member.member_no%type,
   										G_RES OUT SYS_REFCURSOR)
AS
BEGIN
	OPEN G_RES FOR
	select m.member_no, m.username, g.grade, m.member_image, g.empty_point,
	g.share_point, g.num_likes
	from grade g
	left outer join member m on g.member_no = m.member_no
	where g.member_no = P_MEMBER_NO;
END;
/

commit;
