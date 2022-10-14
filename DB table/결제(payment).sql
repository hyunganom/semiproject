-- 결제 테이블
-- 결제 주문 번호(payment_order_no) : 숫자, 외래키, 주문 테이블(order)의 주문 번호(order_no) 참조, 주문 취소시 결제 정보 삭제
-- 결제 상품 번호(payment_product_no) : 숫자, 외래키, 상품 테이블(product)의 상품 번호(product_no) 참조, 상품 삭제시 ??
-- 결제 상품 수량(payment_count) : 숫자, 기본값은 1로, 필수 입력
-- 결제 상품 가격(payment_price) : 숫자, 필수 입력

-- 테이블 생성
create table payment (
payment_no number primary key,
payment_order_no number references orders(order_no) on delete cascade,
payment_product_no number references product(product_no) on delete cascade,
product_count number default 1 not null,
product_price number not null
);

-- 테이블 삭제
drop table payment;

-- 시퀀스 생성
create sequence payment_seq;

-- 시퀀스 삭제
drop sequence payment_seq;