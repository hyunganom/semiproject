--공지게시판(notice)
--notice_no(공지글 번호) : 유일한 식별키, 시퀀스로 부여
--notice_id(작성자) : 회원의 아이디 정보, 외래키로 설정, 탈퇴하면 작성자를 null로 변경
--notice_title(제목) :  한글 최대 100자 기준으로 설정
--notice_content(내용) : 최대 4000byte
--notice_writedate(작성시간) : 작성된 시점의 시각, sysdate로 기본설정
--notice_updatedate(수정시간) : 수정된 시점의 시각
--notice_read(조회수) : 0으로 기본 설정

-- notice 테이블 생성
create table notice(
notice_no number primary key,
notice_id varchar2(20) references member(member_id) on delete set null,
notice_title varchar2(300) not null,
notice_content varchar2(4000) not null,
notice_writedate date default sysdate,
notice_updatedate date,
notice_read number default 0
)

-- notice_seq 시퀀스 생성
create sequence notice_seq;
