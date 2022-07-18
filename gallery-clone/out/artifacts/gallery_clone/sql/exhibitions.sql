create table exhibitions(
    seq number,
    ex_img varchar2(2000),
    ex_date varchar2(2000),
    ex_titleName varchar2(2000),
    ex_artistName varchar2(2000)
);
-- 4) 시퀀스 객체 생성
create sequence seq_exhibitions nocache nocycle;

-- 5) 시퀀스 객체 삭제
drop sequence seq_exhibitions;

-- 테이블 삭제
drop table exhibitions purge;

-- 데이터확인
select * from exhibitions;
-- 데이터입력
insert into exhibitions values(seq_exhibitions.nextval, 'd', '2018.07.05-2018,08.25','sf.lu.p.t','KIM Do Kyun');

select * from exhibitions order by ex_date desc;

select * from exhibitions where ex_date like '%2020%' or ex_date like '%2021%' or ex_date like '%2022%' order by ex_date desc;

select * from exhibitions where ex_date like '%2019%' or ex_date like '%2018%' or ex_date like '%2017%' order by ex_date desc;

select * from exhibitions where ex_date like '%2016%' or ex_date like '%2015%' or ex_date like '%2014%' order by ex_date desc;

select * from exhibitions where ex_date like '%2013%' or ex_date like '%2012%' or ex_date like '%2011%' order by ex_date desc;

-- 아래 명령어 수행해야함 크롤링 시 아래의 이미지만 깨져서 이미지를 불러올수없기때문
update exhibitions set ex_img='https://static.wixstatic.com/media/520ee6_752e42014abc42699096222c479177d9~mv2.jpg/v1/crop/x_0,y_2357,w_10630,h_10050/fill/w_224,h_209,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/%EA%B0%A4%EB%9F%AC%EB%A6%AC%EB%B9%84%EC%BC%80%EC%9D%B4%20%ED%98%84%EC%88%98%EB%A7%89_%EA%B9%80%EB%8F%84%EA%B7%A0%EC%A0%84(outline)-01.jpg' where ex_titleName='《sf.lu.p.t》';
commit;