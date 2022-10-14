-- 상품 테이블
-- 상품 번호(product_no) : 숫자, 기본키, 시퀀스로 부여
-- 상위 카테고리 번호(category_high_no) : 숫자, 외래키, 상위 카테고리 테이블(category_high)의 상위 카테고리 번호(category_high_no)를 참조, 
-- 하위 카테고리 번호(category_low_no) : 숫자, 외래키, 하위 카테고리 테이블(category_low)의 하위 카테고리 번호(category_low_no)를 참조, 
-- 상품 이름(product_name) : 문자(30 byte), 필수 입력
-- 상품 가격(product_price) : 숫자, 필수 입력
-- 상품 정보(product_information) : 문자(500 byte), 필수 입력
-- 상품 재고(product_inventory) : 숫자, 기본값을 0으로, 0 이상의 숫자만 입력 가능, 필수 입력
-- 상품 별점(product_good) : 숫자, 기본값은 0으로

-- 테이블 생성
create table product (
product_no number primary key,
category_high_no number references category_high(category_high_no),
category_low_no number references category_low(category_low_no),
product_name varchar2(30) not null,
product_price number not null,
product_information varchar2(500) not null,
product_inventory number default 0 not null check(product_inventory >= 0),
product_good number default 0
);

-- 테이블 삭제
drop table product;

-- 시퀀스 생성
create sequence product_seq;

-- 시퀀스 삭제
drop sequence product_seq;
