package com.kh.semi.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.semi.entity.OrdersDto;

@Repository
public class OrdersDaoImpl implements OrdersDao{
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void insert(OrdersDto ordersDto) {
		String sql = "insert into orders("
				+ "order_no, order_id, order_name, order_post, order_base_address, "
				+ "order_detail_address, order_tel, order_memo, order_date, order_status, "
				+ "order_changedate, order_price, order_payprice"
			+ ") values(orders_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
		Object[] param = {
				ordersDto.getOrderName(), ordersDto.getOrderPost(),
				ordersDto.getOrderBaseAddress(), ordersDto.getOrderDetailAddress(), 
				ordersDto.getOrderTel(), 	ordersDto.getOrderMemo()
		};
		jdbcTemplate.update(sql, param);
	}
	
	private RowMapper<OrdersDto> mapper = new RowMapper<OrdersDto>() {
		
		public OrdersDto mapRow(java.sql.ResultSet rs, int rowNum) throws java.sql.SQLException {
			OrdersDto ordersDto = new OrdersDto();
			ordersDto.setOrderNo(rs.getInt("order_no"));
			ordersDto.setOrderId(rs.getString("order_id"));
			ordersDto.setOrderName(rs.getString("order_name"));
			ordersDto.setOrderPost(rs.getString("order_post"));
			ordersDto.setOrderBaseAddress(rs.getString("order_base_address"));
			ordersDto.setOrderDetailAddress(rs.getString("oders_detailaddress"));
			ordersDto.setOrderMemo(rs.getString("order_meno"));
			ordersDto.setOrderDate(rs.getDate("order_date"));
			ordersDto.setOrderStatus(rs.getString("order_status"));
			ordersDto.setOrderChangeDate(rs.getDate("order_changedate"));
			ordersDto.setOrderPrice(rs.getInt("order_price"));
			ordersDto.setOrderPayPrice(rs.getInt("order_pay_price"));
			return ordersDto;			
		}
	};

}
