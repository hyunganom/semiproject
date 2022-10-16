-- 쿠폰사용내역 테이블
-- 사용된 쿠폰에 대한 정보

-- 구성요소
-- 기록 번호(coupon_use_no) 중복되면 안됨, 기본키, 시퀀스 부여
-- 주문 번호(coupon_use_order_no) 외래키, 주문(orders)테이블의 주문번호(order_no)참조
-- 쿠폰 번호(coupon_origin_no) 외래키, 쿠폰리스트(coupon_list)테이블의 쿠폰번호(coupon_list_no)참조
-- 아이디(coupon_use_id) 외래키, 회원(member)테이블의 아이디(member_id)참조
-- 쿠폰 사용일(coupon_use_date) 쿠폰 이용 날짜


create table coupon (
coupon_use_no number primary key,
coupon_use_order_no references orders(order_no),
coupon_origin_no references coupon_list(coupon_list_no),
coupon_use_id references member(member_id),
coupon_use_date date default sysdate not null,
);
                        
drop table coupon;

create sequence coupon_use_seq;
