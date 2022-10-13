-- 상위카테고리(CATEGORY_HIGH) 테이블 생성

create table category_high (
category_high_no number primary key,
category_high_name varchar2(30) not null
);

-- 
drop table category_high;