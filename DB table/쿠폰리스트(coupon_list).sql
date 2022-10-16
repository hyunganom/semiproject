-- 쿠폰리스트(coupon_list) 테이블 생성
-- coupon_list_no(쿠폰번호) : 관리자에서 생성한 쿠폰
-- coupon_name(쿠폰이름) : 문자(30byte)
-- coupon_discount(쿠폰 할인율) : 숫자
-- coupon_info(쿠폰정보) : 문자(60byte)


create table coupon_list(
coupon_list_no number primary key,
coupon_name varchar2(30),
coupon_discount number,
coupon_info varchar2(60)
);

-- 테이블삭제
drop table coupon_list;


