create table solo_ex(
    seq number,
    artistName varchar2(300),
    titleName varchar2(1000),
    ex_date varchar2(500),
    main_img varchar2(4000),
    intro_img varchar2(1000),
    intro_content varchar2(4000),
    works_img varchar2(4000),
    cv_school varchar2(1000),
    cv_solo varchar2(2000),
    cv_group varchar2(4000),
    cv_award varchar2(2000),
    cv_collection varchar2(2000)
);

drop table solo_ex;
delete solo_ex where seq=4;

-- 시퀀스 객체 생성
create sequence seq_solo_ex nocache nocycle;

-- 시퀀스 객체 삭제
drop sequence seq_solo_ex;

select * from solo_ex;
select * from solo_ex where seq=4;
-- seq 번호를 꼭 수정해야함. 데이터 저장 후 아래 update 명령어 반드시 실행
update solo_ex set seq=12 where titleName='관觀 Contemplation';
update solo_ex set seq=13 where titleName='sf.lu.p.t';
update solo_ex set seq=15 where titleName='HEART OF GOLD';
update solo_ex set seq=4 where titleName='Garden of Light';
update solo_ex set seq=7 where titleName='The Gathering, Bystanders';
update solo_ex set seq=5 where ex_date='June 10 - July 29, 2021';
update solo_ex set seq=8 where titleName='Manière-noir : Royal Blue';
update solo_ex set seq=9 where titleName='Look Into';
update solo_ex set seq=10 where titleName='Third Time Lucky';
update solo_ex set seq=6 where titleName='Eye to Eye';
commit;