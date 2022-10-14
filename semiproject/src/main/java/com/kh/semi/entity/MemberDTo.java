package com.kh.semi.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MemberDTo {
	private String memberId, memberPw, memberName, memberEmail, memberTel;
	private String memberPost, memberBaseAddress, memberDetailAddress;
	private String memberGender, memberGrade;
	private int memberPoint;
	private Date memberBirth, memberJoindate, memberLogindate;
}
