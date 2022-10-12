-- 1:1 문의 첨부파일 테이블
-- 문의글 원본 번호(inquire_no) : 번호, 외래키, 문의글 테이블(inquire)의 문의글 원본 번호(inquire_no) 참조
-- 문의글 첨부파일 번호(inquire_attachment_no) : 번호, 외래키, 첨부파일 테이블(attachment)의 첨부파일 번호(attachment_no) 참조

-- inquire_attachment 테이블 생성
create table inquire_attachment (
inquire_attachment_origin_no number references inquire(inquire_no) on delete cascade,
inquire_attachment_no number references attachment(attachment_no) on delete cascade
);
