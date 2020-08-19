-- SYS 접속
connect sys/admin1234 as sysdba;
-- 계정 생성
create user navi identified by admin1234;
-- 계정 권한 설정
grant connect, resource, unlimited tablespace to navi identified by admin1234;
alter user navi default tablespace users;
alter user navi temporary tablespace temp;
-- 계정 접속
connect navi/admin1234;