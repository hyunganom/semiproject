-- 1:1 문의 게시판(inquire)
-- inquire_no(문의글 번호) : 숫자, 기본키, 시퀀스로 부여
-- inquire_id(문의글 작성자) : 문자(20 byte), 외래키, 회원(member) 테이블의 회원 아이디(member_id) 참조, 회원 탈퇴시 작성자를 null로
-- inquire_title(문의글 제목) : 문자(300byte), 한글 100자 기준, 필수 입력
-- inquire_content(문의글 내용) : 문자(4000 byte), 필수 입력
-- inquire_writedate(문의글 작성일) : 날짜, sysdate를 기본값으로
-- inquire_updatedate(문의글 수정일) : 날짜

-- 테이블 생성
create table inquire(
inquire_no number primary key,
inquire_id varchar2(20) references member(member_id) on delete set null,
inquire_title varchar2(300) not null,
inquire_content varchar2(4000) not null,
inquire_writedate date default sysdate,
inquire_updatedate date
);

-- 테이블 삭제
drop table inquire;

-- 시퀀스 생성
create sequence inquire_seq;

-- 시퀀스 삭제
drop sequence inquire_seq;
