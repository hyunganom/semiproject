package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.NoticeDto;
import com.kh.semi.vo.NoticeListSearchVO;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	// 의존성 주입
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// 추상 메소드 오버라이딩 - 공지 등록을 위한 시퀀스 번호 반환
	@Override
	public int noticeSequence() {
		String sql = "select notice_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);		
	}
	
	//추상 메소드 오버라이딩 - 공지글 등록(INSERT)
	@Override
	public void write(NoticeDto noticeDto) {
		String sql = "insert into notice "
					+ "(notice_no, notice_id, notice_title, notice_content, "
					+ "(notice_writedate, notice_updatedate, notice_read "
						+ "values(?, ?, ?, ?, sysdate, ?, ?)";
		Object[] param = {
					noticeDto.getNoticeNo(), noticeDto.getNoticeId(),
					noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(),
					noticeDto.getNoticeWritedate(), noticeDto.getNoticeUpdatedate(),
					noticeDto.getNoticeRead()};
		jdbcTemplate.update(sql, param);		
	}
	
	//추상 메소드 오버라이딩 - 공지글 수정(UPDATE)
	@Override
	public boolean update(NoticeDto noticeDto) {
		String sql = "update notice set "
					+ "notice_title=?, "
					+ "notice_content=?,"
					+ "notice_updatedate=sysdate "
						+ "where notice_no=?";
		Object[] param = {
					noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(),
					noticeDto.getNoticeNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	// NoticeDto에 대한 RowMapper
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {
		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return NoticeDto.builder()
																.noticeNo(rs.getInt("notice_no"))
																.noticeId(rs.getString("notice_id"))
																.noticeTitle(rs.getString("notice_title"))
																.noticeContent(rs.getString("notice_content"))
																.noticeWritedate(rs.getDate("notice_writetime"))
																.noticeUpdatedate(rs.getDate("notice_updatedate"))
																.noticeRead(rs.getInt("notice_read"))
														.build();									
		}
		
	};
	
	// NoticeDto에 대한 ResultSetExtractor
	private ResultSetExtractor<NoticeDto> extractor = new ResultSetExtractor<NoticeDto>() {
		@Override
		public NoticeDto extractData(ResultSet rs) throws SQLException ,DataAccessException {
					if(rs.next()) {
						return NoticeDto.builder()
														.noticeNo(rs.getInt("notice_no"))
														.noticeId(rs.getString("notice_id"))
														.noticeTitle(rs.getString("notice_title"))
														.noticeContent(rs.getString("notice_content"))
														.noticeWritedate(rs.getDate("notice_writetime"))
														.noticeUpdatedate(rs.getDate("notice_updatedate"))
														.noticeRead(rs.getInt("notice_read"))
												.build();			
					}
					else {
						return null;
					}		
			}
	};

	@Override
	public List<NoticeDto> selectList(String title, String content) {
		String sql = "select * from notice "
					+ "where instr( "+title+", ? ) > 0 "
							+ "order by "+title+" asc";
		Object[] param = {content};
		return jdbcTemplate.query(sql, mapper, param);
	}

	// 추상 메소드 오버라이딩 - 공지글 삭제(DELETE)
	@Override
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 오버라이딩 - 공지글 조회수(UPDATE)
	@Override
	public NoticeDto read(int noticeNo) {
		this.updateReadcount(noticeNo);
		return this.selectOne(noticeNo);
	}
	
	// 추상 메소드 오버라이딩 - 공지글 조회수 증가(UPDATE)
	@Override
	public boolean updateReadcount(int noticeNo) {
		String sql = "update notice "
													+ "set notice_read = notice_read + 1 "
												+ "where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	@Override
	public void noticeAttachment(int noticeNo, int attachmentNo) {
		String sql = "insert into notice_attachment("
					+ "board_no, attachment_no "
						+ ") values(?, ?)";
		Object[] param = {noticeNo, attachmentNo};
		jdbcTemplate.update(sql, param);
	}

	// 추상 메소드 오버라이딩 - 공지글 상세(DETAIL)
	@Override
	public NoticeDto selectOne(int noticeNo) {
		String sql = "select * from notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.query(sql, extractor,param);
	}
	
	//추상 메소드 오버라이딩 - 공지글 통합 조회(SELECT)
	//통합 조회
	@Override
	public List<NoticeDto> selectListNotice(NoticeListSearchVO noticeListSearchVO) {

		//검색 조회인지 판정
		if(noticeListSearchVO.isSearch()) { //검색조회라면
			return searchListNotice(noticeListSearchVO); //검색조회 실행
		}
		else { //검색 조회가 아니라면 (전체 조회라면)
		 return allListNotice(); //전체조회 실행
		}
	}

	//검색 조회
	@Override
	public List<NoticeDto> searchListNotice(NoticeListSearchVO noticeListSearchVO) {
		String sql = "select * from notice where instr(#1, ?) > 0 order by notice_no desc";
		sql = sql.replace("#1", noticeListSearchVO.getType());
		Object[] param = new Object[] {noticeListSearchVO.getKeyword()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	//전체 조회
	@Override
	public List<NoticeDto> allListNotice() {
		String sql = "select * from notice order by notice_no desc";
		return jdbcTemplate.query(sql, mapper);
	}


}
