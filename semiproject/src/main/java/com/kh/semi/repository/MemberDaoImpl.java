package com.kh.semi.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
}
