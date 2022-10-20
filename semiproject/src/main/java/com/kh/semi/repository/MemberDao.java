package com.kh.semi.repository;

import java.util.List;

import com.kh.semi.entity.MemberDto;

public interface MemberDao {
	void insert(MemberDto memberDto);
	
	List<MemberDto> selectList();
	List<MemberDto> selectList(String type, String keyword);
	MemberDto selectOne(String memberId);
	
}
