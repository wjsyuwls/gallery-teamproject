-- 그룹전시 이미지
create table group_ex_img(
    seq number,
    group_img varchar2(4000)
);
-- 시퀀스 객체 생성
create sequence seq_group_ex_img nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_group_ex_img;
drop table group_ex_img purge;
--인덱스뷰
select * from
(select rownum rn, tt.* from
(select * from group_ex_img order by seq desc) tt)
where rn>=1 and rn<=5;


insert into group_ex_img values(seq_group_ex_img.nextval,'');
select * from group_ex_img;
delete group_ex_img where seq=1;
select img from group_ex_img;
commit;