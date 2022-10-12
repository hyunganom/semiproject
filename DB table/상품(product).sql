-- PRODUCT 테이블
-- 상품 번호(product_no)
-- 

-- PRODUCT 테이블 생성
create table pruduct (
product_no number primary key,
category_high_no number references category_high(category_high_no),
category_low_no number references category_low(category_low_no),
product_name varchar2(30) not null,
product_price number not null,
product_information varchar2(500) not null,
product_inventory number default 0 not null check(product_inventory >= 0),
product_good number default 0
);
