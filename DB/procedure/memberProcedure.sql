-- 1. 관리자 게시판 호출
create or replace procedure SELECTALLMEMBER(SELECTALLMEMBER_RES out SYS_REFCURSOR)
as
begin
		open SELECTALLMEMBER_RES for
		select member_no, email, password, username, name, TO_CHAR(birthdate, 'yyyy-MM-dd') AS "BIRTHDATE", address, gender, member_image, TO_CHAR(join_date, 'yyyy-MM-dd') AS "JOIN_DATE"
		from member;
end;
/

-- 1) 테스트
var res refcursor;
exec SELECTALLMEMBER(:res);
print res;

-- 2. 회원가입 프로시저 호출
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

-- 2) 테스트
var res refcursor;
exec SIGNUP('mini2@gmail.com', '1234', 'user2', '사용자2', '1996-12-25', '서울시 구로구', 'male', :res);
print res;

select * from member;

-- 3. 회원탈퇴 프로시저 호출
create or replace procedure DODELETE(P_MEMBER_NO in member.member_no%type,
															DODELETE_RES out PLS_INTEGER)
as
begin
		delete from member where member_no = P_MEMBER_NO;
		commit;
		DODELETE_RES:=SQL%ROWCOUNT;
		DBMS_OUTPUT.PUT_LINE(DODELETE_RES);
end;
/

-- 3) 테스트
var res number(10);
exec DODELETE(19, :res);
print res;