package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.AttachmentDto;
import com.kh.semi.vo.ProductAttachmentVO;


//첨부파일 조회 등록 기능
@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//전체 조회를 위한 mapper
	private RowMapper<AttachmentDto> productMapper  = (rs, rowNum) -> {
		AttachmentDto dto = new AttachmentDto();
		dto.setAttachmentNo(rs.getInt("attachment_no"));
		dto.setAttachmentName(rs.getString("attachment_name"));
		dto.setAttachmentType(rs.getString("attachment_type"));
		dto.setAttachmentSize(rs.getLong("attachment_size"));
		dto.setAttachmentDate(rs.getDate("attachment_date"));
		return dto;
	};
	//단일조회를 위한 mapper
	private ResultSetExtractor<AttachmentDto> productExtractor = (rs) -> {
			AttachmentDto dto = new AttachmentDto();
			if(rs.next()) {
				dto.setAttachmentNo(rs.getInt("attachment_no"));
				dto.setAttachmentName(rs.getString("attachment_name"));
				dto.setAttachmentType(rs.getString("attachment_type"));
				dto.setAttachmentSize(rs.getLong("attachment_size"));
				dto.setAttachmentDate(rs.getDate("attachment_date"));
				return dto;
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
		return jdbcTemplate.query(sql, productMapper);
	}

	//첨부파일 단일 조회
	@Override
	public AttachmentDto selectOne(int attachmentNo) {
		String sql = "select * from attachment where attachment_no = ?";
		Object[] param = {attachmentNo};
		return jdbcTemplate.query(sql, productExtractor, param);
	}

	@Override
	public boolean delete(int attachmentNo) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public void productConnectAttachment(int productNo, int attachmentNo) {
		String sql = "insert into product_attachment VALUES(?, ?)";
		Object[] param = {productNo, attachmentNo};
		jdbcTemplate.update(sql, param);
		
	}


	@Override
	public List<AttachmentDto> selectProductAttachmentList(int productOriginNo) {
		String sql = "select * from product_attachment_view "
				+ "where product_origin_no = ?";
		Object[] param = {productOriginNo};
		return jdbcTemplate.query(sql, productMapper, param);
	}

	

//	@Override
//	public List<ProductAttachmentVO> selectProductAttachmentList(int productOriginNo) {
//		String sql = "select*from product_attachment_view where product_origin_no=?";
//		Object[] param = {productOriginNo};
//		return jdbcTemplate.query(sql, mapperVO, param);
//	}
	
////	@Override
////	public List<AttachmentDto> selectBoardAttachmentList2(int boardNo) {
////		String sql = "select*from product_attachment_view where product_origin_no=?";
////		Object[] param = {boardNo};
////		return jdbcTemplate.query(sql, mapper, param);
////	}
//	
//	private RowMapper<ProductAttachmentVO> mapperVO = new RowMapper<>() {
//		@Override
//		public ProductAttachmentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//			return ProductAttachmentVO.builder()
//						.attachmentNo(rs.getInt("attachment_no"))
//						.attachmentName(rs.getString("attachment_name"))
//						.attachmentType(rs.getString("attachment_type"))
//						.attachmentSize(rs.getLong("attachment_size"))
//						.attachmentTime(rs.getDate("attachment_time"))
//						.productOriginNo(rs.getInt("product_origin_no"))
//						.productAttachmentNo(rs.getInt("product_attachment_no"))
//					.build();
//		}
//	};
	
	
}
