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

import com.kh.semi.entity.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(MemberDto memberDto) {
		String sql = "insert into member(member_id, member_pw, "
				+ "member_name, member_email, member_tel, member_post, "
				+ "member_base_address, member_detail_address, "
				+ "member_birth, member_gender) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {
				memberDto.getMemberId(), memberDto.getMemberPw(), 
				memberDto.getMemberName(), memberDto.getMemberEmail(), 
				memberDto.getMemberTel(), memberDto.getMemberPost(), 
				memberDto.getMemberBaseAddress(), memberDto.getMemberDetailAddress(), 
				memberDto.getMemberBirth(), memberDto.getMemberGender()
		};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<MemberDto> mapper = new RowMapper<MemberDto>() {
		@Override
		public MemberDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberDto dto = new MemberDto();
			dto.setMemberId(rs.getString("member_id"));
			dto.setMemberPw(rs.getString("member_pw"));
			dto.setMemberName(rs.getString("member_name"));
			dto.setMemberEmail(rs.getString("member_email"));
			dto.setMemberTel(rs.getString("member_tel"));
			dto.setMemberPost(rs.getString("member_post"));
			dto.setMemberBaseAddress(rs.getString("member_base_address"));
			dto.setMemberDetailAddress(rs.getString("member_detail_address"));
			dto.setMemberBirth(rs.getString("member_birth"));
			dto.setMemberGender(rs.getString("member_gender"));
			dto.setMemberGrade(rs.getString("member_grade"));
			dto.setMemberPoint(rs.getInt("member_point"));
			dto.setMemberJoindate(rs.getDate("member_joindate"));
			dto.setMemberLogindate(rs.getDate("member_logindate"));
			dto.setMemberWithdrawal(rs.getString("member_withdrawal"));
			dto.setMemberWithdrawalDate(rs.getDate("member_withdrawaldate"));
			return dto;
		}
	};

	@Override
	public List<MemberDto> selectList() {
		String sql = "select * from member";
		return jdbcTemplate.query(sql, mapper);
	}

	@Override
	public List<MemberDto> selectList(String type, String keyword) {
		String sql = "select * from member where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", type);
		Object[] param = {keyword};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	private ResultSetExtractor<MemberDto> extractor = new ResultSetExtractor<MemberDto>() {
		@Override
		public MemberDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setMemberId(rs.getString("member_id"));
				dto.setMemberPw(rs.getString("member_pw"));
				dto.setMemberName(rs.getString("member_name"));
				dto.setMemberEmail(rs.getString("member_email"));
				dto.setMemberTel(rs.getString("member_tel"));
				dto.setMemberPost(rs.getString("member_post"));
				dto.setMemberBaseAddress(rs.getString("member_base_address"));
				dto.setMemberDetailAddress(rs.getString("member_detail_address"));
				dto.setMemberBirth(rs.getString("member_birth"));
				dto.setMemberGender(rs.getString("member_gender"));
				dto.setMemberGrade(rs.getString("member_grade"));
				dto.setMemberPoint(rs.getInt("member_point"));
				dto.setMemberJoindate(rs.getDate("member_joindate"));
				dto.setMemberLogindate(rs.getDate("member_logindate"));
				dto.setMemberWithdrawal(rs.getString("member_withdrawal"));
				dto.setMemberWithdrawalDate(rs.getDate("member_withdrawaldate"));
				return dto;
			}
			else {
				return null;
			}
		}
	};

	@Override
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member where member_id = ?";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql, extractor, param);
	}
	
	@Override
	public boolean update(MemberDto memberDto) {
		String sql = "update member set member_name = ?, member_email = ?, "
				+ "member_tel = ?, member_post = ?, member_base_address = ?, "
				+ "member_detail_address = ?, member_grade = ?, member_point = ? "
				+ "where member_id = ?";
		Object[] param = {
				memberDto.getMemberName(), memberDto.getMemberEmail(), 
				memberDto.getMemberTel(), memberDto.getMemberPost(), 
				memberDto.getMemberBaseAddress(), memberDto.getMemberDetailAddress(), 
				memberDto.getMemberGrade(), memberDto.getMemberPoint(), 
				memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean changePassword(String memberId, String memberPw) {
		String sql = "update member set member_pw = ? where member_id = ?";
		Object[] param = {memberPw, memberId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean delete(String memberId) {
		String sql = "delete member where member_id = ?";
		Object[] param = {memberId};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	@Override
	public boolean changeInformation(MemberDto memberDto) {
		String sql = "update member set member_name = ?, "
				+ "member_email = ?, member_tel = ?, member_pw = ? "
				+ "where member_id = ?";
		Object[] param = {
				memberDto.getMemberName(), memberDto.getMemberEmail(), 
				memberDto.getMemberTel(), memberDto.getMemberPw(), 
				memberDto.getMemberId()
		};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
@Override
	public boolean updateLoginTime(String memberId) {
		String sql = "update member set member_login = stsdate where member_id = ?";
		Object[] param = {memberId};
		return jdbcTemplate.update(sql, param) > 0;
	}
}
