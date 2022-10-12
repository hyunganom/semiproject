-- 하위 카테고리 테이블
-- 하위 카테고리 번호(category_low_no) : 번호, 기본키, 시퀀스 부여
-- 상위 카테고리 번호(category_high_no) : 번호, 외래키, 상위 카테고리 테이블(category_high)의 상위 카테고리 번호(category_high_no) 참조
-- 하위 카테고리명(category_low_name) : 문자(30byte)


-- CATEGORY_LOW 테이블 생성
create table category_low (
category_low_no number primary key,
category_high_no number references category_high(category_high_no) on delete cascade,
category_low_name varchar2(30) not null
);

create sequence category_low_seq;
