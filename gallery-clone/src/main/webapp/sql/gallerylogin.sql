create table gallerylogin (
	memname varchar2(50) primary key,
    memid varchar2(50),
    pw varchar2(50),
	gender varchar2(50),
	email1 varchar2(50),
	email2 varchar2(50),
	phone1 varchar2(50),
	phone2 varchar2(50),
	phone3 varchar2(50),
	addr varchar2(50)
);

select * from gallerylogin where memid = 'admin1';
drop table gallerylogin;

select * from gallerylogin;

update gallerylogin set memid='admin' where memid='amin';

commit;