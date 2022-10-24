package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//공지글 등록
	@Override
	public void insert(NoticeDto noticeDto) {
		String sql = "insert into notice "
					+ "(notice_no, notice_id, notice_title, notice_content, "
					+ "(notice_writedate, notice_updatedate, notice_read "
						+ "values(notice_seq.nextval, ?, ?, ?, sysdate, ?, ?)";
		Object[] param = {
					noticeDto.getNoticeNo(), noticeDto.getNoticeId(),
					noticeDto.getNoticeTitle(), noticeDto.getNoticeContent(),
					noticeDto.getNoticeWritedate(), noticeDto.getNoticeUpdatedate(),
					noticeDto.getNoticeRead()};
		jdbcTemplate.update(sql, param);		
	}
	
	//공지글 수정
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
	
	private RowMapper<NoticeDto> mapper = new RowMapper<NoticeDto>() {
		@Override
		public NoticeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeId(rs.getString("notice_id"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeWritedate(rs.getDate("notice_writedate"));
			noticeDto.setNoticeUpdatedate(rs.getDate("notice_updatedate"));
			noticeDto.setNoticeRead(rs.getInt("notice_read"));			
			return noticeDto;
		}
		
	};

	@Override
	public List<NoticeDto> selectList() {
		String sql = "select * from notice order by notice_no asc";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<NoticeDto> selectList(String title, String content) {
		String sql = "select * from notice "
					+ "where instr( "+title+", ? ) > 0 "
							+ "order by "+title+" asc";
		Object[] param = {content};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public boolean delete(int noticeNo) {
		String sql = "delete notice where notice_no=?";
		Object[] param = {noticeNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
}
