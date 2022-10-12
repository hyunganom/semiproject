-- 쿠폰 테이블
-- 발행될 쿠폰에 대한 정보

-- 구성요소
-- 쿠폰 번호(coupon_no) 중복되면 안됨  
-- 쿠폰 이름(coupon_name) 한글 10자 이내
-- 쿠폰 발행일(coupon_startdate) 쿠폰이 발행 날짜, 지정 설정
-- 쿠폰 만료일(coupon_enddate) 쿠폰 만료 날짜, 지정 설정
-- 쿠폰 할인율(coupon_discount) 계산식이 들어갈거니 숫자로 설정
-- 쿠폰 정보(coupon_info) 쿠폰이 발행된 이벤트 명(생일축하, 신규가입축하 등)

create table coupon (
coupon_no number primary key,
coupon_name varchar2(30) not null,
coupon_startdate date default sysdate,
coupon_enddate date not null,
coupon_discount number not null,
coupon_info varchar2(60) not null
);

create sequence coupon_seq;
