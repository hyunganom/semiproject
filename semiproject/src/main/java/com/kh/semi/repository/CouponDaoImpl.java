package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.CouponDto;
import com.kh.semi.vo.CouponCountVO;

@Repository
public class CouponDaoImpl implements CouponDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private RowMapper<CouponDto> mapper = new RowMapper<CouponDto>() {
		@Override
		public CouponDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CouponDto couponDto = new CouponDto();
			couponDto.setCouponNo(rs.getInt("coupon_no"));
			couponDto.setCouponId(rs.getString("coupon_id"));
			couponDto.setCouponStartdate(rs.getDate("coupon_startdate"));
			couponDto.setCouponEnddate(rs.getDate("coupon_enddate"));
			couponDto.setCouponYn(rs.getString("coupon_yn"));
			couponDto.setCouponIssue(rs.getInt("coupon_issue"));		
			return couponDto;
		}
	};
			
	//쿠폰 추가
	@Override
	public void insert(CouponDto couponDto) {
		String sql = "insert into coupon "
					+ "(coupon_no, coupon_id, coupon_startdate, "
					+ "coupon_enddate, coupon_yn, coupon_issue) "
						+ "values (?, ?, sysdate, ?, coupon_seq.nextval)";
		Object[] param = {
					couponDto.getCouponId(),
					couponDto.getCouponYn(),
					couponDto.getCouponIssue()
		};
		jdbcTemplate.update(sql, param);
		
	}
	
	//쿠폰 옵션 수정
	@Override
	public boolean update(CouponDto couponDto) {
		String sql = "update coupon set "
					+ "coupon_id =? "
					+ "coupon_startdate=? "
					+ "coupon_enddate=? "
					+ "coupon_yn =? "
					+ "coupon_issue=? "
						+"where coupon_no=?";
		Object[] param = {
					couponDto.getCouponId(),
					couponDto.getCouponYn(),
					couponDto.getCouponIssue(),
					couponDto.getCouponNo()
					};
		return jdbcTemplate.update(sql, param) < 0;
	}
	
	//쿠폰 조회
	@Override
	public List<CouponDto> selectList(String couponId) {
		String sql = "select * from coupon where coupon_id=? and coupon_yn='y'";
		Object[] param = {couponId};
		return jdbcTemplate.query(sql, mapper,param);
	}
	
	//쿠폰 삭제
	@Override
	public boolean delete(int couponNo) {
		String sql = "delete coupon where coupon_no=?";
		Object[] param = {couponNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//쿠폰 갯수를 세기 CouponCountVO에 대한 RowMapper
	private RowMapper<CouponCountVO> countMapper = new RowMapper<CouponCountVO>() {
		@Override
		public CouponCountVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			CouponCountVO couponCountVo = new CouponCountVO();
			couponCountVo.setCouponId(rs.getString("couponId"));
			couponCountVo.setCnt(rs.getInt("cnt"));
			return null;
		}
	};

	@Override 
	public List<CouponCountVO> selectCountList() {
		String sql = "select coupon_id, count(*) cnt from coupon "
						+ "group by coupon_id";
		return jdbcTemplate.query(sql,  countMapper);
	}	
	
}
