package com.kh.semi.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<AttachmentDto> mapper  = (rs, rowNum) -> {
		return AttachmentDto.builder()
				.attachmentNo(rs.getInt("attachment_no"))
				.attachmentName(rs.getString("attachment_name"))
				.attachmentType(rs.getString("attachment_type"))
				.attachmentSize(rs.getInt("attachment_size"))
				.attachmentDate(rs.getDate("attachmet_date"))
			.build();
	};
	
	private ResultSetExtractor<AttachmentDto> extractor = (rs) -> {
			if(rs.next()) {
				return AttachmentDto.builder()
						.attachmentNo(rs.getInt("attachment_no"))
						.attachmentName(rs.getString("attachment_name"))
						.attachmentType(rs.getString("attachment_type"))
						.attachmentSize(rs.getInt("attachment_size"))
						.attachmentDate(rs.getDate("attachmet_date"))
					.build();
			}else {
				return null;
			}
	}; 

	@Override
	public int sequence() {
		String sql = "select attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	@Override
	public void insert(AttachmentDto attachmentDto) {
		String sql = "insert into attachment("
				+ "attachment_no, attachment_name,"
				+ "attachment_type, attachment_size"
			+ ") values(?, ?, ?, ?)";
				Object[] param = {
				attachmentDto.getAttachmentNo(), 
				attachmentDto.getAttachmentName(),
				attachmentDto.getAttachmentType(),
				attachmentDto.getAttachmentSize()
				};
				jdbcTemplate.update(sql, param);
						
		}

	@Override
	public List<AttachmentDto> selectList() {
		String sql = "select * from attachment";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public AttachmentDto selectOne(int attachmentNo) {
		String sql = "select * from attachment "
				+ "where attachment_no = ?";
		Object[] param = {attachmentNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean delete(int attachmentNo) {
		// TODO Auto-generated method stub
		return false;
	}

	
//	@Override
//	public List<AttachmentDto> selectBoardAttachmentList(int boardNo) {
//		String sql = "select * from board_attachment_view "
//						+ "where board_no = ?";
//		Object[] param = {boardNo};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
	
}
