-- 1:1문의댓글(inquire_reply)
-- inquire_reply_no(댓글 번호) : 유일한 식별키, 시퀀스로 부여
-- inquire_reply_id(댓글 작성자) : 회원의 아이디 정보, 외래키로 설정, 탈퇴하면 작성자를 null로 변경
-- inquire_origin_no(원본글 번호) : 원본글 번호, 외래키로 설정
-- inquire_origin_id(원본글 작성자) : 원본글 작성자, 외래키로 설정, 탈퇴하면 작성자를 null로 변경
-- inquire_reply_writedate(댓글 작성일) : 작성된 시점의 시각, sysdate로 기본설정
-- inquire_reply_updatedate(댓글 수정일) : 수정된 시점의 시각
-- inquire_reply_content(댓글 내용) : 최대 2000byte

-- inquire_reply 테이블 생성
create table inquire_reply(
inquire_reply_no number primary key,
inquire_reply_id varchar2(20) references member(member_id) on delete set null,
inquire_origin_no number references inquire(inquire_no) on delete cascade not null,
inquire_origin_id varchar2(20) references inquire(inquire_id) on delete set null,
inquire_reply_writedate date default sysdate,
inquire_reply_updatedate date,
inquire_reply_content varchar2(2000) not null
)

-- inquire_reply_seq 시퀀스 생성
create sequence inquire_reply_seq;
