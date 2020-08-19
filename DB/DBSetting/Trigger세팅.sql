-- emtpy_goods 테이블에서 데이터 삭제 시 Sharing테이블에서도 삭제
create or replace trigger tg_del_goods
after delete
on empty_goods
for each row
begin
	delete from sharing where sharing.goods_no=:old.goods_no;
end;
/
-- 회원가입 시(member 테이블 데이터 삽입 시) grade 테이블 삽입  
create or replace trigger tg_insert_grade
after insert on member
for each row
begin
	insert into grade(member_no) values(:new.member_no);
end;
/

-- empty_goods에 글 등록 시 empty_point 30점 추가
create or replace trigger tg_update_e_point
after insert on empty_goods
for each row
begin
update grade set empty_point = empty_point + 30 where member_no = :new.member_no;
end;
/

--Sharing 테이블에서 status='나눔완료'일 경우 share_point 10점 추가
create or replace trigger tg_update_sh_point
after update of status on sharing
for each row
when(new.status = '나눔완료')
begin
update grade set share_point = share_point + 10 where member_no = :old.member_no;
end;
/