-- BASKET 테이블 생성
create table basket (
basket_id varchar2(20) references member(member_id) on delete cascade,
basket_product_no number references product(product_no) on delete cascade,
basket_count_number default 1 check(basket_count_number >= 1),
basket_adddate date default sysdate,
primary key(basket_id, basket_product_no)
);
