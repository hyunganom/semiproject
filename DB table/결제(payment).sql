-- 결제 테이블
-- 결제 주문 번호(payment_order_no) : 숫자, 외래키, 주문 테이블(order)의 주문 번호(order_no) 참조
-- 결제 상품 번호(payment_product_no) : 숫자, 외래키, 상품 테이블(product)의 상품 번호(product_no) 참조
-- 결제 상품 수량(payment_count) : 숫자
-- 결제 상품 가격(payment_price) : 숫자

-- payment 테이블 생성
create table payment (
payment_order_no number references order(order_no),
payment_product_no number references product(product_no),
product_count number default 1 not null,
product_price number not null
);
