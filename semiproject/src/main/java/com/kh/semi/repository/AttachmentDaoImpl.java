package com.kh.semi.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.AttachmentDto;


//첨부파일 조회 등록 기능
@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//전체 조회를 위한 mapper
	private RowMapper<AttachmentDto> mapper  = (rs, rowNum) -> {
		return AttachmentDto.builder()
				.attachmentNo(rs.getInt("attachment_no"))
				.attachmentName(rs.getString("attachment_name"))
				.attachmentType(rs.getString("attachment_type"))
				.attachmentSize(rs.getLong("attachment_size"))
				.attachmentDate(rs.getDate("attachmet_date"))
			.build();
	};
	//단일조회를 위한 mapper
	private ResultSetExtractor<AttachmentDto> extractor = (rs) -> {
			if(rs.next()) {
				return AttachmentDto.builder()
						.attachmentNo(rs.getInt("attachment_no"))
						.attachmentName(rs.getString("attachment_name"))
						.attachmentType(rs.getString("attachment_type"))
						.attachmentSize(rs.getLong("attachment_size"))
						.attachmentDate(rs.getDate("attachmet_date"))
					.build();
			}else {
				return null;
			}
	}; 

	
	//시퀀스 번호를 발급받기위한 메소드
	@Override
	public int sequence() {
		String sql = "select attachment_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	
	//등록 구문
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

	//첨부파일 조회
	@Override
	public List<AttachmentDto> selectList() {
		String sql = "select * from attachment";
		return jdbcTemplate.query(sql, mapper);
	}

	//첨부파일 단일 조회
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


	@Override
	public void connectAttachment(int productNo, int attachmentNo) {
		String sql = "insert into product_attachment("
				+ "product_origin_no, product_attachment_no"
				+ ") values(?, ?)";
		Object[] param = {productNo, attachmentNo};
		jdbcTemplate.update(sql, param);
		
	}



	
	
//	@Override
//	public List<AttachmentDto> selectBoardAttachmentList(int boardNo) {
//		String sql = "select * from board_attachment_view "
//						+ "where board_no = ?";
//		Object[] param = {boardNo};
//		return jdbcTemplate.query(sql, mapper, param);
//	}
	
}
