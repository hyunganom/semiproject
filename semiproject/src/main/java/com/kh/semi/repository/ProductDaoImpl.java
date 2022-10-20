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

import com.kh.semi.entity.ProductDto;
import com.kh.semi.vo.ProductCategoryListVO;
import com.kh.semi.vo.ProductListSearchVO;

@Repository
public class ProductDaoImpl implements ProductDao {

	// 의존성 주입
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// ProductCategoryListVO에 대한 RowMapper
	private RowMapper<ProductCategoryListVO> productCategoryMapper = new RowMapper<ProductCategoryListVO>() {
		@Override
		public ProductCategoryListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductCategoryListVO.builder()
						.categoryHighNo(rs.getInt("category_high_no"))
						.categoryHighName(rs.getString("category_high_name"))
						.categoryLowNo(rs.getInt("category_low_no"))
						.categoryLowName(rs.getString("category_low_name"))
					.build();
		}
	};
	
	// 추상 메소드 오버라이딩 -  모든 상품 카테고리 항목 조회
	@Override
	public List<ProductCategoryListVO> selectCategoryList() {
		// 상위 카테고리 테이블(category_high)과 하위 카테고리 테이블(category_low)을 inner join하여 조회하는 SQL문
		String sql = "select H.*, L.category_low_no, L.category_low_name from category_high H inner join category_low L on H.category_high_no = L.category_high_no";
		// List<ProductCategoryListVO> 형태의 조회 결과를 반환
		return jdbcTemplate.query(sql, productCategoryMapper);
	}
	
	// 추상 메소드 오버라이딩 - 상품 등록을 위한 다음 시퀀스 번호 반환
	@Override
	public int nextSequence() {
		String sql = "select product_seq.nextval from dual";
		int productNo = jdbcTemplate.queryForObject(sql, int.class);
		return productNo;
	}

	// 추상 메소드 오버라이딩 - 관리자 상품 등록(INSERT)
	@Override
	public void insertProduct(ProductDto productDto) {
		
		// 다음 시퀀스 번호 반환
		int productNo = nextSequence();
		
		// 상품 등록 SQL
		String sql = "insert into product(product_no, category_high_no, category_low_no, product_name, product_price, product_information, product_inventory) values(?, ?, ?, ?, ?, ?, ?)";
		Object[] param = new Object[] {productNo, productDto.getCategoryHighNo(), productDto.getCategoryLowNo(), productDto.getProductName(), productDto.getProductPrice(), productDto.getProductInformation(), productDto.getProductInventory()};
		jdbcTemplate.update(sql, param);
	}
	
	// 추상 메소드 오버라이딩 - 상품 이미지 첨부파일 기록 등록(INSERT)
	@Override
	public void connectAttachment(int productNo, int attachmentNo) {
		String sql = "insert into product_attachment VALUES(?, ?)";
		Object[] param = {productNo, attachmentNo};	
		jdbcTemplate.update(sql, param);
	}
	
	// ProductDto에 대한 RowMapper (product_inactive 추가)
	private RowMapper<ProductDto> mapper = new RowMapper<>() {
		@Override
		public ProductDto mapRow(ResultSet rs, int rowNum) throws SQLException {
			return ProductDto.builder()
						.productNo(rs.getInt("product_no"))
						.categoryHighNo(rs.getInt("category_high_no"))
						.categoryLowNo(rs.getInt("category_low_no"))
						.productName(rs.getString("product_name"))
						.productPrice(rs.getInt("product_price"))
						.productInformation(rs.getString("product_information"))
						.productInventory(rs.getInt("product_inventory"))
						.productGood(rs.getInt("product_good"))
						.productRegisttime(rs.getDate("product_registtime"))
						.productUpdatetime(rs.getDate("product_updatetime"))
						.productInactive(rs.getBoolean("product_inactive"))
					.build();
		}
	};

	// 추상 메소드 오버라이딩 - 관리자 상품 조회(SELECT)
	// 1) 통합 조회
	@Override
	public List<ProductDto> selectListProduct(ProductListSearchVO productListSearchVO) {
		// 검색 조회인지 전체 조회인지 판정
		if(productListSearchVO.isSearch()) { // 검색 조회라면
			// 매개변수인 productListSearchVO의 type과 keyword를 반환하여 검색 조회 실행
			return searchListProduct(productListSearchVO);
		}
		else { // 전체 조회라면
			// 전체 조회 실행
			return allListProduct(productListSearchVO);
		}
	}

	// 2) 전체 조회
	@Override
	public List<ProductDto> allListProduct(ProductListSearchVO productListSearchVO) {
		// Top N Query SQL문 - 전체 조회시 한 페이지에 조회될 레코드의 수를 제한
		String sql = "select * from (select TMP.*, rownum rn from (select * from product order by product_no desc)TMP) where rn between ? and ?";
		Object[] param = new Object[] {productListSearchVO.rownumStart(), productListSearchVO.rownumEnd()};
		return jdbcTemplate.query(sql, mapper, param);
	}

	// 3) 검색 조회
	@Override
	public List<ProductDto> searchListProduct(ProductListSearchVO productListSearchVO) {
		// Top N Query SQL문 - 전체 조회시 한 페이지에 조회될 레코드의 수를 제한
		String sql = "select * from (select TMP.*, rownum rn from (select * from product where instr(#1, ?) > 0 order by product_no desc)TMP) where rn between ? and ?";
		sql = sql.replace("#1", productListSearchVO.getType());
		Object[] param = new Object[] {productListSearchVO.getKeyword(), productListSearchVO.rownumStart(), productListSearchVO.rownumEnd()};
		return jdbcTemplate.query(sql, mapper, param);
	}
	
	// ProductDto에 대한 ResultSetExtractor (product_inactive 추가)
	private ResultSetExtractor<ProductDto> extractor = new ResultSetExtractor<>() {
		@Override
		public ProductDto extractData(ResultSet rs) throws SQLException, DataAccessException {
			if(rs.next()) {
				return ProductDto.builder()
						.productNo(rs.getInt("product_no"))
						.categoryHighNo(rs.getInt("category_high_no"))
						.categoryLowNo(rs.getInt("category_low_no"))
						.productName(rs.getString("product_name"))
						.productPrice(rs.getInt("product_price"))
						.productInformation(rs.getString("product_information"))
						.productInventory(rs.getInt("product_inventory"))
						.productGood(rs.getInt("product_good"))
						.productRegisttime(rs.getDate("product_registtime"))
						.productUpdatetime(rs.getDate("product_updatetime"))
						.productInactive(rs.getBoolean("product_inactive"))
					.build();
			}
			else {
				return null;
			}
		}
	};

	// 추상 메소드 오버라이딩 - 관리자 상품 상세(DETAIL)
	@Override
	public ProductDto selectOneProduct(int productNo) {
		String sql = "select * from product where product_no = ?";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.query(sql, extractor, param);
	}

	// 추상 메소드 오버라이딩 - 관리자 상품 수정(UPDATE)
	@Override
	public boolean updateProduct(ProductDto productDto) {
		String sql = "update product set "
						+ "category_high_no = ?, "
						+ "category_low_no = ?, "
						+ "product_name = ?, "
						+ "product_price = ?, "
						+ "product_information = ?, "
						+ "product_inventory = ? "
					+ "where product_no = ?";
		Object[] param = new Object[] {
						productDto.getCategoryHighNo(), 
						productDto.getCategoryLowNo(), 
						productDto.getProductName(), 
						productDto.getProductPrice(),
						productDto.getProductInformation(),
						productDto.getProductInventory(),
						productDto.getProductNo()
						};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 오버라이딩 - 상품 수정시 수정시간 갱신
	@Override
	public void updateProductRegistTime(int productNo) {
		String sql = "update product set product_updatetime = sysdate where product_no = ?";
		Object[] param = new Object[] {productNo};
		jdbcTemplate.update(sql, param);
	}

	// 추상 메소드 오버라이딩 - 관리자 상품 삭제(비활성화로 UPDATE)
	@Override
	public boolean deleteProduct(int productNo, boolean isInactiveProduct) {
		String sql = "update product set product_inactive = ? where product_no = ?";
		String isInactive = isInactiveProduct ? "Y" : null;
		Object[] param = new Object[] {isInactive, productNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 오버라이딩 - 관리자 상품 삭제(DELETE)
	@Override
	public boolean deleteProduct(int productNo) {
		String sql = "delete product where product_no = ?";
		Object[] param = new Object[] {productNo};
		return jdbcTemplate.update(sql, param) > 0;
	}

	// 추상 메소드 - 상품 총 갯수
	// 1) 통합 조회시 상품의 총 갯수
	@Override
	public int countTotalProduct(ProductListSearchVO productListSearchVO) {
		// 검색 조회인지 판정
		if(productListSearchVO.isSearch()) { // 검색 조회라면
			return countSearchProduct(productListSearchVO);
		}
		else { // 검색 조회가 아니라면(전체 조회라면)
			return countAllProduct();
		}
	}

	// 2) 전체 조회시 상품의 총 갯수
	@Override
	public int countAllProduct() {
		String sql = "select count(*) from product";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 3) 검색 조회시 상품의 총 갯수
	@Override
	public int countSearchProduct(ProductListSearchVO productListSearchVO) {
		String sql = "select count(*) from product where instr(#1, ?) > 0";
		sql = sql.replace("#1", productListSearchVO.getType());
		Object[] param = new Object[] {productListSearchVO.getKeyword()};
		return jdbcTemplate.queryForObject(sql, int.class, param);
	}
}