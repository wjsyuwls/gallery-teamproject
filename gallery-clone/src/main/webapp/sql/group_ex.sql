create table group_ex(
    seq number,
    titleName varchar2(1000),
    ex_date varchar2(1000),
    artistName varchar2(1000),
    main_img varchar2(4000),
    intro_img varchar2(1000),
    intro_content varchar2(4000)
);
insert into group_ex values(seq_group_ex.nextval,'','','','','','');
drop table group_ex purge;
delete group_ex where seq=1;

-- 시퀀스 객체 생성
create sequence seq_group_ex nocache nocycle;

-- 시퀀스 객체 삭제
drop sequence seq_group_ex;


select * from group_ex;
-- db 등록후 아래 update 명령어 반드시 실행 seq 정보 업뎃
update group_ex set seq=1 where titleName='The Hidden Masterpiece';
update group_ex set seq=2 where titleName='Utopia: now here';
update group_ex set seq=3 where titleName='Painting and Thereafter';
update group_ex set seq=11 where titleName='DECONSTRUCTIVISM';
update group_ex set seq=14 where titleName='《북경춘신》 北京春信';

commit;