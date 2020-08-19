-- ������ ����
drop sequence grade_seq;

-- ������ ����
create sequence grade_seq increment by 1 start with 1;

-- ȸ����� ���̺� ����
drop table grade cascade constraints;

-- member_grade ���̺� ����
create table grade (
	member_no number(5),
	grade varchar2(20) default '새싹' not null,
	empty_point number(5) default 0,
    share_point number(5) default 0,
    constraint fk2_member_no foreign key(member_no) references member(member_no)
);

-- ������ Ȯ��
select * from grade;

-- ������ �Է�
delete grade where member_no = 3;
-- 3번 없으면 아래 두개만 실행

insert into grade (member_no, empty_point, share_point)
values(1, 500, 500);
insert into grade (member_no, empty_point, share_point)
values(2, 20, 10);
insert into grade (member_no, empty_point, share_point)
values(3, 20, 10);


--  UserProfile�� ���� Į���� (outer join)
select m.member_no, m.username, g.grade, m.member_image, g.empty_point, 
g.share_point, g.num_likes 
from grade g
left outer join member m on g.member_no = m.member_no
where g.member_no = 2;

-- ȸ�� ���� �˻� ���ν���
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


-- ȸ����� ������Ʈ��
UPDATE GRADE
SET GRADE = CASE
WHEN (share_point + empty_point BETWEEN 0 AND 100) THEN '새싹'
WHEN (share_point + empty_point BETWEEN 101 AND 200) THEN '나무'
WHEN (share_point + empty_point > 200) THEN '숲'
END;

-- ������ Ȯ��
SELECT * FROM GRADE


-- member_grade�� ������ �� ����Ʈ�� DB�� �ֱ� ���� ���ν���
CREATE OR REPLACE PROCEDURE ex_proc
IS
	
BEGIN
	
END;

-- member_grade �������� : empty_point + share_point ���� ���� 
-- 0 �̻� 500 �̸� ����, 500 �̻� 1000 �̸� ����, 1000 �̻���� ��

-- Ʈ���� ����
-- After Ʈ���� �߻� ���� : ����Ʈ �Խ�, �����ϱ� �Ϸ� , ���ƿ並 �ٸ� ����ڿ��� ���� ���
-- ��� ����Ʈ : ����Ʈ 1�� �ø� ������ +50, ����Ʈ�� ���ؼ� ���ƿ並 ���� ������ + 100
-- ���� ����Ʈ : ���� �ŷ��� ����� ������ + 100

-- ����Ʈ ������Ʈ Ʈ���� ����
create trigger UpdatePoint after insert on member_grade for each row
begin set new.total_point = empty_point;


-- ** empty, share ����Ʈ�� ���� ������Ʈ�ϰ�, ���߿� BIZ���� ��ģ��


-- ȸ����� ������Ʈ Ʈ���� ����
create trigger UpdateGrade before insert on member_grade for each row
begin set new.total_point = empty_point + share_point;


-- �Խñ� ���ε� ��¥, ���� ��¥ & ��� ��¥ sysdate date default sysdate
-- constraint fk_member_image foreign key(member_image) references member(member_image)

-- ������ Ȯ��
select * from member_grade;

-- ȸ����� ������Ʈ Ʈ����
CREATE OR REPLACE TRIGGER EX_PROC(
	
)
AFTER INSERT
ON ORDERS
FOR EACH ROW	
BEGIN
  SELECT ORDER.SEQ.nextval into :new.o_seq from dual
END EX_PROC;


--empty, share point �� �� ������Ʈ
 


