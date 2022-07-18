---------------------------------------------------------------------
-- galleries
create table galleries(
    about varchar2(4000),
    internship varchar2(4000)
);

insert into galleries values (null, '');

drop table galleries purge;

update galleries set internship='' where about is null;

select about from galleries where internship is null;

select internship from galleries where about is null;

select * from galleries;

commit;



-- contact
create table contact(
    name varchar2(50),
    email varchar2(200),
    message varchar2(2000),
    logDate date
);

-- 2) 테이블 삭제
drop table contact purge;

-- 3) 테이블 확인
select * from tab;

-- 4) C : insert 데이터 저장
insert into contact values ('홍길동', 'hong@naver.com', '번창하세요', SYSDATE);

-- 5) R : select 검색
select * from contact;
select * from contact order by logdate asc;
select * from contact where name='홍길동';

---------------------------------------------------------------------