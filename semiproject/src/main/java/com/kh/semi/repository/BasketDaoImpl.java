package com.kh.semi.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.BasketDto;


@Repository
public class BasketDaoImpl implements BasketDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	//장바구니 추가
	@Override
	public void insert(BasketDto basketDto) {
		String sql = "insert into basket (basket_id, "
				+ "basket_product_no, basket_count_number, "
				+ "basket_adddate) "
				+ "values(?, ?, ?, sysdate)";
		Object[] param = {basketDto.getBasketId(),
				basketDto.getBasketProductNo(),
				basketDto.getBasketCountNumber()};
		jdbcTemplate.update(sql,param);
	}

	//장바구니 옵션/수량수정
	@Override
	public boolean update(BasketDto basketDto) {
		String sql = "update basket set "
				+ "basket_count_number=?, "
				+ "basket_product_option=?, "
				+ "basket_adddate=sysdate "
				+ "where basket_product_no=?";
		Object[] param = {basketDto.getBasketCountNumber(),
				basketDto.getBasketProductOption(),
				basketDto.getBasketProductNo()};
		return jdbcTemplate.update(sql, param)>0;
	}

	//Mapper
	private RowMapper<BasketDto> mapper =(rs, idx)->{
		return BasketDto.builder()
				.basketId(rs.getString("basket_id"))
				.basketProductNo(rs.getInt("basket_product_no"))
				.basketCountNumber(rs.getInt("basket_count_number"))
				.basketAddDate(rs.getDate("basket_adddate"))
				.build();
	};
	
	//장바구니 상품조회(매개변수:회원ID)
	@Override
	public List<BasketDto> selectList(String memberId) {
		String sql = "select * from basket where basket_id=?";
		Object[] param = {memberId};
		return jdbcTemplate.query(sql,  mapper, param);
	}

	//장바구니 상품삭제(매개변수:상품번호)
	@Override
	public boolean delete(int productNo) {
		String sql = "delete basket where basket_product_no=?";
		Object[] param= {productNo};
		return jdbcTemplate.update(sql, param)>0;
	}
	
}
