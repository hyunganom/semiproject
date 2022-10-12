-- 1대1문의게시판
--1:1 문의게시판(inquire) table
--inquire_no(글 번호) : 유일한 식별키, 시퀀스로 부여
--inquire_id(작성자) : 회원의 아이디 정보, 외래키로 설정, 탈퇴하면 작성자를 null로 변경
--inquire_title(제목) : 한글 100자 기준으로 설정
--inquire_content(내용) : 최대 4000byte
--inquire_writedate(작성일) : 작성된 시점의 시각, sysdate로 기본설정
--inquire_updatedate(수정일) : 수정된 시점의 시각

-- inquire 테이블 생성
create table inquire(
inquire_no number primary key,
inquire_id varchar2(20) references member(member_id) on delete set null,
inquire_title varchar2(300) not null,
inquire_content varchar2(4000) not null,
inquire_writedate date default sysdate,
inquire_updatedate date
)

-- inquire_seq 시퀀스 생성
create sequence inquire_seq;
