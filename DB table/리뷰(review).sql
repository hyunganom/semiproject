-- 리뷰 테이블
-- 리뷰 번호(review_no) : 숫자, 기본키, 시퀀스로 부여
-- 리뷰 작성자 아이디(review_id) : 문자(20 byte), 외래키, 회원 테이블(member)의 회원 아이디(member_id) 참조, 회원 탈퇴시 작성자가 null이 되도록
-- 리뷰 결제 번호(review_payment_no) : 숫자, 외래키, 결제 테이블(payment)의 결제 번호(payment_no) 참조, 결제 취소시 리뷰 삭제
-- 리뷰 제목(review_title) : 문자(300 byte), 필수 입력
-- 리뷰 내용(review_content) : 문자(4000 byte), 필수 입력
-- 리뷰 작성시간(review_writetime) : 날짜, 기본값은 현재 시간으로
-- 리뷰 수정시간(review_updatetime) : 날짜
-- 리뷰 별점(review_good) : 숫자, 필수 입력
-- 리뷰 좋아요(review_like) : 숫자, 기본값은 0으로, 0 이상의 숫자만 입력 가능 

-- 테이블 생성
create table review (
review_no number primary key,
review_id references member(member_id) on delete set null,
review_payment_no references payment(payment_no) on delete cascade,
review_title varchar2(300) not null,
review_content varchar2(4000) not null,
review_writetime date default sysdate not null,
review_updatetime date,
review_good number not null,
review_like number default 0 check(review_like >= 0)
);

-- 테이블 삭제
drop table review;

-- 시퀀스 생성
create sequence review_seq;

-- 시퀀스 삭제
drop sequence review_seq;