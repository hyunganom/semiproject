-- 리뷰 첨부파일 테이블
-- 리뷰 원본 번호(review_attachment_origin_no) : 번호, 외래키, 리뷰 테이블(review)의 리뷰 번호(review_no) 참조
-- 리뷰 첨부파일 번호(review_attachment_no) : 번호, 외래키, 첨부파일 테이블(attachment)의 첨부파일 번호(attachment_no) 참조

-- REVIEW_ATTACHMENT 테이블 생성
create table review_attachment (
review_attachment_origin_no number references review(review_no) on delete cascade,
review_attachment_no number references attachment(attachment_no) on delete cascade
);
