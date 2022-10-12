-- REVIEW 테이블 생성
create table review (
review_no number primary key,
review_id varchar2(30) references member(member_id) on delete set null,
review_order_no number references payment(payment_order_no) on delete set null,
review_title varchar2(300) not null,
review_content varchar2(4000) not null,
review_writetime date default sysdate not null,
review_updatetime date,
review_good number not null,
review_like number default 0 check(review_like >= 0)
);

create sequence review_no_seq;
