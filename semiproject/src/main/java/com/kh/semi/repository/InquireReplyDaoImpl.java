package com.kh.semi.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.InquireReplyDto;
import com.kh.semi.vo.InquireReplyVO;

@Repository
public class InquireReplyDaoImpl implements InquireReplyDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public void replyWrite(InquireReplyDto inquireReplyDto) {
		String sql = "insert INTO inquire_reply "
				+ " values(INQUIRE_REPLY_SEQ.nextval,"
				+ " ?, ?,sysdate,sysdate, ?)";
		Object[] param = {inquireReplyDto.getInqurerReplyId(),
				inquireReplyDto.getInqurerOriginNo(),
				inquireReplyDto.getInqurerReplyContent()};
		jdbcTemplate.update(sql, param);
	}

	@Override
	public List<InquireReplyVO> selectList(int inquireOriginNo) {
		String sql = "select m.member_name, m.member_grade, r.* from"
				+ " inquire_reply R left OUTER join member M "
				+ "on r.inquire_reply_id=m.member_id where r.inquire_origin_no = ?";
		Object[] param = {inquireOriginNo};
		return jdbcTemplate.query(sql, mapper, param);
	}

	@Override
	public InquireReplyDto selectOne(int inquireReplyNo) {
		String sql = "select * from inquire_reply where inquire_reply_no= ?";
		Object[] param = {inquireReplyNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	@Override
	public boolean replyUpdate(int inquireReplyNo) {
		// TODO Auto-generated method stub
		return false;
	}
	
	RowMapper<InquireReplyVO> mapper = (rs, idx)->{
		return InquireReplyVO.builder()
				.inquireReplyNo(rs.getInt("inquire_reply_no"))
				.inquireReplyId(rs.getString("inquire_reply_id"))
				.inquireReplyOriginNo(rs.getInt("inquire_origin_no"))
				.inquireReplyWritedate(rs.getDate("inquire_reply_writedate"))
				.inquireReplyUpdatedate(rs.getDate("inquire_reply_updatedate"))
				.inquireReplyContent(rs.getString("inquire_reply_content"))
				.memberName(rs.getString("member_name"))
				.memberGrade(rs.getString("member_grade"))
				.build();
	};
	
	ResultSetExtractor<InquireReplyDto> extractor = (rs)->{
		if(rs.next()) {
			return InquireReplyDto.builder()
					.inqurerReplyNo(rs.getInt("inqurerReply_no"))
					.inqurerReplyId(rs.getString("inqurerReply_id"))
					.inqurerOriginNo(rs.getInt("inqurerOrigin_no"))
					.inqurerReplyWritedate(rs.getDate("inqurerReply_writedate"))
					.inqurerReplyUpdatedate(rs.getDate("inqurerReply_updatedate"))
					.inqurerReplyContent(rs.getString("inqurerReply_content"))
					.build();
		}
		else return null;
	};
	
}
