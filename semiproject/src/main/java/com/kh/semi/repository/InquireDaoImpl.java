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

import com.kh.semi.entity.InquireDto;

@Repository
public class InquireDaoImpl implements InquireDao {
	
	// 의존성 주입
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 추상 메소드 오버라이딩 - 문의글 등록을 위한 다음 시퀀스 번호 반환
	@Override
	public int nextSequence() {
		String sql = "select inquire_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 추상 메소드 오버라이딩 - 문의글 등록(INSERT)
	@Override
	public void writeInquire(InquireDto inquireDto) {
		String sql = "insert into inquire(inquire_no, inquire_id, inquire_title, inquire_content) values(?, ?, ?, ?)";
		Object[] param = new Object[] {inquireDto.getInquireNo(), inquireDto.getInquireId(), inquireDto.getInquireTitle(), inquireDto.getInquireContent()};
		jdbcTemplate.update(sql, param);
	}
	
	// InquireDto에 대한 RowMapper
	private RowMapper<InquireDto> mapper = new RowMapper<>() {
		@Override
		public InquireDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			
			return InquireDto.builder()
					.inquireNo(rs.getInt("inquire_no"))
					.inquireId(rs.getString("inquire_id"))
					.inquireTitle(rs.getString("inquire_title"))
					.inquireContent(rs.getString("inquire_content"))
					.inquireWritetime(rs.getDate("inquire_writetime"))
					.inquireUpdatetime(rs.getDate("inquire_updatetime"))
					.inquireHasReply(rs.getString("inquire_hasReply"))
					.inquireInactive(rs.getString("inquire_inactive"))
					.build();
		}
	};

	// 추상 메소드 오버라이딩 - 문의글 조회(SELECT)
	@Override
	public List<InquireDto> selectInquire() {
		String sql = "select * from inquire order by inquire_no desc";
		return jdbcTemplate.query(sql, mapper);
	}
	
	// 추상 메소드 오버라이딩 - 문의글 조회(SELECT) - 회원용
	@Override
	public List<InquireDto> selectInquire(String inquireId) {
		String sql = "select * from inquire where inquire_id = ? order by inquire_no desc";
		Object[] param = new Object[] {inquireId};
		return jdbcTemplate.query(sql, mapper, param);
	}

	// InquireDto에 대한 ResultSetExtractor
	private ResultSetExtractor<InquireDto> extractor = new ResultSetExtractor<>() {
		@Override
		public InquireDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return InquireDto.builder()
						.inquireNo(rs.getInt("inquire_no"))
						.inquireId(rs.getString("inquire_id"))
						.inquireTitle(rs.getString("inquire_title"))
						.inquireContent(rs.getString("inquire_content"))
						.inquireWritetime(rs.getDate("inquire_writetime"))
						.inquireUpdatetime(rs.getDate("inquire_updatetime"))
						.inquireHasReply(rs.getString("inquire_hasReply"))
						.inquireInactive(rs.getString("inquire_inactive"))
						.build();
			}
			else {
				return null;
			}
		}
	};
	
	// 추상 메소드 오버라이딩 - 문의글 상세(DETAIL)
	@Override
	public InquireDto selectOneInquire(int inquireNo) {
		String sql = "select * from inquire where inquire_no = ?";
		Object[] param = new Object[] {inquireNo};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	// 추상 메소드 오버라이딩 - 문의글 수정(UPDATE)
	@Override
	public boolean updateInquire(InquireDto inquireDto) {
		String sql = "update inquire set inquire_title = ?, inquire_content = ? where inquire_no = ?";
		Object[] param = new Object[] {inquireDto.getInquireTitle(), inquireDto.getInquireContent(), inquireDto.getInquireNo()};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 오버라이딩 - 문의글 삭제(DELETE)
	@Override
	public boolean deleteInquire(int inquireNo) {
		String sql = "delete inquire where inquire_no = ?";
		Object[] param = new Object[] {inquireNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 오버라이딩 - 문의글 삭제(UPDATE)
	@Override
	public boolean inactiveInquire(int inquireNo) {
		String sql = "update inquire set inquire_inactive = 'Y' where inquire_no = ?";
		Object[] param = new Object[] {inquireNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
}
