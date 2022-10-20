package com.kh.semi.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.kh.semi.entity.CouponUseDto;

public class CouponUseDaoImpl implements CouponUseDao {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;	
	
	private RowMapper<CouponUseDto> mapper = new RowMapper<CouponUseDto>() {
		public CouponUseDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			CouponUseDto couponUseDto = new CouponUseDto();
			couponUseDto.setCouponUseNo(rs.getInt("coupon_use_no"));
			couponUseDto.setCouponUseOrderNo(rs.getInt("coupon_use_order_no"));
			couponUseDto.setCouponOriginNo(rs.getInt("coupon_original_no"));
			couponUseDto.setCouponUseId(rs.getString("coupon_use_id"));
			couponUseDto.setCouponUseDate(rs.getDate("coupon_use_date"));			
			return couponUseDto;	
		}
	};
	
	//쿠폰 사용내역 추가
	@Override
	public void insert(CouponUseDto couponUseDto) {
		String sql = "insert into coupon_use(coupon_use_no, coupon_use_order_no )"
								+"(coupon_origin_no, coupon_use_id, coupon_use_date "
							+ "values(coupon_use_seq.nextval, ?, ?, ?, sysdate)";
		Object []param = {
				couponUseDto.getCouponUseNo(),
				couponUseDto.getCouponUseOrderNo(),
				couponUseDto.getCouponOriginNo(),
				couponUseDto.getCouponUseId(),
				couponUseDto.getCouponUseDate()
				};
		jdbcTemplate.update(sql, param);		
	}
	
	//쿠폰 사용내역 삭제(매개변수 : 쿠폰사용번호)
	@Override
	public boolean delete(int couponUseNo) {
		String sql = "delete coupon_use where coupon_use_no?";
		Object [] param = {couponUseNo};
		return jdbcTemplate.update(sql, param) > 0;
	}
	
	//쿠폰 사용내역 조회(매개변수 : 회원ID)
	@Override
	public List<CouponUseDto> selectList(String couponUseId) {
		String sql = "select * from coupon_use where coupon_use_id=?";
		Object[] param = {couponUseId};
		return jdbcTemplate.query(sql, mapper, param);
	}

}

