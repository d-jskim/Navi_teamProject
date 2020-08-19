--update goods
UPDATE empty_goods
	SET goods_name ='aaaa',
		goods_image ='puppy.jpg',
		goods_category ='aaaa',
		goods_price =1234,
		empty_date = '2020-01-01',
		empty_reason ='aaaa',
		empty_way = 'aaaa',
		memo ='aaaa'
WHERE goods_no = 42;


-- D-day 확인 (WHERE문에서는 별칭 d_day가 적용이 안 됨 -> 계산식 그대로 넣어줌)
SELECT (TO_DATE(empty_date, 'YYYY-MM-DD') - TO_DATE(sysdate, 'YYYY-MM-DD')) AS d_day
FROM empty_goods
WHERE (TO_DATE(empty_date, 'YYYY-MM-DD') - TO_DATE(sysdate, 'YYYY-MM-DD')) > 0
ORDER BY d_day;
------------------------프로시저 추가------------------------------------------
--Goods 레코드 1개 검색
CREATE OR REPLACE PROCEDURE selectGoods(G_NO IN empty_goods.goods_no%type,
										VO_RES OUT SYS_REFCURSOR)
AS
BEGIN
	open VO_RES for
	SELECT * FROM empty_goods WHERE goods_no = G_NO;
END;
/
--실행
SQL> var res refcursor;
SQL> exec selectGoods(1, :res)
SQL> print res

--Goods 삽입
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

SQL> exec insertGoods('test_name', 'test_image', 'test_category', 55555, '2020-01-01', 'test_reason', 'test_way', 'test_memo', 2)


--삽입 후 최신데이터 가져오기

CREATE OR REPLACE PROCEDURE selectRecentGoods(M_NO_V IN empty_goods.member_no%type,
											  VO_RECENT OUT SYS_REFCURSOR)
AS
BEGIN
	open VO_RECENT for
	SELECT * FROM (select * from empty_goods where member_no = M_NO_V order by goods_no desc) WHERE rownum = 1;
END;
/

--삽입 후 최신데이터 가져오기02 (다른 방법)
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





SQL> var res refcursor;
SQL> exec selectRecentGoods(2, :res);
SQL> print res;

--데이터 확인
SELECT * FROM (select * from empty_goods where member_no = 2 order by goods_no desc) WHERE rownum = 1;
